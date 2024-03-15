// todo: https://github.com/11ty/eleventy/issues/2427; explain.

import type { UserConfig } from "@11ty/eleventy"
import type { toHast } from "mdast-util-to-hast"

export interface Processor {
  (content: string): Nodes
}

export type Nodes = ReturnType<typeof toHast>

const cache: Map<string, Processor> = new Map()

export function markdownPlugin(uc: UserConfig): void {
  uc.on("eleventy.before", register)
}

export async function register(): Promise<void> {
  if (cache.has("processor")) {
    return
  }

  const { fromMarkdown } = await import("mdast-util-from-markdown")
  const { gfmTableFromMarkdown } = await import("mdast-util-gfm-table")
  const { toHast } = await import("mdast-util-to-hast")
  const { gfmTable } = await import("micromark-extension-gfm-table")

  const processor: Processor = function processor(content) {
    const m = fromMarkdown(content, {
      extensions: [gfmTable()],
      mdastExtensions: [gfmTableFromMarkdown()]
    })
    return toHast(m)
  }

  cache.set("processor", processor)
}

export function process(content: string): Nodes {
  const p = cache.get("processor")
  if (p === undefined) {
    throw new Error("Processor is not ready")
  }
  return p(content)
}
