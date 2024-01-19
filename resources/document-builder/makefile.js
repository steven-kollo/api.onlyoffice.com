#!/usr/bin/env node

// @ts-check

/**
 * @typedef {import("node:stream").TransformCallback} TransformCallback
 * @typedef {import("@onlyoffice/documentation-declarations").Declaration} Declaration
 */

import { copyFile, mkdir, mkdtemp, rm, writeFile } from "node:fs/promises"
import { createReadStream, createWriteStream, existsSync } from "node:fs"
import { tmpdir } from "node:os"
import { basename, extname, join } from "node:path"
import { argv } from "node:process"
import { finished } from "node:stream/promises"
import { Readable, Transform } from "node:stream"
import { fileURLToPath } from "node:url"
import * as builtin from "@onlyoffice/documentation-declarations/builtin.js"
import { parseDeclaration } from "@onlyoffice/documentation-declarations/jsdoc.js"
import { sortJSON, prettifyJSON } from "@onlyoffice/documentation-scripts/jq.js"
import esMain from "es-main"
import MultiStream from "multistream"
import sade from "sade"
import Chain from "stream-chain"
import StreamArray from "stream-json/streamers/StreamArray.js"
import Disassembler from "stream-json/Disassembler.js"
import Stringer from "stream-json/Stringer.js"
import parser from "stream-json"
import pack from "./package.json" assert { type: "json" }

const root = fileURLToPath(new URL(".", import.meta.url))
const make = sade("./makefile.js")

make
  .command("build")
  .option("-p, --prettify", "Prettify the output")
  .action(build)

/**
 * @typedef {Object} BuildOptions
 * @property {boolean} [prettify=false]
 */

/**
 * @param {BuildOptions=} options
 * @returns {Promise<void>}
 */
async function build(options) {
  /** @type {BuildOptions} */
  const opts = {
    prettify: false,
    ...options
  }

  const ref = "https://raw.githubusercontent.com/vanyauhalin/onlyoffice-docs-definitions-demo/dist"
  const files = ["sdkjs-forms.json", "sdkjs.json"]

  const tmp = join(tmpdir(), pack.name.replace("/", "-"))
  const temp = await mkdtemp(tmp)

  const dist = join(root, "dist")
  if (!existsSync(dist)) {
    await mkdir(dist)
  }

  // todo: write js objects directly to the ./dist/main.cjs.

  const bn = "builtin.json"
  const bf = join(temp, bn)
  const bl = Object.values(builtin)
  const bc = JSON.stringify(bl, null, 2)
  await writeFile(bf, bc)

  const ln = "list.json"

  /** @type {string[]} */
  const li = [bf]

  await Promise.all(files.map(async (file) => {
    const f = join(temp, file)
    const u = `${ref}/${file}`
    await fetchFile(u, f)

    const n = basename(file, extname(file))
    const lp = join(temp, `${n}.${ln}`)
    await createList(f, lp)
    li.push(lp)
  }))

  const mn = "map.json"

  const lp = join(temp, ln)
  await mergeArrays(li, lp)

  const lp2 = join(temp, `${ln}2`)
  await sortJSON(lp, lp2, ".id")

  const mp = join(temp, mn)
  await createMap(lp2, mp)

  if (opts.prettify) {
    const lt = join(dist, ln)
    await prettifyJSON(lp2, lt)

    const mt = join(dist, mn)
    await prettifyJSON(mp, mt)
  } else {
    const lt = join(dist, ln)
    await copyFile(lp2, lt)

    const mt = join(dist, mn)
    await copyFile(mp, mt)
  }

  const src = join(root, "src")
  const ma = "main.cjs"
  const maf = join(src, ma)
  const mat = join(dist, ma)
  await copyFile(maf, mat)

  await rm(temp, { recursive: true, force: true })
}

/**
 * @param {string} from
 * @param {string} to
 * @returns {Promise<void>}
 */
async function fetchFile(from, to) {
  const res = await fetch(from)
  const r = Readable.fromWeb(res.body)
  const s = createWriteStream(to)
  const w = r.pipe(s)
  await finished(w)
}

/**
 * @param {string} from
 * @param {string} to
 * @returns {Promise<void>}
 */
function createList(from, to) {
  return new Promise((res, rej) => {
    const c = new Chain([
      createReadStream(from),
      parser(),
      new StreamArray(),
      (ch) => {
        return createDeclaration(ch.value)
      },
      new Disassembler(),
      new Stringer({ makeArray: true }),
      createWriteStream(to)
    ])
    c.on("error", rej)
    c.on("finish", res)
  })
}

/**
 *
 * @param {string} from
 * @param {string} to
 * @returns {Promise<void>}
 */
function createMap(from, to) {
  let i = 0
  return new Promise((res, rej) => {
    const c = new Chain([
      createReadStream(from),
      parser(),
      new StreamArray(),
      new Transform({
        objectMode: true,
        transform(ch, _, cb) {
          pushPair.call(this, ch.value.id, i)
          i += 1
          cb(null)
        }
      }),
      makeObject(),
      new Stringer(),
      createWriteStream(to)
    ])
    c.on("error", rej)
    c.on("finish", res)
  })
}

/**
 * @param {string[]} from
 * @param {string} to
 * @returns {Promise<void>}
 */
function mergeArrays(from, to) {
  return new Promise((res, rej) => {
    const c = new Chain([
      new MultiStream(from.map((p) => createReadStream(p))),
      parser({ jsonStreaming: true }),
      new StreamArray(),
      (ch) => {
        return ch.value
      },
      new Disassembler(),
      new Stringer({ makeArray: true }),
      createWriteStream(to)
    ])
    c.on("error", rej)
    c.on("finish", res)
  })
}

/**
 * @this {Transform}
 * @param {string} k
 * @param {number} v
 * @returns {void}
 */
function pushPair(k, v) {
  this.push({ name: "startKey" })
  this.push({ name: "stringChunk" , value: k })
  this.push({ name: "endKey" })
  this.push({ name: "startNumber" })
  this.push({ name: "numberChunk", value: `${v}` })
  this.push({ name: "endNumber" })
}

/**
 * @returns {Transform}
 */
function makeObject() {
  // https://github.com/uhop/stream-json/pull/143
  return new Transform({
    objectMode: true,
    transform(ch, enc, cb) {
      this.push({ name: "startObject" })
      this._transform = transformPassThrough
      return this._transform(ch, enc, cb)
    },
    flush(cb) {
      if (this._transform === transformPassThrough) {
        this.push({ name: "endObject" })
      }
      cb(null)
    }
  })
}

/**
 * @this {Transform}
 * @param {any} ch
 * @param {BufferEncoding} enc
 * @param {TransformCallback} cb
 */
function transformPassThrough(ch, enc, cb) {
  this.push(ch, enc)
  cb(null)
}

/**
 * @param {any} v
 * @returns {Declaration=}
 */
function createDeclaration(v) {
  if (!(
    Object.hasOwn(v, "meta") &&
    Object.hasOwn(v.meta, "file") &&
    Object.hasOwn(v, "longname")
  )) {
    return
  }

  const d = parseDeclaration(v, (t) => {
    t.id = [v.meta.file, t.id].join(";")
  })
  if (d === undefined) {
    return
  }

  const longname = v.longname.replace(/\<anonymous\>~?/, "")
  d.id = [v.meta.file, longname].join(";")

  if (d.memberof !== undefined) {
    d.memberof = d.memberof.replace(/\<anonymous\>~?/, "")
  }

  return d
}

if (esMain(import.meta)) {
  make.parse(argv)
}

export { build }
