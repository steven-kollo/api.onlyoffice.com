// import { CodeDeclaration } from "@/src/components/code-declaration/lib/CodeDeclaration.tsx"
// import { Markdown } from "@/src/components/markdown/Markdown.tsx"
// import { SyntaxHighlight } from "@/src/components/syntax-highlight/SyntaxHighlight.tsx"
import { Fragment, h } from "preact"

function data() {
  return {
    layout: "chapter"
  }
}

function render({ pagination, onRetrieve, onLink }) {
  return (
    <>
      {pagination.items.map((d) => (
        <div></div>
        // <CodeDeclaration
        //   declaration={d}
        //   onProcessMarkdown={Markdown}
        //   onHighlightSyntax={SyntaxHighlight}
        //   onLink={onLink}
        //   onRetrieve={onRetrieve}
        // />
      ))}
    </>
  )
}

export { data, render }
