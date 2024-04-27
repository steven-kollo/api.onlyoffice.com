import {argv} from "node:process"
import sade from "sade"
import * as resources from "./resources/makefile.ts"
import * as iconJS from "./ui/icon/makefile.ts"
import * as logoJS from "./ui/logo/makefile.ts"

main()

function main(): void {
  sade("./makefile.js")
    .command("build")
    .action(build)
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
