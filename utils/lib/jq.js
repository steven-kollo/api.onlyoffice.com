// @ts-check

/**
 * @typedef {import("node:fs").WriteStream} WriteStream
 */

import { spawn } from "node:child_process"
import { createWriteStream } from "node:fs"

/**
 * @param {string} from
 * @param {string} to
 * @param {string} by
 * @returns {Promise<void>}
 */
export function sortJSON(from, to, by) {
  const w = createWriteStream(to)
  return jq(w, [`. |= sort_by(${by})`, from])
}

/**
 * @param {string} from
 * @param {string} to
 * @returns {Promise<void>}
 */
export function prettifyJSON(from, to) {
  const w = createWriteStream(to)
  return jq(w, [".", from])
}

/**
 * @param {WriteStream} w
 * @param {string[]} [args=[]]
 * @returns {Promise<void>}
 */
export function jq(w, args = []) {
  const a = ["--monochrome-output", ...args]
  return new Promise((res, rej) => {
    const s = spawn("jq", a)
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
