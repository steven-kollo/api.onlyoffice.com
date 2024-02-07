// @ts-check

/**
 * @typedef {import("@11ty/eleventy").UserConfig} UserConfig
 */

const { plugin: css } = require("./config/css.js")
const { plugin: html } = require("./config/html.js")
const { plugin: js } = require("./config/js.js")
const { plugin: md } = require("./config/md.js")
const { navigationPlugin } = require("./config/navigation.js")

/**
 * @param {UserConfig} c
 * @returns {UserConfig}
 */
function config(c) {
  c.setServerPassthroughCopyBehavior("passthrough")
  c.addPassthroughCopy({
    "./node_modules/@onlyoffice/documentation-ui-kit-js/node_modules/@onlyoffice/documentation-ui-fonts/static/*.{woff,woff2}": "."
  })

  c.addPlugin(html)

  c.addPlugin(css, {
    files: ["./src/main.css"]
  })
  c.addPlugin(js, {
    files: ["./src/main.js"]
  })

  c.addPlugin(md)

  c.addPlugin(navigationPlugin)
  // c.addPlugin(productsPlugin)

  return {
    templateFormats: ["md", "njk", "11ty.js"],
    dir: {
      data: "_",
      includes: "",
      input: "src",
      layouts: "layouts",
      output: "dist"
    },
    htmlTemplateEngine: "njk",
    markdownTemplateEngine: "njk"
  }
}

module.exports = config
