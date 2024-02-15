import { SyntaxHighlight } from "@/components/syntax-highlight/SyntaxHighlight.tsx"
import { Declaration } from "@onlyoffice/documentation-ui-kit-js"
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
        <Declaration
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
