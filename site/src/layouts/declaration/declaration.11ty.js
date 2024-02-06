const { Declaration } = require("../../blocks/declaration/Declaration.js")

function data() {
  return {
    layout: "chapter/chapter.11ty.js"
  }
}

function render({ pagination, onRetrieve, onLink }) {
  return pagination.items.map((d) => {
    return Declaration({ onRetrieve, onLink, declaration: d })
  })
}

module.exports = { data, render }
