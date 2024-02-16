// @ts-check

/**
 * @typedef {import("node:stream").TransformCallback} TransformCallback
 */

import { mkdir, mkdtemp, readFile, rm, writeFile } from "node:fs/promises"
import { createReadStream, createWriteStream, existsSync } from "node:fs"
import { tmpdir } from "node:os"
import { basename, dirname, extname, join } from "node:path"
import { finished } from "node:stream/promises"
import { Readable, Transform } from "node:stream"
import { URL, fileURLToPath } from "node:url"
import {
  DeclarationsCache,
  PostprocessDeclarations,
  PostPostprocessDeclarations,
  PreprocessDeclarations as JSDocPreprocessDeclarations
} from "@onlyoffice/documentation-declarations/jsdoc.js"
import { sortJSON, prettifyJSON } from "@onlyoffice/documentation-scripts/jq.js"
import MultiStream from "multistream"
import Chain from "stream-chain"
import Pick from "stream-json/filters/Pick.js"
import StreamArray from "stream-json/streamers/StreamArray.js"
import StreamObject from "stream-json/streamers/StreamObject.js"
import Disassembler from "stream-json/Disassembler.js"
import Stringer from "stream-json/Stringer.js"
import parser from "stream-json"
import { UnStreamObject, download, makeObject, num } from "./utils.js"
import pack from "../package.json" assert { type: "json" }

// import { createRequire } from "module"
// const require = createRequire(import.meta.url)

const root = fileURLToPath(new URL("..", import.meta.url))
const dist = join(root, "dist")
const src = join(root, "src")

const ref = "https://raw.githubusercontent.com/vanyauhalin/onlyoffice-docs-declarations-demo2/dist/"
const files = [
  // "asc.data.backup.swagger.json",
  // "asc.files.swagger.json",
  "asc.people.swagger.json",
  // "asc.web.api.swagger.json"
]

async function build() {
  const tmp = join(tmpdir(), pack.name.replace("/", "+"))
  const temp = await mkdtemp(`${tmp}-`)

  if (!existsSync(dist)) {
    await mkdir(dist)
  }

  await Promise.all(files.map(async (file) => {
    const f = join(temp, file)
    const u = `${ref}/${file}`
    await download(u, f)

    let from = f
    let to = join(temp, num(file, 0))
    await new Promise((res, rej) => {
      const c = new Chain([
        createReadStream(from),
        parser(),
        new Pick({ filter: "components.schemas" }),
        new StreamObject(),
        //
        new UnStreamObject(),
        makeObject(),
        new Stringer(),
        createWriteStream(to)
      ])
      c.on("error", rej)
      c.on("close", res)
    })

    console.log(to)
  }))
}

export { build }
