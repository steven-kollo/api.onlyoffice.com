import "@onlyoffice/documentation-ui-content-js/content.css"
import "@onlyoffice/documentation-ui-declaration-token-js/declaration-token.css"
import { Content } from "@onlyoffice/documentation-ui-content-js"
import { h } from "preact"
import { DeclarationSignature } from "./DeclarationSignature.tsx"

export default {
  title: "Components/DeclarationSignature"
}

export const Decomposition = {
  render() {
    return (
      <Content>
        <DeclarationSignature
          tokens={[
            {
              "type": "decoration",
              "text": "(union)"
            },
            {
              "type": "text",
              "text": " "
            },
            {
              "type": "identifier",
              "text": "Angle"
            },
            {
              "type": "text",
              "text": ": "
            },
            {
              "type": "reference",
              "text": "\"xlDownward\""
            },
            {
              "type": "text",
              "text": " | "
            },
            {
              "type": "text",
              "text": "\"xlHorizontal\""
            },
            {
              "type": "text",
              "text": " | "
            },
            {
              "type": "text",
              "text": "\"xlUpward\""
            },
            {
              "type": "text",
              "text": " | "
            },
            {
              "type": "text",
              "text": "\"xlVertical\""
            }
          ]}
          onLink={() => "https://example.com"}
        />
      </Content>
    )
  }
}
