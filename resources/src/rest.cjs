// @ts-ignore

/**
 * @typedef {import("@onlyoffice/documentation-declarations-types/rest.js").REST.Request} RESTRequest
 * @typedef {import("@onlyoffice/documentation-declarations-types/rest.js").REST.Component} RESTComponent
 */

/** @type {RESTRequest[]} */
const requests = require("./resource.requests.json")

/**
 * @returns {RESTRequest[]}
 */
function list() {
  return requests
}

/** @type {Record<string, RESTComponent>} */
const components = require("./resource.components.json")

/**
 * @param {string} id
 * @returns {RESTComponent | undefined}
 */
function retrieve(id) {
  return components[id]
}

module.exports = { list, retrieve }