#!/usr/bin/env node

// @ts-check

import { execSync, spawn } from "node:child_process"
import { mkdir, readdir, readFile, rm, writeFile } from "node:fs/promises"
import { createWriteStream, existsSync } from "node:fs"
import { basename, dirname, join } from "node:path"
import { argv } from "node:process"
import { fromMarkdown } from "mdast-util-from-markdown"
import { gfmTableFromMarkdown } from "mdast-util-gfm-table"
import { gfmTable } from "micromark-extension-gfm-table"
import sade from "sade"
import * as jsdoc from "./jsdoc.js"

const makefile = new URL(import.meta.url).pathname
const root = dirname(makefile)
const make = sade("./makefile.js")

// todo: move the local temp dir to the os.temp

make
  .command("build")
  .action(async () => {
    const t = join(root, "temp")
    if (!existsSync(t)) {
      throw new Error("")
    }

    const i = join(t, "office-js-api")
    if (!existsSync(i)) {
      throw new Error("")
    }

    await prepare(i, t)

    const o = join(root, "data")
    if (!existsSync(o)) {
      await mkdir(o)
    }

    await build(t, o)

    /**
     * @param {string} i
     * @param {string} o
     * @returns {Promise<void>}
     */
    async function prepare(i, o) {
      const l = ["Cell", "Form", "Slide", "Word"]
      await Promise.all(l.map(async (m) => {
        // todo: replace with a stream
        /** @type {Definition} */
        const def = {
          content: ""
        }
        const d = join(i, m)
        await prepareModule(def, d)
        const f = join(o, `${m.toLocaleLowerCase()}.js`)
        if (existsSync(f)) {
          await rm(f)
        }
        await writeFile(f, def.content)
      }))
    }

    /**
     * @typedef {Object} Definition
     * @property {string} content
     */

    /**
     * @param {Definition} def
     * @param {string} r
     * @returns {Promise<void>}
     */
    async function prepareModule(def, r) {
      const l = await readdir(r)
      await Promise.all(l.map(async (c) => {
        const d = join(r, c)
        await prepareClass(def, d)
      }))
    }

    /**
     * @param {Definition} def
     * @param {string} r
     * @returns {Promise<void>}
     */
    async function prepareClass(def, r) {
      /** @type {("Events" | "Methods" | "Properties")[]} */
      const l = ["Events", "Methods", "Properties"]
      await Promise.all(l.map(async (u) => {
        const d = join(r, u)
        switch (u) {
          case "Properties":
            await prepareProperties(def, d)
            return
        }
        if (!existsSync(d)) {
          return
        }
        switch (u) {
          case "Events":
            await prepareEvents(def, d)
            return
          case "Methods":
            await prepareMethods(def, d)
            return
          // case "Properties":
          //   await prepareProperties(def, d)
          //   return
        }
      }))
    }

    /**
     * @param {Definition} def
     * @param {string} r
     * @returns {Promise<void>}
     */
    async function prepareEvents(def, r) {
      const p = dirname(r)
      const l = await readdir(r)
      await Promise.all(l.map(async (n) => {
        const f = join(r, n)
        const md = await readFile(f)
        const t = fromMarkdown(md, {
          extensions: [gfmTable()],
          mdastExtensions: [gfmTableFromMarkdown()]
        })
        const e = jsdoc.event()
        e.parent = basename(p)
        const b = [e]
        jsdoc.parse(t, b)
        def.content += "\n\n/**\n"
        await Promise.all(b.map(async (u) => {
          u.normalize()
          const r = await u.render()
          r.split("\n").map((i) => {
            def.content += ` * ${i}\n`
          })
        }))
        def.content += " */"
      }))
    }

    /**
     * @param {Definition} def
     * @param {string} r
     * @returns {Promise<void>}
     */
    async function prepareMethods(def, r) {
      const p = dirname(r)
      const l = await readdir(r)
      await Promise.all(l.map(async (n) => {
        const f = join(r, n)
        const md = await readFile(f)
        const t = fromMarkdown(md, {
          extensions: [gfmTable()],
          mdastExtensions: [gfmTableFromMarkdown()]
        })
        const m = jsdoc.memberof()
        m.parent = basename(p)
        const b = [m]
        jsdoc.parse(t, b)
        def.content += "\n\n/**\n"
        await Promise.all(b.map(async (u) => {
          u.normalize()
          const r = await u.render()
          r.split("\n").map((i) => {
            def.content += ` * ${i}\n`
          })
        }))
        def.content += " */"
      }))
    }

    /**
     * @param {Definition} def
     * @param {string} r
     * @returns {Promise<void>}
     */
    async function prepareProperties(def, r) {
      const pn = dirname(r)
      const c = jsdoc.cls()
      const n = jsdoc.name()
      n.content = basename(pn)
      const d = await (async () => {
        const f = join(pn, `${n.content}.md`)
        const md = await readFile(f)
        const t = fromMarkdown(md, {
          extensions: [gfmTable()],
          mdastExtensions: [gfmTableFromMarkdown()]
        })
        const d = jsdoc.description()
        const b = [d]
        jsdoc.parse(t, b)
        return d
      })()
      const buf = [c, n, d]
      if (existsSync(r)) {
        const l = await readdir(r)
        await Promise.all(l.map(async (n) => {
          const f = join(r, n)
          const md = await readFile(f)
          const t = fromMarkdown(md, {
            extensions: [gfmTable()],
            mdastExtensions: [gfmTableFromMarkdown()]
          })
          const p = jsdoc.property()
          p.name = basename(pn)
          const b = [p]
          jsdoc.parse(t, b)
          buf.push(...b)
        }))
      }
      def.content += "\n\n/**\n"
      await Promise.all(buf.map(async (u) => {
        u.normalize()
        const r = await u.render()
        r.split("\n").map((i) => {
          def.content += ` * ${i}\n`
        })
      }))
      def.content += " */"
    }

    /**
     * @param {string} from
     * @param {string} to
     */
    async function build(from, to) {
      const l = ["Cell", "Form", "Slide", "Word"]
      await Promise.all(l.map((u) => (
        new Promise((resolve, reject) => {
          const n = u.toLocaleLowerCase()
          const o = join(to, `${n}.json`)
          const w = createWriteStream(o)
          const i = join(from, `${n}.js`)
          const e = spawn("./node_modules/.bin/jsdoc", [i, "--explain"])
          e.stdout.on("data", (chunk) => {
            w.write(chunk)
          })
          e.stdout.on("close", () => {
            w.close()
            resolve(undefined)
          })
          e.stdout.on("error", (error) => {
            console.error(error)
            w.close()
            reject(error)
          })
        })
      )))
    }
  })

make
  .command("pull")
  .action(async () => {
    const t = join(root, "temp")
    if (!existsSync(t)) {
      await mkdir(t)
    }

    const n = "office-js-api"
    const d = join(t, n)
    if (existsSync(d)) {
      await rm(d, {
        force: true,
        recursive: true
      })
    }

    const o = "ONLYOFFICE"
    const u = `https://github.com/${o}/${n}`
    execSync(`git clone --depth 1 ${u} ${d}`, {
      encoding: "utf-8",
      stdio: "inherit"
    })

    const h = join(d, ".git")
    await rm(h, {
      force: true,
      recursive: true
    })
  })

make.parse(argv)
