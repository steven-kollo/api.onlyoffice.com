interface ArrayDeclaration extends BuiltinDeclaration {
  id: "_array"
}

interface LiteralDeclaration extends BuiltinDeclaration {
  id: "_literal"
}

interface ObjectDeclaration extends BuiltinDeclaration {
  id: "_object"
}

interface OptionalDeclaration extends BuiltinDeclaration {
  id: "_optional"
}

interface ReadonlyDeclaration extends BuiltinDeclaration {
  id: "_readonly"
}

interface RecordDeclaration extends BuiltinDeclaration {
  id: "_record"
}

interface SetonlyDeclaration extends BuiltinDeclaration {
  id: "_setonly"
}

interface UnionDeclaration extends BuiltinDeclaration {
  id: "_union"
}

interface BuiltinDeclaration extends Declaration {
  kind: "builtin"
}

interface Declaration {
  id: string
  // meta: DeclarationMeta

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
  // package: string // ex: /word/apiBuilder.js, or main
  // todo
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

export {
  BuiltinDeclaration,
  ArrayDeclaration,
  LiteralDeclaration,
  ObjectDeclaration,
  OptionalDeclaration,
  ReadonlyDeclaration,
  RecordDeclaration,
  SetonlyDeclaration,
  UnionDeclaration,
  Declaration,
  DeclarationContent,
  DeclarationSyntax,
  DeclarationKind,
  DeclarationType,
  DeclarationValue,
}
