import { Badge } from "@onlyoffice/documentation-ui-kit"
import type { JSX } from "preact"
import { Fragment, h } from "preact"

export interface CodeDeclarationParameters {
  declaration: any
  onProcessMarkdown: any
  onHighlightSyntax: any
  onRetrieve: any
  onLink: any
}

export function CodeDeclaration(
  {
    declaration: d,
    onProcessMarkdown: Markdown,
    onHighlightSyntax: SyntaxHighlight,
    onRetrieve: retrieve,
    onLink: link
  }: CodeDeclarationParameters
): JSX.Element {
  return (
    <>
      <h1>{d.title}</h1>
      {d.signature && (
        <CodeDeclarationSignature tokens={d.signature} onLink={link} />
      )}
      {d.description && (
        <>
          <h2>Description</h2>
          <Markdown>{d.description}</Markdown>
        </>
      )}
      {d.sections && d.sections.map((s) => (
        <CodeDeclarationSection
          section={s}
          onProcessMarkdown={Markdown}
          onHighlightSyntax={SyntaxHighlight}
          onRetrieve={retrieve}
          onLink={link}
        />
      ))}
    </>
  )
}

function CodeDeclarationSignature({ tokens, onLink }): JSX.Element {
  const c = tokens.map((t) => (
    <CodeDeclarationToken onLink={onLink} token={t} />
  ))
  return <pre><code>{c}</code></pre>
}

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

interface CodeDeclarationSectionParameters {
  section: any
  onHighlightSyntax: any
  onLink: any
  onProcessMarkdown: any
  onRetrieve: any
}

function CodeDeclarationSection(
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

function CodeDeclarationReference({ onLink, declaration: d }): JSX.Element {
  const c = d.signature.map((t) => (
    <ReferenceToken token={t} />
  ))
  return <a class="dr" href={onLink(d)}><code>{c}</code></a>
}

function ReferenceToken({ token: t }): JSX.Element {
  switch (t.type) {
  case "decoration":
    return <ReferenceText>{t.text}</ReferenceText>
  case "identifier":
    return <ReferenceIdentifier>{t.text}</ReferenceIdentifier>
  case "keyword":
  case "reference":
  case "text":
    return <ReferenceText>{t.text}</ReferenceText>
  default:
    // todo: throw new Error(`Unknown token type: ${t.type}`)
    return <></>
  }
}

function ReferenceIdentifier({ children: c }): JSX.Element {
  return <span class="dr-id">{c}</span>
}

function ReferenceText({ children: c }): JSX.Element {
  return <>{c}</>
}
