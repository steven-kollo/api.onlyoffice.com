// @ts-check

const { list, retrieve } = require("@/resources/document-builder.ts")

function data() {
  return {
    layout: "blank/blank.tsx",
    pagination: {
      data: "items",
      size: 1,
      addAllPagesToCollections: true
    },
    items: list(),
    permalink(data) {
      return permalink(data.pagination.items[0])
    },
    eleventyComputed: {
      title(data) {
        return data.pagination.items[0].title
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
  // todo: it should be part of the declarations packages.
  if (d.meta.package.startsWith("word/api_plugins")) {
    p = "text/_plugins"
  } else if (d.meta.package.startsWith("word")) {
    p = "text"
  } else if (d.meta.package.startsWith("cell/api_plugins")) {
    p = "spreadsheet/_plugins"
  } else if (d.meta.package.startsWith("cell")) {
    p = "spreadsheet"
  } else if (d.meta.package.startsWith("slide/api_plugins")) {
    p = "presentation/_plugins"
  } else if (d.meta.package.startsWith("slide")) {
    p = "presentation"
  } else if (d.meta.package.startsWith("forms")) {
    p = "form"
  } else if (d.meta.package.startsWith("common/apiBase_plugins")) {
    p = "common/_plugins"
  } else if (d.meta.package.startsWith("common")) {
    p = "common"
  } else {
    throw new Error(`pages: unknown package: ${d.meta.package}`)
  }
  // todo: use onRetrieve
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

module.exports = { data }
