import { Content } from "@onlyoffice/documentation-ui-kit"
import type { JSX } from "preact"
import { Fragment, h } from "preact"
import { Eleventy } from "../config/context.ts"
import { CodeDeclaration } from "../components/code-declaration/CodeDeclaration.tsx"
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
    onRetrieve,
    onLink
  }: Eleventy.Context
): JSX.Element {
  return (
    <>
      {pagination.items.map((d) => (
        <Content>
          <CodeDeclaration
            declaration={d}
            onProcessMarkdown={Markdown}
            onHighlightSyntax={SyntaxHighlight}
            onLink={onLink}
            onRetrieve={onRetrieve}
          />
        </Content>
      ))}
    </>
  )
}
