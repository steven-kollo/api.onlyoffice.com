#!/usr/bin/env node

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
  const s = join(src, "sc.webc")
  if (!existsSync(dist)) {
    await mkdir(dist)
  }
  const d = join(dist, "sc.webc")
  await copyFile(s, d)
}

make
  .command("test")
  .action(test)

function test() {}

if (esMain(import.meta)) {
  make.parse(argv)
}

export { build, test }
