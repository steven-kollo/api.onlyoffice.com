// @ts-check

/**
 * @typedef {import("node:stream").TransformCallback} TransformCallback
 * @typedef {import("openapi-types").OpenAPIV3_1.SchemaObject} SchemaObject
 */

import { Transform } from "node:stream"

class PreprocessSchema extends Transform {
  constructor() {
    super({ objectMode: true })
  }

  /**
   * @param {Object} ch
   * @param {string} ch.key
   * @param {SchemaObject} ch.value
   * @param {BufferEncoding} _
   * @param {TransformCallback} cb
   */
  _transform(ch, _, cb) {
    const s = ch.value

    switch (s.type) {
    case "array":
      break
    case "boolean":
      break
    case "integer":
      break
    case "null":
      break
    case "number":
      break
    case "object":
      break
    case "string":
      break
    default:
      break
    }

    this.push(ch)
    cb(null)
  }
}

// {
//   "type": "",
//   "description": ""
// }

export { PreprocessSchema }
