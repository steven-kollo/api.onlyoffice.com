// @ts-check

/**
 * @typedef {import("@11ty/eleventy").UserConfig} UserConfig
 */

const { cleanPlugin } = require("./config/clean.cjs")
const { markdownPlugin } = require("./config/markdown.cjs")
const { markupPlugin } = require("./config/markup.cjs")
const { navigationPlugin } = require("./config/navigation.cjs")
const { previewPlugin } = require("./config/preview.cjs")
const { scriptsPlugin } = require("./config/scripts.cjs")
const { staticPlugin } = require("./config/static.cjs")
const { stylesPlugin } = require("./config/styles.cjs")
const { syntaxHighlightPlugin } = require("./config/syntax-highlight.cjs")

/**
 * @param {UserConfig} uc
 * @returns {unknown}
 */
function config(uc) {
  uc.addPlugin(cleanPlugin)
  uc.addPlugin(staticPlugin)
  uc.addPlugin(markupPlugin)
  uc.addPlugin(stylesPlugin)
  uc.addPlugin(scriptsPlugin)
  uc.addPlugin(navigationPlugin)
  uc.addPlugin(markdownPlugin)
  uc.addPlugin(syntaxHighlightPlugin)
  uc.addPlugin(previewPlugin)
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
