import { Theme as StorybookTheme } from "@onlyoffice/documentation-ui-storybook"
import type { JSX } from "preact"
import { Fragment, h } from "preact"
import code from "./fixtures/code.js?raw"
import syntaxHighlight from "./syntax-highlight.css?inline"
import syntaxHighlightRegular from "./syntax-highlight.regular.css?inline"
import { register } from "./syntax-highlight.config.ts"
import { SyntaxHighlight } from "./syntax-highlight.ts"

const styles: string[] = [
  syntaxHighlight,
  syntaxHighlightRegular
]

export default {
  title: "Site/SyntaxHighlight",
  loaders: [
    register
  ],
  decorators: [
    (Story: any): JSX.Element => (
      <>
        {styles.map((s) => (
          <style key={s} dangerouslySetInnerHTML={{ __html: s }} />
        ))}
        <Story />
      </>
    )
  ]
}

export function Composition(): JSX.Element {
  return (
    <pre><code><SyntaxHighlight syntax="javascript">{code}</SyntaxHighlight></code></pre>
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
