import { h } from "preact"

function DeclarationReferenceIdentifier({ token }) {
  return <span class="dr__t dr__t_id">{token.text}</span>
}

export { DeclarationReferenceIdentifier }
