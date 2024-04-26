import {test} from "uvu"
import {is, unreachable} from "uvu/assert"
import {REST} from "@onlyoffice/documentation-declarations-types/rest.ts"
import {
  createCURLExample,
  createHTTPExample,
  example,
  httpExample,
  shellExample,
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
  const eh = httpExample(e)
  is("", e.syntax)
  is("http", eh.syntax)
})

test("shellExample() assigns 'shell' to as syntax parameter of REST.Example", () => {
  const e = example()
  const es = shellExample(e)
  is("", e.syntax)
  is("shell", es.syntax)
})

test("queryParametersToString() creates an empty string if query parameters don't exist", () => {
  const req = testRequest()
  const actual = queryParametersToString(req)
  is("", actual)
})

test("queryParametersToString() creates a query parameters string if parameters exist", () => {
  const req = testRequest()
  const qreq = addQueryToTestRequets(req)

  const expect = "?version={version}&doc={doc}&view={view}"
  const actual = queryParametersToString(qreq)
  is(expect, actual)
})

test("createHTTPExample() creates an HTTP example", () => {
  const r = testRequest()
  const req = postTestRequest(r)
  const qp = queryParametersToString(req)

  const expect = "POST /api/2.0/files/file/referencedata HTTP/1.1"
  const actual = createHTTPExample(req, qp).code
  is(expect, actual)
})

test("createHTTPExample() creates an HTTP example with query parameters if exist", () => {
  const r = testRequest()
  const req = postTestRequest(r)
  const qreq = addQueryToTestRequets(req)
  const qp = queryParametersToString(qreq)

  const expect = "POST /api/2.0/files/file/referencedata" +
    "?version={version}&doc={doc}&view={view} HTTP/1.1"
  const actual = createHTTPExample(qreq, qp).code
  is(expect, actual)
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
  const actual = createHTTPExample(hreq, qp).code
  is(expect, actual)
})

test("createCURLExample() creates a CURL example", () => {
  const r = testRequest()
  const req = postTestRequest(r)
  const qp = queryParametersToString(req)

  const expect = "curl -L\n\t-X POST\n\t{host}/api/2.0/files/file/referencedata"
  const actual = createCURLExample(req, qp).code
  is(expect, actual)
})

test("createCURLExample() creates a CURL example with query parameters if exist", () => {
  const r = testRequest()
  const req = postTestRequest(r)
  const qreq = addQueryToTestRequets(req)
  const qp = queryParametersToString(qreq)

  const expect = "curl -L\n\t-X POST\n" +
    "\t{host}/api/2.0/files/file/referencedata?version={version}&doc={doc}&view={view}"
  const actual = createCURLExample(qreq, qp).code
  is(expect, actual)
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
  const actual = createCURLExample(hreq, qp).code
  is(expect, actual)
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
    unreachable('Examples do not exist');
  }

})

function addQueryToTestRequets(r: REST.RequestDeclaration): REST.RequestDeclaration {
  return {...r, queryParameters: [
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
  ]}
}

function addHeadersToTestRequets(r: REST.RequestDeclaration): REST.RequestDeclaration {
  return {...r, headerParameters: [
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
  ]}
}

function postTestRequest(r: REST.RequestDeclaration): REST.RequestDeclaration {
  return {...r, endpoint: "POST /api/2.0/files/file/referencedata"}
}

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

test.run()
