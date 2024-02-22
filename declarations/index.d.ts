// todo: split into JS*Type and UniversalType. JSDeclaration, UniversalDeclaration.
// constructors have only js classes

// export interface RESTEntity {
//   // id: string
//   // title: string
//   // summary?: string
//   // description?: string
//   type: RESTEntityType
// }

// export type RESTEntityType = RESTEntityTypeMap[keyof RESTEntityTypeMap]

// export interface RESTEntityTypeMap extends RESTEntityPrimitiveTypeMap {
//   array: RESTArrayType
//   enum: RESTEnumType
//   nullable: RESTNullableType
//   object: RESTObjectType
//   reference: RESTReferenceType
//   union: RESTUnionType
// }

// export interface RESTArrayType extends RESTTypeNode {
//   type: "array"
//   items: RESTEntityType
// }

// export interface RESTNullableType extends RESTTypeNode {
//   type: "nullable"
//   children: RESTEntityType
// }

// export interface RESTObjectType extends RESTTypeNode {
//   type: "object"
//   properties: (RESTEntityType & { identifier: string })[]
// }

// export interface RESTReferenceType extends RESTTypeNode {
//   type: "reference"
//   id: string
// }

// export interface RESTUnionType extends RESTTypeNode {
//   type: "union"
//   types: RESTEntityType[]
// }

// // EnumType

// export type RESTEnumerationType = RESTEnumerationTypeMap[keyof RESTEnumerationTypeMap]

// export interface RESTEnumerationTypeMap {
//   boolean: RESTBooleanEnumerationType
//   integer: RESTIntegerEnumerationType
//   number: RESTNumberEnumerationType
//   string: RESTStringEnumerationType
// }

// export interface RESTBooleanEnumerationType extends RESTEnumerationTypeNode {
//   cases: boolean[]
// }

// export interface RESTIntegerEnumerationType extends RESTEnumerationTypeNode {
//   cases: number[]
// }

// export interface RESTNumberEnumerationType extends RESTEnumerationTypeNode {
//   cases: number[]
// }

// export interface RESTStringEnumerationType extends RESTEnumerationTypeNode {
//   cases: string[]
// }

// export interface RESTEnumerationTypeNode extends RESTTypeNode {
//   type: "enum"
//   cases: unknown[]
// }

// // // LiteralType

// // export interface RESTLiteralType extends RESTTypeNode {
// //   type: "literal"
// //   value: RESTLiteralValue
// // }

// // export type RESTLiteralValue = RESTLiteralValueMap[keyof RESTLiteralValueMap]

// // export interface RESTLiteralValueMap {
// //   boolean: RESTBooleanLiteralValue
// //   integer: RESTIntegerLiteralValue
// //   number: RESTNumberLiteralValue
// //   string: RESTStringLiteralValue
// // }

// // export interface RESTBooleanLiteralValue extends RESTBooleanType {
// //   value: boolean
// // }

// // export interface RESTIntegerLiteralValue extends RESTIntegerType {
// //   value: number
// // }

// // export interface RESTNumberLiteralValue extends RESTNumberType {
// //   value: number
// // }

// // export interface RESTStringLiteralValue extends RESTStringType {
// //   value: string
// // }

// // PrimitiveType

// export type RESTEntityPrimitiveType = RESTEntityPrimitiveTypeMap[keyof RESTEntityPrimitiveTypeMap]

// export interface RESTEntityPrimitiveTypeMap {
//   boolean: RESTBooleanType
//   integer: RESTIntegerType
//   number: RESTNumberType
//   string: RESTStringType
// }

// export interface RESTBooleanType extends RESTTypeNode {
//   type: "boolean"
//   example?: boolean
// }

// export interface RESTIntegerType extends RESTTypeNode {
//   type: "integer"
//   example?: number
// }

// export interface RESTNumberType extends RESTTypeNode {
//   type: "number"
//   example?: number
// }

// export interface RESTStringType extends RESTTypeNode {
//   type: "string"
//   example?: string
// }

// export interface RESTTypeNode {
//   type: string
//   description?: string
//   example?: unknown
//   format?: string
// }











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
