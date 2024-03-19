import type { JSX } from "preact"
import { h } from "preact"
import type { Eleventy } from "../config/context.ts"
import { Blank } from "../components/blank/blank.ts"

export function data() {
  return {
    layout: "page"
  }
}

export function render(
  {
    content
  }: Eleventy.Context
): JSX.Element {
  return (
    <Blank>
      {content}
    </Blank>
  )
}
