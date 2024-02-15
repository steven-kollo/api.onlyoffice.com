import { Fragment, JSX, h } from "preact"
import { DeclarationReference } from "./DeclarationReference.tsx"

function DeclarationSection({ section: s, onHighlight, onRetrieve, onLink }): JSX.Element {
  switch (s.type) {
  case "parameters":
    return <DeclarationParameters parameters={s.items} />
  case "returns":
    return <DeclarationReturns returns={s} />
  case "examples":
    return <DeclarationExamples examples={s.items} onHighlight={onHighlight} />
  case "topics":
    return <DeclarationTopics topics={s.items} onRetrieve={onRetrieve} onLink={onLink} />
  case "relationship":
    return <DeclarationRelationship relationship={s.items} onRetrieve={onRetrieve} onLink={onLink} />
  case "seeAlso":
    return <DeclarationSeeAlso seeAlso={s.items} onRetrieve={onRetrieve} onLink={onLink} />
  default:
    // todo: throw new Error(`Unknown section type: ${s.type}`)
    return <></>
  }
}

function DeclarationParameters({ parameters: pa }): JSX.Element {
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

function DeclarationReturns({ returns: re }): JSX.Element {
  return (
    <>
      <h2>Returns</h2>
      <p>{re.description}</p>
    </>
  )
}

function DeclarationExamples({ examples: ex, onHighlight: SyntaxHighlight }): JSX.Element {
  return (
    <>
      <h2>Examples</h2>
      {ex.map((e) => {
        <pre><code><SyntaxHighlight syntax="js">{e}</SyntaxHighlight></code></pre>
      })}
    </>
  )
}

function DeclarationTopics({ topics, onRetrieve, onLink }): JSX.Element {
  return (
    <>
      <h2>Topics</h2>
      {topics.map((t) => (
        <DeclarationTopic topic={t} onRetrieve={onRetrieve} onLink={onLink} />
      ))}
    </>
  )
}

function DeclarationRelationship({ relationship: re, onRetrieve, onLink }): JSX.Element {
  return (
    <>
      <h2>Relationship</h2>
      {re.map((r) => (
        <DeclarationTopic topic={r} onRetrieve={onRetrieve} onLink={onLink} />
      ))}
    </>
  )
}

function DeclarationSeeAlso({ seeAlso: sa, onRetrieve, onLink }): JSX.Element {
  const t = {
    title: "See Also",
    items: sa
  }
  return <DeclarationTopic topic={t} onRetrieve={onRetrieve} onLink={onLink} />
}

function DeclarationTopic({ topic: t, onRetrieve, onLink }): JSX.Element {
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
              <dt><DeclarationReference declaration={d} onLink={onLink} /></dt>
              <dd>{d.description}</dd>
            </>
          )
        })}
      </dl>
    </>
  )
}

export { DeclarationSection }
