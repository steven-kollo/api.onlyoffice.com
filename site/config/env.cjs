// @ts-check

const { env } = require("node:process")

/**
 * Checks if the Eleventy run mode is set to `build`.
 * @returns {boolean} `true` if the run mode is `build`, `false` otherwise.
 */
function isBuild() {
  return env.ELEVENTY_RUN_MODE === "build"
}

module.exports = { isBuild }
