// @ts-check

/**
 * @typedef {import("@11ty/eleventy").UserConfig} UserConfig
 */

/**
 * @typedef {Object} PluginOptions
 * @property {string[]} components
 */

/**
 * @param {UserConfig} c
 * @returns {void}
 */
function plugin(c, options) {
  c.setLibrary("md", {
    set() {},
    render(raw) {
      return render(options, raw)
    }
  })
}

/**
 *
 * @param {PluginOptions} options
 * @param {string} raw
 * @returns
 */
async function render(options, raw) {
  const p = await remark()
  let { value } = await p.process(raw)
  if (typeof value === "string") {
    // // https://github.com/11ty/eleventy-plugin-bundle/issues/17
    // const { WebC } = await import("@11ty/webc")
    // const page = new WebC()
    // page.setBundlerMode(false)
    // page.defineComponents(options.components)
    // value = `<content>${value}</content>`
    // page.setContent(value)
    // const { html } = await page.compile()
    // value = html
  }
  return value
}

async function remark() {
  // https://github.com/remarkjs/remark/blob/main/packages/remark/index.js
  const { remark } = await import("remark")
  const { default: remarkRehype } = await import("remark-rehype")
  const { default: rehypeRaw } = await import("rehype-raw")
  const { default: rehypeStringify } = await import("rehype-stringify")
  return remark()
    .use(remarkRehype, {
      allowDangerousHtml: true,
      handlers: {
        heading(s, n) {
          // https://github.com/syntax-tree/mdast-util-to-hast/blob/13.1.0/lib/handlers/heading.js
          /** @type {import("hast").Element} */
          let result = {}
          if (n.depth === 2) {
            result = {
              type: "element",
              tagName: "content-h2",
              properties: {
                "@anchor": "/home"
              },
              children: s.all(n)
            }
          } else {
            result = {
              type: "element",
              tagName: "h" + n.depth,
              properties: {},
              children: s.all(n)
            }
          }
          s.patch(n, result)
          return s.applyData(n, result)
        }
      }
    })
    .use(rehypeRaw)
    .use(rehypeStringify)
}

module.exports = { plugin }
