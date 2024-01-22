#!/usr/bin/env node

// @ts-check

import { copyFile, mkdir, readdir } from "node:fs/promises"
import { existsSync } from "node:fs"
import { join } from "node:path"
import { argv } from "node:process"
import { URL, fileURLToPath } from "node:url"
import sade from "sade"
import esMain from "es-main"

const root = fileURLToPath(new URL(".", import.meta.url))
const src = join(root, "src")
const dist = join(root, "dist")
const modules = join(root, "node_modules")
const make = sade("./makefile.js")

make
  .command("build")
  .action(build)

async function build() {
  if (!existsSync(dist)) {
    await mkdir(dist)
  }
  await Promise.all([
    "kit.css"
  ].map(async (n) => {
    const f = join(src, n)
    const t = join(dist, n)
    await copyFile(f, t)
  }))
  const d0 = join(dist, "documentation-ui-reflection-webc")
  if (!existsSync(d0)) {
    await mkdir(d0)
  }
  // todo: read exports in package json and use them
  const d1 = join(modules, "@onlyoffice/documentation-ui-reflection-webc/dist")
  const l = await readdir(d1)
  await Promise.all(l.map(async (n) => {
    const f = join(d1, n)
    const t = join(d0, n)
    await copyFile(f, t)
  }))
}

if (esMain(import.meta)) {
  make.parse(argv)
}

export { build }
