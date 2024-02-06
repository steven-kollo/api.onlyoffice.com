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
import { basename, dirname, extname, join } from "node:path"
import { finished } from "node:stream/promises"
import { Readable, Transform } from "node:stream"
import { URL, fileURLToPath } from "node:url"
import { StreamIndexes } from "@onlyoffice/documentation-declarations/helpers.js"
import {
  DeclarationsCache,
  PostprocessDeclarations,
  PreprocessDeclarations as JSDocPreprocessDeclarations
} from "@onlyoffice/documentation-declarations/jsdoc.js"
import { sortJSON, prettifyJSON } from "@onlyoffice/documentation-scripts/jq.js"
import MultiStream from "multistream"
import Chain from "stream-chain"
import StreamArray from "stream-json/streamers/StreamArray.js"
import Disassembler from "stream-json/Disassembler.js"
import Stringer from "stream-json/Stringer.js"
import parser from "stream-json"
import pack from "../package.json" assert { type: "json" }

const root = fileURLToPath(new URL("..", import.meta.url))
const dist = join(root, "dist")
const src = join(root, "src")

const ref = "https://raw.githubusercontent.com/vanyauhalin/onlyoffice-docs-definitions-demo/dist/"
const files = ["sdkjs-forms.json", "sdkjs.json"]

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
    await fetchFile(u, f)

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
      c.on("finish", res)
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
      c.on("finish", res)
    })

    froms.push(to)
  }))

  const pn = "document-builder"
  const pd = `${pn}.declarations.json`
  const pi = `${pn}.indexes.json`

  let from = ""
  let to = join(temp, pd)
  await mergeDeclarations(froms, to)

  from = to
  to = join(dist, pd)
  await sortJSON(from, to, ".id")

  from = to
  to = join(temp, pi)
  await createIndexes(from, to)

  from = to
  to = join(dist, pi)
  await prettifyJSON(from, to)

  from = join(src, "resource.cjs")
  to = join(dist, `${pn}.cjs`)
  let c = await readFile(from, { encoding: "utf8" })
  c = c.replaceAll("resource", pn)
  await writeFile(to, c, { encoding: "utf8" })

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
 * @param {string[]} froms
 * @param {string} to
 * @returns {Promise<void>}
 */
function mergeDeclarations(froms, to) {
  return new Promise((res, rej) => {
    const c = new Chain([
      new MultiStream(froms.map((from) => createReadStream(from))),
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
      new StreamIndexes(),
      makeObject(),
      new Stringer(),
      createWriteStream(to)
    ])
    c.on("error", rej)
    c.on("finish", res)
  })
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
 * @param {string} s
 * @param {number} n
 * @returns {string}
 */
function num(s, n) {
  const e = extname(s)
  return join(dirname(s), `${basename(s, e)}${n}${e}`)
}

export { build }
