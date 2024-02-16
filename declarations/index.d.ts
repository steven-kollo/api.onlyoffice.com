// todo: split into JS*Type and UniversalType. JSDeclaration, UniversalDeclaration.
// constructors have only js classes

interface RESTEntity {
  // id: string
  // title: string
  // summary?: string
  // description?: string
  type: RESTEntityType
}

type RESTEntityType = RESTEntityTypeMap[keyof RESTEntityTypeMap]

interface RESTEntityTypeMap {
  array: RESTArrayType
  enum: RESTEnumType
  nullable: RESTNullableType
  object: RESTObjectType
  primitive: RESTPrimitiveType
  reference: RESTReferenceType
  union: RESTUnionType
}

interface RESTArrayType extends RESTTypeNode {
  type: "array"
  items: RESTEntityType[]
}

interface RESTEnumType extends RESTTypeNode {
  type: "enum"
  // cases
}

interface RESTNullableType extends RESTTypeNode {
  type: "nullable"
  children: RESTEntityType
}

interface RESTObjectType extends RESTTypeNode {
  type: "object"
  // properties
}

interface RESTPrimitiveType extends RESTTypeNode {
  type: "primitive"
  value: "boolean" | "integer" | "null" | "number" | "string"
  format?: string
}

interface RESTReferenceType extends RESTTypeNode {
  type: "reference"
  id: string
}

interface RESTUnionType extends RESTTypeNode {
  type: "union"
  // types:
}

interface RESTTypeNode {
  type: string
  description?: string
}

type Declaration = DeclarationMap[keyof DeclarationMap]

interface DeclarationMap {
  alias: AliasDeclaration

  class: ClassDeclaration
  constructor: ConstructorDeclaration
  initializer: InitializerDeclaration
  instanceMethod: InstanceMethodDeclaration
  instanceProperty: InstancePropertyDeclaration
  typeMethod: TypeMethodDeclaration
  typeProperty: TypePropertyDeclaration

  event: EventDeclaration

  object: ObjectDeclaration
  method: MethodDeclaration
  property: PropertyDeclaration

  type: TypeDeclaration
}

// todo: kind: constant, enum, interface, variable, etc.

interface AliasDeclaration extends DeclarationNode {
  kind: "alias"
  type: DeclarationType
}

interface ClassDeclaration extends DeclarationNode {
  kind: "class"
  constructors?: ReferenceType[]
  events?: ReferenceType[]
  extends?: ReferenceType[] // todo: what about built-in classes?
  implements?: ReferenceType[]
  initializers?: ReferenceType[]
  instanceMethods?: ReferenceType[]
  instanceProperties?: ReferenceType[]
  typeMethods?: ReferenceType[]
  typeProperties?: ReferenceType[]
}

interface ConstructorDeclaration extends DeclarationNode {
  kind: "constructor"
  type: FunctionType
}

interface EventDeclaration extends DeclarationNode {
  kind: "event"
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

interface TypeDeclaration extends DeclarationNode {
  kind: "type"
  type: DeclarationType
}

interface TypeMethodDeclaration extends DeclarationNode {
  kind: "typeMethod"
  type: FunctionType
}

interface TypePropertyDeclaration extends DeclarationNode {
  kind: "typeProperty"
  type: DeclarationType
}

interface DeclarationNode {
  id: string
  meta: DeclarationMeta
  identifier: string
  title: string
  summary?: string
  description?: string
  kind: string
  parent?: DeclarationParent
  signature: DeclarationToken[]
  examples?: string[]
}

interface DeclarationMeta {
  package: string
}

interface DeclarationParent {
  id: string
  identifier: string
}

// todo: StringValue...

interface DeclarationValue {
  name: string
  type: DeclarationType
  description?: string
  default?: bigint | boolean | number | string | symbol
  // todo: example?: unknown
}

interface DeclarationReturns {
  type: DeclarationType
  description?: string
}

type DeclarationType = DeclarationTypeMap[keyof DeclarationTypeMap]

interface DeclarationTypeMap {
  array: ArrayType
  function: FunctionType
  literal: LiteralType
  nullable: NullableType
  object: ObjectType
  optional: OptionalType
  primitive: PrimitiveType
  readonly: ReadonlyType
  record: RecordType
  reference: ReferenceType
  setonly: SetonlyType
  union: UnionType
  unknown: UnknownType
}

interface PrimitiveType extends TypeNode {
  type: "primitive"
  name: "bigint" | "boolean" | "number" | "string" | "symbol"
}

interface LiteralType extends TypeNode {
  type: "literal"
  value: bigint | boolean | null | number | string | symbol | undefined
}

interface NullableType extends TypeNode {
  type: "nullable"
}

interface ArrayType extends ParentType {
  type: "array"
}

interface FunctionType extends TypeNode {
  type: "function"
  parameters?: DeclarationValue[]
  returns?: DeclarationReturns
}

interface ObjectType extends TypeNode {
  type: "object"
  methods?: FunctionType[]
  properties?: DeclarationType[]
}

interface OptionalType extends ParentType {
  type: "optional"
}

interface ReadonlyType extends ParentType {
  type: "readonly"
}

interface RecordType extends ParentType {
  type: "record"
}

interface ReferenceType extends TypeNode {
  type: "reference"
  id: string
  identifier: string
}

interface SetonlyType extends ParentType {
  type: "setonly"
}

interface UnionType extends ParentType {
  type: "union"
}

interface UnknownType extends TypeNode {
  type: "unknown"
}

interface ParentType extends TypeNode {
  children: DeclarationType[]
}

interface TypeNode {
  type: string
}

export {
  AliasDeclaration,
  ArrayType,
  ClassDeclaration,
  ConstructorDeclaration,
  Declaration,
  DeclarationMap,
  DeclarationMeta,
  DeclarationNode,
  DeclarationParent,
  DeclarationReturns,
  DeclarationType,
  DeclarationTypeMap,
  DeclarationValue,
  EventDeclaration,
  FunctionType,
  InitializerDeclaration,
  InstanceMethodDeclaration,
  InstancePropertyDeclaration,
  MethodDeclaration,
  NullableType,
  ObjectDeclaration,
  ObjectType,
  OptionalType,
  ParentType,
  PropertyDeclaration,
  ReadonlyType,
  RecordType,
  ReferenceType,
  SetonlyType,
  TypeDeclaration,
  TypeMethodDeclaration,
  TypeNode,
  TypePropertyDeclaration,
  UnionType,
  UnknownType
}
