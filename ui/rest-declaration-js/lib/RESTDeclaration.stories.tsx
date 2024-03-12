import "@onlyoffice/documentation-ui-content-js/content.css"

import { Content } from "@onlyoffice/documentation-ui-content-js"
import { h } from "preact"
import { RESTDeclaration } from "./rest-declaration.ts"

export default {
  title: "Components/RESTDeclaration"
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
