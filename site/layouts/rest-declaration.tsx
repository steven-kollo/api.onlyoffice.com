import { Content } from "@onlyoffice/documentation-ui-kit"
import type { JSX } from "preact"
import { h } from "preact"
import { Eleventy } from "../config/types.ts"
import { RESTDeclaration } from "../components/rest-declaration/rest-declaration.ts"
import { Markdown } from "../components/markdown/markdown.ts"
import { SyntaxHighlight } from "../components/syntax-highlight/syntax-highlight.ts"
import { ChapterLayout } from "./chapter.tsx"

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
          <RESTDeclaration
            declaration={d}
            onHighlightSyntax={SyntaxHighlight}
            onRenderDescription={Markdown}
            onRetrieve={ctx.onRetrieve}
          />
        ))}
      </Content>
    </ChapterLayout>
  )
}
