// @ts-check

/**
 * @typedef {import("./resource.js").Declaration} Declaration
 * @typedef {import("./resource.d.ts").Array} RArray
 * @typedef {import("./resource.d.ts").Boolean} RBoolean
 * @typedef {import("./resource.d.ts").Double} RDouble
 * @typedef {import("./resource.d.ts").Float} RFloat
 * @typedef {import("./resource.d.ts").Int} RInt
 * @typedef {import("./resource.d.ts").Literal} RLiteral
 * @typedef {import("./resource.d.ts").Null} RNull
 * @typedef {import("./resource.d.ts").Number} RNumber
 * @typedef {import("./resource.d.ts").Object} RObject
 * @typedef {import("./resource.d.ts").Optional} ROptional
 * @typedef {import("./resource.d.ts").Or} ROr
 * @typedef {import("./resource.d.ts").Readonly} RReadonly
 * @typedef {import("./resource.d.ts").Record} RRecord
 * @typedef {import("./resource.d.ts").Setonly} RSetonly
 * @typedef {import("./resource.d.ts").String} RString
 * @typedef {import("./resource.d.ts").Undefined} RUndefined
 * @typedef {import("./resource.d.ts").Void} RVoid
 */

/** @type {Declaration & { id: RArray["id"] }} */
const Array = {
  id: "_array",
  name: "Array",
  kind: "builtin"
}

/** @type {Declaration & { id: RBoolean["id"] }} */
const Boolean = {
  id: "_boolean",
  name: "Boolean",
  kind: "builtin"
}

/** @type {Declaration & { id: RDouble["id"] }} */
const Double = {
  id: "_double",
  name: "Double",
  kind: "builtin"
}

/** @type {Declaration & { id: RFloat["id"] }} */
const Float = {
  id: "_float",
  name: "Float",
  kind: "builtin"
}

/** @type {Declaration & { id: RInt["id"] }} */
const Int = {
  id: "_int",
  name: "Int",
  kind: "builtin"
}

/** @type {Declaration & { id: RLiteral["id"] }} */
const Literal = {
  id: "_literal",
  name: "Literal",
  kind: "builtin"
}

/** @type {Declaration & { id: RNull["id"] }} */
const Null = {
  id: "_null",
  name: "Null",
  kind: "builtin"
}

/** @type {Declaration & { id: RNumber["id"] }} */
const Number = {
  id: "_number",
  name: "Number",
  kind: "builtin"
}

/** @type {Declaration & { id: RObject["id"] }} */
const Object = {
  id: "_object",
  name: "Object",
  kind: "builtin"
}

/** @type {Declaration & { id: ROptional["id"] }} */
const Optional = {
  id: "_optional",
  name: "Optional",
  kind: "builtin"
}

/** @type {Declaration & { id: ROr["id"] }} */
const Or = {
  id: "_or",
  name: "Or",
  kind: "builtin"
}

/** @type {Declaration & { id: RReadonly["id"] }} */
const Readonly = {
  id: "_readonly",
  name: "Readonly",
  kind: "builtin"
}

/** @type {Declaration & { id: RRecord["id"] }} */
const Record = {
  id: "_record",
  name: "Record",
  kind: "builtin"
}

/** @type {Declaration & { id: RSetonly["id"] }} */
const Setonly = {
  id: "_setonly",
  name: "Setonly",
  kind: "builtin"
}

/** @type {Declaration & { id: RString["id"] }} */
const String = {
  id: "_string",
  name: "String",
  kind: "builtin"
}

/** @type {Declaration & { id: RUndefined["id"] }} */
const Undefined = {
  id: "_undefined",
  name: "Undefined",
  kind: "builtin"
}

/** @type {Declaration & { id: RVoid["id"] }} */
const Void = {
  id: "_void",
  name: "Void",
  kind: "builtin"
}

export {
  Array,
  Boolean,
  Double,
  Float,
  Int,
  Literal,
  Null,
  Number,
  Object,
  Optional,
  Or,
  Readonly,
  Record,
  Setonly,
  String,
  Undefined,
  Void
}
