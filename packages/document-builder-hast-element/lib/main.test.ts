// import {toHtml} from "hast-util-to-html"
import {equal as eq, is} from "uvu/assert"
import {test} from "uvu"
import {documentBuilder} from "./main.js"

test("initializes a document-builder with correct order of properties", () => {
  const d = documentBuilder()
  const a = Object.keys(d)
  d.data.documentServerURL = "u"
  d.data.command = "hi"
  console.log(d)
  eq(a, ["type", "tagName", "properties", "children", "data"])
})

test("initializes a document-builder with defaults", () => {
  const d = documentBuilder()
  is(d.type, "element")
  is(d.tagName, "document-builder")
  eq(d.properties, {})
  is(d.data.config, undefined)
  eq(d.children, [])
})

test.run()
