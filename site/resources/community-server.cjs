const { isBuild, isPreview } = require("@/config/env.cjs")

const r = require("@onlyoffice/documentation-resources/community-server.cjs")

function list() {
  let l = r.list()
  l = l.filter((i) => i.slug !== "project/tasks/get-my-tasks-by-status")
  return l
}

function retrieve(id) {
  return r.retrieve(id)
}

module.exports = { list, retrieve }
