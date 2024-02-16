// @ts-check

/**
 * @typedef {import("node:stream").TransformCallback} TransformCallback
 * @typedef {import("@onlyoffice/documentation-declarations").Declaration} Declaration
 */

import { createWriteStream } from "node:fs"
import { basename, dirname, extname, join } from "node:path"
import { finished } from "node:stream/promises"
import { Readable, Transform } from "node:stream"
import Disassembler from "stream-json/Disassembler.js"

class UnStreamObject extends Disassembler {
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

/**
 * @param {string} from
 * @param {string} to
 * @returns {Promise<void>}
 */
async function download(from, to) {
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
function num(s, n) {
  const e = extname(s)
  return join(dirname(s), `${basename(s, e)}${n}${e}`)
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

export {
  UnStreamObject,
  download,
  makeObject,
  num
}
