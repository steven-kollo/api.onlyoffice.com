import { Content } from "@onlyoffice/documentation-ui-kit-js"
import { SyntaxHighlight } from "@/src/components/syntax-highlight/SyntaxHighlight.tsx"
import { Fragment, JSX, h } from "preact"

import {
  RESTArrayParameter,
  RESTArrayProperty,
  RESTBooleanParameter,
  RESTBooleanProperty,
  RESTContent,
  RESTIntegerParameter,
  RESTIntegerProperty,
  RESTNumberParameter,
  RESTNumberProperty,
  RESTObjectParameter,
  RESTObjectProperty,
  RESTObjectType,
  RESTParameter,
  RESTPath,
  RESTProperty,
  RESTReferenceParameter,
  RESTReferenceProperty,
  RESTStringParameter,
  RESTStringProperty,
  RESTType,
  RESTUnknownParameter,
  RESTUnknownProperty
} from "@/../../declarations/rest.d.ts"

// function isFragment(n: any): boolean {
//   return n?.type === Fragment
// }

export interface RESTDeclarationParameters {
  declaration: RESTPath
  onRetrieve(id: string): RESTType | undefined
}

export function RESTDeclaration(
  {
    declaration: d,
    onRetrieve: retrieve
  }: RESTDeclarationParameters
): JSX.Element {
  const sections: { title: string, parameters: RESTParameter[] }[] = []
  if (d.queryParameters !== undefined) {
    sections.push({
      title: "Query Parameters",
      parameters: d.queryParameters
    })
  }
  if (d.pathParameters !== undefined) {
    sections.push({
      title: "Path Parameters",
      parameters: d.pathParameters
    })
  }
  if (d.bodyParameters !== undefined) {
    // todo: huh?
    sections.push({
      title: "Body Parameters",
      parameters: d.bodyParameters.map((c) => {
        return {
          ...c,
          identifier: c.contentType
        }
      })
    })
  }

  return (
    <Content>
      <h1>{d.title}</h1>
      <pre><code>{d.endpoint}</code></pre>
      <h2>Description</h2>
      <p>{d.description}</p>
      {(
        d.queryParameters !== undefined ||
        d.pathParameters !== undefined ||
        d.bodyParameters !== undefined
      ) && (
        <>
          <h2>Request</h2>
          {sections.map((s) => (
            <>
              <h3>{s.title}</h3>
              <Parameters
                parameters={s.parameters}
                onRetrieve={retrieve}
              />
            </>
          ))}
        </>
      )}
      {d.examples !== undefined && (
        <>
          <h2>Examples</h2>
          {d.examples.map((e) => (
            // todo: use tabs
            <pre><code><SyntaxHighlight syntax={e.syntax}>{e.code}</SyntaxHighlight></code></pre>
          ))}
        </>
      )}
      {d.responses !== undefined && (
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
      )}
    </Content>
  )
}

interface RetrieverProperties {
  object: RESTObjectType
  onRetrieve(id: string): RESTType | undefined
  children(...a: any[]): any
}

function Retriever(
  {
    object,
    onRetrieve: retrieve,
    children
  }: RetrieverProperties
) {
  // todo: something needs to be done about this...
  const s: string[] = []

  const rs: Set<number> = new Set()
  let x = -1
  let y = -1

  process(object)
  return children({ retrieve: proxy, retrieve2: proxy2 })

  function process(t: RESTType) {
    switch (t.type) {
    case "array":
      process(t.items)
      break
    case "boolean":
    case "integer":
    case "number":
      break
    case "object":
      t.properties.forEach(process)
      break
    case "reference":
      y += 1
      if (s.includes(t.id)) {
        rs.add(y)
        break
      }
      s.push(t.id)
      const r = retrieve(t.id)
      if (r === undefined) {
        throw new Error(`unable to retrieve reference: ${t.id}`)
      }
      process(r)
      s.pop()
      break
    case "string":
    case "unknown":
      break
    }
  }

  function proxy(id: string): RESTType | undefined {
    x += 1
    if (rs.has(x)) {
      return {
        type: "unknown"
      }
    }
    return retrieve(id)
  }

  function proxy2(id: string): RESTType | undefined {
    if (rs.has(x)) {
      return {
        type: "unknown"
      }
    }
    return retrieve(id)
  }
}

interface ParametersProperties {
  parameters: RESTParameter[]
  onRetrieve(id: string): RESTType | undefined
}

function Parameters(
  {
    parameters: ps,
    onRetrieve: retrieve
  }: ParametersProperties
): JSX.Element {
  const o: RESTObjectType = {
    type: "object",
    properties: ps
  }
  return (
    <Retriever object={o} onRetrieve={retrieve}>
      {({ retrieve, retrieve2 }) => (
        <dl>
          {ps.map((p) => (
            <Parameter
              parameter={p}
              onRetrieve={retrieve}
              onRetrieve2={retrieve2}
            />
          ))}
        </dl>
      )}
    </Retriever>
  )
}

interface ParameterParameters {
  parameter: RESTParameter
  onRetrieve(id: string): RESTType | undefined
  onRetrieve2(id: string): RESTType | undefined
}

function Parameter(
  {
    parameter: p,
    onRetrieve: retrieve,
    onRetrieve2: retrieve2
  }: ParameterParameters
): JSX.Element {
  switch (p.type) {
  case "array":
    return <ArrayParameter parameter={p} onRetrieve={retrieve} onRetrieve2={retrieve2} />
  case "boolean":
    return <BooleanParameter parameter={p} />
  case "integer":
    return <IntegerParameter parameter={p} />
  case "number":
    return <NumberParameter parameter={p} />
  case "object":
    return <ObjectParameter parameter={p} onRetrieve={retrieve} onRetrieve2={retrieve2} />
  case "reference":
    return <ReferenceParameter parameter={p} onRetrieve={retrieve} onRetrieve2={retrieve2} />
  case "string":
    return <StringParameter parameter={p} />
  case "unknown":
    return <UnknownParameter parameter={p} />
  default:
    throw new Error("unknown parameter type")
  }
}

interface ArrayParameterParameters {
  parameter: RESTArrayParameter
  onRetrieve(id: string): RESTType | undefined
  onRetrieve2(id: string): RESTType | undefined
}

function ArrayParameter(
  {
    parameter: p,
    onRetrieve: retrieve,
    onRetrieve2: retrieve2
  }: ArrayParameterParameters
): JSX.Element {
  return (
    <>
      <dt><code>{p.identifier}</code> <code>array {of(p.items)}</code></dt>
      <Description type={p.items} />
    </>
  )

  function of(t: RESTType): string {
    let s = ""
    switch (t.type) {
    case "array":
      s += "of arrays "
      s += of(t.items)
      break
    case "boolean":
      s += "of booleans"
      break
    case "integer":
      s += "of integers"
      break
    case "number":
      s += "of numbers"
      break
    case "object":
      s += "of objects"
      break
    case "reference":
      const d = retrieve2(t.id)
      if (d === undefined) {
        throw new Error(`unable to retrieve reference: ${t.id}`)
      }
      s += of(d)
      break
    case "string":
      s += "of strings"
      break
    case "unknown":
      s += "of unknowns"
      break
    default:
      throw new Error("unknown parameter type")
    }
    return s
  }

  function Description({ type: t }: { type: RESTType }): JSX.Element {
    switch (t.type) {
    case "array":
      return <Description type={t.items} />
    case "boolean":
      return <>{p.description !== undefined && (<dd><p>{p.description}</p></dd>)}</>
    case "integer":
      return <>{p.description !== undefined && (<dd><p>{p.description}</p></dd>)}</>
    case "number":
      return <>{p.description !== undefined && (<dd><p>{p.description}</p></dd>)}</>
    case "object":
      return (
        <dd>
          {p.description !== undefined && (
            <p>{p.description}</p>
          )}
          <details>
            <summary>Properties of <code>{p.identifier}</code></summary>
            <Properties
              properties={t.properties}
              onRetrieve={retrieve}
              onRetrieve2={retrieve2}
            />
          </details>
        </dd>
      )
    case "reference":
      const d = retrieve(t.id)
      if (d === undefined) {
        throw new Error(`unable to retrieve reference: ${t.id}`)
      }
      return <Description type={d} />
    case "string":
      return <>{p.description !== undefined && (<dd><p>{p.description}</p></dd>)}</>
    case "unknown":
      return <>{p.description !== undefined && (<dd><p>{p.description}</p></dd>)}</>
    default:
      throw new Error("unknown parameter type")
    }
  }
}

interface BooleanParameterParameters {
  parameter: RESTBooleanParameter
}

function BooleanParameter({ parameter: p }: BooleanParameterParameters): JSX.Element {
  return (
    <>
      <dt><code>{p.identifier}</code> <code>boolean</code></dt>
      {p.description !== undefined && (
        <dd>
          <p>{p.description}</p>
        </dd>
      )}
    </>
  )
}

interface IntegerParameterParameters {
  parameter: RESTIntegerParameter
}

function IntegerParameter({ parameter: p }: IntegerParameterParameters): JSX.Element {
  return (
    <>
      <dt><code>{p.identifier}</code> <code>integer</code></dt>
      {p.description !== undefined && (
        <dd>
          <p>{p.description}</p>
        </dd>
      )}
    </>
  )
}

interface NumberParameterParameters {
  parameter: RESTNumberParameter
}

function NumberParameter({ parameter: p }: NumberParameterParameters): JSX.Element {
  return (
    <>
      <dt><code>{p.identifier}</code> <code>number</code></dt>
      {p.description !== undefined && (
        <dd>
          <p>{p.description}</p>
        </dd>
      )}
    </>
  )
}

interface ObjectParameterParameters {
  parameter: RESTObjectParameter
  onRetrieve(id: string): RESTType | undefined
  onRetrieve2(id: string): RESTType | undefined
}

function ObjectParameter(
  {
    parameter: p,
    onRetrieve: retrieve,
    onRetrieve2: retrieve2
  }: ObjectParameterParameters
): JSX.Element {
  return (
    <>
      <dt><code>{p.identifier}</code> <code>object</code></dt>
      <dd>
        {p.description !== undefined && (
          <p>{p.description}</p>
        )}
        <details>
          <summary>Properties of <code>{p.identifier}</code></summary>
          <Properties
            properties={p.properties}
            onRetrieve={retrieve}
            onRetrieve2={retrieve2}
          />
        </details>
      </dd>
    </>
  )
}

interface ReferenceParameterParameters {
  parameter: RESTReferenceParameter
  onRetrieve(id: string): RESTType | undefined
  onRetrieve2(id: string): RESTType | undefined
}

function ReferenceParameter(
  {
    parameter: p,
    onRetrieve: retrieve,
    onRetrieve2: retrieve2
  }: ReferenceParameterParameters
): JSX.Element {
  const d = retrieve(p.id)
  if (d === undefined) {
    throw new Error(`unable to retrieve reference: ${p.id}`)
  }
  const r: RESTParameter = { ...p, ...d }
  return (
    <Parameter
      parameter={r}
      onRetrieve={retrieve}
      onRetrieve2={retrieve2}
    />
  )
}

interface StringParameterParameters {
  parameter: RESTStringParameter
}

function StringParameter({ parameter: p }: StringParameterParameters): JSX.Element {
  return (
    <>
      <dt><code>{p.identifier}</code> <code>string</code></dt>
      {p.description !== undefined && (
        <dd>
          <p>{p.description}</p>
        </dd>
      )}
    </>
  )
}

interface UnknownParameterParameters {
  parameter: RESTUnknownParameter
}

function UnknownParameter({ parameter: p }: UnknownParameterParameters): JSX.Element {
  return (
    <>
      <dt><code>{p.identifier}</code> <code>unknown</code></dt>
      {p.description !== undefined && (
        <dd>
          <p>{p.description}</p>
        </dd>
      )}
    </>
  )
}

interface PropertiesProperties {
  properties: RESTProperty[]
  onRetrieve(id: string): RESTType | undefined
  onRetrieve2(id: string): RESTType | undefined
}

function Properties(
  {
    properties: ps,
    onRetrieve: retrieve,
    onRetrieve2: retrieve2
  }: PropertiesProperties
): JSX.Element {
  return (
    <dl>
      {ps.map((p) => (
        <Property
          property={p}
          onRetrieve={retrieve}
          onRetrieve2={retrieve2}
        />
      ))}
    </dl>
  )
}

interface PropertyProperties {
  property: RESTProperty
  onRetrieve(id: string): RESTType | undefined
  onRetrieve2(id: string): RESTType | undefined
}

function Property(
  {
    property: p,
    onRetrieve: retrieve,
    onRetrieve2: retrieve2
  }: PropertyProperties
): JSX.Element {
  switch (p.type) {
  case "array":
    return <ArrayProperty property={p} onRetrieve={retrieve} onRetrieve2={retrieve2} />
  case "boolean":
    return <BooleanProperty property={p} />
  case "integer":
    return <IntegerProperty property={p} />
  case "number":
    return <NumberProperty property={p} />
  case "object":
    return <ObjectProperty property={p} onRetrieve={retrieve} onRetrieve2={retrieve2} />
  case "reference":
    return <ReferenceProperty property={p} onRetrieve={retrieve} onRetrieve2={retrieve2} />
  case "string":
    return <StringProperty property={p} />
  case "unknown":
    return <UnknownProperty property={p} />
  default:
    throw new Error("unknown property type")
  }
}

interface ArrayPropertyParameters {
  property: RESTArrayProperty
  onRetrieve(id: string): RESTType | undefined
  onRetrieve2(id: string): RESTType | undefined
}

function ArrayProperty(
  {
    property: p,
    onRetrieve: retrieve,
    onRetrieve2: retrieve2
  }: ArrayPropertyParameters
): JSX.Element {
  return (
    <>
      <dt><code>{p.identifier}</code> <code>array {of(p.items)}</code></dt>
      <Description type={p.items} />
    </>
  )

  function of(t: RESTType): string {
    let s = ""
    switch (t.type) {
    case "array":
      s += "of arrays "
      s += of(t.items)
      break
    case "boolean":
      s += "of booleans"
      break
    case "integer":
      s += "of integers"
      break
    case "number":
      s += "of numbers"
      break
    case "object":
      s += "of objects"
      break
    case "reference":
      const d = retrieve2(t.id)
      if (d === undefined) {
        throw new Error(`unable to retrieve reference: ${t.id}`)
      }
      s += of(d)
      break
    case "string":
      s += "of strings"
      break
    case "unknown":
      s += "of unknowns"
      break
    default:
      throw new Error("unknown parameter type")
    }
    return s
  }

  function Description({ type: t }: { type: RESTType }): JSX.Element {
    switch (t.type) {
    case "array":
      return <Description type={t.items} />
    case "boolean":
      return <>{p.description !== undefined && (<dd><p>{p.description}</p></dd>)}</>
    case "integer":
      return <>{p.description !== undefined && (<dd><p>{p.description}</p></dd>)}</>
    case "number":
      return <>{p.description !== undefined && (<dd><p>{p.description}</p></dd>)}</>
    case "object":
      return (
        <dd>
          {p.description !== undefined && (
            <p>{p.description}</p>
          )}
          <details>
            <summary>Properties of <code>{p.identifier}</code></summary>
            <Properties
              properties={t.properties}
              onRetrieve={retrieve}
              onRetrieve2={retrieve2}
            />
          </details>
        </dd>
      )
    case "reference":
      const d = retrieve(t.id)
      if (d === undefined) {
        throw new Error(`unable to retrieve reference: ${t.id}`)
      }
      return <Description type={d} />
    case "string":
      return <>{p.description !== undefined && (<dd><p>{p.description}</p></dd>)}</>
    case "unknown":
      return <>{p.description !== undefined && (<dd><p>{p.description}</p></dd>)}</>
    default:
      throw new Error("unknown parameter type")
    }
  }
}

interface BooleanPropertyParameters {
  property: RESTBooleanProperty
}

function BooleanProperty({ property: p }: BooleanPropertyParameters): JSX.Element {
  return (
    <>
      <dt><code>{p.identifier}</code> <code>boolean</code></dt>
      {p.description !== undefined && (
        <dd>
          <p>{p.description}</p>
        </dd>
      )}
    </>
  )
}

interface IntegerPropertyParameters {
  property: RESTIntegerProperty
}

function IntegerProperty({ property: p }: IntegerPropertyParameters): JSX.Element {
  return (
    <>
      <dt><code>{p.identifier}</code> <code>integer</code></dt>
      {p.description !== undefined && (
        <dd>
          <p>{p.description}</p>
        </dd>
      )}
    </>
  )
}

interface NumberPropertyParameters {
  property: RESTNumberProperty
}

function NumberProperty({ property: p }: NumberPropertyParameters): JSX.Element {
  return (
    <>
      <dt><code>{p.identifier}</code> <code>number</code></dt>
      {p.description !== undefined && (
        <dd>
          <p>{p.description}</p>
        </dd>
      )}
    </>
  )
}

interface ObjectPropertyParameters {
  property: RESTObjectProperty
  onRetrieve(id: string): RESTType | undefined
  onRetrieve2(id: string): RESTType | undefined
}

function ObjectProperty(
  {
    property: p,
    onRetrieve: retrieve,
    onRetrieve2: retrieve2
  }: ObjectPropertyParameters
): JSX.Element {
  return (
    <>
      <dt><code>{p.identifier}</code> <code>object</code></dt>
      <dd>
        {p.description !== undefined && (
          <p>{p.description}</p>
        )}
        <details>
          <summary>Properties of <code>{p.identifier}</code></summary>
          <Properties
            properties={p.properties}
            onRetrieve={retrieve}
            onRetrieve2={retrieve2}
          />
        </details>
      </dd>
    </>
  )
}


interface ReferencePropertyParameters {
  property: RESTReferenceProperty
  onRetrieve(id: string): RESTType | undefined
  onRetrieve2(id: string): RESTType | undefined
}

function ReferenceProperty(
  {
    property: p,
    onRetrieve: retrieve,
    onRetrieve2: retrieve2
  }: ReferencePropertyParameters
): JSX.Element {
  const d = retrieve(p.id)
  if (d === undefined) {
    throw new Error(`unable to retrieve reference: ${p.id}`)
  }
  const r: RESTProperty = { ...p, ...d }
  return (
    <Property
      property={r}
      onRetrieve={retrieve}
      onRetrieve2={retrieve2}
    />
  )
}

interface StringPropertyParameters {
  property: RESTStringProperty
}

function StringProperty({ property: p }: StringPropertyParameters): JSX.Element {
  return (
    <>
      <dt><code>{p.identifier}</code> <code>string</code></dt>
      {p.description !== undefined && (
        <dd>
          <p>{p.description}</p>
        </dd>
      )}
    </>
  )
}

interface UnknownPropertyParameters {
  property: RESTUnknownProperty
}

function UnknownProperty({ property: p }: UnknownPropertyParameters): JSX.Element {
  return (
    <>
      <dt><code>{p.identifier}</code> <code>unknown</code></dt>
      {p.description !== undefined && (
        <dd>
          <p>{p.description}</p>
        </dd>
      )}
    </>
  )
}

function data() {
  return {
    layout: "chapter/chapter.tsx"
  }
}

function render({ pagination, onRetrieve, onLink }) {
  return (
    <>
      {pagination.items.map((d) => (
        <RESTDeclaration declaration={d} onRetrieve={onRetrieve} />
      ))}
    </>
  )
}

export { data, render }
