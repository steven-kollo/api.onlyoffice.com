import {test} from "uvu"
import {is} from "uvu/assert"
import {
  tokenNode,
  decoratorToken,
  toDecoratorToken,
  identifierToken,
  toIdentifierToken,
  keywordToken,
  toKeywordToken,
  referenceToken,
  toReferenceToken,
  textToken,
  toTextToken
} from "./tokenizer.ts"

test("tokenNode() creates a TokenNode object with parameters as empty stings", () => {
  const e = tokenNode()
  is("", e.type)
  is("", e.text)
})

test("decoratorToken() creates a TokenNode object with type parameter as 'decorator' from basic TokenNode object", () => {
  const e = tokenNode()
  const t = decoratorToken(e)
  is("decorator", t.type)
})

test("toDecoratorToken() creates a TextToken object with type parameter as 'decorator'", () => {
  const t = toDecoratorToken()
  is("decorator", t.type)
})

test("identifierToken() creates a TokenNode object with type parameter as 'identifier' from basic TokenNode object", () => {
  const e = tokenNode()
  const t = identifierToken(e)
  is("identifier", t.type)
})

test("toIdentifierToken() creates a TextToken object with type parameter as 'identifier'", () => {
  const t = toIdentifierToken()
  is("identifier", t.type)
})

test("keywordToken() creates a TokenNode object with type parameter as 'keyword' from basic TokenNode object", () => {
  const e = tokenNode()
  const t = keywordToken(e)
  is("keyword", t.type)
})

test("toKeywordToken() creates a TextToken object with type parameter as 'keyword'", () => {
  const t = toKeywordToken()
  is("keyword", t.type)
})

test("referenceToken() creates a ReferenceToken object with type parameter as 'reference' from basic TokenNode object", () => {
  const e = tokenNode()
  const r = referenceToken(e)
  is("reference", r.type)
})

test("toReferenceToken() creates a ReferenceToken object with type parameter as 'reference'", () => {
  const r = toReferenceToken()
  is("reference", r.type)
})

test("textToken() creates a TokenNode object with type parameter as 'text' from basic TokenNode object", () => {
  const e = tokenNode()
  const t = textToken(e)
  is("text", t.type)
})

test("toTextToken() creates a TextToken object with type parameter as 'text'", () => {
  const t = toTextToken()
  is("text", t.type)
})

test.run()
