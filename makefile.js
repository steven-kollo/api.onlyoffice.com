#!/usr/bin/env node
// @ts-check

import { argv } from "node:process"
import sade from "sade"
import * as declarations from "./declarations/makefile.js"
import * as resources from "./resources/makefile.js"
import * as iconJS from "./ui/icon-js/makefile.js"
import * as logoJS from "./ui/logo-js/makefile.js"

const make = sade("./makefile.js")

make
  .command("build")
  .action(async () => {
    console.log("@onlyoffice/documentation-declarations")
    declarations.build()

    console.log("@onlyoffice/documentation-resources")
    resources.build()

    await Promise.all([
      ["@onlyoffice/documentation-ui-icon-js", iconJS],
      ["@onlyoffice/documentation-ui-logo-js", logoJS]
    ].map(async ([name, make]) => {
      console.log(name)
      await make.build()
    }))
  })

make.parse(argv)
