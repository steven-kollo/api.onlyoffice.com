import { mkdir } from "node:fs/promises"
import { existsSync } from "node:fs"
import { join } from "node:path"
import { argv } from "node:process"
import { URL, fileURLToPath } from "node:url"
import { buildTSX } from "@onlyoffice/documentation-utils/svg.ts"
import sade from "sade"
import esMain from "es-main"

const root = fileURLToPath(new URL(".", import.meta.url))
const lib = join(root, "lib")

function main(): void {
  sade("./makefile.js")
    .command("build")
    .action(build)
    .parse(argv)
}

export async function build(): Promise<void> {
  if (!existsSync(lib)) {
    await mkdir(lib)
  }
  const m = join(root, "static")
  await buildTSX(m, lib, "logo")
}

if (esMain(import.meta)) {
  main()
}
