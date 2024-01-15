const { basename } = require("node:path")
const { cell } = require("../../../../resources/document-builder/main.js")

/**
 * @typedef {import("@onlyoffice-demo-docs/document-builder/main.js").TypeDefinition} TypeDefinition
 */

function data() {
  const data = {
    layout: "class/class.webc",
    pagination: {
      data: "items",
      size: 1,
      addAllPagesToCollections: true
    },
    items: [
      ...populate(cell, "spreadsheet"),
      // ...populate(form, "form"),
      // ...populate(slide, "presentation"),
      // ...populate(word, "text")
    ],
    permalink(data) {
      /** @type {TypeDefinition} */
      const d = data.pagination.items[0]
      let u = `/document-builder/javascript-sdk/${d.slug}/`
      switch (d.type) {
        case "class":
          u += `${d.name}/index.html`
          break
        case "member":
          u += `${d.memberof}/${d.name}/index.html`
          break
      }
      return u
    },
    eleventyComputed: {
      title(data) {
        return basename(data.page.url)
      },
      currentName(data) {
        return basename(data.page.url)
      }
    }
  }

  return data
}

/**
 * @param {TypeDefinition[]} raw
 * @param {string} slug
 * @returns {(TypeDefinition | { slug: string })[]}
 */
function populate(raw, slug) {
  // todo: permalink
  return raw.map((o) => {
    return {
      ...o,
      slug: slug
    }
  })
}

function render() {
  return ""
}

module.exports = { data, render }
