import { html } from "common-tags"
import { DeclarationReferenceIdentifier } from "./DeclarationReferenceIdentifier.js"
import { DeclarationReferenceText } from "./DeclarationReferenceText.js"

function DeclarationReference({ onLink, declaration: d }) {
  let c = ""

  d.signature.forEach((t) => {
    switch (t.type) {
    case "decoration":
      c += DeclarationReferenceText({ token: t })
      break
    case "identifier":
      c += DeclarationReferenceIdentifier({ token: t })
      break
    case "keyword":
    case "reference":
    case "text":
      c += DeclarationReferenceText({ token: t })
      break
    default:
      // todo: log.
      break
    }
  })

  return html`
    <a class="dr" href="${onLink(d)}"><code class="dr__line">${c}</code></a>
  `
}

export { DeclarationReference }
