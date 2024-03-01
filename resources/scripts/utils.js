// @ts-check

/**
 * @typedef {import("node:stream").TransformCallback} TransformCallback
 * @typedef {import("@onlyoffice/documentation-declarations").Declaration} Declaration
 */

import { mkdir, mkdtemp, readFile, readdir, rm, writeFile } from "node:fs/promises"
import { createReadStream, createWriteStream, existsSync } from "node:fs"
import { tmpdir } from "node:os"
import { basename, dirname, extname, join } from "node:path"
import { finished } from "node:stream/promises"
import { Readable, Transform } from "node:stream"
import { URL, fileURLToPath } from "node:url"
import MultiStream from "multistream"
import Chain from "stream-chain"
import StreamArray from "stream-json/streamers/StreamArray.js"
import StreamObject from "stream-json/streamers/StreamObject.js"
import Disassembler from "stream-json/Disassembler.js"
import Stringer from "stream-json/Stringer.js"
import parser from "stream-json"
import pack from "../package.json" assert { type: "json" }

const rootDir = fileURLToPath(new URL("..", import.meta.url))
const distDir = join(rootDir, "dist")
const srcDir = join(rootDir, "src")

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
  if (!existsSync(distDir)) {
    await mkdir(distDir)
  }
  return distDir
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
 * Safely joins multiple path segments into a single path. If the resulting path
 * already exists, it appends a number to the filename to make it unique.
 * @param {...string} args The path segments to join.
 * @returns {Promise<string>} The joined path.
 */
export async function safeJoin(...args) {
  let f = join(...args)
  if (existsSync(f)) {
    const d = dirname(f)
    const e = extname(f)
    const n = basename(f, e)
    const r = new RegExp(`^${n}(\\d+)?${e}$`)
    const nl = await readdir(d)
    const il = nl.map((n) => {
      const m = n.match(r)
      if (m === null) {
        return 0
      }
      const [s] = m
      if (s === undefined) {
        return 0
      }
      return parseInt(s, 10)
    })
    const i = Math.max(...il) + 1
    f = join(d, `${n}${i}${e}`)
  }
  return f
}

/**
 * @param {string} n
 * @param {string} d
 * @returns {Promise<void>}
 */
export async function createRESTFile(n, d) {
  const f = join(srcDir, "rest.cjs")
  let c = await readFile(f, "utf-8")
  c = c.replaceAll("resource", n)
  const t = join(d, `${n}.cjs`)
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
 * Removes a directory and its contents recursively.
 * @param {string} p The path of the directory to remove.
 * @returns {Promise<void>}
 */
export async function rmrf(p) {
  await rm(p, {
    recursive: true,
    force: true
  })
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
