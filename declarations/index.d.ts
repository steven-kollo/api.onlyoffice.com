interface Declaration {
  id: string
  meta: DeclarationMeta

  name: string
  summary?: string
  description?: DeclarationContent

  kind?: Kind
  memberof?: string
  type?: Type
  properties?: DeclarationValue[]
  parameters?: DeclarationValue[]
  returns?: DeclarationValue[]

  examples?: DeclarationContent[]
}

interface DeclarationMeta {
  package: string
}

interface DeclarationContent {
  syntax: Syntax
  text: string
}

type DeclarationSyntax =
  "js" |
  "md" |
  "ts" |
  "txt"

type DeclarationKind =
  "builtin" |
  "class" |
  "event" |
  "function" |
  "package" |
  "typedef"

interface DeclarationType {
  id: string
  value?: unknown
  children?: DeclarationType[]
}

interface DeclarationValue {
  name: string
  description?: DeclarationContent
  type: DeclarationType
  default?: unknown
  // todo: example?: unknown
}

type BuiltinType =
  ArrayType |
  LiteralType |
  ObjectType |
  OptionalType |
  ReadonlyType |
  RecordType |
  SetonlyType |
  UnionType

interface ArrayType extends DeclarationType {
  id: "_array"
}

interface LiteralType extends DeclarationType {
  id: "_literal"
}

interface ObjectType extends DeclarationType {
  id: "_object"
}

interface OptionalType extends DeclarationType {
  id: "_optional"
}

interface ReadonlyType extends DeclarationType {
  id: "_readonly"
}

interface RecordType extends DeclarationType {
  id: "_record"
}

interface SetonlyType extends DeclarationType {
  id: "_setonly"
}

interface UnionType extends DeclarationType {
  id: "_union"
}

export {
  Declaration,
  DeclarationMeta,
  DeclarationContent,
  DeclarationSyntax,
  DeclarationKind,
  DeclarationType,
  DeclarationValue,
  BuiltinType,
  ArrayType,
  LiteralType,
  ObjectType,
  OptionalType,
  ReadonlyType,
  RecordType,
  SetonlyType,
  UnionType
}
