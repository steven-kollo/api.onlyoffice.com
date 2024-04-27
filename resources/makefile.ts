import {argv} from "node:process"
import esMain from "es-main"
import sade from "sade"
import * as communityServer from "./scripts/community-server.ts"
import * as docspace from "./scripts/docspace.ts"
import * as documentBuilder from "./scripts/document-builder.ts"
import * as hostedSolutions from "./scripts/hosted-solutions.ts"
import {createTempDir, prepareLibDir} from "./utils/basedir.ts"

if (esMain(import.meta)) {
  main()
}

function main(): void {
  sade("./makefile.js")
    .command("build")
    .action(build)
    .parse(argv)
}

export interface BuildOptions {
  _: string[]
}

export async function build(opts: BuildOptions): Promise<void> {
  const tempDir = await createTempDir()
  const distDir = await prepareLibDir()

  const a = resolve(opts._)
  for (const m of a) {
    await m.build(tempDir, distDir)
  }

  function resolve(a: string[]): typeof documentBuilder[] {
    if (a.length === 0) {
      return [communityServer, docspace, documentBuilder, hostedSolutions]
    }
    const r: typeof documentBuilder[] = []
    for (const n of a) {
      const m = module(n)
      if (m) {
        r.push(m)
      }
    }
    return r
  }

  function module(n: string): typeof documentBuilder | undefined {
    switch (n) {
    case "community-server":
      return communityServer
    case "docspace":
      return docspace
    case "document-builder":
      return documentBuilder
    case "hosted-solutions":
      return hostedSolutions
    default:
      return
    }
  }
}
