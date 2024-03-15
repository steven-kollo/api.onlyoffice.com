import { toJsxRuntime } from "hast-util-to-jsx-runtime"
import { Fragment, jsx, jsxs } from "preact/jsx-runtime"
import type { JSX } from "preact"
import { highlight } from "../../../config/syntax-highlight.ts"

export interface RootProperties {
  syntax: string
  children: any
}

export function Root(
  {
    syntax,
    children
  }: RootProperties
): JSX.Element {
  const t = highlight(children, syntax)
  return toJsxRuntime(t, { Fragment, jsx, jsxs })
}
