// @ts-check

/**
 * @typedef {import("../index.js").DeclarationType} DeclarationType
 */

/**
 * @param {DeclarationType} t
 * @returns {boolean}
 */
function isCustomType(t) {
  return !isBuiltinType(t)
}

/**
 * @param {DeclarationType} t
 * @returns {boolean}
 */
function isBuiltinType(t) {
  return (
    t.id === "array" ||
    t.id === "class" ||
    t.id === "constructor" ||
    t.id === "event" ||
    t.id === "function" ||
    t.id === "initializer" ||
    t.id === "literal" ||
    t.id === "method" ||
    t.id === "object" ||
    t.id === "optional" ||
    t.id === "readonly" ||
    t.id === "record" ||
    t.id === "setonly" ||
    t.id === "union" ||
    t.id === "unknown"
  )
}

export { isBuiltinType, isCustomType }
