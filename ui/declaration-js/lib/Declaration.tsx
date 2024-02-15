import { Content } from "@onlyoffice/documentation-ui-content-js"
import { JSX, h } from "preact"
import { DeclarationSection } from "./DeclarationSection.tsx"
import { DeclarationSignature } from "./DeclarationSignature.tsx"

function Declaration({ declaration: d, onHighlight, onRetrieve, onLink }): JSX.Element {
  return (
    <Content>
      <h1>{d.title}</h1>
      <DeclarationSignature tokens={d.signature} onLink={onLink} />
      <h2>Description</h2>
      <p>{d.description}</p>
      {d.sections && d.sections.map((s) => (
        <DeclarationSection
          section={s}
          onHighlight={onHighlight}
          onRetrieve={onRetrieve}
          onLink={onLink}
        />
      ))}
    </Content>
  )
}

export { Declaration }
