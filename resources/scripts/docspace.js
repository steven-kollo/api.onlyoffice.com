// @ts-check

/**
 * @typedef {import("node:stream").TransformCallback} TransformCallback
 */

import { mkdir, mkdtemp, readFile, rm, writeFile } from "node:fs/promises"
import { createReadStream, createWriteStream, existsSync } from "node:fs"
import { tmpdir } from "node:os"
import { join } from "node:path"
import { URL, fileURLToPath } from "node:url"
import { Console as DeclarationConsole } from "@onlyoffice/documentation-declarations/console.js"
import { PreprocessPath as OpenAPIPreprocessPath, PreprocessComponent } from "@onlyoffice/documentation-declarations/openapi.js"
import { prettifyJSON } from "@onlyoffice/documentation-scripts/jq.js"
import Chain from "stream-chain"
import Pick from "stream-json/filters/Pick.js"
import StreamObject from "stream-json/streamers/StreamObject.js"
import Disassembler from "stream-json/Disassembler.js"
import Stringer from "stream-json/Stringer.js"
import parser from "stream-json"
import { UnStreamObject, download, makeObject, mergeArrays, mergeObjects, num, rmrf } from "./utils.js"
import pack from "../package.json" assert { type: "json" }

// import { createRequire } from "module"
// const require = createRequire(import.meta.url)

const root = fileURLToPath(new URL("..", import.meta.url))
const dist = join(root, "dist")
const src = join(root, "src")

const ref = "https://raw.githubusercontent.com/vanyauhalin/onlyoffice-docs-declarations-demo2/dist/"
const files = [
  "asc.data.backup.swagger.json",
  "asc.files.swagger.json",
  "asc.people.swagger.json",
  "asc.web.api.swagger.json"
]

async function build() {
  const tmp = join(tmpdir(), pack.name.replace("/", "+"))
  const temp = await mkdtemp(`${tmp}-`)

  if (!existsSync(dist)) {
    await mkdir(dist)
  }

  const de = declarationConsole()

  /** @type {string[]} */
  const paths = []
  /** @type {string[]} */
  const components = []

  await Promise.all(files.map(async (file) => {
    const f = join(temp, file)
    const u = `${ref}/${file}`
    await download(u, f)

    const p = remapPackage(file)

    let from = f
    let to = join(temp, num(file, 0))
    await new Promise((res, rej) => {
      const c = new Chain([
        createReadStream(from),
        parser(),
        new Pick({ filter: "paths" }),
        new StreamObject(),
        new PreprocessPath(p, de),
        new Disassembler(),
        new Stringer({ makeArray: true }),
        createWriteStream(to)
      ])
      c.on("error", rej)
      c.on("close", res)
    })
    paths.push(to)

    from = f
    to = join(temp, num(file, 1))
    await new Promise((res, rej) => {
      const c = new Chain([
        createReadStream(from),
        parser(),
        new Pick({ filter: "components.schemas" }),
        new StreamObject(),
        new PreprocessComponent(de),
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

  const pn = "docspace"
  const pp = `${pn}.paths.json`
  const pc = `${pn}.references.json`

  let from = ""
  let to = ""

  // todo: use promise all

  to = join(temp, pp)
  await mergeArrays(paths, to)

  from = to
  to = join(dist, pp)
  await prettifyJSON(from, to)

  to = join(temp, pc)
  await mergeObjects(components, to)

  from = to
  to = join(dist, pc)
  await prettifyJSON(from, to)

  from = join(src, "rest.cjs")
  to = join(dist, `${pn}.cjs`)
  let c = await readFile(from, { encoding: "utf8" })
  c = c.replaceAll("resource", pn)
  await writeFile(to, c, { encoding: "utf8" })

  await rm(temp, { recursive: true, force: true })
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

class PreprocessPath extends OpenAPIPreprocessPath {
  constructor(pack, ...args) {
    super(...args)
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
      o.tags = o.tags.map(titleCase)
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
      if (o.requestBody !== undefined) {
        if (o.requestBody.content !== undefined) {
          ["application/*+json", "text/json", "text/plain"].forEach((t) => {
            if (o.requestBody.content[t] !== undefined) {
              delete o.requestBody.content[t]
            }
          })
        }
      }
      if (o.responses !== undefined) {
        Object.entries(o.responses).forEach(([_, r]) => {
          if (r.content !== undefined) {
            ["application/*+json", "text/json", "text/plain"].forEach((t) => {
              if (r.content[t] !== undefined) {
                delete r.content[t]
              }
            })
          }
        })
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

function declarationConsole() {
  const f = join(root, "report.log")
  const s = createWriteStream(f)
  return new DeclarationConsole(s, s)
}

function titleCase(s) {
  return s
    .toLowerCase()
    .split(" ")
    .map((w) => {
      return w.charAt(0).toUpperCase() + w.slice(1)
    })
    .join(" ")
}

export { build }
