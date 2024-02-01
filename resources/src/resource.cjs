// @ts-ignore

/**
 * @typedef {import("@onlyoffice/documentation-declarations").Declaration} Declaration
 */

/** @type {Declaration[]} */
const declarations = require("./resource.declarations.json")

/**
 * @returns {Declaration[]}
 */
function list() {
  return declarations
}

/** @type {Record<string, number>} */
const indexes = require("./resource.indexes.json")

/**
 * @param {string} id
 * @returns {Declaration=}
 */
function retrieve(id) {
  const i = indexes[id]
  if (i === undefined) {
    return
  }
  return declarations[i]
}

module.exports = { list, retrieve }
