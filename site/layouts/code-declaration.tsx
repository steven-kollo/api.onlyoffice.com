import type { JSX } from "preact"
import { h } from "preact"
import type { Eleventy } from "../config/types.ts"
import { CodeDeclaration } from "../components/code-declaration/CodeDeclaration.tsx"
import { Markdown } from "../components/markdown/markdown.ts"
import { SyntaxHighlight } from "../components/syntax-highlight/syntax-highlight.ts"
import { render as ArticleLayout } from "./article.tsx"

export function data() {
  return {
    layout: "html"
  }
}

export function render(ctx: Eleventy.Context): JSX.Element {
  return (
    <ArticleLayout {...ctx}>
      {ctx.pagination.items.map((d) => (
        <CodeDeclaration
          declaration={d}
          onProcessMarkdown={Markdown}
          onHighlightSyntax={SyntaxHighlight}
          onLink={ctx.onLink}
          onRetrieve={ctx.onRetrieve}
        />
      ))}
    </ArticleLayout>
  )
}
