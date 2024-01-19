interface Declaration {
  id: string

  name: string
  summary?: string
  description?: Content
  // permalink?: string

  kind?: Kind
  memberof?: string
  type?: Type
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

type Kind = "builtin" | "class" | "event" | "function" | "package" | "typedef"

interface Type {
  id: string
}

interface Value {
  name: string
  description?: string
  type: Type
  default?: string
}

interface Array extends Type {
  id: "_array"
}

interface Boolean extends Type {
  id: "_boolean"
}

interface Byte extends Type {
  id: "_byte"
}

interface Double extends Type {
  id: "_double"
}

interface Float extends Type {
  id: "_float"
}

interface Int extends Type {
  id: "_int"
}

interface Literal extends Type {
  id: "_literal"
  value: string
}

interface Null extends Type {
  id: "_null"
}

interface Number extends Type {
  id: "_number"
}

interface Object extends Type {
  id: "_object"
}

interface Optional extends Generic {
  id: "_optional"
}

interface Readonly extends Generic {
  id: "_readonly"
}

interface Record extends Generic {
  id: "_record"
}

interface Setonly extends Generic {
  id: "_setonly"
}

interface String extends Type {
  id: "_string"
}

interface Undefined extends Type {
  id: "_undefined"
}

interface Union extends Generic {
  id: "_union"
}

interface Void extends Type {
  id: "_void"
}

interface Generic extends Type {
  children: Type[]
}

export {
  Declaration,
  Content,
  Syntax,
  Kind,
  Type,
  Value,

  Array,
  Boolean,
  Byte,
  Double,
  Float,
  Int,
  Literal,
  Null,
  Number,
  Object,
  Optional,
  Readonly,
  Record,
  Setonly,
  String,
  Undefined,
  Union,
  Void,
  Generic
}
