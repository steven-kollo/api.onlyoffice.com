import { html } from "common-tags"

function DeclarationReferenceIdentifier({ token }) {
  return html`
    <span class="dr__t dr__t_id">${token.text}</span>
  `
}

export { DeclarationReferenceIdentifier }
