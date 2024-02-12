// @ts-check

/**
 * @typedef {import("@11ty/eleventy").UserConfig} UserConfig
 */

const lightningcss = require("lightningcss")

/**
 * @typedef {object} Options
 * @property {string} entry
 * @property {boolean} minify
 */

/**
 * @param {UserConfig} uc
 * @param {Options} o
 * @returns {void}
 */
function css(uc, o) {
  uc.addTemplateFormats("css")
  uc.addExtension("css", {
    outputFileExtension: "css",
    compile(_, f) {
      if (o.entry !== f) {
        return
      }
      return async () => {
        const { code } = await lightningcss.bundleAsync({
          filename: f,
          minify: o.minify
        })
        return code.toString()
      }
    }
  })
}

module.exports = { css }
