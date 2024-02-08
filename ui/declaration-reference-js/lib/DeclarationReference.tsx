import { h, Fragment } from "preact"
import { DeclarationReferenceIdentifier } from "./DeclarationReferenceIdentifier.tsx"
import { DeclarationReferenceText } from "./DeclarationReferenceText.tsx"

function DeclarationReference({ onLink, declaration: d }) {
  let c = []

  d.signature.forEach((t) => {
    switch (t.type) {
    case "decoration":
      c.push(DeclarationReferenceText({ token: t }))
      break
    case "identifier":
      c.push(DeclarationReferenceIdentifier({ token: t }))
      break
    case "keyword":
    case "reference":
    case "text":
      c.push(DeclarationReferenceText({ token: t }))
      break
    default:
      // todo: log.
      break
    }
  })

  return <a class="dr" href={onLink(d)}><code class="dr__line">{c}</code></a>
}

export { DeclarationReference }
