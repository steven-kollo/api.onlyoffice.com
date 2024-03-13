import { Content } from "@onlyoffice/documentation-ui-kit"
import { h } from "preact"

function data() {
  return {
    layout: "chapter/chapter.tsx"
  }
}

function render({ title, content }) {
  return (
    <Content>
      <h1>{title}</h1>
      {content}
    </Content>
  )
}

export { data, render }
