import type { REST } from "@onlyoffice/documentation-declarations-types/rest.ts"
import { Badge } from "@onlyoffice/documentation-ui-badge"
import { CodeListing } from "@onlyoffice/documentation-ui-code-listing"
import type { JSX } from "preact"
import { Fragment, h } from "preact"

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

export interface DeclarationParameters {
  declaration: REST.Request
  onHighlightSyntax: onHighlightSyntax
  onRenderDescription: onRenderDescription
  onRetrieve: onRetrieve
}

export function Declaration(
  {
    declaration: d,
    onRenderDescription: Description,
    onRetrieve: retrieve
  }: DeclarationParameters
): JSX.Element {
  return (
    <>
      <h1>{d.title}</h1>
      <pre><code>{d.endpoint}</code></pre>
      <h2>Description</h2>
      <Description>{d.description}</Description>
      {d.headerParameters !== undefined && (
        <>
          <h2>Headers</h2>
          <Properties
            properties={d.headerParameters}
            onRetrieve={retrieve}
          />
        </>
      )}
      {d.pathParameters !== undefined && (
        <>
          <h2>Path Parameters</h2>
          <Properties
            properties={d.pathParameters}
            onRetrieve={retrieve}
          />
        </>
      )}
      {d.queryParameters !== undefined && (
        <>
          <h2>Query Parameters</h2>
          <Properties
            properties={d.queryParameters}
            onRetrieve={retrieve}
          />
        </>
      )}
      {/* {d.bodyParameters !== undefined && (
        <>
          <h2>Body Parameters</h2>
        </>
        // <Properties
        //   properties={d.bodyParameters}
        //   onRetrieve={retrieve}
        // />
      )} */}
      {d.examples !== undefined && (
        <>
          <h2>Request Examples</h2>
          {/* <CodeListing
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
          /> */}
        </>
      )}
      {/* {d.responses !== undefined && (
        <>
          <h2>Responses</h2>
          {d.responses.map((r) => (
            <>
              <h3>Response Status of {r.status}</h3>
              {r.description !== undefined && (
                <p>{r.description}</p>
              )}
              <Parameters
                parameters={[{ ...r, identifier: r.contentType }]}
                onRetrieve={retrieve}
              />
            </>
          ))}
        </>
      )} */}
    </>
  )
}

interface ValueProperties {
  value: REST.Value
  onRetrieve: onRetrieve
}

function Value(
  {
    value: v,
    onRetrieve: retrieve
  }: ValueProperties
): JSX.Element {
  if ("id" in v) {
    const d = retrieve(v.id)
    if (d === undefined) {
      throw new Error(`unable to retrieve reference: ${v.id}`)
    }
    // switch (true) {
    // case "id" in d:
    // case "type" in d:
    //   v = {
    //     identifier: v.identifier,
    //     ...d
    //   }
    //   return (
    //     <Value
    //       value={v}
    //       onRetrieve={retrieve}
    //     />
    //   )
    // default:
    //   throw new Error("unknown reference type")
    // }
    return <></>
  }

  switch (v.type) {
  case "array":
    return (
      <>
        {v.description !== undefined && (
          <p>{v.description}</p>
        )}
        {/* {v.items !== undefined && (
          <Value
            value={v.items}
            onRetrieve={retrieve}
          />
        )} */}
      </>
    )

  case "object":
    return (
      <>
        {v.description !== undefined && (
          <p>{v.description}</p>
        )}
        {v.properties !== undefined && (
          <Properties
            properties={v.properties}
            onRetrieve={retrieve}
          />
        )}
      </>
    )

  case "boolean":
  case "integer":
  case "number":
  case "string":
  case "unknown":
    if (v.description === undefined) {
      return <></>
    }
    return (
      <p>{v.description}</p>
    )
  }
}

interface PropertiesProperties {
  properties: REST.Property[]
  onRetrieve: onRetrieve
}

function Properties(
  {
    properties: l,
    onRetrieve: retrieve
  }: PropertiesProperties
): JSX.Element {
  return (
    <dl>
      {l.map((p) => (
        <Property
          property={p}
          onRetrieve={retrieve}
        />
      ))}
    </dl>
  )
}

interface PropertyProperties {
  property: REST.Property
  onRetrieve: onRetrieve
}

function Property(
  {
    property: p,
    onRetrieve: retrieve
  }: PropertyProperties
): JSX.Element {
  if ("id" in p) {
    const d = retrieve(p.id)
    if (d === undefined) {
      throw new Error(`unable to retrieve reference: ${p.id}`)
    }
    switch (true) {
    case "id" in d:
    case "type" in d:
      p = {
        identifier: p.identifier,
        ...d
      }
      return (
        <Property
          property={p}
          onRetrieve={retrieve}
        />
      )
    default:
      throw new Error("unknown reference type")
    }
  }
  return (
    <>
      <PropertyTerm
        property={p}
        onRetrieve={retrieve}
      />
      <PropertyDescription
        property={p}
        onRetrieve={retrieve}
      />
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
      <code>{p.identifier}</code> <TypeBadge type={p} onRetrieve={retrieve} /> <RequiredBadge value={p} />
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
): JSX.Element {
  if ("id" in p) {
    const d = retrieve(p.id)
    if (d === undefined) {
      throw new Error(`unable to retrieve reference: ${p.id}`)
    }
    switch (true) {
    case "id" in d:
    case "type" in d:
      p = {
        identifier: p.identifier,
        ...d
      }
      return (
        <PropertyDescription
          property={p}
          onRetrieve={retrieve}
        />
      )
    default:
      throw new Error("unknown reference type")
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
        {p.description !== undefined && (
          <p>{p.description}</p>
        )}
        <p>
          <TypeDescription
            type={p}
            onRetrieve={retrieve}
          />
        </p>
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
        {p.description !== undefined && (
          <p>{p.description}</p>
        )}
        <p>
          <TypeDescription
            type={p}
            onRetrieve={retrieve}
          />
        </p>
      </dd>
    )

  default:
    throw new Error("unknown parameter type")
  }
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
): JSX.Element {
  const s = resolve(t)
  if (s === "") {
    return <></>
  }
  return <Badge>{s}</Badge>

  function resolve(t: REST.Type): string {
    if ("id" in t) {
      const d = retrieve(t.id)
      if (d === undefined) {
        throw new Error(`unable to retrieve reference: ${t.id}`)
      }
      if (!("type" in d)) {
        throw new Error(`reference does not have a type: ${t.id}`)
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
      throw new Error("unknown parameter type")
    }

    return s
  }
}

interface RequiredBadgeParameters {
  value: REST.ValueNode
}

function RequiredBadge(
  {
    value
  }: RequiredBadgeParameters
): JSX.Element {
  if (value.required !== true) {
    return <></>
  }
  return <Badge variant="danger">required</Badge>
}

// Can be one of: 1, 2.

interface TypeDescriptionParameters {
  type: REST.Type
  onRetrieve: onRetrieve
}

function TypeDescription(
  {
    type: t,
    onRetrieve: retrieve
  }: TypeDescriptionParameters
): JSX.Element {
  if ("id" in t) {
    const d = retrieve(t.id)
    if (d === undefined) {
      throw new Error(`unable to retrieve reference: ${t.id}`)
    }
    if (!("type" in d)) {
      throw new Error(`reference does not have a type: ${t.id}`)
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

  return <>{d}</>
}
