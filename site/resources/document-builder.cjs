const documentBuilder = require("@onlyoffice/documentation-resources/document-builder.cjs")
// todo: const { isBuild } = require("../config/env.cjs")

function list() {

  // const l = list()
  // const i = l.find((d) => Object.hasOwn(d, "extends"))
  // const r = l.slice(0, 101)
  // const i2 = l.find((d) => Object.hasOwn(d, "implements"))
  // const i3 = l.find((d) => d.id === "word/api_plugins;Api#AddContentControlDatePicker")
  // const i4 = l.find((d) => d.id === "word/api_plugins;Api#AddContentControl")
  // r.push(i, i2, i3, i4)
  // return r

  return documentBuilder.list()
}

function retrieve(id) {
  return documentBuilder.retrieve(id)
}

module.exports = { list, retrieve }
