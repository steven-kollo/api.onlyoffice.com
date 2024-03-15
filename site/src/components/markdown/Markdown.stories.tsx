import type { JSX } from "preact"
import { h } from "preact"
import { register } from "../../../config/markdown.ts"
import { Markdown } from "./Markdown.tsx"

await register()

export default {
  title: "Site Components/Markdown"
}

export function Composition(): JSX.Element {
  return (
    <div>
      <Markdown>
        {`# Hello, world!`}
      </Markdown>
    </div>
  )
}
