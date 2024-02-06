import { DeclarationTokenDecoration } from "./DeclarationTokenDecoration.js"
import { DeclarationTokenIdentifier } from "./DeclarationTokenIdentifier.js"
import { DeclarationTokenKeyword } from "./DeclarationTokenKeyword.js"
import { DeclarationTokenReference } from "./DeclarationTokenReference.js"
import { DeclarationTokenText } from "./DeclarationTokenText.js"

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
