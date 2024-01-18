// @ts-check

/**
 * @typedef {import("node:stream").TransformCallback} TransformCallback
 * @typedef {import("../resource").Declaration} Declaration
 * @typedef {import("../resource").Type} Type
 */

import { spawn } from "node:child_process"
import { copyFile, mkdir, mkdtemp, rm } from "node:fs/promises"
import { createReadStream, createWriteStream, existsSync } from "node:fs"
import { tmpdir } from "node:os"
import { basename, extname, join } from "node:path"
import { finished } from "node:stream/promises"
import { Readable, Transform } from "node:stream"
import { fileURLToPath } from "node:url"
import MultiStream from "multistream"
import Chain from "stream-chain"
import StreamArray from "stream-json/streamers/StreamArray.js"
import StreamObject from "stream-json/streamers/StreamObject.js"
import Disassembler from "stream-json/Disassembler.js"
import Stringer from "stream-json/Stringer.js"
import parser from "stream-json"
import * as builtin from "../builtin.js"
import pack from "./package.json" assert { type: "json" }

import crypto from 'crypto'

function generateRandomFilename() {
  return crypto.randomBytes(16).toString('hex');
}

const root = fileURLToPath(new URL(".", import.meta.url))
const ref = "https://raw.githubusercontent.com/vanyauhalin/onlyoffice-docs-definitions-demo/dist"
const files = ["sdkjs-forms.json", "sdkjs.json"]

async function build() {
  const tmp = join(tmpdir(), pack.name.replace("/", "-"))
  const temp = await mkdtemp(tmp)

  const dist = join(root, "dist")
  if (!existsSync(dist)) {
    await mkdir(dist)
  }

  // todo: write js objects directly to the ./dist/main.cjs.

  const ln = "list.json"

  /** @type {string[]} */
  const li = []

  await Promise.all(files.map(async (file) => {
    const f = join(temp, file)
    const u = `${ref}/${file}`
    await fetchFile(u, f)

    const n = basename(file, extname(file))
    const lp = join(temp, `${n}.${ln}`)
    await createList(f, lp)
    li.push(lp)
  }))

  const lp = join(temp, ln)
  await mergeArrays(li, lp)

  const mn = "map.json"

  const mp = join(temp, mn)
  await createMap(lp, mp)

  if (await canPrettify()) {
    const lt = join(dist, ln)
    await prettify(lp, lt)

    const mt = join(dist, mn)
    await prettify(mp, mt)
  }

  // sort

  const src = join(root, "src")
  const m = "main.cjs"
  const mf = join(src, m)
  const mt = join(dist, m)
  await copyFile(mf, mt)

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
      objectBrackets(),
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
function objectBrackets() {
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
 * @param {any} v
 * @returns {Declaration=}
 */
function createDeclaration(v) {
  /** @type {Declaration} */
  const d = {
    id: "",
    name: ""
  }

  if (!(
    Object.hasOwn(v, "meta") &&
    Object.hasOwn(v.meta, "file") &&
    Object.hasOwn(v, "longname")
  )) {
    return
  }
  d.id = [v.meta.file, v.longname].join(";")

  if (!(Object.hasOwn(v, "name"))) {
    return
  }
  d.name = v.name

  if (Object.hasOwn(v, "description")) {
    d.summary = v.description.split("\n")[0]
    d.description = {
      syntax: "txt",
      text: v.definitions
    }
  }

  if (Object.hasOwn(v, "kind")) {
    d.kind = v.kind
  }

  if (Object.hasOwn(v, "memberof")) {
    d.memberof = v.memberof
  }

  if (Object.hasOwn(v, "type")) {
    d.type = v.type.names.map((n) => {
      if (n.startsWith("Array")) {
        /** @type {Type} */
        const t = { ...builtin.Array }
        // Array<Readonly<MyType>>
        // t.children
        return t
      }
      if (n === "boolean") {
        return { ...builtin.Boolean }
      }
      if (n === "null") {
        return { ...builtin.Null }
      }
      if (n === "number") {
        return { ...builtin.Number }
      }
      if (n === "Object") {
        return { ...builtin.Object }
      }
      if (n.startsWith('"') && n.endsWith('"')) {
        return { ...builtin.String }
      }
      if (n === "undefined") {
        return { ...builtin.Undefined }
      }
    })
  }

  return d
}


/**
 * @returns {Promise<boolean>}
 */
function canPrettify() {
  // todo: it should return false if it's running in the CI
  return new Promise((res) => {
    const s = spawn("jq", ["--version"])
    s.stdout.on("close", () => {
      res(true)
    })
    s.stdout.on("error", () => {
      res(false)
    })
  })
}

/**
 * @param {string} from
 * @param {string} to
 * @returns {Promise<void>}
 */
function prettify(from, to) {
  return new Promise((res, rej) => {
    const w = createWriteStream(to)
    const s = spawn("jq", [".", from])
    s.stdout.on("data", (ch) => {
      w.write(ch)
    })
    s.stdout.on("close", () => {
      w.close()
      res(undefined)
    })
    s.stdout.on("error", (e) => {
      w.close()
      rej(e)
    })
  })
}

export { build }
