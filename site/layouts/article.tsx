import { Content } from "@onlyoffice/documentation-ui-kit"
import type { JSX } from "preact"
import { h } from "preact"
import { Eleventy } from "../config/types.ts"
import { render as ChapterLayout } from "./chapter.tsx"

export function data() {
  return {
    layout: "html"
  }
}

export function render(ctx: Eleventy.Context): JSX.Element {
  return (
    <ArticleLayout {...ctx}>
      {ctx.content}
    </ArticleLayout>
  )
}

export interface ArticleLayoutProperties extends Omit<Eleventy.Context, "content"> {
  children: any
}

export function ArticleLayout(ctx: ArticleLayoutProperties): JSX.Element {
  return (
    <ChapterLayout {...ctx}>
      <Content>
        {ctx.children}
      </Content>
    </ChapterLayout>
  )
}
