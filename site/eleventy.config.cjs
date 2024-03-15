// @ts-check

/**
 * @typedef {import("@11ty/eleventy").UserConfig} UserConfig
 */

const { cleanPlugin } = require("./config/clean.ts")
const { markdownPlugin } = require("./config/markdown.ts")
const { markupPlugin } = require("./config/markup.ts")
const { navigationPlugin } = require("./config/navigation.ts")
const { previewPlugin } = require("./config/preview.ts")
const { scriptPlugin } = require("./config/script.ts")
const { staticPlugin } = require("./config/static.ts")
const { stylePlugin } = require("./config/style.ts")
const { syntaxHighlightPlugin } = require("./config/syntax-highlight.ts")

/**
 * @param {UserConfig} uc
 * @returns {unknown}
 */
function config(uc) {
  uc.addPlugin(cleanPlugin)
  uc.addPlugin(staticPlugin)
  uc.addPlugin(markupPlugin)
  uc.addPlugin(stylePlugin)
  uc.addPlugin(scriptPlugin)
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
