interface Declaration {
  id: string
  meta: DeclarationMeta

  name: string
  summary?: string
  description?: DeclarationContent

  memberOf?: DeclarationMemberOf
  type: DeclarationType

  examples?: DeclarationContent[]
}

interface DeclarationMeta {
  package: string
}

interface DeclarationContent {
  syntax: DeclarationSyntax
  text: string
}

type DeclarationSyntax = "js" | "md" | "ts" | "txt"

interface DeclarationMemberOf {
  id: string
}

type DeclarationType = DeclarationTypeMap[keyof DeclarationTypeMap]

interface DeclarationValue {
  name: string
  description?: DeclarationContent
  type: DeclarationType
  default?: unknown
  // todo: example?: unknown
}

interface DeclarationTypeMap {
  array: ArrayType
  class: ClassType
  constructor: ConstructorType
  event: EventType
  function: FunctionType
  initializer: InitializerType
  literal: LiteralType
  method: MethodType
  object: ObjectType
  optional: OptionalType
  readonly: ReadonlyType
  record: RecordType
  setonly: SetonlyType
  union: UnionType
  unknown: UnknownType
}

// todo: split into JS*Type and UniversalType. JSDeclaration, UniversalDeclaration.
// constructors have only js classes

interface ArrayType extends ParentType {
  id: "array"
}

interface CustomType extends NodeType {
  id: "custom"
}

interface ClassType extends NodeType {
  id: "class"
  // extends?: NodeType
  // implements?: NodeType[]
  constructors: NodeType[]
  // initializers?: NodeType[]
  properties?: NodeType[]
  methods?: NodeType[]
}

interface ConstructorType extends NodeType {
  id: "constructor"
  parameters?: DeclarationValue[]
}

interface EventType extends NodeType {
  id: "event"
  parameters?: DeclarationValue[]
}

interface FunctionType extends NodeType {
  id: "function"
  parameters?: DeclarationValue[]
  returns?: DeclarationValue[]
}

interface InitializerType extends NodeType {
  id: "initializer"
  parameters?: DeclarationValue[]
}

interface LiteralType extends NodeType {
  id: "literal"
  // todo: remove quotes from string, use typedef to check if it is a string literal
  value: bigint | boolean | number | string | symbol
}

interface MethodType extends FunctionType {
  id: "method"
}

interface ObjectType extends NodeType {
  id: "object"
  properties?: NodeType[]
}

interface OptionalType extends ParentType {
  id: "optional"
}

interface ReadonlyType extends ParentType {
  id: "readonly"
}

interface RecordType extends ParentType {
  id: "record"
}

interface SetonlyType extends ParentType {
  id: "setonly"
}

interface UnionType extends ParentType {
  id: "union"
}

interface UnknownType extends NodeType {
  id: "unknown"
}

interface ParentType extends NodeType {
  children: DeclarationType[]
}

interface NodeType {
  id: string
}

export {
  ArrayType,
  ClassType,
  ConstructorType,
  CustomType,
  Declaration,
  DeclarationContent,
  DeclarationMeta,
  DeclarationSyntax,
  DeclarationType,
  DeclarationValue,
  EventType,
  FunctionType,
  InitializerType,
  LiteralType,
  MethodType,
  NodeType,
  ObjectType,
  OptionalType,
  ReadonlyType,
  RecordType,
  SetonlyType,
  UnionType,
  UnknownType
}
