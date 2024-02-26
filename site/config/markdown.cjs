// @ts-check

/**
 * @typedef {import("@11ty/eleventy").UserConfig} UserConfig
 * @typedef {ReturnType<import("mdast-util-to-hast").toHast>} Nodes
 */

/**
 * @callback Processor
 * @param {string} content
 * @returns {Nodes}
 */

/**
 * @type {Map<string, Processor>}
 */
const cache = new Map()

/**
 * @param {UserConfig} uc
 * @returns {void}
 */
function markdownPlugin(uc) {
  uc.on("eleventy.before", async () => {
    if (cache.has("processor")) {
      return
    }

    const { fromMarkdown } = await import("mdast-util-from-markdown")
    const { gfmTableFromMarkdown } = await import("mdast-util-gfm-table")
    const { toHast } = await import("mdast-util-to-hast")
    const { gfmTable } = await import("micromark-extension-gfm-table")

    /** @type {Processor} */
    function processor(content) {
      const m = fromMarkdown(content, {
        extensions: [gfmTable()],
        mdastExtensions: [gfmTableFromMarkdown()]
      })
      return toHast(m)
    }

    cache.set("processor", processor)
  })
}

/**
 * @param {string} content
 * @returns {Nodes}
 */
function process(content) {
  const p = cache.get("processor")
  if (p === undefined) {
    throw new Error("Processor is not ready")
  }
  return p(content)
}

module.exports = { markdownPlugin, process }
