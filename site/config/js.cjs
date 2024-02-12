// @ts-check

/**
 * @typedef {import("@11ty/eleventy").UserConfig} UserConfig
 * @typedef {import("esbuild").BuildOptions} BuildOptions
 */

const { tmpdir } = require("node:os")
const { build } = require("esbuild")

/**
 * @typedef {object} Options
 * @property {string} entry
 * @property {boolean} minify
 */

/**
 * @param {UserConfig} uc
 * @param {Options} o
 * @returns {void}
 */
function js(uc, o) {
  uc.addTemplateFormats("js")
  uc.addExtension("js", {
    outputFileExtension: "js",
    compile(_, f) {
      if (o.entry !== f) {
        return
      }
      return async () => {
        const r = await build({
          bundle: true,
          entryPoints: [f],
          outdir: tmpdir(),
          write: false,
          minify: o.minify
        })
        return r.outputFiles[0].text
      }
    }
  })
}

module.exports = { js }
