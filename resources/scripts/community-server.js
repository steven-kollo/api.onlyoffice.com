// @ts-check

import { mkdir, rm, rmdir } from "node:fs/promises"
import { createReadStream, createWriteStream } from "node:fs"
import { join } from "node:path"
import { Cache, ProcessPath } from "@onlyoffice/documentation-declarations-scripts/openapi.js"
import { prettifyJSON } from "@onlyoffice/documentation-utils/jq.js"
import Chain from "stream-chain"
import StreamObject from "stream-json/streamers/StreamObject.js"
import Disassembler from "stream-json/Disassembler.js"
import Parser from "stream-json/Parser.js"
import Stringer from "stream-json/Stringer.js"
import {
  PickPath,
  writeComponents,
  createREST,
  downloadFile
} from "./utils.js"

const ref = "https://raw.githubusercontent.com/vanyauhalin/onlyoffice-docs-community-server-declarations-demo/dist/"
const file = "portals.json"
const resource = "community-server"

/**
 * @param {string} tempDir
 * @param {string} distDir
 * @returns {Promise<void>}
 */
export async function build(tempDir, distDir) {
  tempDir = join(tempDir, resource)
  await mkdir(tempDir)

  const u = `${ref}${file}`
  const f = join(tempDir, file)
  await downloadFile(u, f)

  const cache = new Cache()

  await Promise.all([
    writeRequests(cache, tempDir, distDir, f),
    writeComponents(resource),
    createREST(resource)
  ])

  await rm(f)
  await rmdir(tempDir)
}

/**
 * @param {Cache} cache
 * @param {string} tempDir
 * @param {string} distDir
 * @param {string} from
 * @returns {Promise<void>}
 */
async function writeRequests(cache, tempDir, distDir, from) {
  const n = `${resource}.requests.json`

  let to = join(tempDir, n)
  await new Promise((res, rej) => {
    const c = new Chain([
      createReadStream(from),
      new Parser(),
      new PickPath(),
      new StreamObject(),
      new ProcessPath(cache),
      new Disassembler(),
      new Stringer({ makeArray: true }),
      createWriteStream(to)
    ])
    c.on("error", rej)
    c.on("close", res)
  })

  from = to
  to = join(distDir, n)
  await prettifyJSON(from, to)
  await rm(from)
}
