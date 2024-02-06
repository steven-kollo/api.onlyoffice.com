import { html } from "common-tags"

function DeclarationTokenReference({ onLink, token }) {
  const l = onLink(token)
  if (l === undefined) {
    return html`
      <span class="dt dt_re">${token.text}</span>
    `
  }
  return html`
    <a href="${l}" class="dt dt_re">${token.text}</a>
  `
}

export { DeclarationTokenReference }
