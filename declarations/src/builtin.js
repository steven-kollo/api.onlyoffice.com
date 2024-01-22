// @ts-check

/**
 * @typedef {import("../index.js").ArrayType} ArrayType
 * @typedef {import("../index.js").LiteralType} LiteralType
 * @typedef {import("../index.js").ObjectType} ObjectType
 * @typedef {import("../index.js").OptionalType} OptionalType
 * @typedef {import("../index.js").ReadonlyType} ReadonlyType
 * @typedef {import("../index.js").RecordType} RecordType
 * @typedef {import("../index.js").SetonlyType} SetonlyType
 * @typedef {import("../index.js").UnionType} UnionType
 * @typedef {import("../index.js").Declaration} Declaration
 * @typedef {import("../index.js").DeclarationType} DeclarationType
 */

// todo: replace them with types

/** @type {ArrayType} */
const Array = {
  id: "_array"
}

/** @type {LiteralType} */
const Literal = {
  id: "_literal"
}

/** @type {ObjectType} */
const Object = {
  id: "_object"
}

/** @type {OptionalType} */
const Optional = {
  id: "_optional"
}

/** @type {ReadonlyType} */
const Readonly = {
  id: "_readonly"
}

/** @type {RecordType} */
const Record = {
  id: "_record"
}

/** @type {SetonlyType} */
const Setonly = {
  id: "_setonly"
}

/** @type {UnionType} */
const Union = {
  id: "_union"
}

/**
 * @param {DeclarationType} t
 * @returns {boolean}
 */
function isBuiltinType(t) {
  return (
    t.id === Array.id ||
    t.id === Literal.id ||
    t.id === Object.id ||
    t.id === Optional.id ||
    t.id === Readonly.id ||
    t.id === Record.id ||
    t.id === Setonly.id ||
    t.id === Union.id
  )
}

export {
  Array,
  Literal,
  Object,
  Optional,
  Readonly,
  Record,
  Setonly,
  Union,
  isBuiltinType
}
