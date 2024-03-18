#!/usr/bin/env node
// @ts-check

import { argv } from "node:process"
import { Cli, Logger } from "@11ty/eleventy-dev-server/cli.js"
import EleventyDevServer from "@11ty/eleventy-dev-server/server.js"
import sade from "sade"
import * as resources from "./resources/makefile.js"
import * as iconJS from "./ui/icon/makefile.js"
import * as logoJS from "./ui/logo/makefile.js"

/**
 * @returns {void}
 */
function main() {
  sade("./makefile.js")
    .command("build")
    .action(build)
    .command("preview-storybook")
    .action(previewStorybook)
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

/**
 * @returns {Promise<void>}
 */
async function previewStorybook() {
  const o = {
    ...Cli.getDefaultOptions(),
    domDiff: false,
    input: "dist",
    liveReload: false,
    logger: Logger,
    showVersion: true
  }
  EleventyDevServer
    .getServer("eleventy-dev-server-cli", o.input, o)
    .serve(o.port)
}

main()
