import { toJsxRuntime } from "hast-util-to-jsx-runtime"
import { Fragment, jsx, jsxs } from "preact/jsx-runtime"
import type { JSX } from "preact"
import { toHast } from "./markdown.config.ts"

export interface RootParameters {
  children: any
}

export function Root({ children }: RootParameters): JSX.Element {
  const t = toHast(children)
  return toJsxRuntime(t, { Fragment, jsx, jsxs })
}
