import { Markdown } from "@/src/components/markdown/markdown.tsx"
import { SyntaxHighlight } from "@/src/components/syntax-highlight/SyntaxHighlight.tsx"
import { CodeDeclaration } from "@onlyoffice/documentation-ui-kit-js"
import { h, Fragment } from "preact"

function data() {
  return {
    layout: "chapter/chapter.tsx"
  }
}

function render({ pagination, onRetrieve, onLink }) {
  return (
    <>
      {pagination.items.map((d) => (
        <CodeDeclaration
          declaration={d}
          onProcessMarkdown={Markdown}
          onHighlightSyntax={SyntaxHighlight}
          onLink={onLink}
          onRetrieve={onRetrieve}
        />
      ))}
    </>
  )
}

export { data, render }
