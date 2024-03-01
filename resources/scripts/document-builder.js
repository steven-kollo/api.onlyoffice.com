// @ts-check

/**
 * @typedef {import("node:stream").TransformCallback} TransformCallback
 * @typedef {import("@onlyoffice/documentation-declarations").Declaration} Declaration
 * @typedef {import("@onlyoffice/documentation-declarations").DeclarationType} DeclarationType
 * @typedef {import("@onlyoffice/documentation-declarations").DeclarationValue} DeclarationValue
 */

import { mkdir, mkdtemp, readFile, rm, writeFile } from "node:fs/promises"
import { createReadStream, createWriteStream, existsSync } from "node:fs"
import { tmpdir } from "node:os"
import { join } from "node:path"
import { Transform } from "node:stream"
import { URL, fileURLToPath } from "node:url"
import {
  DeclarationsCache,
  PostprocessDeclarations,
  PostPostprocessDeclarations,
  PreprocessDeclarations as JSDocPreprocessDeclarations
} from "@onlyoffice/documentation-declarations/jsdoc.js"
import { sortJSON, prettifyJSON } from "@onlyoffice/documentation-scripts/jq.js"
import Chain from "stream-chain"
import StreamArray from "stream-json/streamers/StreamArray.js"
import Disassembler from "stream-json/Disassembler.js"
import Stringer from "stream-json/Stringer.js"
import parser from "stream-json"
import { UnStreamObject, downloadFile, makeObject, mergeArrays, num } from "./utils.js"
import pack from "../package.json" assert { type: "json" }

import { createRequire } from "module"
const require = createRequire(import.meta.url)

const root = fileURLToPath(new URL("..", import.meta.url))
const dist = join(root, "dist")
const src = join(root, "src")

const ref = "https://raw.githubusercontent.com/vanyauhalin/onlyoffice-docs-definitions-demo/dist/"
const files = [
  "sdkjs-forms.json",
  "sdkjs.json"
]

/**
 * @typedef {Object} BuildOptions
 * @property {boolean} [prettify=false]
 */

/**
 * @param {BuildOptions=} options
 * @returns {Promise<void>}
 */
async function build(options) {
  // /** @type {BuildOptions} */
  // const opts = {
  //   prettify: false,
  //   ...options
  // }

  const tmp = join(tmpdir(), pack.name.replace("/", "+"))
  const temp = await mkdtemp(tmp)

  if (!existsSync(dist)) {
    await mkdir(dist)
  }

  /** @type {string[]} */
  const froms = []

  await Promise.all(files.map(async (file) => {
    const f = join(temp, file)
    const u = `${ref}/${file}`
    await downloadFile(u, f)

    const cache = new DeclarationsCache()

    let from = f
    let to = join(temp, num(file, 0))
    await new Promise((res, rej) => {
      const c = new Chain([
        createReadStream(from),
        parser(),
        new StreamArray(),
        new PreprocessDeclarations(cache),
        new Disassembler(),
        new Stringer({ makeArray: true }),
        createWriteStream(to)
      ])
      c.on("error", rej)
      c.on("close", res)
    })

    from = to
    to = join(temp, num(file, 1))
    await new Promise((res, rej) => {
      const c = new Chain([
        createReadStream(from),
        parser(),
        new StreamArray(),
        new PostprocessDeclarations(cache),
        new Disassembler(),
        new Stringer({ makeArray: true }),
        createWriteStream(to)
      ])
      c.on("error", rej)
      c.on("close", res)
    })

    const _list = require(to)
    // @ts-ignore
    cache._onRetrieve = function _onRetrieve(id) {
      // @ts-ignore
      return _list[cache.retrieve(id).index]
    }

    // let _to = to
    // // @ts-ignore
    // cache._onRetrieve = async function _onRetrieve(id) {
    //   let d
    //   await new Promise((res, rej) => {
    //     const c = new Chain([
    //       createReadStream(_to),
    //       parser(),
    //       new StreamArray(),
    //       new Transform({
    //         objectMode: true,
    //         transform(ch, _, cb) {
    //           if (ch.value.id === id) {
    //             d = ch.value
    //           } else {
    //             cb(null)
    //           }
    //         }
    //       })
    //     ])
    //     c.on("error", rej)
    //     c.on("close", res)
    //   })
    //   // @ts-ignore
    //   return d
    // }

    from = to
    to = join(temp, num(file, 2))
    await new Promise((res, rej) => {
      const c = new Chain([
        createReadStream(from),
        parser(),
        new StreamArray(),
        new PostPostprocessDeclarations(cache),
        new Disassembler(),
        new Stringer({ makeArray: true }),
        createWriteStream(to)
      ])
      c.on("error", rej)
      c.on("close", res)
    })

    froms.push(to)
  }))

  const pn = "document-builder"
  const pd = `${pn}.declarations.json`
  const pi = `${pn}.indexes.json`

  let from = ""
  let to = join(temp, pd)
  await mergeArrays(froms, to)

  from = to
  to = join(dist, pd)
  await sortJSON(from, to, ".id")

  from = to
  to = join(temp, pi)
  await createIndexes(from, to)

  from = to
  to = join(dist, pi)
  await prettifyJSON(from, to)

  from = join(src, "code.cjs")
  to = join(dist, `${pn}.cjs`)
  let c = await readFile(from, { encoding: "utf8" })
  c = c.replaceAll("resource", pn)
  await writeFile(to, c, { encoding: "utf8" })

  await rm(temp, { recursive: true, force: true })
}

class PreprocessDeclarations extends JSDocPreprocessDeclarations {
  // todo: typing.
  constructor(cache) {
    super(cache)
  }

  _transform(ch, enc, cb) {
    // todo: /** @type {Doclet} */
    const doc = ch.value
    if (Object.hasOwn(doc, "meta") && Object.hasOwn(doc.meta, "file")) {
      let file = doc.meta.file.replace(/.*contents\/([\S\s]*)\.js.*/, "$1")
      if (doc.meta.file.includes("sdkjs-forms")) {
        file = `forms/${file}`
      }
      doc.meta.file = file
    }
    // todo: support the `Example: 1.` in properties, parameters, and returns.
    if (Object.hasOwn(doc, "longname")) {
      if (doc.longname === "ApiRange#Find" || doc.longname === "ApiRange#Replace") {
        // todo: @also
        // https://github.com/ONLYOFFICE/sdkjs/blob/eb92448a74506b94ca984b6c6dd82b715ecf4836/cell/apiBuilder.js#L3307
        // https://github.com/ONLYOFFICE/sdkjs/blob/eb92448a74506b94ca984b6c6dd82b715ecf4836/cell/apiBuilder.js#L3464
        cb(null)
        return
      }
    }
    if (Object.hasOwn(doc, "name")) {
      if (doc.name.startsWith("\"") && doc.name.endsWith("\"")) {
        doc.name = doc.name.slice(1, -1)
      }
    }
    super._transform(ch, enc, cb)
  }
}

/**
 * @param {string} from
 * @param {string} to
 * @returns {Promise<void>}
 */
function createIndexes(from, to) {
  return new Promise((res, rej) => {
    const c = new Chain([
      createReadStream(from),
      parser(),
      new StreamArray(),
      new class extends Transform {
        constructor() {
          super({ objectMode: true })
          this._i = 0
        }
        _transform(ch, _, cb) {
          this.push({
            key: ch.value.id,
            value: this._i
          })
          this._i += 1
          cb(null)
        }
      },
      new UnStreamObject(),
      makeObject(),
      new Stringer(),
      createWriteStream(to)
    ])
    c.on("error", rej)
    c.on("close", res)
  })
}

export { build }
