// https://github.com/jsdoc/jsdoc/blob/21c9f5df97e4a2080b049d2ca45c460c8da76c5b/packages/jsdoc-doclet/lib/schema.js#L202
interface Doclet {
  description?: string
  examples?: string[]
  inherits?: string
  kind?: DocletKind
  longname?: string
  memberof?: string
  meta?: DocletMeta
  name?: string
  nullable?: boolean
  optional?: boolean
  params?: DocletParam[]
  properties?: DocletParam[]
  returns?: DocletParam[]
  scope?: DocletScope
  summary?: string
  type?: DocletType
}

type DocletKind =
  "class" |
  "constant" |
  "event" |
  "external" |
  "file" |
  "function" |
  "interface" |
  "member" |
  "mixin" |
  "module" |
  "namespace" |
  "package" |
  "param" |
  "typedef"

type DocletScope =
  "global" |
  "inner" |
  "instance" |
  "static"

interface DocletMeta {
  columnno?: number
  file?: string // custom
  lineno?: number
}

interface DocletParam {
  defaultvalue?: unknown
  description?: string
  name?: string
  nullable?: boolean
  optional?: boolean
  type?: DocletType
}

interface DocletType {
  parsedType?: DocletCatharsis
}

// https://github.com/hegemonic/catharsis/blob/0.9.0/lib/schema.js
interface DocletCatharsis {
  type?: DocletCatharsisType
  name?: string
  expression?: DocletCatharsis
  applications?: DocletCatharsis[]
  elements?: DocletCatharsis[]
  optional?: boolean
  nullable?: boolean
}

type DocletCatharsisType =
  "AllLiteral" |
  "FieldType" |
  "FunctionType" |
  "NameExpression" |
  "NullLiteral" |
  "RecordType"  |
  "TypeApplication" |
  "TypeUnion" |
  "UndefinedLiteral" |
  "UnknownLiteral"

export {
  Doclet,
  DocletCatharsis,
  DocletKind,
  DocletMeta,
  DocletParam,
  DocletType
}
