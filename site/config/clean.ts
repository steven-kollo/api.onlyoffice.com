// todo: https://github.com/11ty/eleventy/issues/19

import { rm } from "node:fs/promises"
import { join } from "node:path"
import type { UserConfig } from "@11ty/eleventy"
import { once } from "@onlyoffice/documentation-utils/once.ts"
import { rootDir } from "./basedir.ts"

export function cleanPlugin(uc: UserConfig): void {
  const t = once()
  uc.on("eleventy.before", async () => {
    await t(async () => {
      await clean(uc)
    })
  })
}

async function clean(uc: UserConfig): Promise<void> {
  const d = join(rootDir(), uc.dir.output)
  await rm(d, {
    recursive: true,
    force: true
  })
}
