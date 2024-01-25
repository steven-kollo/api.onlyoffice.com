#!/usr/bin/env node

// @ts-check

/**
 * @typedef {import("node:stream").TransformCallback} TransformCallback
 * @typedef {import("@onlyoffice/documentation-declarations").Declaration} Declaration
 * @typedef {import("@onlyoffice/documentation-declarations").DeclarationType} DeclarationType
 * @typedef {import("@onlyoffice/documentation-declarations").DeclarationValue} DeclarationValue
 */

import { copyFile, mkdir, mkdtemp, readFile, rm, writeFile } from "node:fs/promises"
import { createReadStream, createWriteStream, existsSync } from "node:fs"
import { tmpdir } from "node:os"
import { basename, dirname, extname, join } from "node:path"
import { argv } from "node:process"
import { finished } from "node:stream/promises"
import { Readable, Transform } from "node:stream"
import { URL, fileURLToPath } from "node:url"
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

  // todo: jq -c if output is false, --monochrome-output

  const ref = "https://raw.githubusercontent.com/vanyauhalin/onlyoffice-docs-definitions-demo/dist"
  const files = ["sdkjs-forms.json", "sdkjs.json"]

  const tmp = join(tmpdir(), pack.name.replace("/", "-"))
  const temp = await mkdtemp(tmp)

  const dist = join(root, "dist")
  if (!existsSync(dist)) {
    await mkdir(dist)
  }

  const ln = "document-builder.declarations.json"

  /** @type {string[]} */
  const li = []

  await Promise.all(files.map(async (file) => {
    const f = join(temp, file)
    const u = `${ref}/${file}`
    await fetchFile(u, f)

    const n = basename(file, extname(file))
    const lp = join(temp, `${n}.${ln}`)
    // preprocessing
    await createList(f, lp, {})
    li.push(lp)
  }))

  const mn = "document-builder.indexes.json"

  const lp1 = join(temp, `${ln}1`)
  await mergeArrays(li, lp1)

  const mp1 = join(temp, `${mn}1`)
  await createMap(lp1, mp1)

  const mapString = await readFile(mp1, { encoding: "utf8" })
  const mapJSON = JSON.parse(mapString)
  const lp2 = join(temp, `${ln}2`)

  function check(item) {
    if (item.type !== undefined) {
      if (!builtin.isBuiltinType(item.type)) {
        const r = mapJSON[item.type.id]
        if (r === undefined) {
          item.type.id = "unknown"
        }
      }
      if (item.type.children !== undefined) {
        item.type.children.forEach(check.bind(this))
      }
    }
  }

  const cache0 = {}
  // postprocessing, middle-processing?
  const cache = {}
  await new Promise((res, rej) => {
    const from = lp1
    const to = lp2
    const c = new Chain([
      createReadStream(from),
      parser(),
      new StreamArray(),
      new Transform({
        objectMode: true,
        transform(ch, _, cb) {
          /** @type {Declaration} */
          const d = ch.value
          if (d.memberOf !== undefined) {
            let r = mapJSON[d.memberOf.id]
            if (r === undefined) {
              r = cache[d.memberOf.id]
              if (r === undefined) {
                const [, n] = d.memberOf.id.split(";")
                /** @type {Declaration} */
                const m = {
                  id: d.memberOf.id,
                  meta: {
                    package: d.meta.package
                  },
                  name: n,
                  type: {
                    id: "unknown"
                  }
                }
                cache[d.memberOf.id] = m
                this.push(m)
              }
            }
            if (cache0[d.memberOf.id] === undefined) {
              cache0[d.memberOf.id] = []
            }
            cache0[d.memberOf.id].push(d.id)
          }
          if (d.type.properties !== undefined) {
            // todo: sort them
            d.type.properties.forEach(check.bind(this))
          }
          if (d.type.parameters !== undefined) {
            d.type.parameters.forEach(check.bind(this))
          }
          if (d.type.returns !== undefined) {
            d.type.returns.forEach(check.bind(this))
          }
          if (d.type.children !== undefined) {
            d.type.children.forEach(check.bind(this))
          }
          if (d.type.properties !== undefined) {
            d.type.properties = d.type.properties.map((p) => {
              /** @type {Declaration} */
              const c = {
                id: d.meta.package + ";" + d.name + "#" + p.name,
                meta: {
                  package: d.meta.package
                },
                name: p.name,
                summary: "",
                description: p.description,
                type: p.type
              }
              this.push(c)
              return {
                id: c.id
              }
            })
          }
          if (d.type.id === "class") {
            /** @type {Declaration} */
            const c = {
              id: d.meta.package + ";" + d.name + "#constructor",
              meta: {
                package: d.meta.package
              },
              name: "constructor",
              type: {
                id: "constructor",
              }
            }
            if (d.type.parameters !== undefined) {
              c.type.parameters = d.type.parameters
              delete d.type.parameters
            }
            d.type.constructors = [
              {
                id: c.id
              }
            ]
            this.push(c)
          }
          this.push(d)
          cb(null)
        }
      }),
      new Disassembler(),
      new Stringer({ makeArray: true }),
      createWriteStream(to)
    ])
    c.on("error", rej)
    c.on("finish", res)
  })

  const lp3 = join(temp, `${ln}3`)
  await new Promise((res, rej) => {
    const from = lp2
    const to = lp3
    const c = new Chain([
      createReadStream(from),
      parser(),
      new StreamArray(),
      new Transform({
        objectMode: true,
        transform(ch, _, cb) {
          /** @type {Declaration} */
          const d = ch.value
          if (cache0[d.id]) {
            d.type.methods = Object.values(cache0[d.id])
              .sort((a, b) => a.localeCompare(b))
              .map((id) => ({ id }))
          }
          if (d.type.constructors !== undefined) {
            d.type.constructors = d.type.constructors.sort((a, b) => a.id.localeCompare(b.id))
          }
          if (d.type.properties !== undefined) {
            d.type.properties = d.type.properties.sort((a, b) => a.id.localeCompare(b.id))
          }
          this.push(d)
          cb(null)
        }
      }),
      new Disassembler(),
      new Stringer({ makeArray: true }),
      createWriteStream(to)
    ])
    c.on("error", rej)
    c.on("finish", res)
  })

  const lp4 = join(temp, `${ln}4`)
  await sortJSON(lp3, lp4, ".id")

  const mp2 = join(temp, `${mn}2`)
  await createMap(lp4, mp2)

  if (opts.prettify) {
    const lt = join(dist, ln)
    await prettifyJSON(lp4, lt)

    const mt = join(dist, mn)
    await prettifyJSON(mp2, mt)
  } else {
    const lt = join(dist, ln)
    await copyFile(lp4, lt)

    const mt = join(dist, mn)
    await copyFile(mp2, mt)
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
 * @param {any} cache
 * @returns {Promise<void>}
 */
function createList(from, to, cache) {
  return new Promise((res, rej) => {
    const c = new Chain([
      createReadStream(from),
      parser(),
      new StreamArray(),
      (ch) => {
        return createDeclaration(ch.value, cache)
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
 * @param {any} cache
 * @returns {Promise<Declaration | undefined>}
 */
async function createDeclaration(js, cache) {
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

  // todo: rewrite it.
  const u = new URL(js.meta.file)
  let p = u.pathname.replace(/^\/repos\/onlyoffice/, "")
  if (js.meta.file.includes("/sdkjs/")) {
    p = p.replace(/^\/sdkjs\/contents/, "")
  } else if (js.meta.file.includes("/sdkjs-forms/")) {
    p = p.replace(/^\/sdkjs-forms\/contents/, "/forms")
  }
  d.meta.package = "/" + p.slice(1).replace(".js", "")

  let longname = ""
  if (Object.hasOwn(js, "inherits")) {
    return
    // d.memberof = js.inherits.split("#")[0]
    // longname = js.inherits
  } else {
    longname = js.longname.replace(/\<anonymous\>~?/, "").replace("event:", "")
  }

  // const longname = js.longname.replace(/\<anonymous\>~?/, "")
  d.id = id(longname)

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

  // if (d.properties !== undefined) {
  //   d.properties = d.properties.map(populateValue)
  // }

  // if (d.parameters !== undefined) {
  //   d.parameters = d.parameters.map(populateValue)
  // }

  // if (d.returns !== undefined) {
  //   d.returns = d.returns.map(populateValue)
  // }

  if (d.memberOf !== undefined) {
    const m = d.memberOf.id.replace(/\<anonymous\>~?/, "")
    if (m === "") {
      delete d.memberOf
    } else {
      d.memberOf = {
        id: id(m)
      }
      if (cache[d.memberOf.id] === undefined) {
        cache[d.memberOf.id] = []
      }
      cache[d.memberOf.id].push(d.id)
    }
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

  /**
   * @param {DeclarationType} t
   * @returns {DeclarationType}
   */
  function populateType(t) {
    if (t.properties !== undefined) {
      // todo: populate as types
      t.properties = t.properties.map(populateValue)
    }
    if (t.parameters !== undefined) {
      t.parameters = t.parameters.map(populateValue)
    }
    if (t.returns !== undefined) {
      t.returns = t.returns.map(populateValue)
    }
    if (t.children !== undefined) {
      t.children = t.children.map(populateType)
    }
    if (!builtin.isBuiltinType(t)) {
      t.id = id(t.id)
      if (t.id.endsWith(";")) {
        t.id = "unknown"
      }
    }
    return t
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
   * @param {string} s
   * @returns {string}
   */
  function id(s) {
    return [d.meta.package, s].join(";")
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
