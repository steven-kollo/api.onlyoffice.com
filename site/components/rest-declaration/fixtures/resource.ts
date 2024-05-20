import declarations from "@onlyoffice/documentation-declarations-fixtures/rest.declarations.json"
import components from "@onlyoffice/documentation-declarations-fixtures/rest.components.json"
import type * as REST from "@onlyoffice/service-declaration"

const d = declarations as REST.Request[]

export function list(): REST.Request[] {
  return d
}

const c = components as Record<string, REST.Component>

export function retrieve(id: string): REST.Component | undefined {
  return c[id]
}
