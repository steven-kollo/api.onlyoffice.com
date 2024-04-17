import {test} from "uvu"
import * as assert from 'uvu/assert';

import {REST} from "@onlyoffice/documentation-declarations-types/rest.ts"
import {populateRequestExamples, createHeadersParams, createQueryParams, createHTTPExample, createShellExample} from "./openapi.ts"

const httpExample: REST.Example = {
  syntax: "http",
  code: "GET /api/2.0/files/file/{fileId}/openedit?version={version}&doc={doc}&view={view} HTTP/1.1\nAccept: text/plain, application/json, text/json\nHost: {host}"
}

const shellExample: REST.Example = {
  syntax: "shell",
  code: "curl -X GET\n  \"{host}/api/2.0/files/file/{fileId}/openedit?version={version}&doc={doc}&view={view}\"\n  -H \"Accept: text/plain, application/json, text/json\""
}

const sample: REST.RequestDeclaration = {
  id: "909343541a82d359cf5cf0950705b1b6",
  kind: "request",
  slug: "files/open-a-file",
  title: "Open a file",
  endpoint: "GET /api/2.0/files/file/{fileId}/openedit",
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

test("create header params", () => {
  const req: REST.RequestDeclaration = JSON.parse(JSON.stringify(sample))
  assert.is(createHeadersParams(req)[0], '\nAccept: text/plain, application/json, text/json')
  delete req.headerParameters
  assert.is(createHeadersParams(req).length, 0)
})

test("create query params", () => {
  const req: REST.RequestDeclaration = JSON.parse(JSON.stringify(sample))
  assert.is(createQueryParams(req), "?version={version}&doc={doc}&view={view}")
  delete req.queryParameters
  assert.is(createQueryParams(req), "")
})

test("create http example", () => {
  const req: REST.RequestDeclaration = JSON.parse(JSON.stringify(sample))
  const hp: string[] = createHeadersParams(req)
  const qp: string = createQueryParams(req)
  const h: string = "{host}"
  const e: REST.Example = createHTTPExample(req, hp, qp, h)

  assert.equal(e, httpExample)
})

test("create shell example", () => {
  const req: REST.RequestDeclaration = JSON.parse(JSON.stringify(sample))
  const hp: string[] = createHeadersParams(req)
  const qp: string = createQueryParams(req)
  const h: string = "{host}"
  const e: REST.Example = createShellExample(req, hp, qp, h)

  assert.equal(e, shellExample)
})

test("populate request examples", () => {
  const req: REST.RequestDeclaration = JSON.parse(JSON.stringify(sample))
  populateRequestExamples(req)

  assert.equal(req.examples, [httpExample, shellExample])
})

test.run()
