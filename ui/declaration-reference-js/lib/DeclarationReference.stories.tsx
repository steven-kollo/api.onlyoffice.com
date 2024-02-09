import { h } from "preact"
import { DeclarationReference } from "./DeclarationReference.js"

export default {
  title: "Components/DeclarationReference",
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
      <DeclarationReference onLink={onLink} declaration={d} />
    )
  }
}

export const Default = {}
