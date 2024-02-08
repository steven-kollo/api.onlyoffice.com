import { h } from "preact"

function data() {
  return {
    layout: "chapter/chapter.tsx"
  }
}

function render({ content }) {
  return (
    <div>{content}</div>
  )
}

export { data, render }
