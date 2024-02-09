import {
  CodeListing,
  Content,
  DeclarationReference,
  DeclarationToken,
  SyntaxHighlight
} from "@onlyoffice/documentation-ui-kit-js"
import { h, Fragment } from "preact"

/**
 * @param {Object} param0
 * @param {import("@onlyoffice/documentation-declarations").Declaration} param0.declaration
 */
function Declaration({ onRetrieve, onLink, declaration: d }) {
  return (
    <Content>
      <h1>{d.title}</h1>
      <CodeListing>
        {/* todo: join("") */}
        {d.signature.map((t) => <DeclarationToken onLink={onLink} token={t} />)}
      </CodeListing>
      <h2>Description</h2>
      <p>{d.description}</p>
      <DeclarationTopics onRetrieve={onRetrieve} onLink={onLink} declaration={d} />
    </Content>
  )
}

/**
 * @param {Object} param0
 * @param {(d: any) => import("@onlyoffice/documentation-declarations").Declaration} param0.onRetrieve
 * @param {import("@onlyoffice/documentation-declarations").Declaration} param0.declaration
 * @returns
 */
function DeclarationTopics({ onRetrieve, onLink, declaration: d }) {
  let s = []
  let p = undefined
  let items = []

  // todo: this logic should be part of the declaration package.

  switch (d.kind) {
  // case "alias":
  //   break
  case "class":
    if (d.constructors !== undefined) {
      s.push(
        <DeclarationTopic
          onRetrieve={onRetrieve}
          onLink={onLink}
          title={"Constructors"}
          items={d.constructors}
        />
      )
    }
    if (d.events !== undefined) {
      s.push(
        <DeclarationTopic
          onRetrieve={onRetrieve}
          onLink={onLink}
          title={"Events"}
          items={d.events}
        />
      )
    }
    if (d.extends !== undefined) {
      s.push(
        <DeclarationTopic
          onRetrieve={onRetrieve}
          onLink={onLink}
          title={"Extends"}
          items={d.extends}
        />
      )
    }
    if (d.implements !== undefined) {
      s.push(
        <DeclarationTopic
          onRetrieve={onRetrieve}
          onLink={onLink}
          title={"Implements"}
          items={d.implements}
        />
      )
    }
    if (d.instanceMethods !== undefined) {
      s.push(
        <DeclarationTopic
          onRetrieve={onRetrieve}
          onLink={onLink}
          title={"Instance Methods"}
          items={d.instanceMethods}
        />
      )
    }
    if (d.instanceProperties !== undefined) {
      s.push(
        <DeclarationTopic
          onRetrieve={onRetrieve}
          onLink={onLink}
          title={"Instance Properties"}
          items={d.instanceProperties}
        />
      )
    }
    if (d.typeMethods !== undefined) {
      s.push(
        <DeclarationTopic
          onRetrieve={onRetrieve}
          onLink={onLink}
          title={"Type Methods"}
          items={d.typeMethods}
        />
      )
    }
    if (d.typeProperties !== undefined) {
      s.push(
        <DeclarationTopic
          onRetrieve={onRetrieve}
          onLink={onLink}
          title={"Type Properties"}
          items={d.typeProperties}
        />
      )
    }
    if (d.examples !== undefined) {
      s.push(
        <>
          <h2>Examples</h2>
          {d.examples.map((e) => (
            <CodeListing>
              <SyntaxHighlight syntax={"js"}>{e}</SyntaxHighlight>
            </CodeListing>
          ))}
        </>
      )
    }

    // todo: p = onRetrieve(d.parent)

    break
  case "constructor":
    if (d.type.parameters !== undefined) {
      s.push(
        <DeclarationTopic2
          title={"Parameters"}
          items={d.type.parameters}
        />
      )
    }

    p = onRetrieve(d.parent)
    if (p === undefined || p.kind !== "class") {
      break
    }

    if (d.examples !== undefined) {
      s.push(
        <>
          <h2>Examples</h2>
          {d.examples.map((e) => (
            <CodeListing>
              <SyntaxHighlight syntax={"js"}>{e}</SyntaxHighlight>
            </CodeListing>
          ))}
        </>
      )
    }

    items = p.constructors.filter((c) => c.id !== d.id)
    if (items.length > 0) {
      s.push(
        <DeclarationTopic
          onRetrieve={onRetrieve}
          onLink={onLink}
          title={"See Also"}
          items={items}
        />
      )
    }

    break
  // case "initializer":
  //   break
  case "instanceMethod":
    if (d.type.parameters !== undefined) {
      s.push(
        <DeclarationTopic2
          title={"Parameters"}
          items={d.type.parameters}
        />
      )
    }
    if (d.type.returns !== undefined) {
      s.push(
        <>
          <h2>Return</h2>
          <p>{d.type.returns.description}</p>
        </>
      )
    }

    if (d.examples !== undefined) {
      s.push(
        <>
          <h2>Examples</h2>
          {d.examples.map((e) => (
            <CodeListing>
              <SyntaxHighlight syntax={"js"}>{e}</SyntaxHighlight>
            </CodeListing>
          ))}
        </>
      )
    }

    p = onRetrieve(d.parent)
    if (p === undefined || p.kind !== "class") {
      break
    }

    items = p.instanceMethods.filter((c) => c.id !== d.id)
    if (items.length > 0) {
      s.push(
        <DeclarationTopic
          onRetrieve={onRetrieve}
          onLink={onLink}
          title={"See Also"}
          items={items}
        />
      )
    }

    break
  case "instanceProperty":
    if (d.examples !== undefined) {
      s.push(
        <>
          <h2>Examples</h2>
          {d.examples.map((e) => (
            <CodeListing>
              <SyntaxHighlight syntax={"js"}>{e}</SyntaxHighlight>
            </CodeListing>
          ))}
        </>
      )
    }

    p = onRetrieve(d.parent)
    if (p === undefined || p.kind !== "class") {
      break
    }

    items = p.instanceProperties.filter((c) => c.id !== d.id)
    if (items.length > 0) {
      s.push(
        <DeclarationTopic
          onRetrieve={onRetrieve}
          onLink={onLink}
          title={"See Also"}
          items={items}
        />
      )
    }
    break
  case "typeMethod":
    if (d.type.parameters !== undefined) {
      s.push(
        <DeclarationTopic2
          title={"Parameters"}
          items={d.type.parameters}
        />
      )
    }
    if (d.type.returns !== undefined) {
      s.push(
        <>
          <h2>Return</h2>
          <p>{d.type.returns.description}</p>
        </>
      )
    }

    if (d.examples !== undefined) {
      s.push(
        <>
          <h2>Examples</h2>
          {d.examples.map((e) => (
            <CodeListing>
              <SyntaxHighlight syntax={"js"}>{e}</SyntaxHighlight>
            </CodeListing>
          ))}
        </>
      )
    }

    p = onRetrieve(d.parent)
    if (p === undefined || p.kind !== "class") {
      break
    }

    items = p.typeMethods.filter((c) => c.id !== d.id)
    if (items.length > 0) {
      s.push(
        <DeclarationTopic
          onRetrieve={onRetrieve}
          onLink={onLink}
          title={"See Also"}
          items={items}
        />
      )
    }
    break
  case "typeProperty":
    if (d.examples !== undefined) {
      s.push(
        <>
          <h2>Examples</h2>
          {d.examples.map((e) => (
            <CodeListing>
              <SyntaxHighlight syntax={"js"}>{e}</SyntaxHighlight>
            </CodeListing>
          ))}
        </>
      )
    }

    p = onRetrieve(d.parent)
    if (p === undefined || p.kind !== "class") {
      break
    }

    items = p.typeProperties.filter((c) => c.id !== d.id)
    if (items.length > 0) {
      s.push(
        <DeclarationTopic
          onRetrieve={onRetrieve}
          onLink={onLink}
          title={"See Also"}
          items={items}
        />
      )
    }
    break
  case "event":
    if (d.type.parameters !== undefined) {
      s.push(
        <DeclarationTopic2
          title={"Parameters"}
          items={d.type.parameters}
        />
      )
    }

    if (d.examples !== undefined) {
      s.push(
        <>
          <h2>Examples</h2>
          {d.examples.map((e) => (
            <CodeListing>
              <SyntaxHighlight syntax={"js"}>{e}</SyntaxHighlight>
            </CodeListing>
          ))}
        </>
      )
    }

    p = onRetrieve(d.parent)
    if (p === undefined || p.kind !== "class") {
      break
    }

    items = p.events.filter((c) => c.id !== d.id)
    if (items.length > 0) {
      s.push(
        <DeclarationTopic
          onRetrieve={onRetrieve}
          onLink={onLink}
          title={"See Also"}
          items={items}
        />
      )
    }
    break
  case "object":
    break
  case "method":
    break
  case "property":
    break
  case "type":
    if (d.examples !== undefined) {
      s.push(
        <>
          <h2>Examples</h2>
          {d.examples.map((e) => (
            <CodeListing>
              <SyntaxHighlight syntax={"js"}>{e}</SyntaxHighlight>
            </CodeListing>
          ))}
        </>
      )
    }
    break
  default:
    // todo: log.
    break
  }

  return s
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
      <h2>{title}</h2>
      <dl>
        {items.map((item) => {
          const d = onRetrieve(item)
          if (d === undefined) {
            return
          }
          return (
            <div>
              <dt><DeclarationReference onLink={onLink} declaration={d} /></dt>
              <dd>{d.description}</dd>
            </div>
          )
        })}
      </dl>
    </>
  )
}

/**
 * @param {Object} param0
 * @param {string} param0.title
 * @param {import("@onlyoffice/documentation-declarations").DeclarationValue[]} param0.items
 */
function DeclarationTopic2({ title, items }) {
  return (
    <>
      <h2>{title}</h2>
      <dl>
        {items.map((item) => (
          <>
            <dt>{item.name}</dt>
            <dd>{item.description}</dd>
          </>
        ))}
      </dl>
    </>
  )
}

function render() {
  return ""
}

export { render, Declaration }
