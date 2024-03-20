import type { REST } from "@onlyoffice/documentation-declarations-types/rest.ts"
import { Badge, CodeListing } from "@onlyoffice/documentation-ui-kit"
import { useContext } from "preact/hooks"
import type { JSX } from "preact"
import { Fragment, createContext, h } from "preact"
import { Callback } from "../callback/callback.ts"

interface RetrieveContext {
  stack: string[]
  retrieve(id: string): REST.Component | undefined
}

const Retrieve = createContext<RetrieveContext>({
  stack: [],
  retrieve() {
    throw new Error("not implemented")
  }
})

export interface DeclarationParameters {
  declaration: REST.Request
  onHighlightSyntax: onHighlightSyntax
  onRenderDescription: onRenderDescription
  onRetrieve: onRetrieve
}

interface onHighlightSyntax {
  (
    {
      syntax,
      children
    }: {
      syntax: string
      children: any
    }
  ): any
}

interface onRenderDescription {
  (
    {
      children
    }: {
      children: any
    }
  ): any
}

interface onRetrieve {
  (id: string): REST.Component | undefined
}

export function Declaration(
  {
    declaration: d,
    // onHighlightSignature: SignatureHighlight,
    onHighlightSyntax: SyntaxHighlight,
    onRenderDescription: Description,
    onRetrieve: retrieve
  }: DeclarationParameters
): JSX.Element {
  return (
    <Retrieve.Provider value={{ stack: [], retrieve }}>
      <h1>{d.title}</h1>
      <pre><code>{d.endpoint}</code></pre>
      <h2>Description</h2>
      <Description>{d.description}</Description>
      {d.headerParameters !== undefined && (
        <>
          <h2>Headers</h2>
          <Properties properties={d.headerParameters} />
        </>
      )}
      {d.pathParameters !== undefined && (
        <>
          <h2>Path Parameters</h2>
          <Properties properties={d.pathParameters} />
        </>
      )}
      {d.queryParameters !== undefined && (
        <>
          <h2>Query Parameters</h2>
          <Properties properties={d.queryParameters} />
        </>
      )}
      {d.bodyParameters !== undefined && (
        <>
          <h2>Body Parameters</h2>
          <Value value={d.bodyParameters} />
        </>
      )}
      {d.examples !== undefined && (
        <>
          <h2>Request Examples</h2>
          <CodeListing
            groups={d.examples.map((e) => [
              (() => {
                switch (e.syntax) {
                case "http":
                  return "HTTP"
                case "shell":
                  return "cURL"
                default:
                  return e.syntax
                }
              })(),
              <SyntaxHighlight syntax={e.syntax}>{e.code}</SyntaxHighlight>
            ])}
          />
        </>
      )}
      {d.responses !== undefined && (
        <>
          <h2>Responses</h2>
          {d.responses.map((r) => (
            <Response key={r.status} response={r} />
          ))}
        </>
      )}
    </Retrieve.Provider>
  )
}

interface ResponseParameters {
  response: REST.Response
}

function Response(
  {
    response: r,
  }: ResponseParameters
): JSX.Element | null {
  if ("id" in r) {
    const retriever = useContext(Retrieve)
    if (retriever.stack.includes(r.id)) {
      return null
    }
    retriever.stack.push(r.id)
    const d = retriever.retrieve(r.id)
    if (d === undefined) {
      console.error(`unable to retrieve reference: ${r.id}`)
      return null
    }
    switch (true) {
    case "status" in d:
      return (
        <>
          <Response response={d} />
          <Callback cb={() => retriever.stack.pop()} />
        </>
      )
    default:
      console.error("unknown reference type")
      return null
    }
  }
  return (
    <>
      <h3>{ResponseHeading({ status: r.status })}</h3>
      {r.description !== undefined && (
        <p>{r.description}</p>
      )}
      {r.body !== undefined && (
        <Value value={r.body} />
      )}
    </>
  )
}

interface ResponseHeadingParameters {
  status: number
}

function ResponseHeading(
  {
    status
  }: ResponseHeadingParameters
): string {
  return `${status}`
  // const s = statuses[status]
  // if (s === undefined) {
  //   return `${status}`
  // }
  // return `${status} ${s}`
}

interface ValueParameters {
  value: REST.Value
}

function Value(
  {
    value: v
  }: ValueParameters
): JSX.Element | null {
  if ("id" in v) {
    const r = useContext(Retrieve)
    if (r.stack.includes(v.id)) {
      return null
    }
    r.stack.push(v.id)
    const d = r.retrieve(v.id)
    if (d === undefined) {
      console.error(`unable to retrieve reference: ${v.id}`)
      return null
    }
    switch (true) {
    case "id" in d:
    case "type" in d:
      return (
        <>
          <Value value={d} />
          <Callback cb={() => r.stack.pop()} />
        </>
      )
    default:
      console.error("unknown reference type")
      return null
    }
  }

  switch (v.type) {
  case "array":
    return (
      <>
        <ValueDescription value={v} />
        {v.items !== undefined && (
          <Value value={v.items} />
        )}
      </>
    )

  case "object":
    return (
      <>
        <ValueDescription value={v} />
        {v.properties !== undefined && (
          <Properties properties={v.properties} />
        )}
      </>
    )

  case "boolean":
  case "integer":
  case "number":
  case "string":
  case "unknown":
    return <ValueDescription value={v} />
  }
}

interface PropertiesParameters {
  properties: REST.Property[]
}

function Properties(
  {
    properties: l,
  }: PropertiesParameters
): JSX.Element {
  return (
    <dl>
      {l.map((p) => (
        <Property key={p} property={p} />
      ))}
    </dl>
  )
}

interface PropertyParameters {
  property: REST.Property
}

function Property(
  {
    property: p,
  }: PropertyParameters
): JSX.Element | null {
  if ("id" in p) {
    const r = useContext(Retrieve)
    if (r.stack.includes(p.id)) {
      return null
    }
    r.stack.push(p.id)
    const d = r.retrieve(p.id)
    if (d === undefined) {
      console.error(`unable to retrieve reference: ${p.id}`)
      return null
    }
    switch (true) {
    case "id" in d:
    case "type" in d:
      p = {
        identifier: p.identifier,
        ...d
      }
      return (
        <>
          <Property property={p} />
          <Callback cb={() => r.stack.pop()} />
        </>
      )
    default:
      console.error("unknown reference type")
      return null
    }
  }
  return (
    <>
      <PropertyTerm property={p} />
      <PropertyDescription property={p} />
    </>
  )
}

interface PropertyTermParameters {
  property: REST.Property
}

function PropertyTerm(
  {
    property: p
  }: PropertyTermParameters
): JSX.Element {
  return (
    <dt>
      <code>{p.identifier}</code> <TypeBadge type={p} /> <ValueBadge value={p} />
    </dt>
  )
}

interface PropertyDescriptionParameters {
  property: REST.Property
}

function PropertyDescription(
  {
    property: p
  }: PropertyDescriptionParameters
): JSX.Element | null {
  if ("id" in p) {
    const r = useContext(Retrieve)
    if (r.stack.includes(p.id)) {
      return null
    }
    r.stack.push(p.id)
    const d = r.retrieve(p.id)
    if (d === undefined) {
      console.error(`unable to retrieve reference: ${p.id}`)
      return null
    }
    switch (true) {
    case "id" in d:
    case "type" in d:
      p = {
        identifier: p.identifier,
        ...d
      }
      return (
        <>
          <PropertyDescription property={p} />
          <Callback cb={() => r.stack.pop()} />
        </>
      )
    default:
      console.error("unknown reference type")
      return null
    }
  }

  switch (p.type) {
  case "array":
    if (p.items === undefined) {
      return <></>
    }
    p = {
      identifier: p.identifier,
      ...p.items
    }
    return <PropertyDescription property={p} />

  case "object":
    return (
      <dd>
        <ValueDescription value={p} />
        <TypeDescription type={p} />
        {p.properties !== undefined && (
          <details>
            <summary>Properties of <code>{p.identifier}</code></summary>
            <Properties properties={p.properties} />
          </details>
        )}
      </dd>
    )

  case "boolean":
  case "integer":
  case "number":
  case "string":
  case "unknown":
    return (
      <dd>
        <ValueDescription value={p} />
        <TypeDescription type={p} />
      </dd>
    )

  default:
    console.error("unknown parameter type")
    return null
  }
}

interface ValueBadgeParameters {
  value: REST.ValueNode
}

function ValueBadge(
  {
    value
  }: ValueBadgeParameters
): JSX.Element | null {
  if (value.required !== true) {
    return null
  }
  return <Badge variant="danger">required</Badge>
}

interface ValueDescriptionParameters {
  value: REST.Value
}

function ValueDescription(
  {
    value: v
  }: ValueDescriptionParameters
): JSX.Element | null {
  if (v.description === undefined) {
    return null
  }
  return <p>{v.description}</p>
}

interface TypeBadgeParameters {
  type: REST.Type
}

function TypeBadge(
  {
    type: t
  }: TypeBadgeParameters
): JSX.Element | null {
  const r = useContext(Retrieve)
  const s = resolve(t)
  if (s === "") {
    return null
  }
  return <Badge>{s}</Badge>

  function resolve(t: REST.Type): string {
    if ("id" in t) {
      const d = r.retrieve(t.id)
      if (d === undefined) {
        console.error(`unable to retrieve reference: ${t.id}`)
        return ""
      }
      if (!("type" in d)) {
        console.error(`reference does not have a type: ${t.id}`)
        return ""
      }
      return resolve(d)
    }

    let s = t.type

    switch (t.type) {
    case "array":
      if (t.items === undefined) {
        break
      }
      // todo: array of strings not array of string.
      s += ` of ${resolve(t.items)}`
      break
    case "boolean":
    case "integer":
    case "number":
    case "object":
    case "string":
    case "unknown":
      break
    default:
      console.error("unknown parameter type")
      return ""
    }

    return s
  }
}

interface TypeDescriptionParameters {
  type: REST.Type
}

function TypeDescription(
  {
    type: t
  }: TypeDescriptionParameters
): JSX.Element | null {
  if ("id" in t) {
    const r = useContext(Retrieve)
    const d = r.retrieve(t.id)
    if (d === undefined) {
      console.error(`unable to retrieve reference: ${t.id}`)
      return null
    }
    if (!("type" in d)) {
      console.error(`reference does not have a type: ${t.id}`)
      return null
    }
    return <TypeDescription type={d} />
  }

  const d = []

  // if (t.format !== undefined) {
  //   d.push(`Format: ${t.format}.`)
  // }

  if (t.cases !== undefined) {
    d.push(
      <>
        Can be one of: {t.cases
          .map((c, i) => {
            const e = <code>{c}</code>
            if (t.cases !== undefined && i !== t.cases?.length - 1) {
              return <>{e}, </>
            }
            return <>{e}.</>
          })}
      </>
    )
  }

  if (d.length === 0) {
    return null
  }
  return <p>{d}</p>
}
