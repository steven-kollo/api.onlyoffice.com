// @ts-check

const { env } = require("node:process")

function isBuild() {
  return env.ELEVENTY_RUN_MODE === "build"
}

module.exports = { isBuild }
