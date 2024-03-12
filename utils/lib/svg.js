// @ts-check

import { readFile, readdir, writeFile } from "node:fs/promises"
import { join, parse } from "node:path"
import { capitalizeKebab } from "./strings.js"

/**
 * @param {string} from
 * @param {string} to
 * @param {string} postfix
 * @returns {Promise<void>}
 */
export async function buildTSX(from, to, postfix) {
  /** @type {string[]} */
  const ep = []

  const l = await readdir(from)
  await Promise.all(l.map(async (n) => {
    let f = join(from, n)
    let c = await readFile(f, "utf8")
    const o = parse(n)
    n = `${o.name}-${postfix}`
    ;[n, c] = await toTSX(n, c)
    f = join(to, `${n}.tsx`)
    await writeFile(f, c)
    ep.push(n)
  }))

  let c = ep
    .map((n) => `export { ${n} } from "./${n}.tsx"`)
    .join("\n")
  c += "\n"
  const f = join(to, "logo.ts")
  await writeFile(f, c)
}

/**
 * Converts an SVG to a TSX component.
 * @param {string} n
 * @param {string} c
 * @returns {Promise<[string, string]>} A tuple containing the name of the component and the TSX code.
 */
export async function toTSX(n, c) {
  n = capitalizeKebab(n)
  c = c.trim()
  c = `import { h } from "preact"\n\nexport function ${n}() {\n  return (${c})\n}\n`
  return [n, c]
}
