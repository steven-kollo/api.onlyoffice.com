import type { REST } from "@onlyoffice/documentation-declarations-types/rest.ts"
import { Badge, CodeListing } from "@onlyoffice/documentation-ui-kit"
import { useContext } from "preact/hooks"
import type { JSX } from "preact"
import { Fragment, createContext, h } from "preact"
import { Callback } from "../callback/callback.ts"

interface RetrieverContext {
  stack: string[]
}

const Retriever = createContext<RetrieverContext>({ stack: [] })

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
    <Retriever.Provider value={{ stack: [] }}>
      <h1>{d.title}</h1>
      <pre><code>{d.endpoint}</code></pre>
      <h2>Description</h2>
      <Description>{d.description}</Description>
      {d.headerParameters !== undefined && (
        <>
          <h2>Headers</h2>
          <Properties properties={d.headerParameters} onRetrieve={retrieve} />
        </>
      )}
      {d.pathParameters !== undefined && (
        <>
          <h2>Path Parameters</h2>
          <Properties properties={d.pathParameters} onRetrieve={retrieve} />
        </>
      )}
      {d.queryParameters !== undefined && (
        <>
          <h2>Query Parameters</h2>
          <Properties properties={d.queryParameters} onRetrieve={retrieve} />
        </>
      )}
      {d.bodyParameters !== undefined && (
        <>
          <h2>Body Parameters</h2>
          <Value value={d.bodyParameters} onRetrieve={retrieve} />
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
            <Response key={r.status} response={r} onRetrieve={retrieve} />
          ))}
        </>
      )}
    </Retriever.Provider>
  )
}

interface ResponseParameters {
  response: REST.Response
  onRetrieve: onRetrieve
}

function Response(
  {
    response: r,
    onRetrieve: retrieve
  }: ResponseParameters
): JSX.Element | null {
  if ("id" in r) {
    const retriever = useContext(Retriever)
    if (retriever.stack.includes(r.id)) {
      return null
    }
    retriever.stack.push(r.id)
    const d = retrieve(r.id)
    if (d === undefined) {
      console.error(`unable to retrieve reference: ${r.id}`)
      return null
    }
    switch (true) {
    case "status" in d:
      return (
        <>
          <Response response={d} onRetrieve={retrieve} />
          <Callback cb={() => {
            retriever.stack.pop()
          }} />
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
        <Value value={r.body} onRetrieve={retrieve} />
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
  onRetrieve: onRetrieve
}

function Value(
  {
    value: v,
    onRetrieve: retrieve
  }: ValueParameters
): JSX.Element | null {
  if ("id" in v) {
    const retriever = useContext(Retriever)
    if (retriever.stack.includes(v.id)) {
      return null
    }
    retriever.stack.push(v.id)
    const d = retrieve(v.id)
    if (d === undefined) {
      console.error(`unable to retrieve reference: ${v.id}`)
      return null
    }
    switch (true) {
    case "id" in d:
    case "type" in d:
      return (
        <>
          <Value value={d} onRetrieve={retrieve} />
          <Callback cb={() => {
            retriever.stack.pop()
          }} />
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
          <Value value={v.items} onRetrieve={retrieve} />
        )}
      </>
    )

  case "object":
    return (
      <>
        <ValueDescription value={v} />
        {v.properties !== undefined && (
          <Properties properties={v.properties} onRetrieve={retrieve} />
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
  onRetrieve: onRetrieve
}

function Properties(
  {
    properties: l,
    onRetrieve: retrieve
  }: PropertiesParameters
): JSX.Element {
  return (
    <dl>
      {l.map((p) => (
        <Property
          key={p}
          property={p}
          onRetrieve={retrieve}
        />
      ))}
    </dl>
  )
}

interface PropertyParameters {
  property: REST.Property
  onRetrieve: onRetrieve
}

function Property(
  {
    property: p,
    onRetrieve: retrieve
  }: PropertyParameters
): JSX.Element | null {
  if ("id" in p) {
    const retriever = useContext(Retriever)
    if (retriever.stack.includes(p.id)) {
      return null
    }
    retriever.stack.push(p.id)
    const d = retrieve(p.id)
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
          <Property property={p} onRetrieve={retrieve} />
          <Callback cb={() => {
            retriever.stack.pop()
          }} />
        </>
      )
    default:
      console.error("unknown reference type")
      return null
    }
  }
  return (
    <>
      <PropertyTerm property={p} onRetrieve={retrieve} />
      <PropertyDescription property={p} onRetrieve={retrieve} />
    </>
  )
}

interface PropertyTermParameters {
  property: REST.Property
  onRetrieve: onRetrieve
}

function PropertyTerm(
  {
    property: p,
    onRetrieve: retrieve
  }: PropertyTermParameters
): JSX.Element {
  return (
    <dt>
      <code>{p.identifier}</code> <TypeBadge type={p} onRetrieve={retrieve} /> <ValueBadge value={p} />
    </dt>
  )
}

interface PropertyDescriptionParameters {
  property: REST.Property
  onRetrieve: onRetrieve
}

function PropertyDescription(
  {
    property: p,
    onRetrieve: retrieve
  }: PropertyDescriptionParameters
): JSX.Element | null {
  if ("id" in p) {
    const retriever = useContext(Retriever)
    if (retriever.stack.includes(p.id)) {
      return null
    }
    retriever.stack.push(p.id)
    const d = retrieve(p.id)
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
          <PropertyDescription property={p} onRetrieve={retrieve} />
          <Callback cb={() => {
            retriever.stack.pop()
          }} />
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
    return (
      <PropertyDescription
        property={p}
        onRetrieve={retrieve}
      />
    )

  case "object":
    return (
      <dd>
        <ValueDescription value={p} />
        <TypeDescription type={p} onRetrieve={retrieve} />
        {p.properties !== undefined && (
          <details>
            <summary>Properties of <code>{p.identifier}</code></summary>
            <Properties
              properties={p.properties}
              onRetrieve={retrieve}
            />
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
        <TypeDescription type={p} onRetrieve={retrieve} />
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
  onRetrieve: onRetrieve
}

function TypeBadge(
  {
    type: t,
    onRetrieve: retrieve
  }: TypeBadgeParameters
): JSX.Element | null {
  const s = resolve(t)
  if (s === "") {
    return null
  }
  return <Badge>{s}</Badge>

  function resolve(t: REST.Type): string {
    if ("id" in t) {
      const d = retrieve(t.id)
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
  onRetrieve: onRetrieve
}

function TypeDescription(
  {
    type: t,
    onRetrieve: retrieve
  }: TypeDescriptionParameters
): JSX.Element | null {
  if ("id" in t) {
    const d = retrieve(t.id)
    if (d === undefined) {
      console.error(`unable to retrieve reference: ${t.id}`)
      return null
    }
    if (!("type" in d)) {
      console.error(`reference does not have a type: ${t.id}`)
      return null
    }
    return (
      <TypeDescription
        type={d}
        onRetrieve={retrieve}
      />
    )
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
