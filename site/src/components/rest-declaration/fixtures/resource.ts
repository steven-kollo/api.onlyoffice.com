import declarations from "@onlyoffice/documentation-declarations-fixtures/rest.declarations.json"
import components from "@onlyoffice/documentation-declarations-fixtures/rest.components.json"

export function list() {
  return declarations
}

export function retrieve(id) {
  return components[id]
}
