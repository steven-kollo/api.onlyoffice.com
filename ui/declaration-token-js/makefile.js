#!/usr/bin/env node
// @ts-check

import { copyFile, mkdir, readFile } from "node:fs/promises"
import { existsSync } from "node:fs"
import { join } from "node:path"
import { argv } from "node:process"
import { URL, fileURLToPath } from "node:url"
import sade from "sade"
import esMain from "es-main"
import esbuild from "esbuild"

const root = fileURLToPath(new URL(".", import.meta.url))
const src = join(root, "src")
const dist = join(root, "dist")
const make = sade("./makefile.js")

make
  .command("build")
  .action(build)

async function build() {
  if (!existsSync(dist)) {
    await mkdir(dist)
  }

  await Promise.all([
    await Promise.all([
      "declaration-token.css"
    ].map(async (n) => {
      const f = join(src, n)
      const t = join(dist, n)
      await copyFile(f, t)
    })),
    await build(),
    await build({
      format: "cjs",
      outExtension: {
        ".js": ".cjs"
      },
      plugins: [
        {
          name: "cjs-in-imports",
          setup(build) {
            build.onLoad({ filter: /\.ts$/ }, async (args) => {
              let content = await readFile(args.path, "utf8")
              content = content.replace(/from "(.*)\.js"/g, 'from "$1.cjs"')
              return { contents: content, loader: "js" }
            })
          }
        }
      ]
    })
  ])

  function build(o = {}) {
    return esbuild.build({
      entryPoints:[
        join(src, "declaration-token.ts"),
        join(src, "DeclarationToken.ts"),
        join(src, "DeclarationTokenDecoration.ts"),
        join(src, "DeclarationTokenIdentifier.ts"),
        join(src, "DeclarationTokenKeyword.ts"),
        join(src, "DeclarationTokenReference.ts"),
        join(src, "DeclarationTokenText.ts")
      ],
      outdir: dist,
      platform: "node",
      ...o
    })
  }
}

if (esMain(import.meta)) {
  make.parse(argv)
}

export { build }
