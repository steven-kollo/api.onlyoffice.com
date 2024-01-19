// @ts-check

/**
 * @typedef {import("./declaration.js").Declaration} TDeclaration
 * @typedef {import("./declaration.js").Array} TArray
 * @typedef {import("./declaration.js").Boolean} TBoolean
 * @typedef {import("./declaration.js").Byte} TByte
 * @typedef {import("./declaration.js").Double} TDouble
 * @typedef {import("./declaration.js").Float} TFloat
 * @typedef {import("./declaration.js").Int} TInt
 * @typedef {import("./declaration.js").Literal} TLiteral
 * @typedef {import("./declaration.js").Null} TNull
 * @typedef {import("./declaration.js").Number} TNumber
 * @typedef {import("./declaration.js").Object} TObject
 * @typedef {import("./declaration.js").Optional} TOptional
 * @typedef {import("./declaration.js").Readonly} TReadonly
 * @typedef {import("./declaration.js").Record} TRecord
 * @typedef {import("./declaration.js").Setonly} TSetonly
 * @typedef {import("./declaration.js").String} TString
 * @typedef {import("./declaration.js").Undefined} TUndefined
 * @typedef {import("./declaration.js").Union} TUnion
 * @typedef {import("./declaration.js").Void} TVoid
 * @typedef {import("./declaration.js").Type} TType
 */

/** @type {TDeclaration & { id: TArray["id"] }} */
const Array = {
  id: "_array",
  name: "Array",
  kind: "builtin"
}

/** @type {TDeclaration & { id: TBoolean["id"] }} */
const Boolean = {
  id: "_boolean",
  name: "Boolean",
  kind: "builtin"
}

/** @type {TDeclaration & { id: TByte["id"] }} */
const Byte = {
  id: "_byte",
  name: "Byte",
  kind: "builtin"
}

/** @type {TDeclaration & { id: TDouble["id"] }} */
const Double = {
  id: "_double",
  name: "Double",
  kind: "builtin"
}

/** @type {TDeclaration & { id: TFloat["id"] }} */
const Float = {
  id: "_float",
  name: "Float",
  kind: "builtin"
}

/** @type {TDeclaration & { id: TInt["id"] }} */
const Int = {
  id: "_int",
  name: "Int",
  kind: "builtin"
}

/** @type {TDeclaration & { id: TLiteral["id"] }} */
const Literal = {
  id: "_literal",
  name: "Literal",
  kind: "builtin"
}

/** @type {TDeclaration & { id: TNull["id"] }} */
const Null = {
  id: "_null",
  name: "Null",
  kind: "builtin"
}

/** @type {TDeclaration & { id: TNumber["id"] }} */
const Number = {
  id: "_number",
  name: "Number",
  kind: "builtin"
}

/** @type {TDeclaration & { id: TObject["id"] }} */
const Object = {
  id: "_object",
  name: "Object",
  kind: "builtin"
}

/** @type {TDeclaration & { id: TOptional["id"] }} */
const Optional = {
  id: "_optional",
  name: "Optional",
  kind: "builtin"
}

/** @type {TDeclaration & { id: TReadonly["id"] }} */
const Readonly = {
  id: "_readonly",
  name: "Readonly",
  kind: "builtin"
}

/** @type {TDeclaration & { id: TRecord["id"] }} */
const Record = {
  id: "_record",
  name: "Record",
  kind: "builtin"
}

/** @type {TDeclaration & { id: TSetonly["id"] }} */
const Setonly = {
  id: "_setonly",
  name: "Setonly",
  kind: "builtin"
}

/** @type {TDeclaration & { id: TString["id"] }} */
const String = {
  id: "_string",
  name: "String",
  kind: "builtin"
}

/** @type {TDeclaration & { id: TUndefined["id"] }} */
const Undefined = {
  id: "_undefined",
  name: "Undefined",
  kind: "builtin"
}

/** @type {TDeclaration & { id: TUnion["id"] }} */
const Union = {
  id: "_union",
  name: "Union",
  kind: "builtin"
}

/** @type {TDeclaration & { id: TVoid["id"] }} */
const Void = {
  id: "_void",
  name: "Void",
  kind: "builtin"
}

/**
 * @param {TDeclaration | TType} t
 */
function isBuiltin(t) {
  return (
    t.id === Array.id ||
    t.id === Boolean.id ||
    t.id === Byte.id ||
    t.id === Double.id ||
    t.id === Float.id ||
    t.id === Int.id ||
    t.id === Literal.id ||
    t.id === Null.id ||
    t.id === Number.id ||
    t.id === Object.id ||
    t.id === Optional.id ||
    t.id === Readonly.id ||
    t.id === Record.id ||
    t.id === Setonly.id ||
    t.id === String.id ||
    t.id === Undefined.id ||
    t.id === Union.id ||
    t.id === Void.id
  )
}

export {
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
  isBuiltin
}
