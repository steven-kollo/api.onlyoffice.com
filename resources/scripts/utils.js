// @ts-check

/**
 * @typedef {import("node:stream").TransformCallback} TransformCallback
 * @typedef {import("@onlyoffice/documentation-declarations-scripts/openapi.js").OpenAPIComponentsKey} OpenAPIComponentsKey
 * @typedef {import("@onlyoffice/documentation-declarations").Declaration} Declaration
 */

import { mkdir, mkdtemp, readFile, readdir, rm, writeFile } from "node:fs/promises"
import { createReadStream, createWriteStream, existsSync } from "node:fs"
import { tmpdir } from "node:os"
import { basename, dirname, extname, format, join, parse } from "node:path"
import { finished } from "node:stream/promises"
import { Readable, Transform } from "node:stream"
import { URL, fileURLToPath } from "node:url"
import MultiStream from "multistream"
import Chain from "stream-chain"
import StreamArray from "stream-json/streamers/StreamArray.js"
import StreamObject from "stream-json/streamers/StreamObject.js"
import Disassembler from "stream-json/Disassembler.js"
import Pick from "stream-json/filters/Pick.js"
import Stringer from "stream-json/Stringer.js"
import parser from "stream-json"
import pack from "../package.json" assert { type: "json" }

/**
 * Creates a temporary directory.
 * @returns {Promise<string>} The path of the temporary directory.
 */
export async function createTempDir() {
  const d = join(tmpdir(), pack.name.replace("/", "+"))
  return await mkdtemp(`${d}-`)
}

/**
 * Prepares the distribution directory.
 * @returns {Promise<string>} The path of the distribution directory.
 */
export async function prepareDistDir() {
  const d = distDir()
  if (!existsSync(d)) {
    await mkdir(d)
  }
  return d
}

/**
 * Returns the path of the distribution directory.
 * @returns {string}
 */
export function distDir() {
  return join(rootDir(), "dist")
}

/**
 * Returns the path of the source directory.
 * @returns {string}
 */
export function srcDir() {
  return join(rootDir(), "src")
}

/**
 * Returns the path of the root directory.
 * @returns {string}
 */
export function rootDir() {
  return fileURLToPath(new URL("..", import.meta.url))
}

/**
 * Downloads a file.
 * @param {string} u The URL of the file to download.
 * @param {string} p The path of the file to save.
 * @returns {Promise<void>}
 */
export async function downloadFile(u, p) {
  const res = await fetch(u)
  if (res.body === null) {
    throw new Error("No body")
  }
  const r = Readable.fromWeb(res.body)
  const s = createWriteStream(p)
  const w = r.pipe(s)
  await finished(w)
}

/**
 * Appends a postfix to the file path.
 * @param {string} f The file path.
 * @param {string} p The postfix to append.
 * @returns {string} The updated file path with the postfix.
 */
export function appendPathPostfix(f, p) {
  const o = parse(f)
  const n = o.name
  o.name += `.${p}`
  o.base = o.base.replace(n, o.name)
  return format(o)
}

/**
 * @param {string} n
 * @returns {Promise<void>}
 */
export async function writeComponents(n) {
  const f = join(distDir(), `${n}.components.json`)
  const c = "{}"
  await writeFile(f, c, "utf-8")
}

/**
 * @param {string} r
 * @returns {Promise<void>}
 */
export async function createREST(r) {
  await writeTemplate("rest", r)
}

/**
 * @param {"code" | "rest"} n
 * @param {string} r
 */
export async function writeTemplate(n, r) {
  const f = join(srcDir(), `${n}.cjs`)
  let c = await readFile(f, "utf-8")
  c = c.replaceAll("resource", r)
  const t = join(distDir(), `${r}.cjs`)
  await writeFile(t, c, "utf-8")
}

/**
 * Capitalizes the first letter of each word in a string.
 * @param {string} s The input string.
 * @returns {string} The capitalized string.
 */
export function capitalizeTitle(s) {
  return s
    .toLowerCase()
    .split(" ")
    .map((w) => {
      return w.charAt(0).toUpperCase() + w.slice(1)
    })
    .join(" ")
}

/**
 * @param {string} s
 * @param {number} n
 * @returns {string}
 */
export function num(s, n) {
  const e = extname(s)
  return join(dirname(s), `${basename(s, e)}${n}${e}`)
}

/**
 * @param {string[]} from
 * @param {string} to
 * @returns {Promise<void>}
 */
export function mergeArrays(from, to) {
  const s = from.map((f) => {
    return createReadStream(f)
  })
  return new Promise((res, rej) => {
    const c = new Chain([
      new MultiStream(s),
      parser({ jsonStreaming: true }),
      new StreamArray(),
      /**
       * @param {Object} ch
       * @param {unknown} ch.value
       * @returns {unknown}
       */
      (ch) => {
        return ch.value
      },
      new Disassembler(),
      new Stringer({ makeArray: true }),
      createWriteStream(to)
    ])
    c.on("error", rej)
    c.on("close", res)
  })
}

/**
 * @param {string[]} from
 * @param {string} to
 * @returns {Promise<void>}
 */
export function mergeObjects(from, to) {
  const s = from.map((f) => {
    return createReadStream(f)
  })
  return new Promise((res, rej) => {
    const c = new Chain([
      new MultiStream(s),
      parser({ jsonStreaming: true }),
      new StreamObject(),
      new UnStreamObject(),
      makeObject(),
      new Stringer(),
      createWriteStream(to)
    ])
    c.on("error", rej)
    c.on("close", res)
  })
}

/**
 * @returns {Transform}
 */
export function makeObject() {
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
}

export class PickPath extends Pick {
  constructor() {
    super({ filter: "paths" })
  }
}

export class PickComponent extends Pick {
  /**
   * @param {OpenAPIComponentsKey} key
   */
  constructor(key) {
    super({ filter: `components.${key}` })
  }
}

export class UnStreamObject extends Disassembler {
  /**
   * @param {Object} ch
   * @param {string} ch.key
   * @param {unknown} ch.value
   * @param {BufferEncoding} _
   * @param {TransformCallback} cb
   * @returns {void}
   */
  _transform(ch, _, cb) {
    this.push({ name: "startKey" })
    this.push({ name: "stringChunk", value: ch.key })
    this.push({ name: "endKey" })
    super._transform(ch.value, _, cb)
  }
}
