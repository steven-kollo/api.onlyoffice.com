interface Declaration extends NodeDeclaration {
  id: string
  meta: DeclarationMeta
  summary?: string
  parent?: DeclarationParent
  examples?: DeclarationContent[]
}

interface DeclarationMeta {
  package: string
}

interface DeclarationParent {
  id: string
}

interface DeclarationValue extends NodeDeclaration {
  default?: LiteralValue
  // todo: example?: unknown
}

interface NodeDeclaration {
  name: string
  description?: DeclarationContent
  type: DeclarationType
}

type DeclarationContent = DeclarationContentMap[keyof DeclarationContentMap]

interface DeclarationContentMap {
  js: JavaScriptContent
  md: MarkdownContent
  ts: TypeScriptContent
  txt: TextContent
}

interface JavaScriptContent extends NodeContent {
  syntax: "js"
}

interface MarkdownContent extends NodeContent {
  syntax: "md"
}

interface TypeScriptContent extends NodeContent {
  syntax: "ts"
}

interface TextContent extends NodeContent {
  syntax: "txt"
}

interface NodeContent {
  text: string
}

type DeclarationType = DeclarationTypeMap[keyof DeclarationTypeMap]

interface DeclarationTypeMap {
  array: ArrayType
  custom: CustomType
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
  name: "array"
}

interface CustomType extends NodeType {
  name: "custom"
  id: string
}

interface ClassType extends NodeType {
  name: "class"
  constructors?: CustomType[]
  initializers?: CustomType[]
  // staticProperties?: CustomType[]
  properties?: CustomType[]
  // staticMethods?: CustomType[]
  methods?: CustomType[]
  events?: CustomType[]
  extends?: CustomType[] // todo: what about built-in classes?
  implements?: CustomType[]
}

interface ConstructorType extends NodeType {
  name: "constructor"
  parameters?: DeclarationValue[]
}

interface EventType extends NodeType {
  name: "event"
  parameters?: DeclarationValue[]
}

interface FunctionType extends NodeType {
  name: "function"
  parameters?: DeclarationValue[]
  returns?: DeclarationType
}

interface InitializerType extends NodeType {
  name: "initializer"
  parameters?: DeclarationValue[]
}

interface LiteralType extends NodeType {
  name: "literal"
  // todo: remove quotes from string, use typedef to check if it is a string literal
  value: LiteralValue
}

interface MethodType extends FunctionType {
  name: "method"
}

interface ObjectType extends NodeType {
  name: "object"
  properties?: NodeType[]
}

interface OptionalType extends ParentType {
  name: "optional"
}

interface ReadonlyType extends ParentType {
  name: "readonly"
}

interface RecordType extends ParentType {
  name: "record"
}

interface SetonlyType extends ParentType {
  name: "setonly"
}

interface UnionType extends ParentType {
  name: "union"
}

interface UnknownType extends NodeType {
  name: "unknown"
}

interface ParentType extends NodeType {
  children: DeclarationType[]
}

interface NodeType {
  name: string
}

type LiteralValue = bigint | boolean | number | string | symbol

export {
  ArrayType,
  ClassType,
  ConstructorType,
  CustomType,
  Declaration,
  DeclarationContent,
  DeclarationContentMap,
  DeclarationMeta,
  DeclarationParent,
  DeclarationType,
  DeclarationValue,
  EventType,
  FunctionType,
  InitializerType,
  JavaScriptContent,
  LiteralType,
  LiteralValue,
  MarkdownContent,
  MethodType,
  NodeContent,
  NodeDeclaration,
  NodeType,
  ObjectType,
  OptionalType,
  ReadonlyType,
  RecordType,
  SetonlyType,
  TextContent,
  TypeScriptContent,
  UnionType,
  UnknownType
}
