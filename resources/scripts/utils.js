// @ts-check

/**
 * @typedef {import("node:stream").TransformCallback} TransformCallback
 * @typedef {import("@onlyoffice/documentation-declarations").Declaration} Declaration
 */

import { rm } from "node:fs/promises"
import { createReadStream, createWriteStream } from "node:fs"
import { basename, dirname, extname, join } from "node:path"
import { finished } from "node:stream/promises"
import { Readable, Transform } from "node:stream"
import MultiStream from "multistream"
import Chain from "stream-chain"
import StreamArray from "stream-json/streamers/StreamArray.js"
import StreamObject from "stream-json/streamers/StreamObject.js"
import Disassembler from "stream-json/Disassembler.js"
import Stringer from "stream-json/Stringer.js"
import parser from "stream-json"

/**
 * @param {string} from
 * @param {string} to
 * @returns {Promise<void>}
 */
export async function download(from, to) {
  const res = await fetch(from)
  if (res.body === null) {
    throw new Error("No body")
  }
  const r = Readable.fromWeb(res.body)
  const s = createWriteStream(to)
  const w = r.pipe(s)
  await finished(w)
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
