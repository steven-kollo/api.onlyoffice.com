import { JSX, h } from "preact"
import { DeclarationToken } from "./DeclarationToken.tsx"

function DeclarationSignature({ tokens, onLink }): JSX.Element {
  const c = tokens.map((t) => (
    <DeclarationToken onLink={onLink} token={t} />
  ))
  return <pre><code>{c}</code></pre>
}

export { DeclarationSignature }
