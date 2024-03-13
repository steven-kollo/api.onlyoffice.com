import { h } from "preact"
import { CodeDeclarationToken } from "./CodeDeclarationToken.js"

export default {
  title: "CodeDeclaration/CodeDeclarationToken",
  render() {
    function onLink() {
      return "/"
    }
    const d = {
      "signature": [
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
          "type": "text",
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
      ]
    }
    return (
      <CodeDeclarationToken onLink={onLink} token={d.signature[0]} />
    )
  }
}

export const Default = {}
