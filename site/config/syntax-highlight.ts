// todo: https://github.com/11ty/eleventy/issues/2427; explain.

import type { UserConfig } from "@11ty/eleventy"
import type { createStarryNight } from "@wooorm/starry-night"

export type StarryNight = Awaited<ReturnType<typeof createStarryNight>>
export type Root = ReturnType<StarryNight["highlight"]>

const cache = new Map<string, StarryNight>()

export function syntaxHighlightPlugin(uc: UserConfig): void {
  uc.on("eleventy.before", register)
}

export async function register(): Promise<void> {
  if (cache.has("starryNight")) {
    return
  }
  const { all, createStarryNight } = await import("@wooorm/starry-night")
  const starryNight = await createStarryNight(all)
  cache.set("starryNight", starryNight)
}

export function highlight(code: string, syntax: string): Root {
  const n = cache.get("starryNight")
  if (n === undefined) {
    throw new Error("Highlighter is not ready")
  }

  const s = n.flagToScope(syntax)
  if (s === undefined) {
    throw new Error(`Unknown syntax: ${syntax}`)
  }

  return n.highlight(code, s)
}
