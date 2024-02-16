import { highlight } from "@/config/syntax-highlight.cjs"
import { toJsxRuntime } from "hast-util-to-jsx-runtime"
import { JSX, h } from "preact"
import { Fragment, jsx, jsxs } from "preact/jsx-runtime"

interface SyntaxHighlightProperties {
  syntax: string
  children: string
}

function SyntaxHighlight({ syntax, children }: SyntaxHighlightProperties): JSX.Element {
  const tree = highlight(children, syntax)
  return toJsxRuntime(tree, { Fragment, jsx, jsxs })
}

export { SyntaxHighlight }
