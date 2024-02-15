import { Fragment, JSX, h } from "preact"
import { CodeDeclarationReference } from "./CodeDeclarationReference.tsx"

function CodeDeclarationSection({ section: s, onHighlight, onRetrieve, onLink }): JSX.Element {
  switch (s.type) {
  case "parameters":
    return <Parameters parameters={s.items} />
  case "returns":
    return <Returns returns={s} />
  case "examples":
    return <Examples examples={s.items} onHighlight={onHighlight} />
  case "topics":
    return <Topics topics={s.items} onRetrieve={onRetrieve} onLink={onLink} />
  case "relationship":
    return <Relationship relationship={s.items} onRetrieve={onRetrieve} onLink={onLink} />
  case "seeAlso":
    return <SeeAlso seeAlso={s.items} onRetrieve={onRetrieve} onLink={onLink} />
  default:
    // todo: throw new Error(`Unknown section type: ${s.type}`)
    return <></>
  }
}

function Parameters({ parameters: pa }): JSX.Element {
  return (
    <>
      <h2>Parameters</h2>
      <dl>
        {pa.map((p) => (
          <>
            <dt><code>{p.name}</code></dt>
            <dd><p>{p.description}</p></dd>
          </>
        ))}
      </dl>
    </>
  )
}

function Returns({ returns: re }): JSX.Element {
  return (
    <>
      <h2>Returns</h2>
      <p>{re.description}</p>
    </>
  )
}

function Examples({ examples: ex, onHighlight: SyntaxHighlight }): JSX.Element {
  return (
    <>
      <h2>Examples</h2>
      {ex.map((e) => {
        <pre><code><SyntaxHighlight syntax="js">{e}</SyntaxHighlight></code></pre>
      })}
    </>
  )
}

function Topics({ topics, onRetrieve, onLink }): JSX.Element {
  return (
    <>
      <h2>Topics</h2>
      {topics.map((t) => (
        <Topic topic={t} onRetrieve={onRetrieve} onLink={onLink} />
      ))}
    </>
  )
}

function Relationship({ relationship: re, onRetrieve, onLink }): JSX.Element {
  return (
    <>
      <h2>Relationship</h2>
      {re.map((r) => (
        <Topic topic={r} onRetrieve={onRetrieve} onLink={onLink} />
      ))}
    </>
  )
}

function SeeAlso({ seeAlso: sa, onRetrieve, onLink }): JSX.Element {
  const t = {
    title: "See Also",
    items: sa
  }
  return <Topic topic={t} onRetrieve={onRetrieve} onLink={onLink} />
}

function Topic({ topic: t, onRetrieve, onLink }): JSX.Element {
  return (
    <>
      <h3>{t.title}</h3>
      <dl>
        {t.items.map((item) => {
          const d = onRetrieve(item)
          if (d === undefined) {
            return <></>
          }
          return (
            <>
              <dt><CodeDeclarationReference declaration={d} onLink={onLink} /></dt>
              <dd>{d.description}</dd>
            </>
          )
        })}
      </dl>
    </>
  )
}

export { CodeDeclarationSection }
