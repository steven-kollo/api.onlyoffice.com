import { Content } from "@onlyoffice/documentation-ui-kit-js"
import { h } from "preact"

function data() {
  return {
    layout: "chapter/chapter.tsx"
  }
}

function render({ content }) {
  return <Content>{content}</Content>
}

export { data, render }
