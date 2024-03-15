// @ts-check

const { list, retrieve } = require("@/resources/docspace.ts")

function data() {
  return {
    layout: "rest",
    pagination: {
      data: "items",
      size: 1,
      addAllPagesToCollections: true
    },
    items: list(),
    onRetrieve: retrieve,
    permalink(data) {
      return permalink(data.pagination.items[0])
    },
    eleventyComputed: {
      title(data) {
        return data.pagination.items[0].title
      },
    }
  }
}

function permalink(d) {
  return `/docspace/rest-api/${d.slug}/index.html`
}

module.exports = { data }
