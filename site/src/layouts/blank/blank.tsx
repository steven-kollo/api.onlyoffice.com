import type { Eleventy } from "@/config/context.ts"
import type { JSX } from "preact"
import { h } from "preact"

export function data() {
  return {
    layout: "page/page.tsx"
  }
}

export function render(
  {
    content
  }: Eleventy.Context
): JSX.Element {
  return content
  // return (
  //   <main class="blank__main">
  //     <div class="blank__inner">{content}</div>
  //   </main>
  // )
}
