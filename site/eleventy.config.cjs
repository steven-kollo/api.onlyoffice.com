// @ts-check

/**
 * @typedef {import("@11ty/eleventy").UserConfig} UserConfig
 */

const { eleventyPlugin: syntaxHighlightPlugin } = require("./components/syntax-highlight/syntax-highlight.config.ts")
const { cleanPlugin } = require("./config/clean.ts")
const { markupPlugin } = require("./config/markup.ts")
const { navigationPlugin } = require("./config/navigation.ts")
const { previewPlugin } = require("./config/preview.ts")
const { scriptPlugin } = require("./config/script.ts")
const { staticPlugin } = require("./config/static.ts")
const { stylePlugin } = require("./config/style.ts")

const { eleventyPlugin: dataPlugin } = require("./config/data.ts")
const { eleventyPlugin: sitemapPlugin } = require("./config/sitemap.ts")

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
  uc.addPlugin(syntaxHighlightPlugin)
  uc.addPlugin(previewPlugin)

  uc.addPlugin(dataPlugin)
  uc.addPlugin(sitemapPlugin)

  return {
    dir: {
      data: "data",
      includes: "components",
      input: ".",
      layouts: "layouts",
      output: "dist"
    }
  }
}

module.exports = config
