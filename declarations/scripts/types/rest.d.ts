import type { REST } from "@onlyoffice/documentation-declarations-types/rest.ts"

export namespace REST {
  export interface ComponentCache {
    headers: Record<string, REST.Property>
  }
}
