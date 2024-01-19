#!/usr/bin/env node

// @ts-check

/**
 * @typedef {import("node:fs").WriteStream} WriteStream
 * @typedef {import("node:stream").TransformCallback} TransformCallback
 * @typedef {import("../resource").Declaration} Declaration
 * @typedef {import("../resource").Array} Array
 * @typedef {import("../resource").Literal} Literal
 * @typedef {import("../resource").Record} Record
 * @typedef {import("../resource").Generic} Generic
 * @typedef {import("../resource").Type} Type
 */

import { spawn } from "node:child_process"
import { copyFile, mkdir, mkdtemp, rm, writeFile } from "node:fs/promises"
import { createReadStream, createWriteStream, existsSync } from "node:fs"
import { tmpdir } from "node:os"
import { basename, extname, join } from "node:path"
import { argv } from "node:process"
import { finished } from "node:stream/promises"
import { Readable, Transform } from "node:stream"
import { fileURLToPath } from "node:url"
import esMain from "es-main"
import MultiStream from "multistream"
import sade from "sade"
import Chain from "stream-chain"
import StreamArray from "stream-json/streamers/StreamArray.js"
import Disassembler from "stream-json/Disassembler.js"
import Stringer from "stream-json/Stringer.js"
import parser from "stream-json"
import * as builtin from "../builtin.js"
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
  /** @type {Declaration} */
  const d = {
    id: "",
    name: ""
  }

  if (!(
    Object.hasOwn(v, "meta") &&
    Object.hasOwn(v.meta, "file") &&
    Object.hasOwn(v, "longname")
  )) {
    return
  }

  let longname = v.longname
  if (!longname.includes("#")) {
    if (!longname.includes("<anonymous>") && Object.hasOwn(v, "memberof")) {
      longname = [v.memberof, longname].join("#")
    }
  }

  d.id = [v.meta.file, longname].join(";")

  if (!(Object.hasOwn(v, "name"))) {
    return
  }
  d.name = v.name

  if (Object.hasOwn(v, "description")) {
    d.summary = v.description.split("\n")[0]
    d.description = {
      syntax: "txt",
      text: v.description
    }
  }

  if (Object.hasOwn(v, "kind")) {
    d.kind = v.kind
  }

  if (Object.hasOwn(v, "memberof")) {
    d.memberof = v.memberof
  }

  if (Object.hasOwn(v, "type")) {
    d.type = v.type.names.map((n) => {
      return parseType(n)
    })
  }

  return d
}

/**
 * @param {string} s
 * @returns {Type}
 */
export function parseType(s) {
  // todo: should we separate primitives and objects or not?

  if (s === "array" || s === "Array") {
    /** @type {Array} */
    const t = {
      id: builtin.Array.id,
      children: []
    }
    return t
  }
  if (s === "boolean" || s === "Boolean") {
    /** @type {Type} */
    const t = {
      id: builtin.Boolean.id
    }
    return t
  }
  if (s === "null" || s === "Null") {
    /** @type {Type} */
    const t = {
      id: builtin.Null.id
    }
    return t
  }
  if (s === "number" || s === "Number") {
    /** @type {Type} */
    const t = {
      id: builtin.Number.id
    }
    return t
  }
  if (s === "object" || s === "Object") {
    /** @type {Type} */
    const t = {
      id: builtin.Object.id,
      children: []
    }
    return t
  }
  if (s === "string" || s === "String") {
    /** @type {Type} */
    const t = {
      id: builtin.String.id
    }
    return t
  }
  if (s === "undefined") {
    /** @type {Type} */
    const t = {
      id: builtin.Undefined.id
    }
    return t
  }

  if (isGeneric(s)) {
    return parseGeneric(s)
  }
  if (isLiteralNumber(s)) {
    /** @type {Literal} */
    const t = {
      id: builtin.Literal.id,
      value: s
    }
    return t
  }
  if (isLiteralString(s)) {
    /** @type {Literal} */
    const t = {
      id: builtin.Literal.id,
      value: s.slice(1, -1)
    }
    return t
  }

  /** @type {Generic} */
  const t = {
    id: "custom",
    children: []
  }
  return t
}

/**
 * @param {string} s
 * @returns {boolean}
 */
function isGeneric(s) {
  return s.includes("<")
}

/**
 * @param {string} s
 * @returns {Type}
 */
function parseGeneric(s) {
  /** @type {Type[]} */
  const st = []
  let c = {
    id: "",
    children: []
  }

  for (let i = 0; i < s.length; i += 1) {
    switch (s[i]) {
      case ".":
        i += 2
        const [t0, j0] = process(i)
        c.children.push(t0)
        st.push(c)
        i = j0
        c = t0
        break
      case ",":
        i += 2
        const [t1, j1] = process(i)
        const p = st.pop()
        p.children.push(t1)
        st.push(p)
        i = j1
        c = t1
        break
      case ">":
        c = st.pop()
        break
      default:
        const [t2, j2] = process(i)
        i = j2
        c = t2
        break
    }
  }

  /**
   * @param {number} i
   * @returns {[Type, number]}
   */
  function process(i) {
    let n = ""
    while (s[i] !== "." && s[i] !== "," && s[i] !== ">") {
      n += s[i]
      i += 1
    }

    const t = parseType(n)
    // // todo: not sure that it is right way.
    // if (s[i] === "," || s[i] === ">") {
    //   delete t.children
    // } else if (t.id === builtin.Object.id) {
    //   t.id = builtin.Record.id
    // }

    i -= 1
    return [t, i]
  }

  return c
}

/**
 * @param {string} s
 * @returns {boolean}
 */
function isLiteralNumber(s) {
  return !isNaN(parseFloat(s));
}

/**
 * @param {string} s
 * @returns {boolean}
 */
function isLiteralString(s) {
  return s.startsWith('"') && s.endsWith('"')
}

/**
 * @param {string} from
 * @param {string} to
 * @param {string} by
 * @returns {Promise<void>}
 */
function sortJSON(from, to, by) {
  const w = createWriteStream(to)
  return jq(w, [`. |= sort_by(${by})`, from])
}

/**
 * @param {string} from
 * @param {string} to
 * @returns {Promise<void>}
 */
function prettifyJSON(from, to) {
  const w = createWriteStream(to)
  return jq(w, [".", from])
}

/**
 * @param {WriteStream} w
 * @param {string[]} [args=[]]
 * @returns {Promise<void>}
 */
function jq(w, args = []) {
  return new Promise((res, rej) => {
    const s = spawn("jq", args)
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

if (esMain(import.meta)) {
  make.parse(argv)
}

export { build }
