import { Badge } from "@onlyoffice/documentation-ui-kit"
import { Fragment, JSX, h } from "preact"
import { CodeDeclarationReference } from "./CodeDeclarationReference.tsx"
import { CodeDeclarationToken } from "./CodeDeclarationToken.tsx"

export interface CodeDeclarationSectionParameters {
  section: any
  onHighlightSyntax: any
  onLink: any
  onProcessMarkdown: any
  onRetrieve: any
}

export function CodeDeclarationSection(
  {
    section: s,
    onHighlightSyntax: SyntaxHighlight,
    onLink: link,
    onProcessMarkdown: Markdown,
    onRetrieve: retrieve
  }: CodeDeclarationSectionParameters
): JSX.Element {
  switch (s.type) {
  case "parameters":
    return (
      <CodeDeclarationParametersSection
        parameters={s.items}
        onLink={link}
        onProcessMarkdown={Markdown}
      />
    )
  case "returns":
    return (
      <CodeDeclarationReturnsSection
        returns={s}
        onLink={link}
        onProcessMarkdown={Markdown}
      />
    )
  case "examples":
    return (
      <CodeDeclarationExamplesSection
        examples={s.items}
        onHighlightSyntax={SyntaxHighlight}
      />
    )
  case "topics":
    return (
      <CodeDeclarationTopicsSection
        topics={s.items}
        onLink={link}
        onProcessMarkdown={Markdown}
        onRetrieve={retrieve}
      />
    )
  case "relationship":
    return (
      <CodeDeclarationRelationshipSection
        relationship={s.items}
        onLink={link}
        onProcessMarkdown={Markdown}
        onRetrieve={retrieve}
      />
    )
  case "seeAlso":
    return (
      <CodeDeclarationSeeAlsoSection
        seeAlso={s.items}
        onLink={link}
        onProcessMarkdown={Markdown}
        onRetrieve={retrieve}
      />
    )
  default:
    // todo: throw new Error(`Unknown section type: ${s.type}`)
    return <></>
  }
}

interface CodeDeclarationParametersSectionParameters {
  parameters: any
  onLink: any
  onProcessMarkdown: any
}

function CodeDeclarationParametersSection(
  {
    parameters: pa,
    onLink: link,
    onProcessMarkdown: Markdown
  }: CodeDeclarationParametersSectionParameters
): JSX.Element {
  return (
    <>
      <h2>Parameters</h2>
      <dl>
        {pa.map((p) => {
          const c = p.signature.map((t) => (
            <CodeDeclarationToken onLink={link} token={t} />
          ))
          return (
            <>
              <dt><code>{p.name}</code> <Badge>{c}</Badge></dt>
              <dd>
                {p.description !== undefined && (
                  <Markdown>{p.description}</Markdown>
                )}
                {p.default !== undefined && <p>Default: <code>{p.default}</code></p>}
              </dd>
            </>
          )
        })}
      </dl>
    </>
  )
}

interface CodeDeclarationReturnsSectionParameters {
  returns: any
  onLink: any
  onProcessMarkdown: any
}

function CodeDeclarationReturnsSection(
  {
    returns: re,
    onLink: link,
    onProcessMarkdown: Markdown
  }: CodeDeclarationReturnsSectionParameters
): JSX.Element {
  return (
    <>
      <h2>Returns</h2>
      <dl>
        <dt><code><Signature /></code></dt>
        {re.description !== undefined && (
          <dd>
            <Markdown>{re.description}</Markdown>
          </dd>
        )}
      </dl>
    </>
  )

  function Signature(): JSX.Element {
    return re.signature.map((t) => (
      <CodeDeclarationToken token={t} onLink={link} />
    ))
  }
}

interface CodeDeclarationExamplesSectionParameters {
  examples: any
  onHighlightSyntax: any
}

function CodeDeclarationExamplesSection(
  {
    examples: ex,
    onHighlightSyntax: SyntaxHighlight
  }: CodeDeclarationExamplesSectionParameters
): JSX.Element {
  return (
    <>
      <h2>Examples</h2>
      {ex.map((e) => (
        <pre><code><SyntaxHighlight syntax="js">{e}</SyntaxHighlight></code></pre>
      ))}
    </>
  )
}

interface CodeDeclarationTopicsSectionParameters {
  topics: any
  onLink: any
  onProcessMarkdown: any
  onRetrieve: any
}

function CodeDeclarationTopicsSection(
  {
    topics: ts,
    onLink: link,
    onProcessMarkdown: Markdown,
    onRetrieve: retrieve
  }: CodeDeclarationTopicsSectionParameters
): JSX.Element {
  return (
    <>
      <h2>Topics</h2>
      {ts.map((t) => (
        <CodeDeclarationTopicSection
          topic={t}
          onLink={link}
          onProcessMarkdown={Markdown}
          onRetrieve={retrieve}
        />
      ))}
    </>
  )
}

interface CodeDeclarationRelationshipParameters {
  relationship: any
  onLink: any
  onProcessMarkdown: any
  onRetrieve: any
}

function CodeDeclarationRelationshipSection(
  {
    relationship: re,
    onLink: link,
    onProcessMarkdown: Markdown,
    onRetrieve: retrieve
  }: CodeDeclarationRelationshipParameters
): JSX.Element {
  return (
    <>
      <h2>Relationship</h2>
      {re.map((r) => (
        <CodeDeclarationTopicSection
          topic={r}
          onLink={link}
          onProcessMarkdown={Markdown}
          onRetrieve={retrieve}
        />
      ))}
    </>
  )
}

interface CodeDeclarationSeeAlsoParameters {
  seeAlso: any
  onLink: any
  onProcessMarkdown: any
  onRetrieve: any
}

function CodeDeclarationSeeAlsoSection(
  {
    seeAlso: sa,
    onLink: link,
    onProcessMarkdown: Markdown,
    onRetrieve: retrieve
  }: CodeDeclarationSeeAlsoParameters
): JSX.Element {
  const t = {
    title: "See Also",
    items: sa
  }
  return (
    <>
      <h2>{t.title}</h2>
      <dl>
        {t.items.map((item) => {
          const d = retrieve(item)
          if (d === undefined) {
            return <></>
          }
          return (
            <>
              <dt><CodeDeclarationReference declaration={d} onLink={link} /></dt>
              {d.summary !== undefined && (
                <dd>
                  <Markdown>{d.summary}</Markdown>
                </dd>
              )}
            </>
          )
        })}
      </dl>
    </>
  )
}

interface CodeDeclarationTopicSectionParameters {
  topic: any
  onLink: any
  onProcessMarkdown: any
  onRetrieve: any
}

function CodeDeclarationTopicSection(
  {
    topic: t,
    onRetrieve: retrieve,
    onProcessMarkdown: Markdown,
    onLink: link
  }: CodeDeclarationTopicSectionParameters
): JSX.Element {
  return (
    <>
      <h3>{t.title}</h3>
      <dl>
        {t.items.map((item) => {
          const d = retrieve(item)
          if (d === undefined) {
            return <></>
          }
          return (
            <>
              <dt><CodeDeclarationReference declaration={d} onLink={link} /></dt>
              {d.summary !== undefined && (
                <dd>
                  <Markdown>{d.summary}</Markdown>
                </dd>
              )}
            </>
          )
        })}
      </dl>
    </>
  )
}
