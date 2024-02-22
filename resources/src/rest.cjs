// @ts-ignore

const paths = require("./resource.paths.json")

function list() {
  return paths
}

const references = require("./resource.references.json")

function retrieve(id) {
  return references[id]
}

module.exports = { list, retrieve }
