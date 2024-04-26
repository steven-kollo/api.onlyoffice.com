import {test} from "uvu"
import {is, equal} from "uvu/assert"
import {REST} from "@onlyoffice/documentation-declarations-types/rest.ts"
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
  httpExample(e)

  const expect = "http"
  const actual = e.syntax
  is(expect, actual)
})

test("shellExample() assigns 'shell' to as syntax parameter of REST.Example", () => {
  const e = example()
  shellExample(e)

  const expect = "shell"
  const actual = e.syntax
  is(expect, actual)
})

test("queryParametersToString() creates a query parameters string if parameters exist", () => {
  const req = testRequest()
  addQueryToTestRequets(req)

  const expect = "?version={version}&doc={doc}&view={view}"
  const actual = queryParametersToString(req)
  is(expect, actual)
})

test("queryParametersToString() creates an empty string if query parameters don't exist", () => {
  const req = testRequest()

  const expect = ""
  const actual = queryParametersToString(req)
  is(expect, actual)
})

test("createHTTPExample() creates an HTTP example", () => {
  const req = testRequest()
  req.endpoint = "POST /api/2.0/files/file/referencedata"
  const qp = queryParametersToString(req)

  const expect = "POST /api/2.0/files/file/referencedata HTTP/1.1"
  const actual = createHTTPExample(req, qp).code
  is(expect, actual)
})

test("createHTTPExample() creates an HTTP example with query parameters if exist", () => {
  const req = testRequest()
  req.endpoint = "POST /api/2.0/files/file/referencedata"
  addQueryToTestRequets(req)
  const qp = queryParametersToString(req)

  const expect = "POST /api/2.0/files/file/referencedata?version={version}&doc={doc}&view={view} HTTP/1.1"
  const actual = createHTTPExample(req, qp).code
  is(expect, actual)
})

test("createHTTPExample() creates an HTTP example with headers if exist", () => {
  const req = testRequest()
  req.endpoint = "POST /api/2.0/files/file/referencedata"
  addHeadersToTestRequets(req)
  const qp = queryParametersToString(req)

  const expect = `POST /api/2.0/files/file/referencedata HTTP/1.1
Accept: text/plain, application/json, text/json
Content-Type: application/json, text/json, application/*+json\nAuth`
  const actual = createHTTPExample(req, qp).code
  is(expect, actual)
})

test("createCURLExample() creates a CURL example", () => {
  const req = testRequest()
  req.endpoint = "POST /api/2.0/files/file/referencedata"
  const qp = queryParametersToString(req)

  const expect = "curl -L\n\t-X POST\n\t{host}/api/2.0/files/file/referencedata"
  const actual = createCURLExample(req, qp).code
  is(expect, actual)
})

test("createCURLExample() creates a CURL example with query parameters if exist", () => {
  const req = testRequest()
  req.endpoint = "POST /api/2.0/files/file/referencedata"
  addQueryToTestRequets(req)
  const qp = queryParametersToString(req)

  const expect = `curl -L\n\t-X POST
\t{host}/api/2.0/files/file/referencedata?version={version}&doc={doc}&view={view}`
  const actual = createCURLExample(req, qp).code
  is(expect, actual)
})

test("createCURLExample() creates a CURL example with headers if exist", () => {
  const req = testRequest()
  req.endpoint = "POST /api/2.0/files/file/referencedata"
  addHeadersToTestRequets(req)
  const qp = queryParametersToString(req)

  const expect = `curl -L\n\t-X POST\n\t{host}/api/2.0/files/file/referencedata
\t-H Accept: text/plain, application/json, text/json
\t-H Content-Type: application/json, text/json, application/*+json\n\t-H Auth`
  const actual = createCURLExample(req, qp).code
  is(expect, actual)
})

test("populateRequestExamples() populates RequestDeclaration with request examples", () => {
  const req = testRequest()
  req.endpoint = "POST /api/2.0/files/file/referencedata"

  populateRequestExamples(req)
  const expect = [
    "POST /api/2.0/files/file/referencedata HTTP/1.1",
    "curl -L\n\t-X POST\n\t{host}/api/2.0/files/file/referencedata"
  ]
  const actual = req.examples?.map(ex => ex.code)
  equal(actual, expect)
})

function testRequest(): REST.RequestDeclaration {
  return {
    id: "",
    kind: "request",
    slug: "",
    title: "",
    endpoint: "",
    description: "",
    headerParameters: [],
    pathParameters: [],
    queryParameters: []
  }
}

function addQueryToTestRequets(r: REST.RequestDeclaration): void {
  r.queryParameters = [
    {
      "identifier": "version",
      "type": "integer",
      "format": "int32"
    },
    {
      "identifier": "doc",
      "type": "string"
    },
    {
      "identifier": "view",
      "type": "boolean"
    }
  ]
}

function addHeadersToTestRequets(r: REST.RequestDeclaration): void {
  r.headerParameters = [
    {
      "identifier": "Accept",
      "type": "string",
      "cases": [
        "text/plain",
        "application/json",
        "text/json"
      ]
    },
    {
      "identifier": "Content-Type",
      "type": "string",
      "cases": [
        "application/json",
        "text/json",
        "application/*+json"
      ]
    },
    {
      "identifier": "Auth",
      "type": "string"
    }
  ]
}

test.run()
