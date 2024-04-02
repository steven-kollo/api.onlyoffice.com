import { createRequire } from "module"
import { isBuild, isPreview } from "../config/mode.ts"

const require = createRequire(import.meta.url)

const r = isBuild() || isPreview()
  ? require("@onlyoffice/documentation-resources/community-server.cjs")
  : require("@onlyoffice/documentation-declarations-fixtures/rest.js")

export function list() {
  // todo: implement it.
  return []
  // return r.list()
}

export function retrieve(id) {
  return r.retrieve(id)
}