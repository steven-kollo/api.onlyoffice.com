// @ts-check

/**
 * @typedef {import("@11ty/eleventy").UserConfig} UserConfig
 */

const { Cli, Logger } = require("@11ty/eleventy-dev-server/cli.js")
const EleventyDevServer = require("@11ty/eleventy-dev-server/server.js")
const { isPreview } = require("./env.cjs")

/**
 * @param {UserConfig} uc
 * @returns {void}
 */
function previewPlugin(uc) {
  if (!isPreview()) {
    return
  }

  uc.on("eleventy.after", () => {
    const o = {
      ...Cli.getDefaultOptions(),
      domDiff: false,
      input: "dist",
      liveReload: false,
      logger: Logger,
      showVersion: true
    }
    EleventyDevServer
      .getServer("eleventy-dev-server-cli", o.input, o)
      .serve(o.port)
  })
}

module.exports = { previewPlugin }
