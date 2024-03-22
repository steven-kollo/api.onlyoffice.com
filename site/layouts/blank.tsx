import type { JSX } from "preact"
import { h } from "preact"
import type { Eleventy } from "../config/types.ts"
import { PageLayout } from "./page.tsx"

export function data() {
  return {
    layout: "html"
  }
}

export function render(
  {
    content,
    ...ctx
  }: Eleventy.Context
): JSX.Element {
  return (
    <PageLayout {...ctx}>
      <main>
        {content}
      </main>
    </PageLayout>
  )
}
