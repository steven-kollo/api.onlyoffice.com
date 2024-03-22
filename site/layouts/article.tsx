import { Content } from "@onlyoffice/documentation-ui-kit"
import type { JSX } from "preact"
import { h } from "preact"
import { Eleventy } from "../config/types.ts"
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
        {ctx.content}
      </Content>
    </ChapterLayout>
  )
}
