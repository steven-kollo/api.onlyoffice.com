import { Fragment, JSX, h } from "preact"

function DeclarationReference({ onLink, declaration: d }): JSX.Element {
  const c = d.signature.map((t) => (
    <Token token={t} />
  ))
  return <a class="dr" href={onLink(d)}><code>{c}</code></a>
}

function Token({ token: t }): JSX.Element {
  switch (t.type) {
  case "decoration":
    return <Text>{t.text}</Text>
  case "identifier":
    return <Identifier>{t.text}</Identifier>
  case "keyword":
  case "reference":
  case "text":
    return <Text>{t.text}</Text>
  default:
    // todo: throw new Error(`Unknown token type: ${t.type}`)
    return <></>
  }
}

function Identifier({ children: c }): JSX.Element {
  return <span class="dr-id">{c}</span>
}

function Text({ children: c }): JSX.Element {
  return <>{c}</>
}

export { DeclarationReference }
