import type { JSX } from "preact"
import { h } from "preact"
import { TableOfContents } from "../components/table-of-contents/table-of-contents.ts"
import { retrieve } from "../config/sitemap.ts"
import { Eleventy } from "../config/types.ts"
import { ArticleLayout } from "./article.tsx"

export function data() {
  return {
    layout: "html"
  }
}

export function render(ctx: Eleventy.Context): JSX.Element {
  return (
    <ArticleLayout {...ctx}>
      {ctx.content}
      <TableOfContents url={ctx.page.url} onRetrieve={retrieve} />
    </ArticleLayout>
  )
}
