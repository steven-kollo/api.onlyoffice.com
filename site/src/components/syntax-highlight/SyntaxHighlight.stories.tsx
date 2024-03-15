import "./syntax-highlight.css"

import { Theme as StorybookTheme } from "@onlyoffice/documentation-ui-storybook"
import type { JSX } from "preact"
import { h } from "preact"
import { register } from "../../../config/syntax-highlight.ts"
import { SyntaxHighlight } from "./SyntaxHighlight.tsx"

await register()

export default {
  title: "Site Components/SyntaxHighlight"
}

export function Composition(): JSX.Element {
  return (
    <div>
      <SyntaxHighlight syntax="javascript">
        {`import { h } from "preact"`}
      </SyntaxHighlight>
    </div>
  )
}

const colors: string[] = [
  "syntax-highlight-comment-color",
  "syntax-highlight-constant-color",
  "syntax-highlight-entity-color",
  "syntax-highlight-storage-modifier-import-color",
  "syntax-highlight-entity-tag-color",
  "syntax-highlight-keyword-color",
  "syntax-highlight-string-color",
  "syntax-highlight-variable-color",
  "syntax-highlight-brackethighlighter-unmatched-color",
  "syntax-highlight-invalid-illegal-text-color",
  "syntax-highlight-invalid-illegal-bg-color",
  "syntax-highlight-carriage-return-text-color",
  "syntax-highlight-carriage-return-bg-color",
  "syntax-highlight-string-regexp-color",
  "syntax-highlight-markup-list-color",
  "syntax-highlight-markup-heading-color",
  "syntax-highlight-markup-italic-color",
  "syntax-highlight-markup-bold-color",
  "syntax-highlight-markup-deleted-text-color",
  "syntax-highlight-markup-deleted-bg-color",
  "syntax-highlight-markup-inserted-text-color",
  "syntax-highlight-markup-inserted-bg-color",
  "syntax-highlight-markup-changed-text-color",
  "syntax-highlight-markup-changed-bg-color",
  "syntax-highlight-markup-ignored-text-color",
  "syntax-highlight-markup-ignored-bg-color",
  "syntax-highlight-meta-diff-range-color",
  "syntax-highlight-brackethighlighter-angle-color",
  "syntax-highlight-sublimelinter-gutter-mark-color",
  "syntax-highlight-constant-other-reference-link-color"
]

export function Theme(): JSX.Element {
  return (
    <StorybookTheme>
      <StorybookTheme.Color>
        {colors.map((c) => (
          <StorybookTheme.Scale key={c} scale={c} />
        ))}
      </StorybookTheme.Color>
    </StorybookTheme>
  )
}
