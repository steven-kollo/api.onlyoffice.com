import { parse } from "yaml"
import type { Eleventy } from "./eleventy.ts"

export function eleventyPlugin(uc: Eleventy.UserConfig): void {
  uc.addDataExtension("yml, yaml", (c: string) => {
    return parse(c)
  })
}
