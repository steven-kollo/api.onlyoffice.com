const { Declaration } = require("../../blocks/declaration/Declaration.js")

function data() {
  return {
    layout: "chapter/chapter.11ty.js"
  }
}

async function render({ pagination, onRetrieve, onLink }) {
  return await Promise.all(pagination.items.map((d) => {
    return Declaration({ onRetrieve, onLink, declaration: d })
  }))
}

module.exports = { data, render }
