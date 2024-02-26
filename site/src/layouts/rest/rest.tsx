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
      <Retriever>
        {({ setup, isLoop, teardown }) => (
          <>
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
                      isLoop={isLoop}
                      onRetrieve={retrieve}
                      onSetup={setup}
                      onTeardown={teardown}
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
                      onSetup={setup}
                      isLoop={isLoop}
                      onTeardown={teardown}
                      onRetrieve={retrieve}
                    />
                  </>
                ))}
              </>
            )}
          </>
        )}
      </Retriever>
    </Content>
  )
}

interface RetrieverParameters {
  children(p: RetrieverChildrenParameters): any
}

interface RetrieverChildrenParameters {
  setup(id: string): void
  isLoop(): boolean
  teardown(): void
}

function Retriever({ children }: RetrieverParameters): ReturnType<RetrieverParameters["children"]> {
  const h: string[] = []
  let n = -1

  function setup(id: string): void {
    const i = h.lastIndexOf(id)
    if (i !== -1) {
      if (n === -1) {
        n = i
      } else {
        if (i - n === 1) {
          n += 1
        } else {
          n = -1
        }
      }
    }
    h.push(id)
  }

  function isLoop(): boolean {
    return false

    // if (n !== -1) {
    //   const c = h[h.length - 1]
    //   const p = h[(h.length - 1) - (n + 1)]
    //   if (c === p) {
    //     return true
    //   }
    // }
    // return false

    // if (n === -1) {
    //   return false
    // }
    // const c = h[h.length - 1]
    // if (c === undefined) {
    //   return false
    // }
    // const p = h[(h.length - 1) - (n + 1)]
    // if (p === undefined) {
    //   return false
    // }
    // if (c !== p) {
    //   return false
    // }
    // return true
  }

  function teardown(): void {
    if (isLoop()) {
      n = -1
    }
    h.pop()
  }

  return children({ setup, isLoop, teardown })
}

interface ParametersProperties {
  parameters: RESTParameter[]
  onSetup(id: string): void
  isLoop(): boolean
  onTeardown(): void
  onRetrieve(id: string): RESTType | undefined
}

function Parameters(
  {
    parameters: ps,
    onSetup: setup,
    isLoop,
    onTeardown: teardown,
    onRetrieve: retrieve
  }: ParametersProperties
): JSX.Element {
  return (
    <dl>
      {ps.map((p) => (
        <Parameter
          parameter={p}
          onSetup={setup}
          isLoop={isLoop}
          onTeardown={teardown}
          onRetrieve={retrieve}
        />
      ))}
    </dl>
  )
}

interface ParameterParameters {
  parameter: RESTParameter
  onSetup(id: string): void
  isLoop(): boolean
  onTeardown(): void
  onRetrieve(id: string): RESTType | undefined
}

function Parameter(
  {
    parameter: p,
    onSetup: setup,
    isLoop,
    onTeardown: teardown,
    onRetrieve: retrieve
  }: ParameterParameters
): JSX.Element {
  switch (p.type) {
  case "array":
    return <ArrayParameter parameter={p} onSetup={setup} isLoop={isLoop} onTeardown={teardown} onRetrieve={retrieve} />
  case "boolean":
    return <BooleanParameter parameter={p} />
  case "integer":
    return <IntegerParameter parameter={p} />
  case "number":
    return <NumberParameter parameter={p} />
  case "object":
    return <ObjectParameter parameter={p} onSetup={setup} isLoop={isLoop} onTeardown={teardown} onRetrieve={retrieve} />
  case "reference":
    return <ReferenceParameter parameter={p} onSetup={setup} isLoop={isLoop} onTeardown={teardown} onRetrieve={retrieve} />
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
  onSetup(id: string): void
  isLoop(): boolean
  onTeardown(): void
  onRetrieve(id: string): RESTType | undefined
}

function ArrayParameter(
  {
    parameter: p,
    onSetup: setup,
    isLoop,
    onTeardown: teardown,
    onRetrieve: retrieve
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
      const d = retrieve(t.id)
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
              onSetup={setup}
              isLoop={isLoop}
              onTeardown={teardown}
              onRetrieve={retrieve}
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
  onSetup(id: string): void
  isLoop(): boolean
  onTeardown(): void
  onRetrieve(id: string): RESTType | undefined
}

function ObjectParameter(
  {
    parameter: p,
    onSetup: setup,
    isLoop,
    onTeardown: teardown,
    onRetrieve: retrieve
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
            onSetup={setup}
            isLoop={isLoop}
            onTeardown={teardown}
            onRetrieve={retrieve}
          />
        </details>
      </dd>
    </>
  )
}

interface ReferenceParameterParameters {
  parameter: RESTReferenceParameter
  onSetup(id: string): void
  isLoop(): boolean
  onTeardown(): void
  onRetrieve(id: string): RESTType | undefined
}

function ReferenceParameter(
  {
    parameter: p,
    onSetup: setup,
    isLoop,
    onTeardown: teardown,
    onRetrieve: retrieve
  }: ReferenceParameterParameters
): JSX.Element {
  setup(p.id)
  if (isLoop()) {
    teardown()
    return <></>
  }

  const d = retrieve(p.id)
  if (d === undefined) {
    throw new Error(`unable to retrieve reference: ${p.id}`)
  }

  const r: RESTParameter = { ...p, ...d }
  const e = (
    <Parameter
      parameter={r}
      onSetup={setup}
      isLoop={isLoop}
      onTeardown={teardown}
      onRetrieve={retrieve}
    />
  )
  teardown()
  return e
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
  onSetup(id: string): void
  isLoop(): boolean
  onTeardown(): void
  onRetrieve(id: string): RESTType | undefined
}

function Properties(
  {
    properties: ps,
    onSetup: setup,
    isLoop,
    onTeardown: teardown,
    onRetrieve: retrieve
  }: PropertiesProperties
): JSX.Element {
  return (
    <dl>
      {ps.map((p) => (
        <Property
          property={p}
          onSetup={setup}
          isLoop={isLoop}
          onTeardown={teardown}
          onRetrieve={retrieve}
        />
      ))}
    </dl>
  )
}

interface PropertyProperties {
  property: RESTProperty
  onSetup(id: string): void
  isLoop(): boolean
  onTeardown(): void
  onRetrieve(id: string): RESTType | undefined
}

function Property(
  {
    property: p,
    onSetup: setup,
    isLoop,
    onTeardown: teardown,
    onRetrieve: retrieve
  }: PropertyProperties
): JSX.Element {
  switch (p.type) {
  case "array":
    return <ArrayProperty property={p} onSetup={setup} isLoop={isLoop} onTeardown={teardown} onRetrieve={retrieve} />
  case "boolean":
    return <BooleanProperty property={p} />
  case "integer":
    return <IntegerProperty property={p} />
  case "number":
    return <NumberProperty property={p} />
  case "object":
    return <ObjectProperty property={p} onSetup={setup} isLoop={isLoop} onTeardown={teardown} onRetrieve={retrieve} />
  case "reference":
    return <ReferenceProperty property={p} onSetup={setup} isLoop={isLoop} onTeardown={teardown} onRetrieve={retrieve} />
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
  onSetup(id: string): void
  isLoop(): boolean
  onTeardown(): void
  onRetrieve(id: string): RESTType | undefined
}

function ArrayProperty(
  {
    property: p,
    onSetup: setup,
    isLoop,
    onTeardown: teardown,
    onRetrieve: retrieve
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
      const d = retrieve(t.id)
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
              onSetup={setup}
              isLoop={isLoop}
              onTeardown={teardown}
              onRetrieve={retrieve}
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
  onSetup(id: string): void
  isLoop(): boolean
  onTeardown(): void
  onRetrieve(id: string): RESTType | undefined
}

function ObjectProperty(
  {
    property: p,
    onSetup: setup,
    isLoop,
    onTeardown: teardown,
    onRetrieve: retrieve
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
            onSetup={setup}
            isLoop={isLoop}
            onTeardown={teardown}
            onRetrieve={retrieve}
          />
        </details>
      </dd>
    </>
  )
}


interface ReferencePropertyParameters {
  property: RESTReferenceProperty
  onSetup(id: string): void
  isLoop(): boolean
  onTeardown(): void
  onRetrieve(id: string): RESTType | undefined
}

function ReferenceProperty(
  {
    property: p,
    onSetup: setup,
    isLoop,
    onTeardown: teardown,
    onRetrieve: retrieve
  }: ReferencePropertyParameters
): JSX.Element {
  setup(p.id)
  if (isLoop()) {
    teardown()
    return <></>
  }

  const d = retrieve(p.id)
  if (d === undefined) {
    throw new Error(`unable to retrieve reference: ${p.id}`)
  }

  const r: RESTProperty = { ...p, ...d }
  const e = (
    <Property
      property={r}
      onSetup={setup}
      isLoop={isLoop}
      onTeardown={teardown}
      onRetrieve={retrieve}
    />
  )
  teardown()
  return e
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
      {pagination.items.map((d) => {
        if (
          d.slug === "web/save-the-documents-firebase-device-token" ||
          d.slug === "web/subscribe-to-documents-push-notification" ||
          d.slug === "web/update-a-storage" ||
          d.slug === "web/update-the-cdn-storage"
        ) {
          return <>recursive</>
        }
        return <RESTDeclaration declaration={d} onRetrieve={onRetrieve} />
      })}
    </>
  )
}

export { data, render }
