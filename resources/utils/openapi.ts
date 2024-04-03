import type {OpenAPIComponentsKey} from "@onlyoffice/documentation-declarations-scripts/openapi.ts"
import Pick from "stream-json/filters/Pick.js"

export class PickPath extends Pick {
  constructor() {
    super({filter: "paths"})
  }
}

export class PickComponent extends Pick {
  constructor(key: OpenAPIComponentsKey) {
    super({filter: `components.${key}`})
  }
}
