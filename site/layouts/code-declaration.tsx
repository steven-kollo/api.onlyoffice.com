import { Content } from "@onlyoffice/documentation-ui-kit"
import type { JSX } from "preact"
import { h } from "preact"
import { Eleventy } from "../config/context.ts"
import { CodeDeclaration } from "../components/code-declaration/CodeDeclaration.tsx"
import { Markdown } from "../components/markdown/markdown.ts"
import { SyntaxHighlight } from "../components/syntax-highlight/syntax-highlight.ts"
import { ChapterLayout } from "./chapter.tsx"

export function data() {
  return {
    layout: "base"
  }
}

export function render(ctx: Eleventy.Context): JSX.Element {
  return (
    <ChapterLayout {...ctx}>
      {ctx.pagination.items.map((d) => (
        <Content>
          <CodeDeclaration
            declaration={d}
            onProcessMarkdown={Markdown}
            onHighlightSyntax={SyntaxHighlight}
            onLink={ctx.onLink}
            onRetrieve={ctx.onRetrieve}
          />
        </Content>
      ))}
    </ChapterLayout>
  )
}
