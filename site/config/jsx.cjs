// @ts-check

/**
 * @typedef {import("@11ty/eleventy").UserConfig} UserConfig
 */

/**
 * @param {UserConfig} uc
 * @returns {void}
 */
function jsx(uc) {
  uc.addExtension("tsx", {
    key: "11ty.js"
  })
}

module.exports = { jsx }
