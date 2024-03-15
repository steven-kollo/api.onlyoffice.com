import "@onlyoffice/documentation-ui-content/content.css"
import { Content } from "@onlyoffice/documentation-ui-content"
import { h } from "preact"
import { CodeDeclarationSignature } from "./CodeDeclarationSignature.tsx"

export default {
  title: "CodeDeclaration/CodeDeclarationSignature"
}

export const Decomposition = {
  render() {
    return (
      <Content>
        <CodeDeclarationSignature
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
