// @ts-check

// https://github.com/jqlang/jq/issues/1364

/**
 * @typedef {import("../index.js").Declaration} Declaration
 */

import { Transform } from "node:stream"

class StreamIndexes extends Transform {
  constructor() {
    super({ objectMode: true })
    this._i = 0
  }

  _transform(ch, _, cb) {
    /** @type {Declaration} */
    const d = ch.value
    this.push({ name: "startKey" })
    this.push({ name: "stringChunk" , value: d.id })
    this.push({ name: "endKey" })
    this.push({ name: "startNumber" })
    this.push({ name: "numberChunk", value: `${this._i}` })
    this.push({ name: "endNumber" })
    this._i += 1
    cb(null)
  }
}

export { StreamIndexes }
