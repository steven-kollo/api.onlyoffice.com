// @ts-ignore

const declarations = require("./resource.declarations.json")

function list() {
  return declarations
}

const entities = require("./resource.entities.json")

function retrieve(id) {
  return entities[id]
}

module.exports = { list, retrieve }
