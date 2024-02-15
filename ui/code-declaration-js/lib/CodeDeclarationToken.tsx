import { Fragment, JSX, h } from "preact"

function CodeDeclarationToken({ onLink, token: t }): JSX.Element {
  switch (t.type) {
  case "decoration":
    return <Decoration>{t.text}</Decoration>
  case "identifier":
    return <Identifier>{t.text}</Identifier>
  case "keyword":
    return <Keyword>{t.text}</Keyword>
  case "reference":
    return <Reference link={onLink(t)}>{t.text}</Reference>
  case "text":
    return <Text>{t.text}</Text>
  default:
    // todo: throw new Error(`Unknown token type: ${t.type}`)
    return <></>
  }
}

function Decoration({ children: c }): JSX.Element {
  return <span class="dt-de">{c}</span>
}

function Identifier({ children: c }): JSX.Element {
  return <span class="dt-id">{c}</span>
}

function Keyword({ children: c }): JSX.Element {
  return <span class="dt-ke">{c}</span>
}

function Reference({ link: l, children: c }): JSX.Element {
  if (l === undefined) {
    return <span class="dt-re">{c}</span>
  }
  return <a href={l} class="dt-re">{c}</a>
}

function Text({ children: c }): JSX.Element {
  return <>{c}</>
}

export { CodeDeclarationToken }
