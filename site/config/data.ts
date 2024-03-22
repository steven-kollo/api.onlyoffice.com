import type { Eleventy } from "./types.ts";
import { parse } from "yaml"

export function eleventyPlugin(uc: Eleventy.UserConfig): void {
  uc.addDataExtension("yml, yaml", (c: string) => {
    return parse(c)
  })
}
