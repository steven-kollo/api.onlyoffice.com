#!/usr/bin/env node

// @ts-check

import { existsSync } from "node:fs"
import { mkdir, readdir, copyFile } from "node:fs/promises"
import { join } from "node:path"
import { argv } from "node:process"
import { fileURLToPath } from "node:url"
import sade from "sade"
import * as documentBuilder from "./resources/document-builder/makefile.js"
// const uiKit = require("./ui/kit/makefile.js")

const root = fileURLToPath(new URL(".", import.meta.url))
const make = sade("./makefile.js")

make
  .command("build-resources")
  .option("-p, --prettify", "Prettify the output")
  .action(async (o) => {
    await documentBuilder.build(o)
  })

// todo: separate build and watch commands
// todo: add postprocessing for the build command
// todo: move to the script directory and import in each package
// todo: add build and watch commands in each package
make
  .command("build-ui-kit")
  .action(async () => {
    const uiDir = join(root, "ui")
    const dirents = await readdir(uiDir, { withFileTypes: true })
    await Promise.all(dirents.map(async (dirent) => {
      if (dirent.isFile()) {
        return
      }

      const packDir = join(uiDir, dirent.name)

      const packDist = join(packDir, "dist")
      if (!existsSync(packDist)) {
        await mkdir(packDist)
      }

      const packStatic = join(packDir, "static")
      if (existsSync(packStatic)) {
        const files = await readdir(packStatic)
        await Promise.all(files.map(async (file) => {
          const src = join(packStatic, file)
          const dest = join(packDist, file)
          await copyFile(src, dest)
        }))
      }

      const packSrc = join(packDir, "src")
      if (existsSync(packSrc)) {
        const files = await readdir(packSrc)
        await Promise.all(files.map(async (file) => {
          const src = join(packSrc, file)
          const dest = join(packDist, file)
          await copyFile(src, dest)
        }))
      }

      // await uiKit.build()
    }))
  })

make.parse(argv)
