import type {TransformCallback} from "node:stream"
import {Transform} from "node:stream"

export type Chunk = Parameters<Transform["_transform"]>[0]

export class AsyncTransform extends Transform {
  _transform(ch: Chunk, _: BufferEncoding, cb: TransformCallback): void {
    this._atransform(ch).then(() => cb()).catch(cb)
  }

  // disable due to false positive
  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  async _atransform(_: Chunk): Promise<void> {
    throw new Error("Not implemented")
  }
}
