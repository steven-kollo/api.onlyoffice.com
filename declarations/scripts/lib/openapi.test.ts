import {REST} from "@onlyoffice/documentation-declarations-types/rest.ts"
import {test} from "uvu"
import {is, unreachable} from "uvu/assert"
import {
  createCURLExample,
  createHTTPExample,
  example,
  httpExample,
  shellExample,
  populateRequestExamples,
  queryParametersToString
} from "./openapi.ts"

test("example() creates a REST example object with parameters as empty stings", () => {
  const e = example()
  is("", e.code)
  is("", e.syntax)
})

test("httpExample() assigns 'http' to as syntax parameter of REST.Example", () => {
  const e = example()
  const h = httpExample(e)
  is("", e.syntax)
  is("http", h.syntax)
})

test("shellExample() assigns 'shell' to as syntax parameter of REST.Example", () => {
  const e = example()
  const s = shellExample(e)
  is("", e.syntax)
  is("shell", s.syntax)
})

test("queryParametersToString() creates an empty string if query parameters don't exist", () => {
  const n = declarationNode()
  const r = requestDeclaration(n)
  const a = queryParametersToString(r)
  is("", a)
})

test("queryParametersToString() creates a query parameters string if parameters exist", () => {
  const n = declarationNode()
  const r = requestDeclaration(n)
  r.queryParameters = [
    documentQueryParameter(),
    versionQueryParameter(),
    viewQueryParameter()
  ]
  const e = "?version={version}&doc={doc}&view={view}"
  const a = queryParametersToString(r)
  is(e, a)
})

test("createHTTPExample() creates an HTTP example", () => {
  const r = postRequestDeclaration()
  const qp = queryParametersToString(r)
  const e = "POST /api/2.0/files/file/referencedata HTTP/1.1"
  const {code} = createHTTPExample(r, qp)
  is(e, code)
})

test("createHTTPExample() creates an HTTP example with query parameters if exist", () => {
  const r = postRequestDeclaration()
  r.queryParameters = [
    documentQueryParameter(),
    versionQueryParameter(),
    viewQueryParameter()
  ]
  const qp = queryParametersToString(r)
  const e = "" +
    "POST /api/2.0/files/file/referencedata" +
    "?version={version}&doc={doc}&view={view} HTTP/1.1"
  const {code} = createHTTPExample(r, qp)
  is(e, code)
})

test("createHTTPExample() creates an HTTP example with headers if exist", () => {
  const r = testRequest()
  const req = postTestRequest(r)
  const hreq = addHeadersToTestRequets(req)
  const qp = queryParametersToString(hreq)

  const expect = "POST /api/2.0/files/file/referencedata HTTP/1.1\n" +
    "Accept: text/plain, application/json, text/json\n" +
    "Content-Type: application/json, text/json, application/*+json\n" +
    "Auth: Auth"
  const actual = createHTTPExample(hreq, qp)
  is(expect, actual.code)
})

test("createCURLExample() creates a CURL example", () => {
  const r = testRequest()
  const req = postTestRequest(r)
  const qp = queryParametersToString(req)

  const expect = "curl -L\n\t-X POST\n\t{host}/api/2.0/files/file/referencedata"
  const actual = createCURLExample(req, qp)
  is(expect, actual.code)
})

test("createCURLExample() creates a CURL example with query parameters if exist", () => {
  const r = testRequest()
  const req = postTestRequest(r)
  const qreq = addQueryToTestRequets(req)
  const qp = queryParametersToString(qreq)

  const expect = "curl -L\n\t-X POST\n" +
    "\t{host}/api/2.0/files/file/referencedata?version={version}&doc={doc}&view={view}"
  const actual = createCURLExample(qreq, qp)
  is(expect, actual.code)
})

test("createCURLExample() creates a CURL example with headers if exist", () => {
  const r = testRequest()
  const req = postTestRequest(r)
  const hreq = addHeadersToTestRequets(req)
  const qp = queryParametersToString(hreq)

  const expect = "curl -L\n\t-X POST\n\t{host}/api/2.0/files/file/referencedata\n" +
    "\t-H Accept: text/plain, application/json, text/json\n" +
    "\t-H Content-Type: application/json, text/json, application/*+json\n" +
    "\t-H Auth: Auth"
  const actual = createCURLExample(hreq, qp)
  is(expect, actual.code)
})

test("populateRequestExamples() populates RequestDeclaration with request examples", () => {
  const r = testRequest()
  const req = postTestRequest(r)

  populateRequestExamples(req)
  const expect = [
    "POST /api/2.0/files/file/referencedata HTTP/1.1",
    "curl -L\n\t-X POST\n\t{host}/api/2.0/files/file/referencedata"
  ]
  const actual = req.examples
  if (actual) {
    is(actual[0].code, expect[0])
    is(actual[1].code, expect[1])
  } else {
    unreachable("Examples do not exist")
  }
})

test.run()

function getRequestDeclaration(): REST.RequestDeclaration {
  // todo
}

function postRequestDeclaration(): REST.RequestDeclaration {
  const n = declarationNode()
  const r = requestDeclaration(n)
  r.endpoint = "POST /api/2.0/files/file/referencedata"
  return r
}

function acceptHeaderParameter(): REST.Property {
  const n = typeNode()
  const t = stringType(n)
  const p = property(t)
  p.identifier = "Accept"
  p.cases = ["text/plain", "application/json", "text/json"]
  return p
}

function authHeaderParameter(): REST.Property {
  const n = typeNode()
  const t = stringType(n)
  const p = property(t)
  p.identifier = "Auth"
  return p
}

function contentTypeHeaderParameter(): REST.Property {
  const n = typeNode()
  const t = stringType(n)
  const p = property(t)
  p.identifier = "Content-Type"
  p.cases = ["application/json", "text/json", "application/*+json"]
  return p
}

function documentQueryParameter(): REST.Property {
  const n = typeNode()
  const t = stringType(n)
  const p = property(t)
  p.identifier = "document"
  return p
}

function versionQueryParameter(): REST.Property {
  const n = typeNode()
  const t = integerType(n)
  const p = property(t)
  p.identifier = "version"
  p.format = "int32"
  return p
}

function viewQueryParameter(): REST.Property {
  const n = typeNode()
  const t = booleanType(n)
  const p = property(t)
  p.identifier = "view"
  return p
}

// todo: move the function bellow to the openapi module.

function requestDeclaration(d: REST.DeclarationNode): REST.RequestDeclaration {
  return {
    ...d,
    id: "",
    kind: "request",
    endpoint: "",
    headerParameters: undefined,
    cookieParameters: undefined,
    pathParameters: undefined,
    queryParameters: undefined,
    bodyParameters: undefined,
    examples: undefined,
    responses: undefined
  }
}

function declarationNode(): REST.DeclarationNode {
  return {kind: "", slug: "", title: "", description: undefined}
}

function property(t: Exclude<REST.Type, REST.Reference>): Exclude<REST.Property, REST.PropertyReference> {
  return {...t, identifier: ""}
}

function booleanType(t: REST.TypeNode): REST.BooleanType {
  return {...t, type: "boolean"}
}

function stringType(t: REST.TypeNode): REST.StringType {
  return {...t, type: "string"}
}

function integerType(t: REST.TypeNode): REST.IntegerType {
  return {...t, type: "integer"}
}

function typeNode(): REST.TypeNode {
  return {type: ""}
}
