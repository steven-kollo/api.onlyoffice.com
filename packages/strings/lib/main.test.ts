import {is} from "uvu/assert"
import {test} from "uvu"
import {
  firstParagraph,
  firstSentence,
  isStringLiteral,
  selectSection,
  uniqString
} from "./main.js"

test("firstParagraph() returns an empty string for an empty content", () => {
  const e = firstParagraph("")
  is(e, "")
})

test("firstParagraph() returns a first paragraph for a content with a single paragraph", () => {
  const e = firstParagraph("a")
  is(e, "a")
})

test("firstParagraph() returns a first paragraph for a content with multiple paragraphs", () => {
  const e = firstParagraph("a\n\nb")
  is(e, "a")
})

test("firstParagraph() returns a first paragraph for a content with a heading", () => {
  const e = firstParagraph("# h\n\na\n\nb")
  is(e, "a")
})

test("selectSection() returns an empty string for an empty title", () => {
  const e = selectSection("", "c")
  is(e, "")
})

test("selectSection() returns an empty string for an empty content", () => {
  const e = selectSection("t", "")
  is(e, "")
})

test("selectSection() returns an empty string for a title not found in the content", () => {
  const e = selectSection("t", "c")
  is(e, "")
})

test("selectSection() returns a section for a title found in the content", () => {
  const e = selectSection("t", "## t\n\nc")
  is(e, "c")
})

test("selectSection() returns a section for a title found in the content with multiple sections", () => {
  const e = selectSection("t", "## t\n\nc\n\n## g\n\nd")
  is(e, "c")
})

test("selectSection() returns the first section for a title found multiple times in the content", () => {
  const e = selectSection("t", "## t\n\nc\n\n## t\n\nd")
  is(e, "c")
})

test("firstSentence() returns an empty string for an empty content", () => {
  const e = firstSentence("")
  is(e, "")
})

test("firstSentence() returns a first sentence for a content with a single sentence", () => {
  const e = firstSentence("a.")
  is(e, "a.")
})

test("firstSentence() returns a first sentence for a content with multiple sentences", () => {
  const e = firstSentence("a. b.")
  is(e, "a.")
})

test("isStringLiteral() returns false for an empty string", () => {
  const e = isStringLiteral("")
  is(e, false)
})

test("isStringLiteral() returns false for a string without quotes", () => {
  const e = isStringLiteral("s")
  is(e, false)
})

test("isStringLiteral() returns true for a string with double quotes", () => {
  const e = isStringLiteral('"s"')
  is(e, true)
})

test("isStringLiteral() returns true for a string with single quotes", () => {
  const e = isStringLiteral("'s'")
  is(e, true)
})

test("uniqString() returns a string", () => {
  const s = uniqString()
  is(typeof s, "string")
})

test("uniqString() returns a unique string", () => {
  const a = uniqString()
  const b = uniqString()
  is.not(a, b)
})

test("uniqString() returns a base64 string", () => {
  const s = uniqString()
  is(s, btoa(atob(s)))
})

test("uniqString() returns a string with a word character in the first position", () => {
  const r = /^[A-Za-z]/

  let s = uniqString()
  is(r.test(s[0]), true)

  s = `1${s.slice(1)}`
  is(r.test(s[0]), false)
})

test.run()
