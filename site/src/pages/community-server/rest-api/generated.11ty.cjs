// @ts-check

const { list, retrieve } = require("@/resources/community-server.ts")

function data() {
  return {
    layout: "rest/rest.tsx",
    pagination: {
      data: "items",
      size: 1,
      addAllPagesToCollections: true
    },
    items: list(),
    onRetrieve: retrieve,
    permalink(data) {
      const d = data.pagination.items[0]
      return `/community-server/rest-api/${d.slug}/index.html`
    },
    eleventyComputed: {
      title(data) {
        return data.pagination.items[0].title
      }
    }
  }
}

module.exports = { data }
