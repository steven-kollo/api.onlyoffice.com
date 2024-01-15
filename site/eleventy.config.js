/**
 * @typedef {import("@11ty/eleventy").UserConfig} UserConfig
 */

const { extname } = require("node:path")
const syntaxHighlight = require("@11ty/eleventy-plugin-syntaxhighlight");
const { plugin: css } = require("./config/css.js")
const { plugin: html } = require("./config/html.js")
const { plugin: js } = require("./config/js.js")
const { plugin: md } = require("./config/md.js")
const { plugin: webc } = require("./config/webc.js")

/**
 * @param {UserConfig} c
 * @returns {UserConfig}
 */
function config(c) {
  c.setServerPassthroughCopyBehavior("passthrough")
  c.addPassthroughCopy({ "./node_modules/@onlyoffice/documentation-ui-kit/node_modules/@onlyoffice/documentation-ui-fonts/dist/*.{woff,woff2}": "." })

  c.addPlugin(syntaxHighlight)
  c.addPlugin(html)

  c.addPlugin(css, {
    files: ["./src/main.css"]
  })
  c.addPlugin(js, {
    files: ["./src/main.js"]
  })

  const components = [
    // todo: "npm:@onlyoffice/documentation-ui-kit/dist/*.webc",
    "npm:@onlyoffice/documentation-ui-kit/node_modules/@onlyoffice/documentation-ui-code-example/dist/*.webc",
    "npm:@onlyoffice/documentation-ui-kit/node_modules/@onlyoffice/documentation-ui-content/dist/*.webc",
    "npm:@onlyoffice/documentation-ui-kit/node_modules/@onlyoffice/documentation-ui-fonts/dist/*.webc",
    "npm:@onlyoffice/documentation-ui-kit/node_modules/@onlyoffice/documentation-ui-l/dist/*.webc",
    "npm:@onlyoffice/documentation-ui-kit/node_modules/@onlyoffice/documentation-ui-logo/dist/*.webc",
    "npm:@onlyoffice/documentation-ui-kit/node_modules/@onlyoffice/documentation-ui-reflection/dist/*.webc",
    "npm:@onlyoffice/documentation-ui-kit/node_modules/@onlyoffice/documentation-ui-sr-only/dist/*.webc",
    "./src/blocks/**/*.webc"
  ]
  c.addPlugin(webc, { components })
  c.addPlugin(md, { components })

  configureProducts(c)

  return {
    templateFormats: ["md", "webc"],
    dir: {
      data: "_",
      includes: "",
      input: "src",
      layouts: "layouts",
      output: "dist"
    },
    htmlTemplateEngine: "webc",
    // https://github.com/11ty/eleventy-plugin-bundle/issues/17
    // markdownTemplateEngine: "webc"
    markdownTemplateEngine: false
  }
}

/**
 * @typedef {Object} TreeBranch
 * @property {string} type
 * @property {string} title
 * @property {string} link
 * @property {TreeBranch[]} children
 */

/**
 * @param {UserConfig} c
 */
function configureProducts(c) {
  c.addCollection("products", (c) => {
    // todo: rewrite it.

    const r = {}

    const l = c.getFilteredByTag("product")
    l.forEach((i) => {
      const e = extname(i.outputPath)
      if (e !== ".html") {
        return
      }

      const m = i.url.match(/^\/([\S\s]*)\/$/)
      if (!m) {
        return
      }

      const [, u] = m
      if (!u) {
        return
      }

      const us = u.split("/")
      let t = r
      us.forEach((s, index) => {
        if (t[s] === undefined) {
          t[s] = {
            title: "",
            link: "",
            internal: {},
            children: {}
          }
        }

        switch (index) {
          case us.length - 1:
            t[s].internal = i
            if (t[s].internal.data.order === undefined) {
              t[s].internal.data.order = 0
            }
            break
          default:
            t = t[s].children
            break
        }
      })
    })

    function resolve(i) {
      let children = []
      if (i.children !== undefined) {
        children = Object.values(i.children).map(resolve)
      }
      return {
        title: "",
        link: "",
        internal: i.internal,
        children
      }
    }

    const g = Object.values(r).map(resolve)

    function sortTrue(t) {
      for (let i = 0; i < t.length - 1; i += 1) {
        for (let j = 0; j < t.length - i - 1; j += 1) {
          if (t[j].internal.data.order === t[j + 1].internal.data.order) {
            if (t[j].internal.url > t[j + 1].internal.url) {
              let temp = t[j];
              t[j] = t[j + 1];
              t[j + 1] = temp;
            }
            continue
          }
          if (t[j].internal.data.order > t[j + 1].internal.data.order) {
            let temp = t[j];
            t[j] = t[j + 1];
            t[j + 1] = temp;
          }
        }
      }
      return t
    }

    function sort(t) {
      return sortTrue(Object.values(t)).map((i) => {
        let c = []
        if (i.children !== undefined) {
          c = sort(i.children)
        }
        return {
          type: "",
          title: i.internal.data.title,
          link: i.internal.url,
          internal: i.internal,
          children: c
        }
      })
    }

    const result = sort(g).map((p) => {
      p.type = "root"
      return p
    })
    return result
  })
}

module.exports = config
