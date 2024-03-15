import declarations from "@onlyoffice/documentation-declarations-fixtures/code.declarations.json"
import indexes from "@onlyoffice/documentation-declarations-fixtures/code.indexes.json"

export function list() {
  return declarations
}

export function retrieve(id) {
  const i = indexes[id]
  if (i === undefined) {
    return
  }
  return declarations[i]
}
