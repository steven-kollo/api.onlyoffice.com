// @ts-check

/**
 * @typedef {import("../index.js").ReflectionValue} ReflectionValue
 */

import { readFile } from "node:fs/promises"
import { join } from "node:path"
import { URL, fileURLToPath } from "node:url"
import * as assert from "uvu/assert"
import { test } from "uvu"
import { WebC } from "@11ty/webc"
import {
  components,
  renderArrayType,
  renderGenericType,
  renderLiteralType,
  renderOptionalType,
  renderRequiredType,
  renderTextContent,
  renderUnionType
} from "./reflection.cjs"

const src = fileURLToPath(new URL(".", import.meta.url))

// <number><i=input|o=output>.<webc|html>

test("check", async () => {
  const p = setup()
  await setupContent(p, [
    {
      name: "hi",
      type: {
        name: "",
        render: renderRequiredType,
        children: [
          {
            name: "",
            render: renderOptionalType,
            children: [
              {
                name: "string",
                permalink: "/",
                render: renderLiteralType
              }
            ]
          }
        ],
      },
      permalink: "/",
      description: {
        text: "hi",
        render: renderTextContent
      },
      default: "def",
      example: "ex"
    }
  ])
  const { html } = await p.compile()
  const o = await fixture("0o.html")
  assert.equal(html, o)
})

/**
 * @returns {WebC}
 */
function setup() {
  const p = new WebC()
  p.setBundlerMode(false)
  p.defineComponents(components())
  return p
}

/**
 * @param {WebC} p
 * @param {ReflectionValue[]} values
 */
async function setupContent(p, values) {
  p.setHelper("testValues", () => values)
  const o = await fixture("0i.webc")
  // p.setContent('<reflection :@values="testValues()"></reflection>')
  p.setContent(o)
}

/**
 * @param {string} n
 * @returns {Promise<string>}
 */
function fixture(n) {
  const f = join(src, "../fixtures", n)
  return readFile(f, { encoding: "utf-8" })
}

test.run()
