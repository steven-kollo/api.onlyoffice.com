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
    t.name === "array" ||
    t.name === "class" ||
    t.name === "constructor" ||
    t.name === "event" ||
    t.name === "function" ||
    t.name === "initializer" ||
    t.name === "literal" ||
    t.name === "method" ||
    t.name === "object" ||
    t.name === "optional" ||
    t.name === "readonly" ||
    t.name === "record" ||
    t.name === "setonly" ||
    t.name === "union" ||
    t.name === "unknown"
  )
}

export { isBuiltinType, isCustomType }
