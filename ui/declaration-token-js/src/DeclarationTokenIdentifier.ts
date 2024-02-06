import { html } from "common-tags"

function DeclarationTokenIdentifier({ token }) {
  return html`
    <span class="dt dt_id">${token.text}</span>
  `
}

export { DeclarationTokenIdentifier }
