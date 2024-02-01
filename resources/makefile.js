#!/usr/bin/env node
// @ts-check

import { argv } from "node:process"
import esMain from "es-main"
import sade from "sade"
import { build } from "./scripts/document-builder.js"

const make = sade("./makefile.js")

make
  .command("build")
  .option("-p, --prettify", "Prettify the output")
  .action(build)

if (esMain(import.meta)) {
  make.parse(argv)
}

export { build }
