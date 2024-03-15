import { JSX, h } from "preact"
import { CodeDeclarationToken } from "./CodeDeclarationToken.tsx"

function CodeDeclarationSignature({ tokens, onLink }): JSX.Element {
  const c = tokens.map((t) => (
    <CodeDeclarationToken onLink={onLink} token={t} />
  ))
  return <pre><code>{c}</code></pre>
}

export { CodeDeclarationSignature }
