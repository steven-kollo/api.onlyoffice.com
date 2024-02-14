import {
  CodeListing,
  Content,
  DeclarationReference,
  DeclarationSignature
} from "@onlyoffice/documentation-ui-kit-js"
import { h, Fragment } from "preact"
import { SyntaxHighlight } from "../syntax-highlight/SyntaxHighlight.tsx"

/**
 * @param {Object} param0
 * @param {import("@onlyoffice/documentation-declarations").Declaration} param0.declaration
 */
function Declaration({ onRetrieve, onLink, declaration: d }) {
  return (
    <Content>
      <h1>{d.title}</h1>
      <DeclarationSignature tokens={d.signature} onLink={onLink} />
      <h2>Description</h2>
      <p>{d.description}</p>
      {d.sections && d.sections.map((s) => {
        switch (s.type) {
        case "parameters":
          return (
            <>
              <h2>Parameters</h2>
              <dl>
                {s.items.map((item) => (
                  <>
                    <dt>{item.name}</dt>
                    <dd>{item.description}</dd>
                  </>
                ))}
              </dl>
            </>
          )
        case "returns":
          return (
            <>
              <h2>Returns</h2>
              <p>{s.description}</p>
            </>
          )
        case "examples":
          return (
            <>
              <h2>Examples</h2>
              {s.items.map((e) => (
                <CodeListing>
                  <SyntaxHighlight syntax={"js"}>{e}</SyntaxHighlight>
                </CodeListing>
              ))}
            </>
          )
        case "topics":
          return (
            <>
              <h2>Topics</h2>
              {s.items.map((item) => (
                <DeclarationTopic
                  title={item.title}
                  items={item.items}
                  onRetrieve={onRetrieve}
                  onLink={onLink}
                />
              ))}
            </>
          )
        case "relationship":
          return (
            <>
              <h2>Relationship</h2>
              {s.items.map((item) => (
                <DeclarationTopic
                  title={item.title}
                  items={item.items}
                  onRetrieve={onRetrieve}
                  onLink={onLink}
                />
              ))}
            </>
          )
        case "seeAlso":
          return (
            <>
              <h2>See Also</h2>
              <dl>
                {s.items.map((item) => {
                  const d = onRetrieve(item)
                  if (d === undefined) {
                    return
                  }
                  return (
                    <>
                      <dt><DeclarationReference onLink={onLink} declaration={d} /></dt>
                      <dd>{d.description}</dd>
                    </>
                  )
                })}
              </dl>
            </>
          )
        default:
          // throw new Error(`Unknown section type: ${s.type}`)
        }
      })}
    </Content>
  )
}

/**
 * @param {Object} param0
 * @param {(d: any) => import("@onlyoffice/documentation-declarations").Declaration} param0.onRetrieve
 * @param {string} param0.title
 * @param {import("@onlyoffice/documentation-declarations").ReferenceType[]} param0.items
 */
function DeclarationTopic({ onRetrieve, onLink, title, items }) {
  return (
    <>
      <h3>{title}</h3>
      <dl>
        {items.map((item) => {
          const d = onRetrieve(item)
          if (d === undefined) {
            return
          }
          return (
            <>
              <dt><DeclarationReference onLink={onLink} declaration={d} /></dt>
              <dd>{d.description}</dd>
            </>
          )
        })}
      </dl>
    </>
  )
}

export { Declaration }
