// @ts-ignore

/**
 * @typedef {import("@onlyoffice/documentation-declarations").Declaration} Declaration
 */

/**
 * @typedef {Declaration[]} List
 */

/** @type {List} */
const l = require("./document-builder.list.json")

/**
 * @returns {List}
 */
function list() {
  return l
}

/**
 * @typedef {Record<string, number>} Map
 */

/** @type {Map} */
const m = require("./document-builder.map.json")

/**
 * @param {string} id
 * @returns {Declaration=}
 */
function retrieve(id) {
  const i = m[id]
  if (i === undefined) {
    return
  }
  return l[i]
}

module.exports = { list, retrieve }
