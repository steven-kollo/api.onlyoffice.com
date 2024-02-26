import { process } from "@/config/markdown.cjs"
import { toJsxRuntime } from "hast-util-to-jsx-runtime"
import { JSX, h } from "preact"
import { Fragment, jsx, jsxs } from "preact/jsx-runtime"

export interface MarkdownProperties {
  children: any
}

export function Markdown({ children }: MarkdownProperties): JSX.Element {
  const t = process(children)
  return toJsxRuntime(t, { Fragment, jsx, jsxs })
}
