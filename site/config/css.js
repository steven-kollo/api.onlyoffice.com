// @ts-check

/**
 * @typedef {import("@11ty/eleventy").UserConfig} UserConfig
 * @typedef {import("lightningcss").BundleAsyncOptions} BundleAsyncOptions
 */

const lightningcss = require("lightningcss")
const { isBuild } = require("./any.js")

/**
 * @typedef {object} PluginOptions
 * @property {string[]} files
 */

/**
 * @param {UserConfig} c
 * @param {PluginOptions} o
 * @returns {void}
 */
function plugin(c, o) {
  c.addTemplateFormats("css")

  const bo = resolveOptions()

  c.addExtension("css", {
    outputFileExtension: "css",
    compile(_, p) {
      return compile(o, bo, p)
    }
  })
}

/**
 * @returns {BundleAsyncOptions}
 */
function resolveOptions() {
  /** @type {BundleAsyncOptions} */
  const o = {
    filename: "",
    minify: false
  }
  if (isBuild()) {
    o.minify = true
    // o.targets = lightningcss.browserslistToTargets()
  }
  return o
}

/**
 * @param {PluginOptions} p
 * @param {BundleAsyncOptions} b
 * @param {string} f
 * @returns {(() => Promise<Uint8Array>) | undefined}
 */
function compile(p, b, f) {
  if (!p.files.includes(f)) {
    return
  }
  return async () => {
    const { code } = await lightningcss.bundleAsync({
      ...b,
      filename: f
    })
    return code
  }
}

module.exports = { plugin }
