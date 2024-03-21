import { toJsxRuntime } from "hast-util-to-jsx-runtime"
import { Fragment, jsx, jsxs } from "preact/jsx-runtime"
import type { JSX } from "preact"
import { toHast } from "./syntax-highlight.config.ts"

export interface RootParameters {
  syntax: string
  children: any
}

export function Root({ syntax, children }: RootParameters): JSX.Element {
  const t = toHast(syntax, children)
  return toJsxRuntime(t, { Fragment, jsx, jsxs })
}
