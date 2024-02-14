// @ts-check

/**
 * @typedef {import("@11ty/eleventy").UserConfig} UserConfig
 */

const { markupPlugin } = require("./config/markup.cjs")
const { scriptsPlugin } = require("./config/scripts.cjs")
const { stylesPlugin } = require("./config/styles.cjs")
const { staticPlugin } = require("./config/static.cjs")
const { navigationPlugin } = require("./config/navigation.cjs")
const { syntaxHighlightPlugin } = require("./config/syntax-highlight.cjs")

/**
 * @param {UserConfig} uc
 * @returns {unknown}
 */
function config(uc) {
  uc.addPlugin(staticPlugin)
  uc.addPlugin(markupPlugin)
  uc.addPlugin(stylesPlugin)
  uc.addPlugin(scriptsPlugin)
  uc.addPlugin(navigationPlugin)
  uc.addPlugin(syntaxHighlightPlugin)
  return {
    dir: {
      includes: "components",
      input: "src",
      layouts: "layouts",
      output: "dist"
    }
  }
}

module.exports = config
