// @ts-check

/**
 * @typedef {import("@11ty/eleventy").UserConfig} UserConfig
 */

const { env } = require("node:process")
const { css } = require("./config/css.cjs")
const { html } = require("./config/html.cjs")
const { js } = require("./config/js.cjs")
const { jsx } = require("./config/jsx.cjs")

const { mdxPlugin } = require("./config/mdx.cjs")
const { navigationPlugin } = require("./config/navigation.cjs")

/**
 * @param {UserConfig} uc
 * @returns {unknown}
 */
function config(uc) {
  uc.setServerPassthroughCopyBehavior("passthrough")
  uc.addPassthroughCopy({
    "./node_modules/@onlyoffice/documentation-ui-kit-js/node_modules/@onlyoffice/documentation-ui-primitives/static/*.{woff,woff2}": "."
  })

  const minify = isBuild()
  uc.addPlugin(html, {
    minify
  })
  uc.addPlugin(css, {
    entry: "./src/main.css",
    minify
  })
  uc.addPlugin(js, {
    entry: "./src/main.js",
    minify
  })

  uc.addPlugin(navigationPlugin)
  // c.addPlugin(productsPlugin)

  uc.addPlugin(jsx)
  uc.addPlugin(mdxPlugin)

  return {
    templateFormats: ["mdx", "tsx"],
    dir: {
      includes: "components",
      input: "src",
      layouts: "layouts",
      output: "dist"
    }
  }
}

/**
 * Checks if the Eleventy run mode is set to `build`.
 * @returns {boolean} `true` if the run mode is `build`, `false` otherwise.
 */
function isBuild() {
  return env.ELEVENTY_RUN_MODE === "build"
}

module.exports = config
