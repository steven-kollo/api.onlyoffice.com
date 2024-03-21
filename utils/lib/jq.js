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
export async function sortJSON(from, to, by) {
  const w = createWriteStream(to)
  await jq(w, [`. |= sort_by(${by})`, from])
  w.close()
}

/**
 * @param {string} from
 * @param {string} to
 * @returns {Promise<void>}
 */
export async function prettifyJSON(from, to) {
  const w = createWriteStream(to)
  await jq(w, [".", from])
  w.close()
}

/**
 * @param {WriteStream} w
 * @param {string[]} [options=[]]
 * @returns {Promise<void>}
 */
export function jq(w, options = []) {
  return new Promise((res, rej) => {
    const s = spawn("jq", ["--monochrome-output", ...options])
    s.on("data", w.write)
    s.on("close", res)
    s.on("error", rej)
  })
}
