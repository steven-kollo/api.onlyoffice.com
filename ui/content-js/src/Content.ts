import { html } from "common-tags"

function Content(children) {
  return html`<div class="content">${children()}</div>`
}

export { Content }
