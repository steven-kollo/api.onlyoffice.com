// @ts-check

/**
 * @typedef {import("@11ty/eleventy").UserConfig} UserConfig
 */

const syntaxHighlight = require("@11ty/eleventy-plugin-syntaxhighlight");
const { plugin: css } = require("./config/css.js")
const { plugin: html } = require("./config/html.js")
const { plugin: js } = require("./config/js.js")
const { plugin: md } = require("./config/md.js")
const { navigationPlugin } = require("./config/navigation.js")
// const { productsPlugin } = require("./config/products.js")
const { plugin: webc } = require("./config/webc.js")

/**
 * @param {UserConfig} c
 * @returns {UserConfig}
 */
function config(c) {
  c.setServerPassthroughCopyBehavior("passthrough")
  c.addPassthroughCopy({ "./node_modules/@onlyoffice/documentation-ui-kit/node_modules/@onlyoffice/documentation-ui-fonts/dist/*.{woff,woff2}": "." })

  c.addPlugin(syntaxHighlight)
  c.addPlugin(html)

  c.addPlugin(css, {
    files: ["./src/main.css"]
  })
  c.addPlugin(js, {
    files: ["./src/main.js"]
  })

  const components = [
    // todo: "npm:@onlyoffice/documentation-ui-kit/dist/*.webc",
    "npm:@onlyoffice/documentation-ui-kit/node_modules/@onlyoffice/documentation-ui-code-example/dist/*.webc",
    "npm:@onlyoffice/documentation-ui-kit/node_modules/@onlyoffice/documentation-ui-content/dist/*.webc",
    "npm:@onlyoffice/documentation-ui-kit/node_modules/@onlyoffice/documentation-ui-fonts/dist/*.webc",
    "npm:@onlyoffice/documentation-ui-kit/node_modules/@onlyoffice/documentation-ui-l/dist/*.webc",
    "npm:@onlyoffice/documentation-ui-kit/node_modules/@onlyoffice/documentation-ui-logo/dist/*.webc",
    "npm:@onlyoffice/documentation-ui-kit/node_modules/@onlyoffice/documentation-ui-sr-only/dist/*.webc",
    // todo: read from package.json exports
    "npm:@onlyoffice/documentation-ui-kit-webc/dist/**/*.webc",
    "npm:@onlyoffice/documentation-ui-code-example-webc/dist/**/*.webc",
    "./src/blocks/**/*.webc"
  ]
  c.addPlugin(webc, { components })
  c.addPlugin(md, { components })

  c.addPlugin(navigationPlugin)
  // c.addPlugin(productsPlugin)

  return {
    templateFormats: ["md", "webc", "njk", "11ty.js"],
    dir: {
      data: "_",
      includes: "",
      input: "src",
      layouts: "layouts",
      output: "dist"
    },
    htmlTemplateEngine: "webc",
    // https://github.com/11ty/eleventy-plugin-bundle/issues/17
    // markdownTemplateEngine: "webc"
    markdownTemplateEngine: false
  }
}

module.exports = config
