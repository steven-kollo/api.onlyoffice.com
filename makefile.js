#!/usr/bin/env node
// @ts-check

import { argv } from "node:process"
import sade from "sade"
import * as codeListingJS from "@onlyoffice/documentation-ui-code-listing-js/makefile.js"
import * as contentJS from "@onlyoffice/documentation-ui-content-js/makefile.js"
import * as declarationReferenceJS from "@onlyoffice/documentation-ui-declaration-reference-js/makefile.js"
import * as declarationTokenJS from "@onlyoffice/documentation-ui-declaration-token-js/makefile.js"
import * as fonts from "@onlyoffice/documentation-ui-fonts/makefile.js"
import * as iconJS from "@onlyoffice/documentation-ui-icon-js/makefile.js"
import * as kitJS from "@onlyoffice/documentation-ui-kit-js/makefile.js"
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
      (() => {
        console.log("@onlyoffice/documentation-ui-code-listing-js")
        return codeListingJS.build()
      })(),
      (() => {
        console.log("@onlyoffice/documentation-ui-content-js")
        return contentJS.build()
      })(),
      (() => {
        console.log("@onlyoffice/documentation-ui-declaration-reference-js")
        return declarationReferenceJS.build()
      })(),
      (() => {
        console.log("@onlyoffice/documentation-ui-declaration-token-js")
        return declarationTokenJS.build()
      })(),
      (() => {
        console.log("@onlyoffice/documentation-ui-fonts")
        return fonts.build()
      })(),
      (() => {
        console.log("@onlyoffice/documentation-ui-icon-js")
        return iconJS.build()
      })(),
      (() => {
        console.log("@onlyoffice/documentation-ui-logo-js")
        return logoJS.build()
      })(),
      (() => {
        console.log("@onlyoffice/documentation-ui-kit-js")
        return kitJS.build()
      })()
    ])
  })

make.parse(argv)
