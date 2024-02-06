import { html } from "common-tags"

function DeclarationTokenKeyword({ token }) {
  return html`
    <span class="dt dt_ke">${token.text}</span>
  `
}

export { DeclarationTokenKeyword }
