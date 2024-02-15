import { SyntaxHighlight } from "@/components/syntax-highlight/SyntaxHighlight.tsx"
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
          onHighlight={SyntaxHighlight}
          onLink={onLink}
          onRetrieve={onRetrieve}
        />
      ))}
    </>
  )
}

export { data, render }
