// @ts-check

const { basename } = require("node:path")
const { list, retrieve } = require("@onlyoffice/documentation-resources/document-builder.cjs")

function data() {
  return {
    layout: "declaration/declaration.tsx",
    pagination: {
      data: "items",
      size: 1,
      addAllPagesToCollections: true
    },
    // todo: do not forget to remove slice.
    items: (() => {
      const l = list()
      const i = l.find((d) => Object.hasOwn(d, "extends"))
      const r = l.slice(0, 101)
      const i2 = l.find((d) => Object.hasOwn(d, "implements"))
      const i3 = l.find((d) => d.id === "word/apiBuilder;ReviewReport")
      const i4 = l.find((d) => d.id === "word/api_plugins;Api#AddContentControl")
      r.push(i, i2, i3, i4)
      return r
    })(),
    permalink(data) {
      return permalink(data.pagination.items[0])
    },
    eleventyComputed: {
      title(data) {
        return basename(data.page.url)
      },
      currentName(data) {
        return basename(data.page.url)
      }
    },
    onRetrieve(t) {
      return retrieve(t.id)
    },
    onLink(t) {
      const d = retrieve(t.id)
      if (d === undefined) {
        return undefined
      }
      return permalink(d)
    }
  }
}

function permalink(d) {
  let p = d.meta.package
  if (d.meta.package.startsWith("word")) {
    p = "text"
  } else if (d.meta.package.startsWith("cell")) {
    p = "spreadsheet"
  } else if (d.meta.package.startsWith("slide")) {
    p = "presentation"
  } else if (d.meta.package.startsWith("forms")) {
    p = "form"
  } else if (d.meta.package.startsWith("common")) {
    p = "common"
  } else {
    throw new Error(`pages: unknown package: ${d.meta.package}`)
  }
  let u = `/document-builder/client-sdk/${p}/`
  if (Object.hasOwn(d, "parent")) {
    const r = retrieve(d.parent.id)
    if (r !== undefined) {
      u += `${r.identifier}/`
    }
  }
  u += `${d.identifier}/index.html`
  return u
}

function render() {
  return ""
}

module.exports = { data, render }
