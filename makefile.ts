import {spawn} from "node:child_process"
import {readFile, readdir} from "node:fs/promises"
import {join} from "node:path"
import {argv} from "node:process"
import {URL, fileURLToPath} from "node:url"
import sade from "sade"
import * as resources from "./resources/makefile.ts"
import * as iconJS from "./ui/icon/makefile.ts"
import * as logoJS from "./ui/logo/makefile.ts"

main()

function main(): void {
  sade("./makefile.js")
    .command("build")
    .action(build)
    .command("test")
    .action(test)
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

async function test(): Promise<void> {
  const cd = currentDir()
  const pd = packagesDir(cd)
  const pc = await readdir(pd)
  for (const p of pc) {
    const d = join(pd, p)
    const f = packageJSON(d)
    const c = await readFile(f, "utf8")
    const j = JSON.parse(c)
    if (!j.scripts) {
      continue
    }
    if (!j.scripts.test) {
      continue
    }
    await new Promise((res, rej) => {
      const s = spawn("pnpm", ["test"], {cwd: d, stdio: "inherit"})
      s.on("close", res)
      s.on("error", rej)
    })
  }
}

function currentDir(): string {
  const u = new URL(".", import.meta.url)
  return fileURLToPath(u)
}

function packagesDir(d: string): string {
  return join(d, "packages")
}

function packageJSON(d: string): string {
  return join(d, "package.json")
}
