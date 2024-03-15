// @ts-check

import { createRequire } from "module"

const require = createRequire(import.meta.url)

const declarations = require("./code.declarations.json")

export function list() {
  return declarations
}

const indexes = require("./code.indexes.json")

export function retrieve(id) {
  const i = indexes[id]
  if (i === undefined) {
    return
  }
  return declarations[i]
}
