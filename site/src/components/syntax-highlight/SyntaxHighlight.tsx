import { starryNight } from "@/../config/syntax-highlight.cjs"
import { toJsxRuntime } from "hast-util-to-jsx-runtime"
import { JSX, h } from "preact"
import { Fragment, jsx, jsxs } from "preact/jsx-runtime"

interface SyntaxHighlightProperties {
  syntax: string
  children: string
}

function SyntaxHighlight({ syntax, children }: SyntaxHighlightProperties): JSX.Element {
  const night = starryNight()
  if (night === undefined) {
    throw new Error("starryNight is not ready")
  }

  const scope = night.flagToScope(syntax)
  if (scope === undefined) {
    throw new Error(`Unknown syntax: ${syntax}`)
  }

  const tree = night.highlight(children, scope)
  return toJsxRuntime(tree, { Fragment, jsx, jsxs })
}

export { SyntaxHighlight }
