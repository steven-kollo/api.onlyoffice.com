// @ts-check

// https://github.com/11ty/eleventy/issues/2427
// todo: explain situation.

/**
 * @typedef {import("@11ty/eleventy").UserConfig} UserConfig
 * @typedef {Awaited<ReturnType<typeof import("@wooorm/starry-night").createStarryNight>>} StarryNight
 */

/**
 * @type {Map<string, StarryNight>}
 */
const cache = new Map()

/**
 * @returns {StarryNight | undefined}
 */
function starryNight() {
  return cache.get("starryNight")
}

/**
 * @param {UserConfig} uc
 * @returns {void}
 */
function syntaxHighlightPlugin(uc) {
  uc.on("eleventy.before", async () => {
    if (cache.has("starryNight")) {
      return
    }
    const { common, createStarryNight } = await import("@wooorm/starry-night")
    const starryNight = await createStarryNight(common)
    cache.set("starryNight", starryNight)
  })
}

module.exports = { syntaxHighlightPlugin, starryNight }
