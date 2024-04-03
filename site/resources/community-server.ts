import { createRequire } from "module"
import { isBuild, isPreview } from "../config/mode.ts"

const require = createRequire(import.meta.url)

const r = isBuild() || isPreview()
  ? require("@onlyoffice/documentation-resources/community-server.ts")
  : require("@onlyoffice/documentation-declarations-fixtures/rest.ts")

export function list() {
  return r.list()
}

export function retrieve(id) {
  return r.resolve(id)
}
