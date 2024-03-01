// @ts-check

/**
 * @typedef {import("node:console").Console["prototype"]} Console
 * @typedef {import("node:stream").TransformCallback} TransformCallback
 * @typedef {import("openapi-types").OpenAPIV3_1.ArraySchemaObject} ArraySchemaObject
 * @typedef {import("openapi-types").OpenAPIV3_1.HttpMethods} HttpMethods
 * @typedef {import("openapi-types").OpenAPIV3_1.MediaTypeObject} MediaTypeObject
 * @typedef {import("openapi-types").OpenAPIV3_1.NonArraySchemaObject} NonArraySchemaObject
 * @typedef {import("openapi-types").OpenAPIV3_1.OperationObject} OperationObject
 * @typedef {import("openapi-types").OpenAPIV3_1.ParameterObject} ParameterObject
 * @typedef {import("openapi-types").OpenAPIV3_1.PathItemObject} PathItemObject
 * @typedef {import("openapi-types").OpenAPIV3_1.ReferenceObject} ReferenceObject
 * @typedef {import("openapi-types").OpenAPIV3_1.RequestBodyObject} RequestBodyObject
 * @typedef {import("openapi-types").OpenAPIV3_1.ResponseObject} ResponseObject
 * @typedef {import("openapi-types").OpenAPIV3_1.SchemaObject} SchemaObject
 * @typedef {import("../rest.js").RESTArrayParameter} RESTArrayParameter
 * @typedef {import("../rest.js").RESTArrayProperty} RESTArrayProperty
 * @typedef {import("../rest.js").RESTArrayType} RESTArrayType
 * @typedef {import("../rest.js").RESTBooleanParameter} RESTBooleanParameter
 * @typedef {import("../rest.js").RESTBooleanProperty} RESTBooleanProperty
 * @typedef {import("../rest.js").RESTBooleanType} RESTBooleanType
 * @typedef {import("../rest.js").RESTContent} RESTContent
 * @typedef {import("../rest.js").RESTExample} RESTExample
 * @typedef {import("../rest.js").RESTIntegerParameter} RESTIntegerParameter
 * @typedef {import("../rest.js").RESTIntegerProperty} RESTIntegerProperty
 * @typedef {import("../rest.js").RESTIntegerType} RESTIntegerType
 * @typedef {import("../rest.js").RESTNumberParameter} RESTNumberParameter
 * @typedef {import("../rest.js").RESTNumberProperty} RESTNumberProperty
 * @typedef {import("../rest.js").RESTNumberType} RESTNumberType
 * @typedef {import("../rest.js").RESTObjectParameter} RESTObjectParameter
 * @typedef {import("../rest.js").RESTObjectProperty} RESTObjectProperty
 * @typedef {import("../rest.js").RESTObjectType} RESTObjectType
 * @typedef {import("../rest.js").RESTParameter} RESTParameter
 * @typedef {import("../rest.js").RESTParameterNode} RESTParameterNode
 * @typedef {import("../rest.js").RESTPath} RESTPath
 * @typedef {import("../rest.js").RESTProperty} RESTProperty
 * @typedef {import("../rest.js").RESTPropertyNode} RESTPropertyNode
 * @typedef {import("../rest.js").RESTReferenceParameter} RESTReferenceParameter
 * @typedef {import("../rest.js").RESTReferenceProperty} RESTReferenceProperty
 * @typedef {import("../rest.js").RESTReferenceType} RESTReferenceType
 * @typedef {import("../rest.js").RESTResponse} RESTResponse
 * @typedef {import("../rest.js").RESTStringParameter} RESTStringParameter
 * @typedef {import("../rest.js").RESTStringProperty} RESTStringProperty
 * @typedef {import("../rest.js").RESTStringType} RESTStringType
 * @typedef {import("../rest.js").RESTType} RESTType
 * @typedef {import("../rest.js").RESTTypeNode} RESTTypeNode
 * @typedef {import("../rest.js").RESTUnknownParameter} RESTUnknownParameter
 * @typedef {import("../rest.js").RESTUnknownProperty} RESTUnknownProperty
 * @typedef {import("../rest.js").RESTUnknownType} RESTUnknownType
 *
 * todo: https://github.com/kogosoftwarellc/open-api/pull/897
 * @typedef {Exclude<Exclude<SchemaObject, ArraySchemaObject>, NonArraySchemaObject>} MixedSchemaObject
 */

import { Transform } from "node:stream"
import slugify from "@sindresorhus/slugify"

export class PreprocessPath extends Transform {
  /**
   * @param {Console} console
   */
  constructor(console) {
    super({ objectMode: true })
    this._console = console
  }

  /**
   * @param {Object} ch
   * @param {string} ch.key
   * @param {PathItemObject} ch.value
   * @param {BufferEncoding} _
   * @param {TransformCallback} cb
   */
  _transform(ch, _, cb) {
    const p = ch.key
    const o = ch.value

    this._console.info(`start processing ${p}`)

    /** @type {HttpMethods[]} */
    const ms = ["delete", "get", "head", "options", "patch", "post", "put", "trace"]
    ms.forEach((m) => {
      const s = o[m]
      if (s !== undefined) {
        if (s.tags === undefined) {
          this._console.warn("missing tags")
        } else {
          const u = m.toUpperCase()
          s.tags.forEach((t) => {
            const r = createPath(this._console, u, p, {
              ...s,
              tags: [t]
            })
            this.push(r)
          })
        }
      }
    })

    cb(null)
  }
}

export class PreprocessComponent extends Transform {
  /**
   * @param {Console} console
   */
  constructor(console) {
    super({ objectMode: true })
    this._console = console
  }

  /**
   * @param {Object} ch
   * @param {string} ch.key
   * @param {ReferenceObject | SchemaObject} ch.value
   * @param {BufferEncoding} _
   * @param {TransformCallback} cb
   */
  _transform(ch, _, cb) {
    const c = {
      key: `#/components/schemas/${ch.key}`,
      value: createType(this._console, ch.value)
    }
    this.push(c)
    cb(null)
  }
}

/**
 * @param {Console} c
 * @param {string} m
 * @param {string} p
 * @param {OperationObject} s
 * @returns {RESTPath}
 */
function createPath(c, m, p, s) {
  /** @type {RESTPath} */
  const path = {
    slug: "",
    title: "",
    endpoint: `${m} ${p}`, // aka signature
    summary: ""
  }

  if (s.summary !== undefined) {
    const p = s.tags[0].split("/").map(slugify).join("/")
    const c = slugify(s.summary)
    path.slug = `${p}/${c}`
    path.title = s.summary
    path.summary = s.summary
  } else {
    c.warn("missing summary")
  }

  if (s.description !== undefined) {
    path.description = s.description
  } else {
    c.warn("missing description")
  }

  /** @type {RESTParameter[]} */
  const pathParameters = []
  /** @type {RESTParameter[]} */
  const queryParameters = []

  if (s.parameters !== undefined) {
    s.parameters.forEach((p) => {
      if ("$ref" in p) {
        c.warn("parameter reference not supported")
        return
      }
      switch (p.in) {
      case "path":
        const p0 = createParameter(c, p)
        pathParameters.push(p0)
        break
      case "query":
        const p1 = createParameter(c, p)
        queryParameters.push(p1)
        break
      default:
        c.warn(`unknown parameter location: ${p.in}`)
        break
      }
    })
  }

  /** @type {RESTContent[]} */
  let bodyParameters = []

  if (s.requestBody !== undefined) {
    if ("$ref" in s.requestBody) {
      c.warn("request body reference not supported")
    } else {
      bodyParameters = Object
        .entries(s.requestBody.content)
        .map(([k, v]) => {
          const r = createContent(c, v)
          r.contentType = k
          if (s.requestBody?.description !== undefined) {
            r.description = s.requestBody.description
          }
          return r
        })
    }
  }

  /** @type {RESTExample[]} */
  const examples = [
    {
      syntax: "http",
      // todo: take host from the meta object.
      code: `${m} ${p} HTTP/1.1\nAccept: application/json\nHost: example.com\n`
    },
    {
      syntax: "shell",
      // todo: omit the -X flag if the method is GET
      code: `curl -L\n  -X "${m}"\n  -H "Accept: application/json"\n  "https://example.com${p}"`
    }
  ]

  /** @type {RESTResponse[]} */
  const responses = []

  if (s.responses !== undefined) {
    Object.entries(s.responses).forEach(([k, v]) => {
      if ("$ref" in v) {
        c.warn("response reference not supported")
        return
      }
      if (v.content !== undefined) {
        Object.entries(v.content).forEach(([kk, vv]) => {
          const r = createResponse(c, vv)
          r.contentType = kk
          r.status = Number(k)
          responses.push(r)
        })
      }
    })
  }

  if (pathParameters.length > 0) {
    path.pathParameters = pathParameters
  }
  if (queryParameters.length > 0) {
    path.queryParameters = queryParameters
  }
  if (bodyParameters.length > 0) {
    path.bodyParameters = bodyParameters
  }
  if (examples.length > 0) {
    path.examples = examples
  }
  if (responses.length > 0) {
    path.responses = responses
  }

  return path
}

// todo: reorderPath

/**
 * @param {Console} c
 * @param {ParameterObject} s
 * @returns {RESTParameter}
 */
function createParameter(c, s) {
  const pr = property()
  /** @type {RESTParameter} */
  const pa = {
    ...pr,
    identifier: s.name
  }
  if (s.required === true) {
    pa.required = true
  }
  return pa

  function property() {
    if (s.schema === undefined) {
      c.warn("missing schema")
      return createUnknownProperty({})
    }
    return createProperty(c, s.schema)
  }
}

/**
 * @param {Console} c
 * @param {MediaTypeObject} s
 * @returns {RESTResponse}
 */
function createResponse(c, s) {
  const n = createContent(c, s)
  return {
    ...n,
    status: 0
  }
}

/**
 * @param {Console} c
 * @param {MediaTypeObject} s
 * @returns {RESTContent}
 */
function createContent(c, s) {
  const t = type()
  /** @type {RESTContent} */
  const r = {
    ...t,
    contentType: ""
  }
  return r

  function type() {
    if (s.schema === undefined) {
      c.warn("missing schema")
      return createUnknownType({})
    }
    return createType(c, s.schema)
  }
}

/**
 * @param {Console} c
 * @param {ReferenceObject | SchemaObject} s
 * @returns {RESTProperty}
 */
function createProperty(c, s) {
  if ("$ref" in s) {
    return createReferenceProperty(s)
  }
  switch (s.type) {
  case "array":
    return createArrayProperty(c, s)
  case "boolean":
    return createBooleanProperty(s)
  case "integer":
    return createIntegerProperty(s)
  case "number":
    return createNumberProperty(s)
  case "object":
    return createObjectProperty(c, s)
  case "string":
    return createStringProperty(s)
  default:
    return createUnknownProperty(s)
  }
}

/**
 * @param {Console} c
 * @param {ArraySchemaObject} s
 * @returns {RESTArrayProperty}
 */
function createArrayProperty(c, s) {
  const p = createPropertyNode(s)
  const t = createArrayType(c, s)
  return { ...p, ...t }
}

/**
 * @param {NonArraySchemaObject} s
 * @returns {RESTBooleanProperty}
 */
function createBooleanProperty(s) {
  const p = createPropertyNode(s)
  const t = createBooleanType(s)
  return { ...p, ...t }
}

/**
 * @param {NonArraySchemaObject} s
 * @returns {RESTIntegerProperty}
 */
function createIntegerProperty(s) {
  const p = createPropertyNode(s)
  const t = createIntegerType(s)
  return { ...p, ...t }
}

/**
 * @param {NonArraySchemaObject} s
 * @returns {RESTNumberProperty}
 */
function createNumberProperty(s) {
  const p = createPropertyNode(s)
  const t = createNumberType(s)
  return { ...p, ...t }
}

/**
 * @param {Console} c
 * @param {NonArraySchemaObject} s
 * @returns {RESTObjectProperty}
 */
function createObjectProperty(c, s) {
  const p = createPropertyNode(s)
  const t = createObjectType(c, s)
  return { ...p, ...t }
}

/**
 * @param {ReferenceObject} s
 * @returns {RESTReferenceProperty}
 */
function createReferenceProperty(s) {
  const p = createPropertyNode(s)
  const t = createReferenceType(s)
  return { ...p, ...t }
}

/**
 * @param {NonArraySchemaObject} s
 * @returns {RESTStringProperty}
 */
function createStringProperty(s) {
  const p = createPropertyNode(s)
  const t = createStringType(s)
  return { ...p, ...t }
}

/**
 * @param {SchemaObject} s
 * @returns {RESTUnknownProperty}
 */
function createUnknownProperty(s) {
  const p = createPropertyNode(s)
  p.identifier = "unknown"
  const t = createUnknownType(s)
  return { ...p, ...t }
}

/**
 * @param {SchemaObject} s
 * @returns {RESTPropertyNode}
 */
function createPropertyNode(s) {
  /** @type {RESTPropertyNode} */
  const p = {
    identifier: ""
  }
  if (s.description !== undefined) {
    p.description = s.description
  }
  // if (s.example !== undefined) {
  //   p.example = s.example
  // }
  return p
}

/**
 * @param {Console} c
 * @param {ReferenceObject | SchemaObject} s
 * @returns {RESTType}
 */
function createType(c, s) {
  if ("$ref" in s) {
    return createReferenceType(s)
  }
  switch (s.type) {
  case "array":
    return createArrayType(c, s)
  case "boolean":
    return createBooleanType(s)
  case "integer":
    return createIntegerType(s)
  case "number":
    return createNumberType(s)
  case "object":
    return createObjectType(c, s)
  case "string":
    return createStringType(s)
  default:
    c.warn(`unknown schema type: ${s.type}`)
    return createUnknownType(s)
  }
}

/**
 * @param {Console} c
 * @param {ArraySchemaObject} s
 * @return {RESTArrayType}
 */
function createArrayType(c, s) {
  const n = createTypeNode(s)
  return {
    ...n,
    type: "array",
    items: items()
  }

  function items() {
    if (s.items === undefined) {
      return createUnknownType(s)
    }
    return createType(c, s.items)
  }
}

/**
 * @param {NonArraySchemaObject} s
 * @returns {RESTBooleanType}
 */
function createBooleanType(s) {
  const n = createTypeNode(s)
  return {
    ...n,
    type: "boolean"
  }
}

/**
 * @param {NonArraySchemaObject} s
 * @returns {RESTIntegerType}
 */
function createIntegerType(s) {
  const n = createTypeNode(s)
  return {
    ...n,
    type: "integer"
  }
}

/**
 * @param {NonArraySchemaObject} s
 * @returns {RESTNumberType}
 */
function createNumberType(s) {
  const n = createTypeNode(s)
  return {
    ...n,
    type: "number"
  }
}

/**
 * @param {Console} c
 * @param {NonArraySchemaObject} s
 * @returns {RESTObjectType}
 */
function createObjectType(c, s) {
  const n = createTypeNode(s)
  return {
    ...n,
    type: "object",
    properties: properties()
  }

  function properties() {
    if (s.properties === undefined) {
      const p = createUnknownProperty(s)
      return [p]
    }
    return Object
      .entries(s.properties)
      .map(([k, v]) => {
        const p = createProperty(c, v)
        p.identifier = k
        return p
      })
  }
}

/**
 * @param {ReferenceObject} s
 * @returns {RESTReferenceType}
 */
function createReferenceType(s) {
  return {
    type: "reference",
    id: s.$ref
  }
}

/**
 * @param {NonArraySchemaObject} s
 * @returns {RESTStringType}
 */
function createStringType(s) {
  const n = createTypeNode(s)
  return {
    ...n,
    type: "string"
  }
}

/**
 * @param {SchemaObject} s
 * @returns {RESTUnknownType}
 */
function createUnknownType(s) {
  const n = createTypeNode(s)
  return {
    ...n,
    type: "unknown"
  }
}

/**
 * @param {SchemaObject} s
 * @returns {RESTTypeNode}
 */
function createTypeNode(s) {
  /** @type {RESTTypeNode} */
  const t = {
    type: ""
  }
  if (s.format !== undefined) {
    t.format = s.format
  }
  return t
}
