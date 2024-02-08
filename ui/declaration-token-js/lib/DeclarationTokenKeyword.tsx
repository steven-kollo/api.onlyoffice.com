import { h } from "preact"

function DeclarationTokenKeyword({ token }) {
  return <span class="dt dt_ke">{token.text}</span>
}

export { DeclarationTokenKeyword }
