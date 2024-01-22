// @ts-check

import { readFile } from "node:fs/promises"
import { join } from "node:path"
import { URL, fileURLToPath } from "node:url"
import * as assert from "uvu/assert"
import { test } from "uvu"
import { WebC } from "@11ty/webc"

const root = fileURLToPath(new URL(".", import.meta.url))

test("check", async () => {
  const p = setup()
  const i = await fixture("0i.webc")
  p.setContent(i)
  const { html } = await p.compile()
  // const o = await fixture("0o.html")
  assert.equal(html, "o")
})

/**
 * @returns {WebC}
 */
function setup() {
  const p = new WebC()
  p.setBundlerMode(false)
  const c = join(root, "sc.webc")
  p.defineComponents([c])
  return p
}

/**
 * @param {string} n
 * @returns {Promise<string>}
 */
function fixture(n) {
  const f = join(root, "../fixtures", n)
  return readFile(f, { encoding: "utf-8" })
}

test.run()
