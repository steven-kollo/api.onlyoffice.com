#!/usr/bin/env node
// @ts-check

import { mkdir, readFile, readdir, writeFile } from "node:fs/promises"
import { existsSync } from "node:fs"
import { basename, extname, join } from "node:path"
import { argv } from "node:process"
import { URL, fileURLToPath } from "node:url"
import sade from "sade"
import esMain from "es-main"

const root = fileURLToPath(new URL(".", import.meta.url))
const lib = join(root, "lib")
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
  return `import { h } from "preact"\n\nfunction ${n}() {\n  return (${c})\n}\n\nexport { ${n} }\n`
}

make
  .command("build")
  .action(build)

async function build() {
  if (!existsSync(lib)) {
    await mkdir(lib)
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
    f = join(lib, `${n}.ts`)
    await writeFile(f, c)
    entryPoints.push(f)
    f = f.replace(lib, ".")
    relativeEntryPoints.push(f)
  }))

  // todo: update package.json exports.

  // todo: allowImportingTsExtensions
  let index = relativeEntryPoints.map((f) => `export * from "${f}"`).join("\n")
  let f = join(lib, "icon.tsx")
  await writeFile(f, index)
  entryPoints.push(f)
}

if (esMain(import.meta)) {
  make.parse(argv)
}

export { build }
