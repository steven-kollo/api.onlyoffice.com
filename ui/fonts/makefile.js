#!/usr/bin/env node
// @ts-check

import { copyFile, mkdir } from "node:fs/promises"
import { existsSync } from "node:fs"
import { join } from "node:path"
import { argv } from "node:process"
import { URL, fileURLToPath } from "node:url"
import sade from "sade"
import esMain from "es-main"

const root = fileURLToPath(new URL(".", import.meta.url))
const src = join(root, "src")
const dist = join(root, "dist")
const make = sade("./makefile.js")

make
  .command("build")
  .action(build)

async function build() {
  if (!existsSync(dist)) {
    await mkdir(dist)
  }

  await Promise.all([
    await Promise.all([
      "fonts.css"
    ].map(async (n) => {
      const f = join(src, n)
      const t = join(dist, n)
      await copyFile(f, t)
    }))
  ])
}

if (esMain(import.meta)) {
  make.parse(argv)
}

export { build }
