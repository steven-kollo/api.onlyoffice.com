// @ts-check

/**
 * @typedef {import("../../resource.d.ts").Declaration} Declaration
 */

/** @type {Declaration[]} */
const l = require("./list.json")

/**
 * @returns {Declaration[]}
 */
function list() {
  return l
}

/**
 * @typedef {Record<string, number>} Map
 */

/** @type {Map} */
const m = require("./map.json")

/**
 * @param {string} id
 * @returns {Declaration | undefined}
 */
function retrieve(id) {
  const i = m[id]
  if (i === undefined) {
    return
  }
  return l[i]
}

module.exports = {
  list,
  retrieve
}
