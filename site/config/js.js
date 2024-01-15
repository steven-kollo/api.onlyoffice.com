// @ts-check

/**
 * @typedef {import("@11ty/eleventy").UserConfig} UserConfig
 * @typedef {import("esbuild").BuildOptions} BuildOptions
 */

const { tmpdir } = require("node:os")
const { build } = require("esbuild")
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
  c.addTemplateFormats("js")

  const bo = resolveOptions()

  c.addExtension("js", {
    outputFileExtension: "js",
    compile(_, p) {
      return compile(o, bo, p)
    }
  })
}

/**
 * @returns {BuildOptions}
 */
function resolveOptions() {
  /** @type {BuildOptions} */
  const o = {
    minify: false
  }
  if (isBuild()) {
    o.minify = true
  }
  return o
}

/**
 * @param {PluginOptions} p
 * @param {BuildOptions} b
 * @param {string} f
 * @returns {(() => Promise<string>) | undefined}
 */
function compile(p, b, f) {
  if (!p.files.includes(f)) {
    return
  }
  return async () => {
    const r = await build({
      ...b,
      bundle: true,
      entryPoints: [f],
      outdir: tmpdir(),
      write: false
    })
    return r.outputFiles[0].text
  }
}

module.exports = { plugin }
