import { h } from "preact"
import { DeclarationTokenDecoration } from "./DeclarationTokenDecoration.tsx"
import { DeclarationTokenIdentifier } from "./DeclarationTokenIdentifier.tsx"
import { DeclarationTokenKeyword } from "./DeclarationTokenKeyword.tsx"
import { DeclarationTokenReference } from "./DeclarationTokenReference.tsx"
import { DeclarationTokenText } from "./DeclarationTokenText.tsx"

function DeclarationToken({ onLink, token }) {
  switch (token.type) {
  case "decoration":
    return DeclarationTokenDecoration({ token })
  case "identifier":
    return DeclarationTokenIdentifier({ token })
  case "keyword":
    return DeclarationTokenKeyword({ token })
  case "reference":
    return DeclarationTokenReference({ token, onLink })
  case "text":
    return DeclarationTokenText({ token })
  default:
    // todo: log.
    break
  }
}

export { DeclarationToken }
