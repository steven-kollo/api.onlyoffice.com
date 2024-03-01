// @ts-check

import { createReadStream, createWriteStream } from "node:fs"
import { join } from "node:path"
import { URL, fileURLToPath } from "node:url"
import { Console as DeclarationConsole } from "@onlyoffice/documentation-declarations/console.js"
import { PreprocessPath } from "@onlyoffice/documentation-declarations/openapi.js"
import { prettifyJSON } from "@onlyoffice/documentation-scripts/jq.js"
import Chain from "stream-chain"
import Pick from "stream-json/filters/Pick.js"
import StreamObject from "stream-json/streamers/StreamObject.js"
import Disassembler from "stream-json/Disassembler.js"
import Parser from "stream-json/Parser.js"
import Stringer from "stream-json/Stringer.js"
import {
  createRESTFile,
  createTempDir,
  downloadFile,
  prepareDistDir,
  rmrf,
  safeJoin
} from "./utils.js"
import { writeFile } from "node:fs/promises"

const root = fileURLToPath(new URL("..", import.meta.url))

const ref = "https://raw.githubusercontent.com/vanyauhalin/onlyoffice-docs-community-server-declarations-demo/dist"
const file = "/portals.json"

export async function build() {
  const temp = await createTempDir()
  const dist = await prepareDistDir()

  const de = declarationConsole()

  const u = `${ref}${file}`
  const f = join(temp, file)
  await downloadFile(u, f)

  const from = f
  const to = await safeJoin(temp, file)
  await new Promise((res, rej) => {
    const c = new Chain([
      createReadStream(from),
      new Parser(),
      new Pick({ filter: "paths" }),
      new StreamObject(),
      new PreprocessPath(de),
      new Disassembler(),
      new Stringer({ makeArray: true }),
      createWriteStream(to)
    ])
    c.on("error", rej)
    c.on("close", res)
  })

  const rn = "community-server"
  const rp = `${rn}.paths.json`
  const rc = `${rn}.references.json`

  await Promise.all([
    (async () => {
      const f = to
      const t = join(dist, rp)
      await prettifyJSON(f, t)
    })(),
    createRESTFile(rn, dist),
    (async () => {
      const t = join(dist, rc)
      const c = "{}"
      await writeFile(t, c, "utf-8")
    })()
  ])
  await rmrf(temp)
}

function declarationConsole() {
  const f = join(root, "report.log")
  const s = createWriteStream(f)
  return new DeclarationConsole(s, s)
}
