#!/usr/bin/env node
// @ts-check

import { argv } from "node:process"
import sade from "sade"
import * as resources from "./resources/makefile.js"
import * as iconJS from "./ui/icon-js/makefile.js"
import * as logoJS from "./ui/logo-js/makefile.js"

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
async function build() {
  await Promise.all([
    resources.build(),

    // todo: move to ui/kit-js.
    iconJS.build(),
    logoJS.build()
  ])
}

main()
