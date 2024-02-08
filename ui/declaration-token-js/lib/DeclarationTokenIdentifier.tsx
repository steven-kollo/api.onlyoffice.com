import { h } from "preact"

function DeclarationTokenIdentifier({ token }) {
  return <span class="dt dt_id">{token.text}</span>
}

export { DeclarationTokenIdentifier }
