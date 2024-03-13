import "@onlyoffice/documentation-ui-content/content.css"

import { Content } from "@onlyoffice/documentation-ui-content"
import { h } from "preact"
import { RESTDeclaration } from "./rest-declaration.ts"

export default {
  title: "UI Kit/RESTDeclaration"
}

export const Composition = {
  render() {
    return (
      <Content>
        <RESTDeclaration />
      </Content>
    )
  }
}
