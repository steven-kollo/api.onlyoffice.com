import { rm } from "node:fs/promises"
import { createReadStream, createWriteStream } from "node:fs"
import { join } from "node:path"
import {
  DeclarationsCache,
  PostprocessDeclarations,
  PostPostprocessDeclarations,
  PreprocessDeclarations as JSDocPreprocessDeclarations
} from "@onlyoffice/documentation-declarations-scripts/jsdoc.ts"
import { sortJSON, prettifyJSON } from "@onlyoffice/documentation-utils/jq.ts"
import Chain from "stream-chain"
import StreamArray from "stream-json/streamers/StreamArray.js"
import Disassembler from "stream-json/Disassembler.js"
import Stringer from "stream-json/Stringer.js"
import parser from "stream-json"
import { downloadFile } from "../utils/net.ts"
import { createIndexes, mergeArrays } from "../utils/stream.ts"
import { num, writeTemplate } from "./utils.ts"

import { createRequire } from "node:module"
const require = createRequire(import.meta.url)

const ref = "https://raw.githubusercontent.com/vanyauhalin/onlyoffice-docs-definitions-demo/dist/"
const files = [
  "sdkjs-forms.json",
  "sdkjs.json"
]

/**
 * @param {string} tempDir
 * @param {string} distDir
 * @returns {Promise<void>}
 */
export async function build(tempDir, distDir) {
  /** @type {string[]} */
  const froms = []

  await Promise.all(files.map(async (file) => {
    const f = join(tempDir, file)
    const u = `${ref}${file}`
    await downloadFile(u, f)

    const cache = new DeclarationsCache()

    let from = f
    let to = join(tempDir, num(file, 0))
    await new Promise((res, rej) => {
      const c = new Chain([
        createReadStream(from),
        parser(),
        new StreamArray(),
        new PreprocessDeclarations(cache),
        new Disassembler(),
        new Stringer({ makeArray: true }),
        createWriteStream(to)
      ])
      c.on("error", rej)
      c.on("close", res)
    })

    from = to
    to = join(tempDir, num(file, 1))
    await new Promise((res, rej) => {
      const c = new Chain([
        createReadStream(from),
        parser(),
        new StreamArray(),
        new PostprocessDeclarations(cache),
        new Disassembler(),
        new Stringer({ makeArray: true }),
        createWriteStream(to)
      ])
      c.on("error", rej)
      c.on("close", res)
    })

    const _list = require(to)
    // @ts-ignore
    cache._onRetrieve = function _onRetrieve(id) {
      // @ts-ignore
      return _list[cache.retrieve(id).index]
    }

    // let _to = to
    // // @ts-ignore
    // cache._onRetrieve = async function _onRetrieve(id) {
    //   let d
    //   await new Promise((res, rej) => {
    //     const c = new Chain([
    //       createReadStream(_to),
    //       parser(),
    //       new StreamArray(),
    //       new Transform({
    //         objectMode: true,
    //         transform(ch, _, cb) {
    //           if (ch.value.id === id) {
    //             d = ch.value
    //           } else {
    //             cb(null)
    //           }
    //         }
    //       })
    //     ])
    //     c.on("error", rej)
    //     c.on("close", res)
    //   })
    //   // @ts-ignore
    //   return d
    // }

    from = to
    to = join(tempDir, num(file, 2))
    await new Promise((res, rej) => {
      const c = new Chain([
        createReadStream(from),
        parser(),
        new StreamArray(),
        new PostPostprocessDeclarations(cache),
        new Disassembler(),
        new Stringer({ makeArray: true }),
        createWriteStream(to)
      ])
      c.on("error", rej)
      c.on("close", res)
    })

    froms.push(to)
  }))

  const pn = "document-builder"
  const pd = `${pn}.declarations.json`
  const pi = `${pn}.indexes.json`

  let from = ""
  let to = join(tempDir, pd)
  await mergeArrays(froms.map((f) => createReadStream(f)), to)

  from = to
  to = join(distDir, pd)
  await sortJSON(from, to, ".id")

  from = to
  to = join(tempDir, pi)
  await createIndexes(from, to, "id")

  from = to
  to = join(distDir, pi)
  await prettifyJSON(from, to)

  await writeTemplate("code", pn)
  await rm(tempDir, { recursive: true, force: true })
}

class PreprocessDeclarations extends JSDocPreprocessDeclarations {
  // todo: typing.
  constructor(cache) {
    super(cache)
  }

  _transform(ch, enc, cb) {
    // todo: /** @type {Doclet} */
    const doc = ch.value
    if (Object.hasOwn(doc, "meta") && Object.hasOwn(doc.meta, "file")) {
      let file = doc.meta.file.replace(/.*contents\/([\S\s]*)\.js.*/, "$1")
      if (doc.meta.file.includes("sdkjs-forms")) {
        file = `forms/${file}`
      }
      doc.meta.file = file
    }
    // todo: support the `Example: 1.` in properties, parameters, and returns.
    if (Object.hasOwn(doc, "longname")) {
      if (doc.longname === "ApiRange#Find" || doc.longname === "ApiRange#Replace") {
        // todo: @also
        // https://github.com/ONLYOFFICE/sdkjs/blob/eb92448a74506b94ca984b6c6dd82b715ecf4836/cell/apiBuilder.js#L3307
        // https://github.com/ONLYOFFICE/sdkjs/blob/eb92448a74506b94ca984b6c6dd82b715ecf4836/cell/apiBuilder.js#L3464
        cb(null)
        return
      }
    }
    if (Object.hasOwn(doc, "name")) {
      if (doc.name.startsWith("\"") && doc.name.endsWith("\"")) {
        doc.name = doc.name.slice(1, -1)
      }
    }
    super._transform(ch, enc, cb)
  }
}
