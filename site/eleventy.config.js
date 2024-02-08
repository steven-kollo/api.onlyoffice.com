// @ts-check

/**
 * @typedef {import("@11ty/eleventy").UserConfig} UserConfig
 */

const { plugin: css } = require("./config/css.js")
const { plugin: html } = require("./config/html.js")
const { plugin: js } = require("./config/js.js")
const { plugin: md } = require("./config/md.js")
const { jsxPlugin } = require("./config/jsx.js")
const { mdxPlugin } = require("./config/mdx.js")
const { navigationPlugin } = require("./config/navigation.js")

/**
 * @param {UserConfig} c
 * @returns {UserConfig}
 */
function config(c) {
  c.setServerPassthroughCopyBehavior("passthrough")
  c.addPassthroughCopy({
    "./node_modules/@onlyoffice/documentation-ui-kit-js/node_modules/@onlyoffice/documentation-ui-primitives/static/*.{woff,woff2}": "."
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

  c.addPlugin(jsxPlugin)
  c.addPlugin(mdxPlugin)

  return {
    templateFormats: ["md", "mdx", "njk", "11ty.js"],
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
