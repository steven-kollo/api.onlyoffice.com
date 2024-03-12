export namespace Tokenizer {
  export type Token = TokenMap[keyof TokenMap]

  export interface TokenMap {
    decorator: DecoratorToken
    identifier: IdentifierToken
    keyword: KeywordToken
    reference: ReferenceToken
    text: TextToken
  }

  export interface DecoratorToken extends TokenNode {
    type: "decorator"
  }

  export interface IdentifierToken extends TokenNode {
    type: "identifier"
  }

  export interface KeywordToken extends TokenNode {
    type: "keyword"
  }

  export interface ReferenceToken extends TokenNode {
    type: "reference"
    id: string
  }

  export interface TextToken extends TokenNode {
    type: "text"
  }

  export interface TokenNode {
    type: string
    text: string
  }
}
