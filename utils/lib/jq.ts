import type { WriteStream } from "node:fs"
import { spawn } from "node:child_process"
import { createWriteStream } from "node:fs"

export async function prettifyJSON(from: string, to: string): Promise<void> {
  const w = createWriteStream(to)
  await jq(w, [".", from])
  w.close()
}

/**
 * Wraps the `jq` command.
 * @param w Stream to write the output to.
 * @param opts Options to pass to `jq`.
 */
export function jq(w: WriteStream, opts: string[] = []): Promise<void> {
  return new Promise((res, rej) => {
    const s = spawn("jq", ["--monochrome-output", ...opts])
    s.stdout.on("data", (ch) => {
      w.write(ch)
    })
    s.on("close", res)
    s.on("error", rej)
  })
}
