// @ts-check

/**
 * @typedef {import("@11ty/eleventy").UserConfig} UserConfig
 * @typedef {import("./navigation.js").NavigationItem} NavigationItem
 */

const { extname } = require("node:path")

/**
 * @typedef {Object} Product
 * @property {string} title
 * @property {string} link
 * @property {string} logo
 * @property {NavigationItem[]=} children
 */

/**
 * @typedef {Object} CacheProduct
 * @property {string} title
 * @property {string} link
 * @property {string} logo
 * @property {number} order
 * @property {NavigationItem[]=} children
 */

const gc = new WeakMap()

/**
 * @param {UserConfig} uc
 * @returns {void}
 */
function productsPlugin(uc) {
  uc.addCollection("products", (c) => {
    if (gc.has(productsPlugin)) {
      return gc.get(productsPlugin)
    }
    const nav = uc.collections.navigation(c)
    const list = c.getFilteredByTag("product")
    const products = collect(nav, list)
    gc.set(productsPlugin, products)
    return products
  })
}

/**
 * @param {NavigationItem[]} nav
 * @param {any[]} list
 * @returns {Product[]}
 */
function collect(nav, list) {
  console.log(nav, list)
  return []
}

module.exports = { productsPlugin }
