// @ts-check

/**
 * @typedef {import("@11ty/eleventy").UserConfig} UserConfig
 */

const webc = require("@11ty/eleventy-plugin-webc")

/**
 * @typedef {Object} PluginOptions
 * @property {string[]} components
 */

/**
 * @param {UserConfig} c
 * @param {PluginOptions} o
 * @returns {void}
 */
function plugin(c, o) {
  c.addPlugin(webc, {
    components: o.components,
    before(p) {
      p.bundlerMode = false
    }
  })
}


module.exports = { plugin }
