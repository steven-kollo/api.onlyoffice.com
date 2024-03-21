import type { UserConfig } from "@11ty/eleventy"
import type { createStarryNight } from "@wooorm/starry-night"
import type { Element, Root } from "hast"
import { toText } from "hast-util-to-text"
import type { State } from "mdast-util-to-hast"
import { visit } from "unist-util-visit"
import type { VFile } from "vfile"

export type StarryNight = Awaited<ReturnType<typeof createStarryNight>>

// todo: const key = Symbol("starryNight") or WeakMap
const cache = new Map<string, StarryNight>()

export function eleventyPlugin(uc: UserConfig): void {
  uc.on("eleventy.before", register)
}

// based on https://github.com/rehypejs/rehype-highlight/tree/main
export function rehypePlugin(): any {
  return function (tree: Root, file: VFile): undefined {
    visit(tree, "element", function (node, _, parent) {
      if (
        node.tagName !== "code" ||
        !parent ||
        parent.type !== "element" ||
        parent.tagName !== "pre"
      ) {
        return
      }

      const [s, no] = syntax(node)
      if (s === undefined || no) {
        return
      }

      try {
        const t = toText(parent)
        const { children } = toHast(s, t)
        node.children = children
      } catch {
        // todo
        // const cause = /** @type {Error} */ (error)
        // file.message(
        //   'Cannot highlight as `' + lang + '`, it’s not registered',
        //   {
        //     ancestors: [parent, node],
        //     cause,
        //     place: node.position,
        //     ruleId: 'missing-language',
        //     source: 'rehype-highlight'
        //   }
        // )
      }
    })
  }
}

export function codeHastHandler(_: State, node: Element) {
  if (node.tagName !== "pre") {
    return
  }

  const [child] = node.children
  if (
    child === undefined ||
    child.type !== "element" ||
    child.tagName !== "code"
  ) {
    return
  }

  const [s, no] = syntax(child)
  if (s === undefined || no) {
    return
  }

  try {
    const t = toText(node)
    const { children } = toHast(s, t)
    child.children = children
  } catch {
    // todo
  }

  return
}

export async function register(): Promise<void> {
  if (cache.has("starryNight")) {
    return
  }
  // todo: explain why import is here.
  const { all, createStarryNight } = await import("@wooorm/starry-night")
  const starryNight = await createStarryNight(all)
  cache.set("starryNight", starryNight)
}

export function toHast(syntax: string, code: string): Root {
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

// todo: rename lang to syntax
// based on https://github.com/rehypejs/rehype-highlight/blob/7.0.0/lib/index.js#L157
/**
 * Get the programming syntax of `node`.
 *
 * @returns the tuple `[syntax, no]` where `syntax` is the detected syntax or `undefined` when no syntax is detected, and `no` is `true` when highlighting should not be done.
 */
function syntax(node: Element): [string | undefined, boolean] {
  const l = node.properties.className
  if (!Array.isArray(l)) {
    return [undefined, true]
  }

  let i = -1
  let n: string | undefined

  while (++i < l.length) {
    const v = String(l[i])

    // todo: move the strings bellow to parameters.

    if (v === "no-highlight") {
      return [n, true]
    }

    if (!n && v.slice(0, 9) === "language-") {
      n = v.slice(9)
    }
  }

  return [n, false]
}
