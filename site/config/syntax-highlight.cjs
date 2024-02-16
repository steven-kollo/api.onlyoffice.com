// @ts-check

// https://github.com/11ty/eleventy/issues/2427
// todo: explain situation.

/**
 * @typedef {import("@11ty/eleventy").UserConfig} UserConfig
 * @typedef {Awaited<ReturnType<typeof import("@wooorm/starry-night").createStarryNight>>} StarryNight
 * @typedef {ReturnType<StarryNight["highlight"]>} Root
 */

/**
 * @type {Map<string, StarryNight>}
 */
const cache = new Map()

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

/**
 * @param {string} code
 * @param {string} syntax
 * @returns {Root}
 */
function highlight(code, syntax) {
  const n = cache.get("starryNight")
  if (n === undefined) {
    throw new Error("Highlighter is not ready")
  }

  const s = n.flagToScope(syntax)
  if (s === undefined) {
    throw new Error(`Unknown syntax: ${syntax}`)
  }

  return n.highlight(code, s)
}

module.exports = { highlight, syntaxHighlightPlugin }
