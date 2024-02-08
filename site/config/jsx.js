// @ts-check

/**
 * @typedef {import("@11ty/eleventy").UserConfig} UserConfig
 */

const { isValidElement } = require("preact")
const { render } = require("preact-render-to-string")
const pack = require("../package.json")

/**
 * @param {UserConfig} uc
 */
function jsxPlugin(uc) {
  uc.addExtension(["jsx", "tsx"], {
    key: "11ty.js"
  })

  uc.addTransform(`${pack}/render-jsx`, (c) => {
    if (typeof c === "object") {
      if (isValidElement(c)) {
        return render(c)
      }
      // todo: console.log("warn")
      return ""
    }
    return c
  })
}

module.exports = { jsxPlugin }
