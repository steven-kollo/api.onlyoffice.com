// @ts-check

const { writeFile } = require("node:fs/promises")
const { join } = require("node:path")
const lightningcss = require("lightningcss")

const root = __dirname

/**
 * @returns {Promise<void>}
 */
async function build() {
  // await buildCSS()
}

/**
 * @returns {Promise<void>}
 */
async function buildCSS() {
  const src = join(root, "src/kit.css")
  const { code } = await lightningcss.bundleAsync({
    filename: src,
    minify: true
  })
  const dist = join(root, "dist/kit.css")
  await writeFile(dist, code)
}

/**
 * @returns {Promise<void>}
 */
// async function buildWebC() {}

module.exports = { build }
