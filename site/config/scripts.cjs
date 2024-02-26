// @ts-check

/**
 * @typedef {import("@11ty/eleventy").UserConfig} UserConfig
 */

const { Buffer } = require("node:buffer")
const { tmpdir } = require("node:os")
const { parse } = require("node:path")
const { build } = require("esbuild")
const { isBuild, isPreview } = require("./env.cjs")

const minify = isBuild() || isPreview()

/**
 * @param {UserConfig} uc
 * @returns {void}
 */
function scriptsPlugin(uc) {
  uc.addTemplateFormats("ts")
  uc.addExtension("ts", {
    outputFileExtension: "js",
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
        return buildScripts(f)
      }
    }
  })
}

/**
 * @param {string} f The entry point file path.
 * @returns {Promise<Uint8Array>} The bundled content.
 */
async function buildScripts(f) {
  const r = await build({
    bundle: true,
    entryPoints: [f],
    minify,
    outdir: tmpdir(),
    write: false,
  })
  return Buffer.from(r.outputFiles[0].contents)
}

module.exports = { buildScripts, scriptsPlugin }
