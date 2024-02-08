import { h } from "preact"

function DeclarationTokenReference({ onLink, token }) {
  const l = onLink(token)
  if (l === undefined) {
    return <span class="dt dt_re">{token.text}</span>
  }
  return <a href={l} class="dt dt_re">{token.text}</a>
}

export { DeclarationTokenReference }
