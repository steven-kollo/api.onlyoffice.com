#!/usr/bin/env node
// @ts-check

import { argv } from "node:process"
import esMain from "es-main"
import sade from "sade"
import * as communityServer from "./scripts/community-server.js"
import * as docspace from "./scripts/docspace.js"
import * as documentBuilder from "./scripts/document-builder.js"

function main() {
  sade("./makefile.js")
    .command("build")
    .option("-p, --prettify", "Prettify the output")
    .action(build)
    .parse(argv)
}

export async function build() {
  await Promise.all([
    communityServer.build(),
    docspace.build(),
    documentBuilder.build()
  ])
}

if (esMain(import.meta)) {
  main()
}
