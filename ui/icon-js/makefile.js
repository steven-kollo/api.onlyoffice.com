#!/usr/bin/env node
// @ts-check

import { exec } from "node:child_process"
import { mkdir, readFile, readdir, writeFile } from "node:fs/promises"
import { existsSync } from "node:fs"
import { basename, extname, join } from "node:path"
import { argv } from "node:process"
import { URL, fileURLToPath } from "node:url"
import sade from "sade"
import esMain from "es-main"
import esbuild from "esbuild"

const root = fileURLToPath(new URL(".", import.meta.url))
const src = join(root, "src")
const dist = join(root, "dist")
const make = sade("./makefile.js")

/**
 * @param {string} s
 * @returns {string}
 */
function capitalizeKebab(s) {
  return s
    .split("-")
    .map((w) => w.charAt(0).toUpperCase() + w.slice(1))
    .join("")
}

/**
 * @param {string} n
 * @param {string} c
 * @returns {string}
 */
function SVGToJSComponent(n, c) {
  return `function ${n}() {\n  return \`${c}\`\n}\n\nexport { ${n} }\n`
}

make
  .command("build")
  .action(build)

async function build() {
  if (!existsSync(dist)) {
    await mkdir(dist)
  }

  if (!existsSync(src)) {
    await mkdir(src)
  }

  const entryPoints = []
  const relativeEntryPoints = []

  const module = join(root, "node_modules/@onlyoffice/documentation-ui-icon/src")
  const list = await readdir(module)
  await Promise.all(list.map(async (item) => {
    let n = basename(item, extname(item))
    n = `${capitalizeKebab(n)}Icon`
    let f = join(module, item)
    let c = await readFile(f, { encoding: "utf8" })
    c = c.trim()
    c = SVGToJSComponent(n, c)
    f = join(src, `${n}.ts`)
    await writeFile(f, c)
    entryPoints.push(f)
    f = f.replace(src, ".")
    relativeEntryPoints.push(f)
  }))

  // todo: update package.json exports.

  // todo: allowImportingTsExtensions
  let index = relativeEntryPoints.map((f) => `export * from "${f.replace(".ts", ".js")}"`).join("\n")
  let f = join(src, "icon.ts")
  await writeFile(f, index)
  entryPoints.push(f)

  await Promise.all([
    await new Promise((res, rej) => {
      const tsc = join(root, "node_modules", ".bin", "tsc")
      const p = join(root, "tsconfig.json")
      exec(`${tsc} --project ${p}`, (err, stdout, stderr) => {
        if (err) {
          return rej(err)
        }
        if (stderr) {
          return rej(stderr)
        }
        return res(stdout)
      })
    }),
    await build(),
    await build({
      format: "cjs",
      outExtension: {
        ".js": ".cjs"
      },
      plugins: [
        {
          name: "cjs-in-imports",
          setup(build) {
            build.onLoad({ filter: /\.ts$/ }, async (args) => {
              let content = await readFile(args.path, "utf8")
              content = content.replace(/from "(.*)\.js"/g, 'from "$1.cjs"')
              return { contents: content, loader: "js" }
            })
          }
        }
      ]
    })
  ])

  function build(o = {}) {
    return esbuild.build({
      entryPoints,
      outdir: dist,
      platform: "node",
      ...o
    })
  }
}

if (esMain(import.meta)) {
  make.parse(argv)
}

export { build }
