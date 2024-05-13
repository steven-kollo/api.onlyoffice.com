import {is} from "uvu/assert"
import {test} from "uvu"
import {firstParagraph, firstSentence, isStringLiteral} from "./main.js"

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

test.run()
