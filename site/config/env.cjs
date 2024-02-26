// @ts-check

// Eleventy has its environment variable called `ELEVENTY_RUN_MODE`, which
// defines the run mode. However, this variable is limited to `build` and
// `serve`, which is insufficient for our needs. Instead of trying to figure out
// how to marry the Eleventy variable with our own, it is easier to use the
// second solely.

const { env } = require("node:process")

/**
 * Checks if the current run mode is set to `build`.
 * @returns {boolean} `true` if the run mode is `build`, `false` otherwise.
 */
function isBuild() {
  const m = env.DOCUMENTATION_RUN_MODE
  if (m === undefined) {
    throw new Error("DOCUMENTATION_RUN_MODE is not defined")
  }
  return m === "build"
}

/**
 * Checks if the current run mode is set to `preview`.
 * @returns {boolean} `true` if the run mode is `preview`, `false` otherwise.
 */
function isPreview() {
  const m = env.DOCUMENTATION_RUN_MODE
  if (m === undefined) {
    throw new Error("DOCUMENTATION_RUN_MODE is not defined")
  }
  return m === "preview"
}

/**
 * Checks if the current run mode is set to `serve`.
 * @returns {boolean} `true` if the run mode is `serve`, `false` otherwise.
 */
function isServe() {
  const m = env.DOCUMENTATION_RUN_MODE
  if (m === undefined) {
    throw new Error("DOCUMENTATION_RUN_MODE is not defined")
  }
  return m === "serve"
}

/**
 * Returns the root directory of the Eleventy project.
 * @returns {string}
 */
function root() {
  const r = env.ELEVENTY_ROOT
  if (r === undefined) {
    throw new Error("ELEVENTY_ROOT is not defined")
  }
  return r
}

module.exports = { isBuild, isPreview, isServe, root }
