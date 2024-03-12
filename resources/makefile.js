#!/usr/bin/env node
// @ts-check

import { argv } from "node:process"
import esMain from "es-main"
import sade from "sade"
import * as communityServer from "./scripts/community-server.js"
import * as docspace from "./scripts/docspace.js"
import * as documentBuilder from "./scripts/document-builder.js"
import * as hostedSolutions from "./scripts/hosted-solutions.js"
import { createTempDir, prepareDistDir } from "./scripts/utils.js"

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
  const tempDir = await createTempDir()
  const distDir = await prepareDistDir()

  await Promise.all([
    communityServer.build(tempDir, distDir),
    docspace.build(tempDir, distDir),
    documentBuilder.build(tempDir, distDir),
    hostedSolutions.build(tempDir, distDir)
  ])
}

if (esMain(import.meta)) {
  main()
}
