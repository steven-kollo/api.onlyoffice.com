// @ts-check

/**
 * @typedef {import("@11ty/eleventy").UserConfig} UserConfig
 */

const { join, parse } = require("node:path")
const { bundleAsync } = require("lightningcss")
const { isBuild } = require("./env.cjs")

const src = join(__dirname, "../src")
const dark = join(src, "dark.css")
const light = join(src, "light.css")
const minify = isBuild()

/**
 * @param {UserConfig} uc
 * @returns {void}
 */
function stylesPlugin(uc) {
  uc.addTemplateFormats("css")
  uc.addExtension("css", {
    outputFileExtension: "css",
    /**
     * @param {string} _
     * @param {string} f
     * @returns {(() => Promise<Uint8Array>) | undefined}
     */
    compile(_, f) {
      const { name } = parse(f)
      if (name !== "main") {
        return
      }
      return () => {
        return buildStyles(f)
      }
    }
  })
}

/**
 * @returns {Promise<string>}
 */
async function buildDarkStyles() {
  const s = await buildStyles(dark)
  return s.toString()
}

/**
 * @returns {Promise<string>}
 */
async function buildLightStyles() {
  const s = await buildStyles(light)
  return s.toString()
}

/**
 * @param {string} f The entry point file path.
 * @returns {Promise<Uint8Array>} The bundled content.
 */
async function buildStyles(f) {
  const r = await bundleAsync({
    filename: f,
    minify
  })
  return r.code
}

module.exports = {
  buildDarkStyles,
  buildLightStyles,
  buildStyles,
  stylesPlugin
}
