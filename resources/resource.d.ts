interface Declaration {
  id: string

  name: string
  summary?: string
  description?: Content
  // permalink?: string

  kind?: Kind
  memberof?: string
  type?: Type[]
  properties?: Value[]
  parameters?: Value[]
  returns?: Value[]

  signatures?: Content[]
  examples?: Content[]
}

interface Content {
  syntax?: Syntax
  text: string
}

type Syntax = "js" | "md" | "txt"

type Kind = "class" | "event" | "function" | "package" | "typedef"

interface Type {
  id: string
  name: string
  children?: Type[]
}

interface Value {
  name: string
  description?: string
  optional?: boolean
  type: Type[]
  default?: unknown // string | number | boolean, force string?
}

export {
  Declaration,
  Content,
  Syntax,
  Kind,
  Type,
  Value
}
