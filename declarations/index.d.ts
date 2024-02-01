// todo: split into JS*Type and UniversalType. JSDeclaration, UniversalDeclaration.
// constructors have only js classes

type Declaration = DeclarationMap[keyof DeclarationMap]

interface DeclarationMap {
  alias: AliasDeclaration
  class: ClassDeclaration
  constructor: ConstructorDeclaration
  event: EventDeclaration
  function: FunctionDeclaration
  initializer: InitializerDeclaration
  instanceMethod: InstanceMethodDeclaration
  instanceProperty: InstancePropertyDeclaration
  method: MethodDeclaration
  object: ObjectDeclaration
  property: PropertyDeclaration
  staticMethod: StaticMethodDeclaration // todo: rename to type*
  staticProperty: StaticPropertyDeclaration // todo: rename to type*
  type: TypeDeclaration
  union: UnionDeclaration
  unknown: UnknownDeclaration
}

// todo: kind: constant, enum, interface, variable, etc.

interface AliasDeclaration extends DeclarationNode {
  kind: "alias"
  type: DeclarationType
}

interface ClassDeclaration extends DeclarationNode {
  kind: "class"
  constructors?: CustomType[]
  events?: CustomType[]
  extends?: CustomType[] // todo: what about built-in classes?
  implements?: CustomType[]
  initializers?: CustomType[]
  instanceMethods?: CustomType[]
  instanceProperties?: CustomType[]
  staticMethods?: CustomType[]
  staticProperties?: CustomType[]
}

interface ConstructorDeclaration extends DeclarationNode {
  kind: "constructor"
  type: FunctionType
}

interface EventDeclaration extends DeclarationNode {
  kind: "event"
  type: FunctionType
}

interface FunctionDeclaration extends DeclarationNode {
  kind: "function"
  type: FunctionType
}

interface InitializerDeclaration extends DeclarationNode {
  kind: "initializer"
  type: FunctionType
}

interface InstanceMethodDeclaration extends DeclarationNode {
  kind: "instanceMethod"
  type: FunctionType
}

interface InstancePropertyDeclaration extends DeclarationNode {
  kind: "instanceProperty"
  type: DeclarationType
}

interface MethodDeclaration extends DeclarationNode {
  kind: "method"
  type: FunctionType
}

interface ObjectDeclaration extends DeclarationNode {
  kind: "object"
  type: ObjectType
}

interface PropertyDeclaration extends DeclarationNode {
  kind: "property"
  type: DeclarationType
}

interface StaticMethodDeclaration extends DeclarationNode {
  kind: "staticMethod"
  type: FunctionType
}

interface StaticPropertyDeclaration extends DeclarationNode {
  kind: "staticProperty"
  type: DeclarationType
}

interface TypeDeclaration extends DeclarationNode {
  kind: "type"
  type: DeclarationType
}

interface UnionDeclaration extends DeclarationNode {
  kind: "union"
  type: UnionType
}

interface UnknownDeclaration extends DeclarationNode {
  kind: "unknown"
  type: UnknownType
}

interface DeclarationNode {
  id: string
  meta: DeclarationMeta
  name: string
  summary?: string
  description?: DeclarationContent
  kind: string
  type: DeclarationType
  parent?: DeclarationParent
  examples?: DeclarationContent[]
}

interface DeclarationMeta {
  package: string
}

interface DeclarationParent {
  id: string
}

// todo: StringValue...

interface DeclarationValue {
  name: string
  description?: DeclarationContent
  type: DeclarationType
  default?: bigint | boolean | number | string | symbol
  // todo: example?: unknown
}

type DeclarationContent = DeclarationContentMap[keyof DeclarationContentMap]

interface DeclarationContentMap {
  js: JavaScriptContent
  md: MarkdownContent
  ts: TypeScriptContent
  txt: TextContent
}

interface JavaScriptContent extends ContentNode {
  syntax: "js"
}

interface MarkdownContent extends ContentNode {
  syntax: "md"
}

interface TypeScriptContent extends ContentNode {
  syntax: "ts"
}

interface TextContent extends ContentNode {
  syntax: "txt"
}

interface ContentNode {
  text: string
}

type DeclarationType = DeclarationTypeMap[keyof DeclarationTypeMap]

interface DeclarationTypeMap {
  array: ArrayType
  bigint: BigIntType
  bigintLiteral: BigIntLiteral
  boolean: BooleanType
  booleanLiteral: BooleanLiteral
  custom: CustomType
  function: FunctionType
  null: NullType
  number: NumberType
  numberLiteral: NumberLiteral
  object: ObjectType
  optional: OptionalType
  readonly: ReadonlyType
  record: RecordType
  setonly: SetonlyType
  string: StringType
  stringLiteral: StringLiteral
  symbol: SymbolType
  symbolLiteral: SymbolLiteral
  undefined: UndefinedType
  union: UnionType
  unknown: UnknownType
}

interface ArrayType extends ParentType {
  name: "array"
}

interface BigIntType extends TypeNode {
  name: "bigint"
}

interface BigIntLiteral extends TypeNode {
  name: "bigintLiteral",
  value: bigint
}

interface BooleanType extends TypeNode {
  name: "boolean"
}

interface BooleanLiteral extends TypeNode {
  name: "booleanLiteral",
  value: boolean
}

interface CustomType extends TypeNode {
  name: "custom"
  id: string
}

interface FunctionType extends TypeNode {
  name: "function"
  parameters?: DeclarationValue[]
  returns?: DeclarationType
}

interface NullType extends TypeNode {
  name: "null"
}

interface NumberType extends TypeNode {
  name: "number"
}

interface NumberLiteral extends TypeNode {
  name: "numberLiteral",
  value: number
}

interface ObjectType extends TypeNode {
  name: "object"
  methods?: FunctionType[]
  properties?: DeclarationType[]
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

interface StringType extends TypeNode {
  name: "string"
}

interface StringLiteral extends TypeNode {
  name: "stringLiteral",
  value: string
}

interface SymbolType extends TypeNode {
  name: "symbol"
}

interface SymbolLiteral extends TypeNode {
  name: "symbolLiteral",
  value: symbol
}

interface UndefinedType extends TypeNode {
  name: "undefined"
}

interface UnionType extends ParentType {
  name: "union"
}

interface UnknownType extends TypeNode {
  name: "unknown"
}

interface ParentType extends TypeNode {
  children: DeclarationType[]
}

interface TypeNode {
  name: string
}

export {
  AliasDeclaration,
  ArrayType,
  BigIntLiteral,
  BigIntType,
  BooleanLiteral,
  BooleanType,
  ClassDeclaration,
  ConstructorDeclaration,
  ContentNode,
  CustomType,
  Declaration,
  DeclarationContent,
  DeclarationContentMap,
  DeclarationMap,
  DeclarationMeta,
  DeclarationNode,
  DeclarationParent,
  DeclarationType,
  DeclarationTypeMap,
  DeclarationValue,
  EventDeclaration,
  FunctionDeclaration,
  FunctionType,
  InitializerDeclaration,
  InstanceMethodDeclaration,
  InstancePropertyDeclaration,
  JavaScriptContent,
  MarkdownContent,
  MethodDeclaration,
  NullType,
  NumberLiteral,
  NumberType,
  ObjectDeclaration,
  ObjectType,
  OptionalType,
  ParentType,
  PropertyDeclaration,
  ReadonlyType,
  RecordType,
  SetonlyType,
  StaticMethodDeclaration,
  StaticPropertyDeclaration,
  StringLiteral,
  StringType,
  SymbolLiteral,
  SymbolType,
  TextContent,
  TypeDeclaration,
  TypeNode,
  TypeScriptContent,
  UndefinedType,
  UnionDeclaration,
  UnionType,
  UnknownDeclaration,
  UnknownType
}
