// @ts-check

/**
 * @typedef {import("node:console").Console["prototype"]} Console
 * @typedef {import("node:stream").TransformCallback} TransformCallback
 * @typedef {import("@onlyoffice/documentation-declarations-types/rest.ts").REST.ArrayProperty} RESTArrayProperty
 * @typedef {import("@onlyoffice/documentation-declarations-types/rest.ts").REST.ArrayType} RESTArrayType
 * @typedef {import("@onlyoffice/documentation-declarations-types/rest.ts").REST.ArrayValue} RESTArrayValue
 * @typedef {import("@onlyoffice/documentation-declarations-types/rest.ts").REST.BooleanProperty} RESTBooleanProperty
 * @typedef {import("@onlyoffice/documentation-declarations-types/rest.ts").REST.BooleanType} RESTBooleanType
 * @typedef {import("@onlyoffice/documentation-declarations-types/rest.ts").REST.BooleanValue} RESTBooleanValue
 * @typedef {import("@onlyoffice/documentation-declarations-types/rest.ts").REST.Component} RESTComponent
 * @typedef {import("@onlyoffice/documentation-declarations-types/rest.ts").REST.Example} RESTExample
 * @typedef {import("@onlyoffice/documentation-declarations-types/rest.ts").REST.IntegerProperty} RESTIntegerProperty
 * @typedef {import("@onlyoffice/documentation-declarations-types/rest.ts").REST.IntegerType} RESTIntegerType
 * @typedef {import("@onlyoffice/documentation-declarations-types/rest.ts").REST.IntegerValue} RESTIntegerValue
 * @typedef {import("@onlyoffice/documentation-declarations-types/rest.ts").REST.NumberProperty} RESTNumberProperty
 * @typedef {import("@onlyoffice/documentation-declarations-types/rest.ts").REST.NumberType} RESTNumberType
 * @typedef {import("@onlyoffice/documentation-declarations-types/rest.ts").REST.NumberValue} RESTNumberValue
 * @typedef {import("@onlyoffice/documentation-declarations-types/rest.ts").REST.ObjectProperty} RESTObjectProperty
 * @typedef {import("@onlyoffice/documentation-declarations-types/rest.ts").REST.ObjectType} RESTObjectType
 * @typedef {import("@onlyoffice/documentation-declarations-types/rest.ts").REST.ObjectValue} RESTObjectValue
 * @typedef {import("@onlyoffice/documentation-declarations-types/rest.ts").REST.Property} RESTProperty
 * @typedef {import("@onlyoffice/documentation-declarations-types/rest.ts").REST.PropertyNode} RESTPropertyNode
 * @typedef {import("@onlyoffice/documentation-declarations-types/rest.ts").REST.PropertyReference} RESTPropertyReference
 * @typedef {import("@onlyoffice/documentation-declarations-types/rest.ts").REST.Reference} RESTReference
 * @typedef {import("@onlyoffice/documentation-declarations-types/rest.ts").REST.Request} RESTRequest
 * @typedef {import("@onlyoffice/documentation-declarations-types/rest.ts").REST.Response} RESTResponse
 * @typedef {import("@onlyoffice/documentation-declarations-types/rest.ts").REST.StringProperty} RESTStringProperty
 * @typedef {import("@onlyoffice/documentation-declarations-types/rest.ts").REST.StringType} RESTStringType
 * @typedef {import("@onlyoffice/documentation-declarations-types/rest.ts").REST.StringValue} RESTStringValue
 * @typedef {import("@onlyoffice/documentation-declarations-types/rest.ts").REST.Type} RESTType
 * @typedef {import("@onlyoffice/documentation-declarations-types/rest.ts").REST.TypeNode} RESTTypeNode
 * @typedef {import("@onlyoffice/documentation-declarations-types/rest.ts").REST.UnknownProperty} RESTUnknownProperty
 * @typedef {import("@onlyoffice/documentation-declarations-types/rest.ts").REST.UnknownType} RESTUnknownType
 * @typedef {import("@onlyoffice/documentation-declarations-types/rest.ts").REST.UnknownValue} RESTUnknownValue
 * @typedef {import("@onlyoffice/documentation-declarations-types/rest.ts").REST.Value} RESTValue
 * @typedef {import("@onlyoffice/documentation-declarations-types/rest.ts").REST.ValueNode} RESTValueNode
 * @typedef {import("@onlyoffice/documentation-declarations-types/rest.ts").REST.ValueReference} RESTValueReference
 * @typedef {import("openapi-types").OpenAPIV3_1.ArraySchemaObject} OpenAPIArraySchemaObject
 * @typedef {import("openapi-types").OpenAPIV3_1.ComponentsObject} OpenAPIComponentsObject
 * @typedef {import("openapi-types").OpenAPIV3_1.HttpMethods} OpenAPIHttpMethods
 * @typedef {import("openapi-types").OpenAPIV3_1.MediaTypeObject} OpenAPIMediaTypeObject
 * @typedef {import("openapi-types").OpenAPIV3_1.NonArraySchemaObject} OpenAPINonArraySchemaObject
 * @typedef {import("openapi-types").OpenAPIV3_1.OperationObject} OpenAPIOperationObject
 * @typedef {import("openapi-types").OpenAPIV3_1.ParameterObject} OpenAPIParameterObject
 * @typedef {import("openapi-types").OpenAPIV3_1.PathItemObject} OpenAPIPathItemObject
 * @typedef {import("openapi-types").OpenAPIV3_1.ReferenceObject} OpenAPIReferenceObject
 * @typedef {import("openapi-types").OpenAPIV3_1.RequestBodyObject} OpenAPIRequestBodyObject
 * @typedef {import("openapi-types").OpenAPIV3_1.ResponseObject} OpenAPIResponseObject
 * @typedef {import("openapi-types").OpenAPIV3_1.SchemaObject} OpenAPISchemaObject
 * @typedef {import("../types/rest.js").REST.ComponentCache} RESTComponentCache
 */

/**
 * todo: https://github.com/kogosoftwarellc/open-api/pull/897
 * @typedef {Exclude<Exclude<OpenAPISchemaObject, OpenAPIArraySchemaObject>, OpenAPINonArraySchemaObject>} OpenAPIMixedSchemaObject
 */

/**
 * @typedef {keyof OpenAPIComponentsObject} OpenAPIComponentsKey
 */

// todo: reorderPath?

import { Transform } from "node:stream"
import slugify from "@sindresorhus/slugify"
import { console } from "./console.js"

export class ProcessPath extends Transform {
  /**
   * @param {Cache} cache
   */
  constructor(cache) {
    super({ objectMode: true })
    this._cache = cache
  }

  /**
   * @param {Object} ch
   * @param {string} ch.key
   * @param {OpenAPIPathItemObject} ch.value
   * @param {BufferEncoding} _
   * @param {TransformCallback} cb
   */
  _transform(ch, _, cb) {
    const p = ch.key
    const o = ch.value
    console.log(`start processing ${p}`)

    /** @type {OpenAPIHttpMethods[]} */
    // @ts-ignore I have no idea how to apply a enum to this.
    const ms = ["delete", "get", "head", "options", "patch", "post", "put", "trace"]
    ms.forEach((m) => {
      const e = `${m} ${p}`
      const s = o[m]
      if (s !== undefined) {
        console.info(`start processing "${e}"`)
        if (s.tags === undefined) {
          console.warn("tags is missing")
          console.info(`skipped processing "${e}"`)
        } else {
          const u = m.toUpperCase()
          s.tags.forEach((t) => {
            const r = createRequest(this._cache, u, p, {
              ...s,
              tags: [t]
            })
            this.push(r)
          })
          console.info(`finished processing "${e}"`)
        }
      }
    })

    console.log(`finished processing ${p}`)
    cb(null)
  }
}

/**
 * @template {OpenAPIComponentsKey} K
 */
export class ProcessComponent extends Transform {
  /**
   * @param {Cache} cache
   * @param {K} key
   */
  constructor(cache, key) {
    super({ objectMode: true })
    this._cache = cache
    this._key = key
  }

  /**
   * @param {Object} ch
   * @param {string} ch.key
   * @param {NonNullable<OpenAPIComponentsObject[K]>[""]} ch.value
   * @param {BufferEncoding} _
   * @param {TransformCallback} cb
   */
  _transform(ch, _, cb) {
    const key = `#/components/${this._key}/${ch.key}`
    console.log(`start processing "${key}"`)

    const c = createComponentCache()
    const value = createComponent(c, this._key, ch.value)
    if (value !== undefined) {
      this.push({ key, value })
      console.info(`finished processing "${key}"`)
    } else {
      console.warn(`failed to process "${key}"`)
    }
    this._cache.components[key] = c

    cb(null)
  }
}

export class Cache {
  /** @type {Record<string, RESTComponentCache>} */
  components = {}
}

/**
 * @returns {RESTComponentCache}
 */
function createComponentCache() {
  return {
    headers: {}
  }
}

/**
 * @param {Cache} c
 * @param {string} m
 * @param {string} p
 * @param {OpenAPIOperationObject} s
 * @returns {RESTRequest}
 */
function createRequest(c, m, p, s) {
  const req = createRequest2()
  populateRequestHero(req, m, p, s)
  populateRequestParameters(req, s)
  populateRequestExamples(req)
  populateRequestResponses(c, req, s)
  normalizeRequest(req)
  return req
}

/**
 * @param {RESTRequest} req
 * @param {string} m
 * @param {string} m
 * @param {string} p
 * @param {OpenAPIOperationObject} s
 * @returns {void}
 */
function populateRequestHero(req, m, p, s) {
  req.endpoint = `${m} ${p}`

  if (s.summary !== undefined) {
    /** @type {string[]} */
    let a = []

    if (s.tags !== undefined) {
      const [t] = s.tags
      if (t !== undefined) {
        a = t.split("/")
      } else {
        console.warn("first tag is missing")
      }
    } else {
      console.warn("tags is missing")
    }

    a.push(s.summary)
    req.slug = a
      .map((s) => {
        return slugify(s)
      })
      .join("/")

    req.title = s.summary
  } else {
    console.warn("summary is missing")
  }

  if (s.description !== undefined) {
    req.description = s.description
  } else {
    console.warn("description is missing")
  }
}

/**
 * @param {RESTRequest} req
 * @param {OpenAPIOperationObject} s
 */
function populateRequestParameters(req, s) {
  /** @type {RESTProperty[]} */
  const path = []
  /** @type {RESTProperty[]} */
  const query = []

  if (s.parameters !== undefined) {
    s.parameters.forEach((p) => {
      if ("$ref" in p) {
        console.warn("parameter reference not supported")
        return
      }
      switch (p.in) {
      case "path":
        const p0 = createParameter(p)
        if (p0 !== undefined) {
          path.push(p0)
        }
        break
      case "query":
        const p1 = createParameter(p)
        if (p1 !== undefined) {
          query.push(p1)
        }
        break
      default:
        console.warn(`parameter location "${p.in}" not supported`)
        break
      }
    })
  }

  /** @type {RESTProperty[]} */
  const header = []
  /** @type {RESTValue=} */
  let body = undefined

  if (s.requestBody !== undefined) {
    if ("$ref" in s.requestBody) {
      console.warn("request body reference not supported")
    } else {
      const e = Object.entries(s.requestBody.content)
      if (e.length !== 0) {
        const [k, v] = e[0]
        if (v.schema !== undefined) {
          let o = v.schema
          if (s.requestBody !== undefined) {
            if (s.requestBody.description !== undefined) {
              o.description = s.requestBody.description
            }
          }
          body = createValue(o)
          if (body !== undefined) {
            if (s.requestBody !== undefined) {
              if (s.requestBody.required === true) {
                body.required = true
              }
            }
          }
        } else {
          console.warn("schema for request body is missing")
        }

        const cases = [k]

        for (let i = 1; i < e.length; i += 1) {
          cases.push(e[i][0])
        }
        const h = createStringProperty({ enum: cases })
        h.identifier = "Content-Type"
        header.push(h)
      } else {
        console.warn("content for request body is missing")
      }
    }
  }

  if (header.length > 0) {
    req.headerParameters = header
  }
  if (path.length > 0) {
    req.pathParameters = path
  }
  if (query.length > 0) {
    req.queryParameters = query
  }
  if (body !== undefined) {
    req.bodyParameters = body
  }
}

/**
 * @param {RESTRequest} req
 * @returns {void}
 */
function populateRequestExamples(req) {
  // todo: add headers, query
  /** @type {RESTExample[]} */
  const examples = [
    // {
    //   syntax: "http",
    //   // todo: take host from the meta object.
    //   code: `${req.endpoint} HTTP/1.1\nAccept: application/json\nHost: example.com\n`
    // },
    // {
    //   syntax: "shell",
    //   // todo: omit the -X flag if the method is GET
    //   code: `curl -L\n  -X "${"todo: m"}"\n  -H "Accept: application/json"\n  "https://example.com${"todo: p"}"`
    // }
  ]
  // if (examples.length > 0) {
  //   req.examples = examples
  // }
}

/**
 * @param {Cache} cache
 * @param {RESTRequest} req
 * @param {OpenAPIOperationObject} s
 * @returns {void}
 */
function populateRequestResponses(cache, req, s) {
  /** @type {Record<string, RESTProperty>} */
  const headers = {}

  /** @type {RESTResponse[]} */
  const responses = []

  if (s.responses !== undefined) {
    Object.entries(s.responses).forEach(([k, v]) => {
      // const r = createResponse({ headers: {} }, v)
      // r.status = Number(k)

      /** @type {RESTResponse} */
      let r = {
        status: Number(k)
      }

      if ("$ref" in v) {
        const o = createReference(v)
        r = { ...r, ...o }
        const c = cache.components[o.id]
        if (c !== undefined) {
          Object.entries(c.headers).forEach(([k, p]) => {
            switch (k) {
            case "Accept":
              if (headers.Accept !== undefined) {
                if ("id" in headers.Accept) {
                  console.warn("header reference not supported")
                } else {
                  if (headers.Accept.cases !== undefined) {
                    const s = new Set(headers.Accept.cases.concat(p.cases))
                    headers.Accept.cases = [...s]
                  } else {
                    headers.Accept.cases = p.cases
                  }
                }
              } else {
                headers.Accept = p
              }
              break
            default:
              console.warn(`header "${k}" not supported`)
            }
          })
        }
      } else {
        if (v.description !== undefined) {
          r.description = v.description
        }

        if (v.content !== undefined) {
          /** @type {string[]} */
          const cases = []

          const e = Object.entries(v.content)
          if (e.length !== 0) {
            const [c, o] = e[0]
            cases.push(c)

            if (o.schema !== undefined) {
              r.body = createValue(o.schema)
            } else {
              console.warn("schema for response is missing")
            }

            for (let i = 1; i < e.length; i += 1) {
              cases.push(e[i][0])
            }
          } else {
            console.warn("content for response is missing")
          }

          const a = createStringProperty({ enum: cases })
          a.identifier = "Accept"
          if (headers[a.identifier] !== undefined) {
            const h = headers[a.identifier]
            if ("id" in h) {
              console.warn("header reference not supported")
            } else {
              if (h.cases !== undefined) {
                const s = new Set(h.cases.concat(a.cases))
                h.cases = [...s]
              } else {
                h.cases = a.cases
              }
            }
          } else {
            headers[a.identifier] = a
          }
        }
      }

      responses.push(r)
    })
  } else {
    console.warn("responses for request is missing")
  }

  if (responses.length > 0) {
    req.responses = responses
  }
  const h = Object.values(headers)
  if (h.length > 0) {
    if (req.headerParameters === undefined) {
      req.headerParameters = h
    } else {
      req.headerParameters = req.headerParameters.concat(h)
    }
  }
}

/**
 * @param {RESTRequest} req
 * @returns {void}
 */
function normalizeRequest(req) {
  if (req.headerParameters !== undefined) {
    req.headerParameters = req.headerParameters.sort((a, b) => {
      return a.identifier.localeCompare(b.identifier)
    })
  }
}

/**
 * @returns {RESTRequest}
 */
function createRequest2() {
  return {
    slug: "",
    title: "",
    endpoint: "",
    description: undefined,
    headerParameters: undefined,
    cookieParameters: undefined,
    pathParameters: undefined,
    queryParameters: undefined,
    bodyParameters: undefined,
    examples: undefined,
    responses: undefined,
  }
}

/**
 * @template {OpenAPIComponentsKey} T
 * @param {RESTComponentCache} cache
 * @param {T} t
 * @param {NonNullable<OpenAPIComponentsObject[T]>[""]} s
 */
function createComponent(cache, t, s) {
  switch (t) {
  case "schemas":
    const s = as("schemas")
    return createType(s)
  case "responses":
    const r = as("responses")
    return createResponseComponent(cache, r)
  default:
    console.warn(`"${t}" not supported`)
    break
  }

  /**
   * @template {OpenAPIComponentsKey} T
   * @param {T} _
   * @returns {NonNullable<OpenAPIComponentsObject[T]>[""]}
   */
  function as(_) {
    return s
  }
}

/**
 * @param {RESTComponentCache} cache
 * @param {OpenAPIReferenceObject | OpenAPIResponseObject} s
 * @returns {RESTResponse}
 */
function createResponseComponent(cache, s) {
  /** @type {RESTResponse} */
  let r = {
    // todo: resolve it.
    status: 0
  }

  if ("$ref" in s) {
    const o = createReference(s)
    r = { ...r, ...o }
  } else {
    if (s.description !== undefined) {
      r.description = s.description
    }

    if (s.content !== undefined) {
      /** @type {string[]} */
      const cases = []

      const e = Object.entries(s.content)
      if (e.length !== 0) {
        const [c, o] = e[0]
        cases.push(c)

        if (o.schema !== undefined) {
          r.body = createValue(o.schema)
        } else {
          console.warn("schema for response is missing")
        }

        for (let i = 1; i < e.length; i += 1) {
          cases.push(e[i][0])
        }
      } else {
        console.warn("content for response is missing")
      }

      const a = createStringProperty({ enum: cases })
      a.identifier = "Accept"
      cache.headers[a.identifier] = a
    }
  }

  return r
}

/**
 * // todo: param {OpenAPIReferenceObject | OpenAPIParameterObject} s
 * @param {OpenAPIParameterObject} s
 * @returns {RESTProperty | undefined}
 */
function createParameter(s) {
  if (s.schema === undefined) {
    console.warn(`missing schema for parameter "${s.name}"`)
    return
  }
  const p = createProperty(s.schema)
  p.identifier = s.name
  if (s.required === true) {
    p.required = true
  }
  return p
}

/**
 * @param {OpenAPIReferenceObject | OpenAPISchemaObject} s
 * @returns {RESTProperty}
 */
function createProperty(s) {
  if ("$ref" in s) {
    return createPropertyReference(s)
  }
  switch (s.type) {
  case "array":
    return createArrayProperty(s)
  case "boolean":
    return createBooleanProperty(s)
  case "integer":
    return createIntegerProperty(s)
  case "number":
    return createNumberProperty(s)
  case "object":
    return createObjectProperty(s)
  case "string":
    return createStringProperty(s)
  default:
    console.warn(`type "${s.type}" not supported`)
    return createUnknownProperty(s)
  }
}

/**
 * @param {OpenAPIReferenceObject} s
 * @returns {RESTPropertyReference}
 */
function createPropertyReference(s) {
  const n = createPropertyNode(s)
  const v = createValueReference(s)
  return { ...n, ...v }
}

/**
 * @param {OpenAPIArraySchemaObject} s
 * @returns {RESTArrayProperty}
 */
function createArrayProperty(s) {
  const n = createPropertyNode(s)
  const v = createArrayValue(s)
  return { ...n, ...v }
}

/**
 * @param {OpenAPINonArraySchemaObject} s
 * @returns {RESTBooleanProperty}
 */
function createBooleanProperty(s) {
  const n = createPropertyNode(s)
  const v = createBooleanValue(s)
  return { ...n, ...v }
}

/**
 * @param {OpenAPINonArraySchemaObject} s
 * @returns {RESTIntegerProperty}
 */
function createIntegerProperty(s) {
  const n = createPropertyNode(s)
  const v = createIntegerValue(s)
  return { ...n, ...v }
}

/**
 * @param {OpenAPINonArraySchemaObject} s
 * @returns {RESTNumberProperty}
 */
function createNumberProperty(s) {
  const n = createPropertyNode(s)
  const v = createNumberValue(s)
  return { ...n, ...v }
}

/**
 * @param {OpenAPINonArraySchemaObject} s
 * @returns {RESTObjectProperty}
 */
function createObjectProperty(s) {
  const n = createPropertyNode(s)
  const v = createObjectValue(s)
  return { ...n, ...v }
}

/**
 * @param {OpenAPINonArraySchemaObject} s
 * @returns {RESTStringProperty}
 */
function createStringProperty(s) {
  const n = createPropertyNode(s)
  const v = createStringValue(s)
  return { ...n, ...v }
}

/**
 * @param {OpenAPISchemaObject} s
 * @returns {RESTUnknownProperty}
 */
function createUnknownProperty(s) {
  const n = createPropertyNode(s)
  const v = createUnknownValue(s)
  return { ...n, ...v }
}

/**
 * @param {OpenAPISchemaObject} s
 * @returns {RESTPropertyNode}
 */
function createPropertyNode(s) {
  return {
    identifier: ""
  }
}

/**
 * @param {OpenAPIReferenceObject | OpenAPISchemaObject} s
 * @returns {RESTValue}
 */
function createValue(s) {
  if ("$ref" in s) {
    return createValueReference(s)
  }
  switch (s.type) {
  case "array":
    return createArrayValue(s)
  case "boolean":
    return createBooleanValue(s)
  case "integer":
    return createIntegerValue(s)
  case "number":
    return createNumberValue(s)
  case "object":
    return createObjectValue(s)
  case "string":
    return createStringValue(s)
  default:
    console.warn(`type "${s.type}" not supported`)
    return createUnknownValue(s)
  }
}

/**
 * @param {OpenAPIReferenceObject} s
 * @returns {RESTValueReference}
 */
function createValueReference(s) {
  const n = createValueNode(s)
  const t = createReference(s)
  // const t = createReferenceType(s)
  return { ...n, ...t }
}

/**
 * @param {OpenAPIArraySchemaObject} s
 * @returns {RESTArrayValue}
 */
function createArrayValue(s) {
  const n = createValueNode(s)
  const t = createArrayType(s)
  return { ...n, ...t }
}

/**
 * @param {OpenAPINonArraySchemaObject} s
 * @returns {RESTBooleanValue}
 */
function createBooleanValue(s) {
  const n = createValueNode(s)
  const t = createBooleanType(s)
  return { ...n, ...t }
}

/**
 * @param {OpenAPINonArraySchemaObject} s
 * @returns {RESTIntegerValue}
 */
function createIntegerValue(s) {
  const n = createValueNode(s)
  const t = createIntegerType(s)
  return { ...n, ...t }
}

/**
 * @param {OpenAPINonArraySchemaObject} s
 * @returns {RESTNumberValue}
 */
function createNumberValue(s) {
  const n = createValueNode(s)
  const t = createNumberType(s)
  return { ...n, ...t }
}

/**
 * @param {OpenAPINonArraySchemaObject} s
 * @returns {RESTObjectValue}
 */
function createObjectValue(s) {
  const n = createValueNode(s)
  const t = createObjectType(s)
  return { ...n, ...t }
}

/**
 * @param {OpenAPINonArraySchemaObject} s
 * @returns {RESTStringValue}
 */
function createStringValue(s) {
  const n = createValueNode(s)
  const t = createStringType(s)
  return { ...n, ...t }
}

/**
 * @param {OpenAPISchemaObject} s
 * @returns {RESTUnknownValue}
 */
function createUnknownValue(s) {
  const n = createValueNode(s)
  const t = createUnknownType(s)
  return { ...n, ...t }
}

/**
 * @param {OpenAPISchemaObject} s
 * @returns {RESTValueNode}
 */
function createValueNode(s) {
  /** @type {RESTValueNode} */
  const n = {}
  if (s.description !== undefined) {
    n.description = s.description
  }
  return n
}

/**
 * @param {OpenAPIReferenceObject | OpenAPISchemaObject} s
 * @returns {RESTType}
 */
function createType(s) {
  if ("$ref" in s) {
    return createReference(s)
    // return createReferenceType(s)
  }
  // if (s.enum !== undefined) {
  //   return createEnumType(s)
  // }
  switch (s.type) {
  case "array":
    return createArrayType(s)
  case "boolean":
    return createBooleanType(s)
  case "integer":
    return createIntegerType(s)
  case "number":
    return createNumberType(s)
  case "object":
    return createObjectType(s)
  case "string":
    return createStringType(s)
  default:
    console.warn(`type "${s.type}" not supported`)
    return createUnknownType(s)
  }
}

/**
 * @param {OpenAPIReferenceObject} s
 * @returns {RESTReference}
 */
function createReference(s) {
  return {
    id: s.$ref
  }
}

/**
 * @param {OpenAPIArraySchemaObject} s
 * @return {RESTArrayType}
 */
function createArrayType(s) {
  const n = createTypeNode(s)
  /** @type {RESTArrayType} */
  const a = {
    ...n,
    type: "array"
  }

  if (s.items !== undefined) {
    a.items = createType(s.items)
  } else {
    console.warn("items for array is missing")
  }

  return a
}

/**
 * @param {OpenAPINonArraySchemaObject} s
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
 * @param {OpenAPINonArraySchemaObject} s
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
 * @param {OpenAPINonArraySchemaObject} s
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
 * @param {OpenAPINonArraySchemaObject} s
 * @returns {RESTObjectType}
 */
function createObjectType(s) {
  const n = createTypeNode(s)
  /** @type {RESTObjectType} */
  const o = {
    ...n,
    type: "object"
  }

  if (s.properties !== undefined) {
    o.properties = Object
      .entries(s.properties)
      .map(([k, v]) => {
        const p = createProperty(v)
        p.identifier = k
        if (s.required !== undefined && s.required.includes(k)) {
          p.required = true
        }
        return p
      })
  } else {
    console.warn("properties for object is missing")
  }

  return o
}

// /**
//  * @param {OpenAPIReferenceObject} s
//  * @returns {RESTReferenceType}
//  */
// function createReferenceType(s) {
//   return {
//     // type: "reference",
//     id: s.$ref
//   }
// }

/**
 * @param {OpenAPINonArraySchemaObject} s
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
 * @param {OpenAPISchemaObject} s
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
 * @param {OpenAPISchemaObject} s
 * @returns {RESTTypeNode}
 */
function createTypeNode(s) {
  /** @type {RESTTypeNode} */
  const n = {
    type: ""
  }
  if (s.format !== undefined) {
    n.format = s.format
  }
  if (s.enum !== undefined) {
    n.cases = s.enum
  }
  return n
}

// todo
// Maybe we should replace factory functions with classes to be able to keep the
// order of the properties.
// https://github.com/TypeStrong/typedoc/blob/9a1a5afe44937c65150435b16eb6af97c5e86952/src/lib/models/reflections/parameter.ts
// or https://github.com/syntax-tree/mdast-util-from-markdown/blob/763af0bdca018b9fd89a5e2214d4e792ad1c9b8f/dev/lib/index.js#L1321
// class TypeNode {
//   toObject() {
//     return {
//       type: ""
//     }
//   }
// }
