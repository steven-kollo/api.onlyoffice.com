import { Content } from "@onlyoffice/documentation-ui-kit"
import { h } from "preact"

function data() {
  return {
    layout: "chapter"
  }
}

function render({ title, content }) {
  return content
  // return (
  //   <Content>
  //     <h1>{title}</h1>
  //     {content}
  //   </Content>
  // )
}

export { data, render }
