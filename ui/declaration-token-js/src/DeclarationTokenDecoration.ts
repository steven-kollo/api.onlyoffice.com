import { html } from "common-tags"

function DeclarationTokenDecoration({ token }) {
  return html`
    <span class="dt dt_de">${token.text}</span>
  `
}

export { DeclarationTokenDecoration }
