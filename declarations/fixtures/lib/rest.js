// @ts-check

/**
 * @typedef {import("@onlyoffice/documentation-declarations-types/rest.js").REST.Request} RESTRequest
 * @typedef {import("@onlyoffice/documentation-declarations-types/rest.js").REST.Component} RESTComponent
 */

import { createRequire } from "module"

const require = createRequire(import.meta.url)

/** @type {RESTRequest[]} */
const declarations = require("./rest.declarations.json")

/**
 * @returns {RESTRequest[]}
 */
export function list() {
  return declarations
}

/** @type {Record<string, RESTComponent>} */
const components = require("./rest.components.json")

/**
 * @param {string} id
 * @returns {RESTComponent | undefined}
 */
export function retrieve(id) {
  return components[id]
}
