import type { JSX } from "preact"
import { h } from "preact"
import composition from "./fixtures/composition.md?raw"
import decomposition from "./fixtures/decomposition.md?raw"
import { Markdown } from "./markdown.ts"

export default {
  title: "Site/Markdown"
}

export function Composition(): JSX.Element {
  return (
    <Markdown>
      {composition}
    </Markdown>
  )
}

export function Decomposition(): JSX.Element {
  return (
    <Markdown>
      {decomposition}
    </Markdown>
  )
}
