#!/usr/bin/env node
// @ts-check

import { exec } from "node:child_process"
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
    await new Promise((res, rej) => {
      const tsc = join(root, "node_modules", ".bin", "tsc")
      const p = join(root, "tsconfig.json")
      exec(`${tsc} --project ${p}`, (err, stdout, stderr) => {
        if (err) {
          return rej(err)
        }
        if (stderr) {
          return rej(stderr)
        }
        return res(stdout)
      })
    }),
    await Promise.all([
      "declaration-reference.css"
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
        join(src, "declaration-reference.ts"),
        join(src, "DeclarationReference.ts"),
        join(src, "DeclarationReferenceIdentifier.ts"),
        join(src, "DeclarationReferenceText.ts")
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
