// todo: kind: constant, enum, interface, variable, initializer, alias, etc.

import type { Code } from "./code.ts"
import type { Tokenizer } from "./tokenizer.ts"

export namespace Library {
  export type Declaration = DeclarationMap[keyof DeclarationMap]

  export interface DeclarationMap {
    class: ClassDeclaration
    constructor: ConstructorDeclaration
    event: EventDeclaration
    instanceMethod: InstanceMethodDeclaration
    instanceProperty: InstancePropertyDeclaration
    method: MethodDeclaration
    property: PropertyDeclaration
    type: TypeDeclaration
    typeMethod: TypeMethodDeclaration
    typeProperty: TypePropertyDeclaration
  }

  export interface ClassDeclaration extends DeclarationNode {
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

  export interface ConstructorDeclaration extends DeclarationNode, FunctionType {
    kind: "constructor"
  }

  export interface EventDeclaration extends DeclarationNode, FunctionType {
    kind: "event"
  }

  export interface InstanceMethodDeclaration extends DeclarationNode, FunctionType {
    kind: "instanceMethod"
  }

  export type InstancePropertyDeclaration = InstancePropertyDeclarationMap[keyof InstancePropertyDeclarationMap]

  export interface InstancePropertyDeclarationMap {
    array: ArrayInstancePropertyDeclaration
    function: FunctionInstancePropertyDeclaration
    object: ObjectInstancePropertyDeclaration
    optional: OptionalInstancePropertyDeclaration
    record: RecordInstancePropertyDeclaration
    reference: ReferenceInstancePropertyDeclaration
    union: UnionInstancePropertyDeclaration
    unknown: UnknownInstancePropertyDeclaration
  }

  export interface ArrayInstancePropertyDeclaration extends InstancePropertyDeclarationNode, ArrayType {}

  export interface FunctionInstancePropertyDeclaration extends InstancePropertyDeclarationNode, FunctionType {}

  export interface ObjectInstancePropertyDeclaration extends InstancePropertyDeclarationNode, ObjectType {}

  export interface OptionalInstancePropertyDeclaration extends InstancePropertyDeclarationNode, OptionalType {}

  export interface RecordInstancePropertyDeclaration extends InstancePropertyDeclarationNode, RecordType {}

  export interface ReferenceInstancePropertyDeclaration extends InstancePropertyDeclarationNode, ReferenceType {}

  export interface UnionInstancePropertyDeclaration extends InstancePropertyDeclarationNode, UnionType {}

  export interface UnknownInstancePropertyDeclaration extends InstancePropertyDeclarationNode, UnknownType {}

  export interface InstancePropertyDeclarationNode {
    kind: "instanceProperty"
  }

  export interface MethodDeclaration extends DeclarationNode, FunctionType {
    kind: "method"
  }

  export type PropertyDeclaration = PropertyDeclarationMap[keyof PropertyDeclarationMap]

  export interface PropertyDeclarationMap {
    array: ArrayPropertyDeclaration
    function: FunctionPropertyDeclaration
    object: ObjectPropertyDeclaration
    optional: OptionalPropertyDeclaration
    record: RecordPropertyDeclaration
    reference: ReferencePropertyDeclaration
    union: UnionPropertyDeclaration
    unknown: UnknownPropertyDeclaration
  }

  export interface ArrayPropertyDeclaration extends PropertyDeclarationNode, ArrayType {}

  export interface FunctionPropertyDeclaration extends PropertyDeclarationNode, FunctionType {}

  export interface ObjectPropertyDeclaration extends PropertyDeclarationNode, ObjectType {}

  export interface OptionalPropertyDeclaration extends PropertyDeclarationNode, OptionalType {}

  export interface RecordPropertyDeclaration extends PropertyDeclarationNode, RecordType {}

  export interface ReferencePropertyDeclaration extends PropertyDeclarationNode, ReferenceType {}

  export interface UnionPropertyDeclaration extends PropertyDeclarationNode, UnionType {}

  export interface UnknownPropertyDeclaration extends PropertyDeclarationNode, UnknownType {}

  export interface PropertyDeclarationNode {
    kind: "property"
  }

  export type TypeDeclaration = TypeDeclarationMap[keyof TypeDeclarationMap]

  export interface TypeDeclarationMap {
    array: ArrayTypeDeclaration
    function: FunctionTypeDeclaration
    object: ObjectTypeDeclaration
    optional: OptionalTypeDeclaration
    record: RecordTypeDeclaration
    reference: ReferenceTypeDeclaration
    union: UnionTypeDeclaration
    unknown: UnknownTypeDeclaration
  }

  export interface ArrayTypeDeclaration extends TypeDeclarationNode, ArrayType {}

  export interface FunctionTypeDeclaration extends TypeDeclarationNode, FunctionType {}

  export interface ObjectTypeDeclaration extends TypeDeclarationNode, ObjectType {}

  export interface OptionalTypeDeclaration extends TypeDeclarationNode, OptionalType {}

  export interface RecordTypeDeclaration extends TypeDeclarationNode, RecordType {}

  export interface ReferenceTypeDeclaration extends TypeDeclarationNode, ReferenceType {}

  export interface UnionTypeDeclaration extends TypeDeclarationNode, UnionType {}

  export interface UnknownTypeDeclaration extends TypeDeclarationNode, UnknownType {}

  export interface TypeDeclarationNode {
    kind: "type"
  }

  export interface TypeMethodDeclaration extends DeclarationNode, FunctionType {
    kind: "typeMethod"
  }

  export type TypePropertyDeclaration = TypePropertyDeclarationMap[keyof TypePropertyDeclarationMap]

  export interface TypePropertyDeclarationMap {
    array: ArrayTypePropertyDeclaration
    function: FunctionTypePropertyDeclaration
    object: ObjectTypePropertyDeclaration
    optional: OptionalTypePropertyDeclaration
    record: RecordTypePropertyDeclaration
    reference: ReferenceTypePropertyDeclaration
    union: UnionTypePropertyDeclaration
    unknown: UnknownTypePropertyDeclaration
  }

  export interface ArrayTypePropertyDeclaration extends TypePropertyDeclarationNode, ArrayType {}

  export interface FunctionTypePropertyDeclaration extends TypePropertyDeclarationNode, FunctionType {}

  export interface ObjectTypePropertyDeclaration extends TypePropertyDeclarationNode, ObjectType {}

  export interface OptionalTypePropertyDeclaration extends TypePropertyDeclarationNode, OptionalType {}

  export interface RecordTypePropertyDeclaration extends TypePropertyDeclarationNode, RecordType {}

  export interface ReferenceTypePropertyDeclaration extends TypePropertyDeclarationNode, ReferenceType {}

  export interface UnionTypePropertyDeclaration extends TypePropertyDeclarationNode, UnionType {}

  export interface UnknownTypePropertyDeclaration extends TypePropertyDeclarationNode, UnknownType {}

  export interface TypePropertyDeclarationNode {
    kind: "typeProperty"
  }

  export interface DeclarationNode {
    slug: string
    id: string
    // identifier: string
    title: string
    signature: Tokenizer.Token[]
    summary?: string
    description?: string
    kind: string
    examples?: Code.Example[]
  }

  export type Property = PropertyMap[keyof PropertyMap]

  export interface PropertyMap {
    array: ArrayProperty
    function: FunctionProperty
    object: ObjectProperty
    optional: OptionalProperty
    record: RecordProperty
    reference: ReferenceProperty
    union: UnionProperty
    unknown: UnknownProperty
  }

  export interface ArrayProperty extends PropertyNode, ArrayValue {}

  export interface FunctionProperty extends PropertyNode, FunctionValue {}

  export interface ObjectProperty extends PropertyNode, ObjectValue {}

  export interface OptionalProperty extends PropertyNode, OptionalValue {}

  export interface RecordProperty extends PropertyNode, RecordValue {}

  export interface ReferenceProperty extends PropertyNode, ReferenceValue {}

  export interface UnionProperty extends PropertyNode, UnionValue {}

  export interface UnknownProperty extends PropertyNode, UnknownValue {}

  export interface PropertyNode {
    identifier: string
  }

  export type Value = ValueMap[keyof ValueMap]

  export interface ValueMap {
    array: ArrayValue
    function: FunctionValue
    object: ObjectValue
    optional: OptionalValue
    record: RecordValue
    reference: ReferenceValue
    union: UnionValue
    unknown: UnknownValue
  }

  export interface ArrayValue extends ValueNode, ArrayType {}

  export interface FunctionValue extends ValueNode, FunctionType {}

  export interface ObjectValue extends ValueNode, ObjectType {}

  export interface OptionalValue extends ValueNode, OptionalType {}

  export interface RecordValue extends ValueNode, RecordType {}

  export interface ReferenceValue extends ValueNode, ReferenceType {}

  export interface UnionValue extends ValueNode, UnionType {}

  export interface UnknownValue extends ValueNode, UnknownType {}

  export interface ValueNode {
    description?: string
    // default?: any
  }

  export type Type = TypeMap[keyof TypeMap]

  export interface TypeMap {
    // literal: LiteralType
    // primitive: PrimitiveType
    array: ArrayType
    function: FunctionType
    object: ObjectType
    optional: OptionalType
    record: RecordType
    reference: ReferenceType
    union: UnionType
    unknown: UnknownType
  }

  // export interface PrimitiveType extends TypeNode {
  //   type: "primitive"
  //   name: "bigint" | "boolean" | "number" | "string" | "symbol"
  // }

  // export interface LiteralType extends TypeNode {
  //   type: "literal"
  //   value: bigint | boolean | null | number | string | symbol | undefined
  // }

  export interface ArrayType extends TypeNode {
    type: "array"
    items: Type[]
  }

  export interface FunctionType extends TypeNode {
    type: "function"
    parameters?: Property[]
    returns?: Value
  }

  export interface ObjectType extends TypeNode {
    type: "object"
    methods?: FunctionType[]
    properties?: Property[]
  }

  export interface OptionalType extends TypeNode {
    type: "optional"
    children: Type[]
  }

  export interface RecordType extends TypeNode {
    type: "record"
    children: Type[]
  }

  export interface ReferenceType extends TypeNode {
    type: "reference"
    id: string
  }

  export interface UnionType extends TypeNode {
    type: "union"
    types: Type[]
  }

  export interface UnknownType extends TypeNode {
    type: "unknown"
  }

  export interface TypeNode {
    type: string
  }
}
