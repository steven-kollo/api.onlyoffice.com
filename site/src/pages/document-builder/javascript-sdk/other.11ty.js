const { basename } = require("node:path")
// const { isBuiltin } = require // todo: cjs
const { list, retrieve } = require("@onlyoffice/documentation-resources-document-builder")

/**
 * @typedef {import("@onlyoffice/documentation-declarations").Declaration} Declaration
 */

const items = list()

function data() {
  const data = {
    // layout: "class/class.webc",
    layout: "blank/blank.webc",
    pagination: {
      data: "items",
      size: 1,
      addAllPagesToCollections: true,
      before(data) {
        // data.order = 0
        // https://github.com/11ty/eleventy/issues/2260
        return data.filter((d) => d.kind !== "builtin")
      }
    },
    items,
    permalink(data) {
      /** @type {Declaration} */
      const d = data.pagination.items[0]
      if (d.kind === "builtin") {
        return false
      }

      // let p = ""
      let p = d._package
      // switch (d._package) {
      //   case "word":
      //     p = "text"
      //     break
      //   case "cell":
      //     p = "spreadsheet"
      //     break
      //   case "slide":
      //     p = "presentation"
      //     break
      //   case "form":
      //     p = "form"
      //     break
      // }

      let u = ""
      switch (d.kind) {
        case "builtin":
          u = `/document-builder/javascript-sdk/_/${d.name}/index.html`
          break
        case "class":
          u = `/document-builder/javascript-sdk/${p}/${d.name}/index.html`
          break
        case "event":
          u = `/document-builder/javascript-sdk/${p}/_e/${d.name}/index.html`
          break
        case "function":
          u = `/document-builder/javascript-sdk/${p}/${d.memberof}/${d.name}/index.html`
          break
        case "typedef":
          u = `/document-builder/javascript-sdk/${p}/_t/${d.name}/index.html`
          break
        default:
          throw new Error(`Unknown kind: ${d.kind}`)
      }

      return u
    },
    eleventyComputed: {
      title(data) {
        return basename(data.page.url)
      },
      currentName(data) {
        return basename(data.page.url)
      },
      eleventyExcludeFromCollections(data) {
        /** @type {Declaration} */
        const d = data.pagination.items[0]
        return d.kind === "builtin"
      }
    }
  }

  return data
}

function render() {
  return ""
}

module.exports = { data, render }
