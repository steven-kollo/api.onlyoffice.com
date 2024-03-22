import { Content } from "@onlyoffice/documentation-ui-kit"
import type { JSX } from "preact"
import { h } from "preact"
import { CodeDeclaration } from "../components/code-declaration/CodeDeclaration.tsx"
import { Markdown } from "../components/markdown/markdown.ts"
import { SyntaxHighlight } from "../components/syntax-highlight/syntax-highlight.ts"
import type { Eleventy } from "../config/eleventy.ts"
import { render as ChapterLayout } from "./chapter.tsx"

export function data() {
  return {
    layout: "html"
  }
}

export function render(ctx: Eleventy.Context): JSX.Element {
  return (
    <ChapterLayout {...ctx}>
      <Content>
        {ctx.pagination.items.map((d) => (
          <CodeDeclaration
            declaration={d}
            onProcessMarkdown={Markdown}
            onHighlightSyntax={SyntaxHighlight}
            onLink={ctx.onLink}
            onRetrieve={ctx.onRetrieve}
          />
        ))}
      </Content>
    </ChapterLayout>
  )
}
