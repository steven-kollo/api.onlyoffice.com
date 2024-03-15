import type { JSX } from "preact"
import { h } from "preact"
import { register } from "../../../config/markdown.ts"
import composition from "./fixtures/composition.md?raw"
import decomposition from "./fixtures/decomposition.md?raw"
import { Markdown } from "./markdown.ts"

export default {
  title: "Site/Markdown",
  loaders: [
    register
  ]
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
