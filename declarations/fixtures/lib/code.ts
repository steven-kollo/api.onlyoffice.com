import {createRequire} from "node:module"

const require = createRequire(import.meta.url)

const RESOURCE = "code"

const d = require(`./${RESOURCE}.declarations.json`)
const m = require(`./${RESOURCE}.indexes.json`)

export function list() {
  return d
}

export function retrieve(id: string) {
  const i = m[id]
  if (i === undefined) {
    return
  }
  return d[i]
}
