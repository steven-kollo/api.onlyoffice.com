import {REST} from "@onlyoffice/documentation-declarations-types/rest.ts"
import {
  createCURLExample,
  createHTTPExample,
  createRESTExample,
  populateRequestExamples,
  queryParametersToString
} from "./openapi.ts"
import {test} from "uvu"
import * as assert from 'uvu/assert';

const httpExample: REST.Example = {
  syntax: "http",
  code: "POST /api/2.0/files/file/{fileId}/openedit?version={version}&doc={doc}&view={view} HTTP/1.1\nAccept: text/plain, application/json, text/json\nHost: {host}"
}

const curlExample: REST.Example = {
  syntax: "shell",
  code: "curl -L\n  -X POST\n  {host}/api/2.0/files/file/{fileId}/openedit?version={version}&doc={doc}&view={view}\n  -H Accept: text/plain, application/json, text/json"
}

const sample: REST.RequestDeclaration = {
  id: "909343541a82d359cf5cf0950705b1b6",
  kind: "request",
  slug: "files/open-a-file",
  title: "Open a file",
  endpoint: "POST /api/2.0/files/file/{fileId}/openedit",
  description: "Returns the initialization configuration of a file to open it in the editor.",
  headerParameters: [
    {
      "identifier": "Accept",
      "type": "string",
      "cases": [
        "text/plain",
        "application/json",
        "text/json"
      ]
    }
  ],
  pathParameters: [
    {
      "identifier": "fileId",
      "type": "integer",
      "format": "int32",
      "required": true
    }
  ],
  queryParameters: [
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

test("createRESTExample() creates a REST example object with 'code' and 'syntax' parameters as empty stings", () => {
  const e = createRESTExample()
  const expect = ["", ""]
  const actual = [e.code, e.syntax]
  assert.equal(expect, actual)
})

test("queryParametersToString() creates a query parameters string if parameters exist", () => {
  const req: REST.RequestDeclaration = JSON.parse(JSON.stringify(sample))
  const expect = "?version={version}&doc={doc}&view={view}"
  const actual = queryParametersToString(req)
  assert.equal(expect, actual)
})

test("createHTTPExample() creates an HTTP example", () => {
  const req: REST.RequestDeclaration = JSON.parse(JSON.stringify(sample))
  const qp = queryParametersToString(req)
  const expect = httpExample
  const actual = createHTTPExample(req, qp)
  assert.equal(actual, expect)
})

test("createCURLExample() creates a CURL example", () => {
  const req: REST.RequestDeclaration = JSON.parse(JSON.stringify(sample))
  const qp = queryParametersToString(req)
  const expect = curlExample
  const actual = createCURLExample(req, qp)
  assert.equal(actual, expect)
})

test("populateRequestExamples() populates RequestDeclaration with request examples", () => {
  const req: REST.RequestDeclaration = JSON.parse(JSON.stringify(sample))
  populateRequestExamples(req)
  const expect = [httpExample, curlExample]
  const actual = req.examples
  assert.equal(actual, expect)
})

test.run()
