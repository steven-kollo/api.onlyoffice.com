import { createRequire } from "module"
import { isBuild, isPreview } from "../config/mode.ts"

const require = createRequire(import.meta.url)

const r = isBuild() || isPreview()
  ? require("@onlyoffice/documentation-resources/document-builder.cjs")
  : require("@onlyoffice/documentation-declarations-fixtures/code.js")

export function list() {
  return r.list()
}

export function retrieve(id) {
  return r.retrieve(id)
}
