import type { JSX } from "preact"
import { h } from "preact"
import type { Eleventy } from "../config/eleventy.ts"
import { useChildren } from "../config/eleventy.ts"
import { PageLayout } from "./page.tsx"

export function data() {
  return {
    layout: "html"
  }
}

export function render(ctx: Eleventy.Context): JSX.Element {
  const children = useChildren(ctx)
  return (
    <PageLayout {...ctx}>
      <main>
        {children}
      </main>
    </PageLayout>
  )
}
