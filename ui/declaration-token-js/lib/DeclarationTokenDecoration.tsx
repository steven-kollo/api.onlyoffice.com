import { h } from "preact"

function DeclarationTokenDecoration({ token }) {
  return <span class="dt dt_de">{token.text}</span>
}

export { DeclarationTokenDecoration }
