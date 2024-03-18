import type { JSX } from "preact"
import { Fragment, h } from "preact"
import { Eleventy } from "../../config/context.ts"
import { RESTDeclaration } from "../components/rest-declaration/rest-declaration.ts"
import { Markdown } from "../components/markdown/markdown.ts"
import { SyntaxHighlight } from "../components/syntax-highlight/syntax-highlight.ts"

export function data() {
  return {
    layout: "chapter"
  }
}

export function render(
  {
    pagination,
    onRetrieve: retrieve
  }: Eleventy.Context
): JSX.Element {
  return (
    <>
      {pagination.items.map((d) => (
        <RESTDeclaration
          declaration={d}
          onHighlightSyntax={SyntaxHighlight}
          onRenderDescription={Markdown}
          onRetrieve={retrieve}
        />
      ))}
    </>
  )
}
