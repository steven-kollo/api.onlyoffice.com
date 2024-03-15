import { toJsxRuntime } from "hast-util-to-jsx-runtime"
import { Fragment, jsx, jsxs } from "preact/jsx-runtime"
import type { JSX } from "preact"
import { process } from "../../../config/markdown.ts"

export interface MarkdownProperties {
  children: any
}

export function Markdown(
  {
    children
  }: MarkdownProperties
): JSX.Element {
  const t = process(children)
  return toJsxRuntime(t, { Fragment, jsx, jsxs })
}
