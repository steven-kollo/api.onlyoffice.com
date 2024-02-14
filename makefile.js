#!/usr/bin/env node
// @ts-check

import { argv } from "node:process"
import sade from "sade"
// import * as codeListingJS from "@onlyoffice/documentation-ui-code-listing-js/makefile.js"
// import * as contentJS from "@onlyoffice/documentation-ui-content-js/makefile.js"
// import * as declarationReferenceJS from "@onlyoffice/documentation-ui-declaration-reference-js/makefile.js"
// import * as declarationTokenJS from "@onlyoffice/documentation-ui-declaration-token-js/makefile.js"
import * as iconJS from "@onlyoffice/documentation-ui-icon-js/makefile.js"
// import * as kitJS from "@onlyoffice/documentation-ui-kit-js/makefile.js"
import * as logoJS from "@onlyoffice/documentation-ui-logo-js/makefile.js"
import * as documentBuilder from "./resources/makefile.js"

// @onlyoffice/documentation-ui-logo-js
// @onlyoffice/documentation-ui-primitives
// @onlyoffice/documentation-ui-sr-only

const make = sade("./makefile.js")

make
  .command("build-resources")
  .option("-p, --prettify", "Prettify the output")
  .action(async (o) => {
    await documentBuilder.build(o)
  })

make
  .command("build")
  .action(async () => {
    await Promise.all([
      // ["@onlyoffice/documentation-ui-code-listing-js", codeListingJS],
      // ["@onlyoffice/documentation-ui-content-js", contentJS],
      // ["@onlyoffice/documentation-ui-declaration-reference-js", declarationReferenceJS],
      // ["@onlyoffice/documentation-ui-declaration-token-js", declarationTokenJS],
      ["@onlyoffice/documentation-ui-icon-js", iconJS],
      // ["@onlyoffice/documentation-ui-kit-js", kitJS],
      ["@onlyoffice/documentation-ui-logo-js", logoJS]
    ].map(([name, make]) => {
      console.log(name)
      return make.build()
    }))
  })

make.parse(argv)
