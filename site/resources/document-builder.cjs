const { isBuild, isPreview } = require("@/config/env.cjs")

const documentBuilder = true // todo: isBuild() || isPreview()
  ? require("@onlyoffice/documentation-resources/document-builder.cjs")
  : require("./code/code.cjs")

function list() {
  const l = documentBuilder.list()
  if (isBuild() || isPreview()) {
    return l
  }
  const r = l.slice(0, 101)
  r.push(
    l.find((d) => Object.hasOwn(d, "extends")),
    l.find((d) => Object.hasOwn(d, "implements")),
    l.find((d) => d.id === "word/api_plugins;Api#AddContentControlDatePicker"),
    l.find((d) => d.id === "word/api_plugins;Api#AddContentControl"),
    l.find((d) => d.id === "common/plugins/plugin_base_api;Plugin"),
    l.find((d) => d.id === "common/plugins/plugin_base_api;Plugin#callCommand"),
  )
  return r
}

function retrieve(id) {
  return documentBuilder.retrieve(id)
}

module.exports = { list, retrieve }
