// @ts-check

// https://github.com/11ty/eleventy/issues/19

/**
 * @typedef {import("@11ty/eleventy").UserConfig} UserConfig
 * @typedef {import("../types/once.js").Throttler} Throttler
 */

const { rm } = require("node:fs/promises")
const { join } = require("node:path")
const { root } = require("./env.cjs")
const { once } = require("./once.cjs")

/**
 * @param {UserConfig} uc
 * @returns {void}
 */
function cleanPlugin(uc) {
  const t = once()
  uc.on("eleventy.before", async () => {
    await t(async () => {
      await clean(uc)
    })
  })
}

/**
 * @param {UserConfig} uc
 * @returns {Promise<void>}
 */
async function clean(uc) {
  const d = join(root(), uc.dir.output)
  await rm(d, {
    recursive: true,
    force: true
  })
}

module.exports = { cleanPlugin }
