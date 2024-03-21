// todo: https://github.com/11ty/eleventy/issues/2427; explain.

declare module "unified" {
  interface Data {
    // todo: specify the type.
    micromarkExtensions?: any[]
    fromMarkdownExtensions?: any[]
  }
}

import type { Element, Nodes } from "hast"
import type { Code } from "mdast"
import { fromMarkdown } from "mdast-util-from-markdown"
import { gfmTableFromMarkdown } from "mdast-util-gfm-table"
import type { State } from "mdast-util-to-hast"
import { defaultHandlers, toHast as toNativeHast } from "mdast-util-to-hast"
import { gfmTable } from "micromark-extension-gfm-table"
import type { Processor } from "unified"
import {
  codeHastHandler as syntaxHighlightCodeHastHandler,
  rehypePlugin as syntaxHighlightRehypePlugin
} from "../syntax-highlight/syntax-highlight.config.ts"

export const rehypePlugins = [syntaxHighlightRehypePlugin]
export const remarkPlugins = [gmfRemarkPlugin]

function gmfRemarkPlugin(this: Processor): undefined {
  // todo: explain.
  // based on
  // use only table
  // use only from md, not to
  // https://github.com/remarkjs/remark-gfm/blob/4.0.0/lib/index.js

  const data = this.data()

  if (data.micromarkExtensions === undefined) {
    data.micromarkExtensions = []
  }
  data.micromarkExtensions.push(gfmTable())

  if (data.fromMarkdownExtensions === undefined) {
    data.fromMarkdownExtensions = []
  }
  data.fromMarkdownExtensions.push(gfmTableFromMarkdown())
}

export function toHast(content: string): Nodes {
  const m = fromMarkdown(content, {
    extensions: [gfmTable()],
    mdastExtensions: [gfmTableFromMarkdown()]
  })
  return toNativeHast(m, {
    handlers: {
      code(state: State, node: Code): Element {
        const el = defaultHandlers.code(state, node)
        syntaxHighlightCodeHastHandler(state, el)
        return el
      }
    }
  })
}
