// @ts-check

/**
 * @typedef {import("@11ty/eleventy").UserConfig} UserConfig
 */

const { isBuild, isPreview } = require("./env.cjs")

/**
 * @param {UserConfig} uc
 * @returns {void}
 */
function staticPlugin(uc) {
  // todo: export the passthrough copy options from primitives.
  uc.addPassthroughCopy({
    "./node_modules/@onlyoffice/documentation-ui-kit-js/node_modules/@onlyoffice/documentation-ui-primitives/static/*.{woff,woff2}": "."
  })

  // Do not use a glob for passthrough copy.
  // https://github.com/11ty/eleventy/issues/3010
  uc.addPassthroughCopy({ "./src/pages": "." }, {
    filter: ["**/_static/*"],
    ...(isBuild() || isPreview()
      ? {
        rename(path) {
          // todo
          return path
        }
      }
      : {})
  })
}

module.exports = { staticPlugin }
