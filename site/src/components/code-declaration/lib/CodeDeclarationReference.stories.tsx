import { h } from "preact"
import { CodeDeclarationReference } from "./CodeDeclarationReference.js"

export default {
  title: "CodeDeclaration/CodeDeclarationReference",
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
      <CodeDeclarationReference onLink={onLink} declaration={d} />
    )
  }
}

export const Default = {}
