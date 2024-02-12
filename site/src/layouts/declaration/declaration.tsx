import { Declaration } from "@/components/declaration/Declaration.tsx"
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
        <Declaration onRetrieve={onRetrieve} onLink={onLink} declaration={d} />
      ))}
    </>
  )
}

export { data, render }
