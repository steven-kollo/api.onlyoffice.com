#!/usr/bin/env node
// @ts-check

import { mkdir } from "node:fs/promises"
import { existsSync } from "node:fs"
import { join } from "node:path"
import { argv } from "node:process"
import { URL, fileURLToPath } from "node:url"
import { buildTSX } from "@onlyoffice/documentation-utils/svg.js"
import sade from "sade"
import esMain from "es-main"

const root = fileURLToPath(new URL(".", import.meta.url))
const lib = join(root, "lib")

/**
 * @returns {void}
 */
function main() {
  sade("./makefile.js")
    .command("build")
    .action(build)
    .parse(argv)
}

/**
 * @returns {Promise<void>}
 */
export async function build() {
  if (!existsSync(lib)) {
    await mkdir(lib)
  }
  const m = join(root, "node_modules/@onlyoffice/documentation-ui-icon/src")
  await buildTSX(m, lib, "logo")
}

if (esMain(import.meta)) {
  main()
}
