import { argv } from "node:process"
import { Cli, Logger } from "@11ty/eleventy-dev-server/cli.js"
import EleventyDevServer from "@11ty/eleventy-dev-server/server.js"
import sade from "sade"
import * as resources from "./resources/makefile.ts"
import * as iconJS from "./ui/icon/makefile.ts"
import * as logoJS from "./ui/logo/makefile.ts"

function main(): void {
  sade("./makefile.js")
    .command("build")
    .action(build)
    .command("preview-storybook")
    .action(previewStorybook)
    .parse(argv)
}

async function build(): Promise<void> {
  await Promise.all([
    resources.build(),

    // todo: move to ui/kit-js.
    iconJS.build(),
    logoJS.build()
  ])
}

async function previewStorybook(): Promise<void> {
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
