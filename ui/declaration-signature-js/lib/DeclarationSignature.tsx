import { DeclarationToken } from "@onlyoffice/documentation-ui-declaration-token-js"
import { JSX, h } from "preact"

interface DeclarationSignatureProperties {
  tokens: any
  onLink: any
}

function DeclarationSignature({ tokens, onLink }: DeclarationSignatureProperties): JSX.Element {
  const code = tokens.map((t) => (
    <DeclarationToken onLink={onLink} token={t} />
  ))
  return (
    <pre><code>{code}</code></pre>
  )
}

export { DeclarationSignature, DeclarationSignatureProperties }
