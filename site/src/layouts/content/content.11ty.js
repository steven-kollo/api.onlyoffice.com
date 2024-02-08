// const { Content } = require("@onlyoffice/documentation-ui-kit-js/kit.js")

function data() {
  return {
    layout: "chapter/chapter.11ty.js"
  }
}

function render({ content }) {
  return content
  // return Content(() => content)
}

module.exports = { data, render }
