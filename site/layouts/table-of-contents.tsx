import type { JSX } from "preact"
import { h } from "preact"
import { TableOfContents } from "../components/table-of-contents/table-of-contents.ts"
import { retrieve } from "../config/sitemap.ts"
import type { Eleventy } from "../config/types.ts"
import { useChildren } from "../config/types.ts"
import { render as ArticleLayout } from "./article.tsx"

export function data() {
  return {
    layout: "html"
  }
}

export function render(ctx: Eleventy.Context): JSX.Element {
  const children = useChildren(ctx)
  return (
    <ArticleLayout {...ctx}>
      {children}
      <TableOfContents url={ctx.page.url} onRetrieve={retrieve} />
    </ArticleLayout>
  )
}
