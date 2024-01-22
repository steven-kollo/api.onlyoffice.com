#!/usr/bin/env node

// @ts-check

/**
 * @typedef {import("node:stream").TransformCallback} TransformCallback
 * @typedef {import("@onlyoffice/documentation-declarations").Declaration} Declaration
 * @typedef {import("@onlyoffice/documentation-declarations").DeclarationType} DeclarationType
 * @typedef {import("@onlyoffice/documentation-declarations").DeclarationValue} DeclarationValue
 */

import { copyFile, mkdir, mkdtemp, rm, writeFile } from "node:fs/promises"
import { createReadStream, createWriteStream, existsSync } from "node:fs"
import { tmpdir } from "node:os"
import { basename, extname, join } from "node:path"
import { argv } from "node:process"
import { finished } from "node:stream/promises"
import { Readable, Transform } from "node:stream"
import { fileURLToPath } from "node:url"
import * as builtin from "@onlyoffice/documentation-declarations/builtin.js"
import { parseDeclaration } from "@onlyoffice/documentation-declarations/jsdoc.js"
import { sortJSON, prettifyJSON } from "@onlyoffice/documentation-scripts/jq.js"
import esMain from "es-main"
import { ESLint } from "eslint"
import MultiStream from "multistream"
import sade from "sade"
import Chain from "stream-chain"
import StreamArray from "stream-json/streamers/StreamArray.js"
import Disassembler from "stream-json/Disassembler.js"
import Stringer from "stream-json/Stringer.js"
import parser from "stream-json"
import pack from "./package.json" assert { type: "json" }

const root = fileURLToPath(new URL(".", import.meta.url))
const make = sade("./makefile.js")
const eslint = createEslint()

make
  .command("build")
  .option("-p, --prettify", "Prettify the output")
  .action(build)

/**
 * @typedef {Object} BuildOptions
 * @property {boolean} [prettify=false]
 */

/**
 * @param {BuildOptions=} options
 * @returns {Promise<void>}
 */
async function build(options) {
  /** @type {BuildOptions} */
  const opts = {
    prettify: false,
    ...options
  }

  const ref = "https://raw.githubusercontent.com/vanyauhalin/onlyoffice-docs-definitions-demo/dist"
  const files = ["sdkjs-forms.json", "sdkjs.json"]

  const tmp = join(tmpdir(), pack.name.replace("/", "-"))
  const temp = await mkdtemp(tmp)

  const dist = join(root, "dist")
  if (!existsSync(dist)) {
    await mkdir(dist)
  }

  // todo: write js objects directly to the ./dist/main.cjs.

  const bn = "builtin.json"
  const bf = join(temp, bn)
  const bl = Object.values(builtin)
  const bc = JSON.stringify(bl, null, 2)
  await writeFile(bf, bc)

  const ln = "document-builder.list.json"

  /** @type {string[]} */
  const li = [bf]

  await Promise.all(files.map(async (file) => {
    const f = join(temp, file)
    const u = `${ref}/${file}`
    await fetchFile(u, f)

    const n = basename(file, extname(file))
    const lp = join(temp, `${n}.${ln}`)
    await createList(f, lp)
    li.push(lp)
  }))

  const mn = "document-builder.map.json"

  const lp = join(temp, ln)
  await mergeArrays(li, lp)

  const lp2 = join(temp, `${ln}2`)
  await sortJSON(lp, lp2, ".id")

  const mp = join(temp, mn)
  await createMap(lp2, mp)

  if (opts.prettify) {
    const lt = join(dist, ln)
    await prettifyJSON(lp2, lt)

    const mt = join(dist, mn)
    await prettifyJSON(mp, mt)
  } else {
    const lt = join(dist, ln)
    await copyFile(lp2, lt)

    const mt = join(dist, mn)
    await copyFile(mp, mt)
  }

  const src = join(root, "src")
  const ma = "document-builder.cjs"
  const maf = join(src, ma)
  const mat = join(dist, ma)
  await copyFile(maf, mat)

  await rm(temp, { recursive: true, force: true })
}

/**
 * @param {string} from
 * @param {string} to
 * @returns {Promise<void>}
 */
async function fetchFile(from, to) {
  const res = await fetch(from)
  const r = Readable.fromWeb(res.body)
  const s = createWriteStream(to)
  const w = r.pipe(s)
  await finished(w)
}

/**
 * @param {string} from
 * @param {string} to
 * @returns {Promise<void>}
 */
function createList(from, to) {
  return new Promise((res, rej) => {
    const c = new Chain([
      createReadStream(from),
      parser(),
      new StreamArray(),
      (ch) => {
        return createDeclaration(ch.value)
      },
      new Disassembler(),
      new Stringer({ makeArray: true }),
      createWriteStream(to)
    ])
    c.on("error", rej)
    c.on("finish", res)
  })
}

/**
 *
 * @param {string} from
 * @param {string} to
 * @returns {Promise<void>}
 */
function createMap(from, to) {
  let i = 0
  return new Promise((res, rej) => {
    const c = new Chain([
      createReadStream(from),
      parser(),
      new StreamArray(),
      new Transform({
        objectMode: true,
        transform(ch, _, cb) {
          pushPair.call(this, ch.value.id, i)
          i += 1
          cb(null)
        }
      }),
      makeObject(),
      new Stringer(),
      createWriteStream(to)
    ])
    c.on("error", rej)
    c.on("finish", res)
  })
}

/**
 * @param {string[]} from
 * @param {string} to
 * @returns {Promise<void>}
 */
function mergeArrays(from, to) {
  return new Promise((res, rej) => {
    const c = new Chain([
      new MultiStream(from.map((p) => createReadStream(p))),
      parser({ jsonStreaming: true }),
      new StreamArray(),
      (ch) => {
        return ch.value
      },
      new Disassembler(),
      new Stringer({ makeArray: true }),
      createWriteStream(to)
    ])
    c.on("error", rej)
    c.on("finish", res)
  })
}

/**
 * @this {Transform}
 * @param {string} k
 * @param {number} v
 * @returns {void}
 */
function pushPair(k, v) {
  this.push({ name: "startKey" })
  this.push({ name: "stringChunk" , value: k })
  this.push({ name: "endKey" })
  this.push({ name: "startNumber" })
  this.push({ name: "numberChunk", value: `${v}` })
  this.push({ name: "endNumber" })
}

/**
 * @returns {Transform}
 */
function makeObject() {
  // https://github.com/uhop/stream-json/pull/143
  return new Transform({
    objectMode: true,
    transform(ch, enc, cb) {
      this.push({ name: "startObject" })
      this._transform = transformPassThrough
      return this._transform(ch, enc, cb)
    },
    flush(cb) {
      if (this._transform === transformPassThrough) {
        this.push({ name: "endObject" })
      }
      cb(null)
    }
  })
}

/**
 * @this {Transform}
 * @param {any} ch
 * @param {BufferEncoding} enc
 * @param {TransformCallback} cb
 */
function transformPassThrough(ch, enc, cb) {
  this.push(ch, enc)
  cb(null)
}

/**
 * @param {any} js
 * @returns {Promise<Declaration | undefined>}
 */
async function createDeclaration(js) {
  if (!(
    Object.hasOwn(js, "meta") &&
    Object.hasOwn(js.meta, "file") &&
    Object.hasOwn(js, "longname")
  )) {
    return
  }

  const d = parseDeclaration(js)
  if (d === undefined) {
    return
  }

  let longname = ""
  if (Object.hasOwn(js, "inherits")) {
    return
    d.memberof = js.inherits.split("#")[0]
    longname = js.inherits
  } else {
    longname = js.longname.replace(/\<anonymous\>~?/, "")
  }

  // const longname = js.longname.replace(/\<anonymous\>~?/, "")
  d.id = [js.meta.file, longname].join(";")

  if (longname === "ApiRange#Find" || longname === "ApiRange#Replace") {
    // todo: @also
    // https://github.com/ONLYOFFICE/sdkjs/blob/eb92448a74506b94ca984b6c6dd82b715ecf4836/cell/apiBuilder.js#L3307
    // https://github.com/ONLYOFFICE/sdkjs/blob/eb92448a74506b94ca984b6c6dd82b715ecf4836/cell/apiBuilder.js#L3464
    return
  }

  if (d.description !== undefined) {
    d.description.syntax = "md"
  }

  if (d.type !== undefined) {
    d.type = populateType(d.type)
  }

  // todo: support the `Example: 1.` in properties, parameters, and returns.

  if (d.properties !== undefined) {
    d.properties = d.properties.map(populateValue)
  }

  if (d.parameters !== undefined) {
    d.parameters = d.parameters.map(populateValue)
  }

  if (d.returns !== undefined) {
    d.returns = d.returns.map(populateValue)
  }

  if (d.memberof !== undefined) {
    d.memberof = d.memberof.replace(/\<anonymous\>~?/, "")
  }

  if (d.examples !== undefined) {
    d.examples = await Promise.all(d.examples.map(async (e) => {
      const [r] = await eslint.lintText(e.text)
      if (r.output !== undefined) {
        e.text = r.output
      }
      return e
    }))
  }

  // todo: in progress...
  d._package = ""
  if (d.id.includes("sdkjs/contents/word/apiBuilder.js")) {
    d._package = "word"
  } else if (d.id.includes("sdkjs/contents/cell/apiBuilder.js")) {
    d._package = "cell"
  } else if (d.id.includes("sdkjs/contents/slide/apiBuilder.js")) {
    d._package = "slide"
  } else if (d.id.includes("sdkjs/contents/word/api_plugins.js")) {
    d._package = "word-plugins"
  } else if (d.id.includes("sdkjs/contents/cell/api_plugins.js")) {
    d._package = "cell-plugins"
  } else if (d.id.includes("sdkjs/contents/slide/api_plugins.js")) {
    d._package = "slide-plugins"
  } else if (d.id.includes("sdkjs/contents/common/apiBase_plugins.js")) {
    d._package = "common"
  } else if (d.id.includes("sdkjs/contents/common/plugins/plugin_base_api.js")) {
    d._package = "common-plugins"
  } else if (d.id.includes("sdkjs-forms/contents/apiBuilder.js")) {
    d._package = "form"
  } else if (d.id.includes("sdkjs-forms/contents/apiPlugins.js")) {
    d._package = "form-plugins"
  }

  /**
   * @param {DeclarationValue} v
   * @returns {DeclarationValue}
   */
  function populateValue(v) {
    v.type = populateType(v.type)
    if (v.description !== undefined) {
      v.description.syntax = "md"
    }
    return v
  }

  /**
   * @param {DeclarationType} t
   * @returns {DeclarationType}
   */
  function populateType(t) {
    if (t.children !== undefined) {
      t.children = t.children.map(populateType)
    }
    if (!builtin.isBuiltinType(t)) {
      t.id = [js.meta.file, t.id].join(";")
    }
    return t
  }

  return d
}

/**
 * @returns {ESLint}
 */
function createEslint() {
  return new ESLint({
    useEslintrc: false,
    fix: true,
    overrideConfig: {
      extends: [
        "eslint:recommended"
      ],
      parserOptions: {
        sourceType: "module",
        ecmaVersion: "latest",
      },
      plugins: [
        "@stylistic/js"
      ],
      rules: {
        "no-undef": "off",
        "no-var": "warn",
        "prefer-const": "warn",
        "prefer-arrow-callback": "warn",
        "@stylistic/js/array-bracket-newline": [
          "warn",
          { "multiline": true, "minItems": null }
        ],
        "@stylistic/js/array-bracket-spacing": [
          "warn",
          "never"
        ],
        "@stylistic/js/array-element-newline": [
          "warn",
          "always"
        ],
        "@stylistic/js/arrow-spacing": "warn",
        "@stylistic/js/block-spacing": "warn",
        "@stylistic/js/brace-style": "warn",
        "@stylistic/js/comma-dangle": [
          "warn",
          "never"
        ],
        "@stylistic/js/comma-spacing": [
          "warn",
          {
            "before": false, "after": true
          }
        ],
        "@stylistic/js/comma-style": [
          "warn",
          "last"
        ],
        "@stylistic/js/function-call-argument-newline": [
          "warn",
          "consistent"
        ],
        "@stylistic/js/function-call-spacing": [
          "warn",
          "never"
        ],
        "@stylistic/js/function-paren-newline": [
          "warn",
          "multiline"
        ],
        "@stylistic/js/implicit-arrow-linebreak": [
          "warn",
          "beside"
        ],
        "@stylistic/js/indent": [
          "warn",
          2,
          {
            "VariableDeclarator": "first",
            "FunctionDeclaration": {
              "parameters": "first"
            },
            "FunctionExpression": {
              "parameters": "first"
            },
            "CallExpression": {
              "arguments": "first"
            },
            "ArrayExpression": "first",
            "ObjectExpression": "first",
            "ImportDeclaration": "first",
            "flatTernaryExpressions": true
          }
        ],
        "@stylistic/js/key-spacing": [
          "warn",
          {
            "beforeColon": false, "mode": "strict"
          }
        ],
        "@stylistic/js/keyword-spacing": [
          "warn",
          {
            "before": true
          }
        ],
        "@stylistic/js/lines-between-class-members": [
          "warn",
          "always"
        ],
        "@stylistic/js/max-len": [
          "warn",
          {
            "code": 120
          }
        ],
        "@stylistic/js/multiline-ternary": [
          "warn",
          "never"
        ],
        "@stylistic/js/new-parens": "warn",
        "@stylistic/js/no-extra-semi": "warn",
        "@stylistic/js/no-mixed-spaces-and-tabs": "warn",
        "@stylistic/js/no-multi-spaces": "warn",
        "@stylistic/js/no-multiple-empty-lines": "warn",
        "@stylistic/js/no-tabs": "warn",
        "@stylistic/js/no-trailing-spaces": "warn",
        "@stylistic/js/no-whitespace-before-property": "warn",
        "@stylistic/js/nonblock-statement-body-position": [
          "warn",
          "beside"
        ],
        "@stylistic/js/object-curly-newline": [
          "warn",
          {
            "consistent": true
          }
        ],
        "@stylistic/js/object-curly-spacing": [
          "warn",
          "always"
        ],
        "@stylistic/js/object-property-newline": [
          "warn",
          {
            "allowAllPropertiesOnSameLine": true
          }
        ],
        "@stylistic/js/padded-blocks": [
          "warn",
          "never"
        ],
        "@stylistic/js/quotes": [
          "warn",
          "double"
        ],
        "@stylistic/js/semi": [
          "warn",
          "never"
        ],
        "@stylistic/js/semi-spacing": "warn",
        "@stylistic/js/space-before-blocks": "warn",
        "@stylistic/js/space-before-function-paren": [
          "warn",
          { "anonymous": "always", "named": "never", "asyncArrow": "always" }
        ],
        "@stylistic/js/space-in-parens": [
          "warn",
          "never"
        ],
        "no-unused-vars": [
          "warn",
          {
            "vars": "local"
          }
        ],
        "@stylistic/js/eol-last": [
          "warn",
          "never"
        ]
      },
      env: {
        browser: true,
        es2022: true
      }
    }
  })
}

if (esMain(import.meta)) {
  make.parse(argv)
}

export { build }
