const { isBuild, isPreview } = require("@/config/env.cjs")

const docspace = require("@onlyoffice/documentation-resources/docspace.cjs")

function list() {
  const l = docspace.list()
  return l
}

function retrieve(id) {
  return docspace.retrieve(id)
}

module.exports = { list, retrieve }
