// @ts-check

/**
 * @typedef {import("node:stream").TransformCallback} TransformCallback
 */

import { mkdir, rm, rmdir } from "node:fs/promises"
import { createReadStream, createWriteStream } from "node:fs"
import { join } from "node:path"
import {
  Cache,
  ProcessComponent,
  ProcessPath as OpenAPIProcessPath
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
  capitalizeTitle,
  createREST,
  downloadFile,
  makeObject,
  mergeArrays,
  mergeObjects
} from "./utils.js"

const ref = "https://raw.githubusercontent.com/vanyauhalin/onlyoffice-docs-declarations-demo2/dist/"
const files = [
  "asc.data.backup.swagger.json",
  "asc.files.swagger.json",
  "asc.people.swagger.json",
  "asc.web.api.swagger.json"
]
const resource = "docspace"

/**
 * @param {string} tempDir
 * @param {string} distDir
 * @returns {Promise<void>}
 */
export async function build(tempDir, distDir) {
  tempDir = join(tempDir, resource)
  await mkdir(tempDir)

  /** @type {string[]} */
  const components = []
  /** @type {string[]} */
  const requests = []

  await Promise.all(files.map(async (file) => {
    const f = join(tempDir, file)
    const u = `${ref}${file}`
    await downloadFile(u, f)

    const cache = new Cache()

    let to = await writeTempComponents(tempDir, f, file, cache)
    components.push(to)

    to = await writeTempRequests(tempDir, f, file, cache)
    requests.push(to)

    await rm(f)
  }))

  await Promise.all([
    writeComponents(tempDir, distDir, components),
    writeRequests(tempDir, distDir, requests),
    createREST(resource)
  ])
  await rmdir(tempDir)
}

/**
 * @param {string} tempDir
 * @param {string} from
 * @param {string} file
 * @param {Cache} cache
 * @returns {Promise<string>}
 */
async function writeTempComponents(tempDir, from, file, cache) {
  let n = appendPathPostfix(file, "components")

  const k = "schemas"
  n = appendPathPostfix(n, k)
  const to = join(tempDir, n)
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

  return to
}

/**
 * @param {string} tempDir
 * @param {string} distDir
 * @param {string[]} components
 * @returns {Promise<void>}
 */
async function writeComponents(tempDir, distDir, components) {
  const n = `${resource}.components.json`

  let to = join(tempDir, n)
  await mergeObjects(components, to)
  await Promise.all(components.map(async (f) => {
    await rm(f)
  }))

  const from = to
  to = join(distDir, n)
  await prettifyJSON(from, to)
  await rm(from)
}

/**
 * @param {string} tempDir
 * @param {string} from
 * @param {string} file
 * @param {Cache} cache
 * @returns {Promise<string>}
 */
async function writeTempRequests(tempDir, from, file, cache) {
  let n = appendPathPostfix(file, "requests")

  const p = remapPackage(file)
  const to = join(tempDir, n)
  await new Promise((res, rej) => {
    const c = new Chain([
      createReadStream(from),
      new Parser(),
      new PickPath(),
      new StreamObject(),
      new ProcessPath(cache, p),
      new Disassembler(),
      new Stringer({ makeArray: true }),
      createWriteStream(to)
    ])
    c.on("error", rej)
    c.on("close", res)
  })

  return to
}

/**
 * @param {string} tempDir
 * @param {string} distDir
 * @param {string[]} requests
 * @returns {Promise<void>}
 */
async function writeRequests(tempDir, distDir, requests) {
  const n = `${resource}.requests.json`

  let to = join(tempDir, n)
  await mergeArrays(requests, to)
  await Promise.all(requests.map(async (f) => {
    await rm(f)
  }))

  const from = to
  to = join(distDir, n)
  await prettifyJSON(from, to)
  await rm(from)
}

/**
 * @param {string} f
 * @returns {string}
 */
function remapPackage(f) {
  switch (f) {
  case "asc.data.backup.swagger.json":
    return "data"
  case "asc.files.swagger.json":
    return "files"
  case "asc.people.swagger.json":
    return "people"
  case "asc.web.api.swagger.json":
    return "web"
  default:
    throw new Error(`unknown package: ${f}`)
  }
}

class ProcessPath extends OpenAPIProcessPath {
  constructor(cache, pack) {
    super(cache)
    this._pack = pack
  }

  _transform(ch, _, cb) {
    // todo: it is not good that we do this on our side.

    // https://github.com/ONLYOFFICE/DocSpace-server/blob/v2.0.2-server/web/ASC.Web.Api/Api/CapabilitiesController.cs#L33
    if (ch.key.endsWith("{.format}")) {
      cb(null)
      return
    }

    const ss = []
    const vs = ["delete", "get", "head", "options", "patch", "post", "put", "trace"]

    vs.forEach((v) => {
      const o = ch.value[v]
      if (o === undefined) {
        return
      }
      if (o.tags === undefined) {
        o.tags = [this._pack]
      }
      o.tags = o.tags.map(capitalizeTitle)
      if (o.description !== undefined) {
        o.description = `**Note**: ${o.description}`
      }
      if (o.summary !== undefined) {
        if (o.description === undefined) {
          o.description = o.summary
        } else {
          o.description = `${o.summary}\n\n${o.description}`
        }
      }
      if (o["x-shortName"] !== undefined) {
        o.summary = o["x-shortName"]
        ss.push(o.summary)
      }
      // https://github.com/ONLYOFFICE/DocSpace-server/blob/v2.0.2-server/products/ASC.People/Server/Api/UserController.cs#L2028
      if (o.summary === undefined) {
        delete ch.value[v]
      }
    })

    // https://github.com/ONLYOFFICE/DocSpace-server/blob/v2.0.2-server/web/ASC.Web.Api/Api/AuthenticationController.cs#L359-L360
    vs.forEach((v) => {
      const o = ch.value[v]
      if (o === undefined) {
        return
      }
      const count = ss.filter((s) => o.summary === s).length
      if (count > 1) {
        o.summary = `${o.summary} (${v.toUpperCase()})`
      }
    })

    super._transform(ch, _, cb)
  }
}
