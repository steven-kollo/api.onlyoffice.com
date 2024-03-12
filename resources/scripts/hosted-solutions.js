// @ts-check

/**
 * @typedef {import("@onlyoffice/documentation-declarations-scripts/openapi.js").OpenAPIComponentsKey} OpenAPIComponentsKey
 */

import { mkdir, rm, rmdir } from "node:fs/promises"
import { createReadStream, createWriteStream } from "node:fs"
import { join } from "node:path"
import {
  Cache,
  ProcessComponent,
  ProcessPath
} from "@onlyoffice/documentation-declarations-scripts/openapi.js"
import { prettifyJSON } from "@onlyoffice/documentation-utils/jq.js"
import Chain from "stream-chain"
import StreamObject from "stream-json/streamers/StreamObject.js"
import Disassembler from "stream-json/Disassembler.js"
import Parser from "stream-json/Parser.js"
import Stringer from "stream-json/Stringer.js"
import {
  PickComponent,
  PickPath,
  UnStreamObject,
  appendPathPostfix,
  createREST,
  downloadFile,
  makeObject,
  mergeObjects
} from "./utils.js"

const resource = "hosted-solutions"
const ref = "https://raw.githubusercontent.com/vanyauhalin/onlyoffice-docs-hosted-solutions-declarations-demo/dist/"
const file = "hosted-solutions.json"

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

  await writeComponents(tempDir, distDir, f, cache),
  await writeRequests(tempDir, distDir, f, cache),
  await createREST(resource),

  await rm(f)
  await rmdir(tempDir)
}

/**
 * @param {string} tempDir
 * @param {string} distDir
 * @param {string} from
 * @param {Cache} cache
 * @returns {Promise<void>}
 */
async function writeComponents(tempDir, distDir, from, cache) {
  const n = `${resource}.components.json`

  /** @type {string[]} */
  const components = []

  /** @type {OpenAPIComponentsKey[]} */
  const l = ["schemas", "responses"]
  await Promise.all(l.map(async (k) => {
    const nk = appendPathPostfix(n, k)
    const to = join(tempDir, nk)
    await new Promise((res, rej) => {
      const c = new Chain([
        createReadStream(from),
        new Parser(),
        new PickComponent(k),
        new StreamObject(),
        new ProcessComponent(cache, k),
        new UnStreamObject(),
        makeObject(),
        new Stringer(),
        createWriteStream(to)
      ])
      c.on("error", rej)
      c.on("close", res)
    })
    components.push(to)
  }))

  let to = join(tempDir, n)
  await mergeObjects(components, to)
  await Promise.all(components.map(async (f) => {
    await rm(f)
  }))

  from = to
  to = join(distDir, n)
  await prettifyJSON(from, to)
  await rm(from)
}

/**
 * @param {string} tempDir
 * @param {string} distDir
 * @param {string} from
 * @param {Cache} cache
 * @returns {Promise<void>}
 */
async function writeRequests(tempDir, distDir, from, cache) {
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
