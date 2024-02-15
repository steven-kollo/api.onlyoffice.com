import { Content } from "@onlyoffice/documentation-ui-content-js"
import { JSX, h } from "preact"
import { CodeDeclarationSection } from "./CodeDeclarationSection.tsx"
import { CodeDeclarationSignature } from "./CodeDeclarationSignature.tsx"

function CodeDeclaration({ declaration: d, onHighlight, onRetrieve, onLink }): JSX.Element {
  return (
    <Content>
      <h1>{d.title}</h1>
      <CodeDeclarationSignature tokens={d.signature} onLink={onLink} />
      <h2>Description</h2>
      <p>{d.description}</p>
      {d.sections && d.sections.map((s) => (
        <CodeDeclarationSection
          section={s}
          onHighlight={onHighlight}
          onRetrieve={onRetrieve}
          onLink={onLink}
        />
      ))}
    </Content>
  )
}

export { CodeDeclaration }
