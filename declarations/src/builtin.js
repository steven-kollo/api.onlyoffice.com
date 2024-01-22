// @ts-check

/**
 * @typedef {import("../index.js").ArrayDeclaration} ArrayDeclaration
 * @typedef {import("../index.js").LiteralDeclaration} LiteralDeclaration
 * @typedef {import("../index.js").ObjectDeclaration} ObjectDeclaration
 * @typedef {import("../index.js").OptionalDeclaration} OptionalDeclaration
 * @typedef {import("../index.js").ReadonlyDeclaration} ReadonlyDeclaration
 * @typedef {import("../index.js").RecordDeclaration} RecordDeclaration
 * @typedef {import("../index.js").SetonlyDeclaration} SetonlyDeclaration
 * @typedef {import("../index.js").UnionDeclaration} UnionDeclaration
 * @typedef {import("../index.js").Declaration} Declaration
 * @typedef {import("../index.js").DeclarationType} DeclarationType
 */

/** @type {ArrayDeclaration} */
const Array = {
  id: "_array",
  name: "Array",
  kind: "builtin"
}

/** @type {LiteralDeclaration} */
const Literal = {
  id: "_literal",
  name: "Literal",
  kind: "builtin"
}

/** @type {ObjectDeclaration} */
const Object = {
  id: "_object",
  name: "Object",
  kind: "builtin"
}

/** @type {OptionalDeclaration} */
const Optional = {
  id: "_optional",
  name: "Optional",
  kind: "builtin"
}

/** @type {ReadonlyDeclaration} */
const Readonly = {
  id: "_readonly",
  name: "Readonly",
  kind: "builtin"
}

/** @type {RecordDeclaration} */
const Record = {
  id: "_record",
  name: "Record",
  kind: "builtin"
}

/** @type {SetonlyDeclaration} */
const Setonly = {
  id: "_setonly",
  name: "Setonly",
  kind: "builtin"
}

/** @type {UnionDeclaration} */
const Union = {
  id: "_union",
  name: "Union",
  kind: "builtin"
}

/**
 * @param {Declaration} d
 * @returns {boolean}
 */
function isBuiltinDeclaration(d) {
  return d.kind === "builtin"
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
  isBuiltinDeclaration,
  isBuiltinType
}
