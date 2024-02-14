// @ts-check

/**
 * @typedef {import("@11ty/eleventy").UserConfig} UserConfig
 */

const { tmpdir } = require("node:os")
const { Transform } = require("node:stream")
const { build } = require("esbuild")
const { isBuild } = require("./env.cjs")

const minify = isBuild()

/**
 * @param {UserConfig} uc
 * @returns {void}
 */
function scriptsPlugin(uc) {
  uc.addPassthroughCopy("./src", {
    filter: ["**/main.ts"],
    /**
     * @param {string} f
     * @returns {Transform}
     */
    transform(f) {
      return new Transform({
        transform(_, __, cb) {
          buildScripts(f).then((c) => {
            this.push(c)
            cb(null)
          })
        }
      })
    },
    /**
     * @param {string} f
     * @returns {string}
     */
    rename(f) {
      return f.replace(/\.ts$/, ".js")
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
  return r.outputFiles[0].contents
}

module.exports = { buildScripts, scriptsPlugin }
