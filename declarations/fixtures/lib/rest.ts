import {createRequire} from "node:module"
import type {REST} from "@onlyoffice/documentation-declarations-types/rest.ts"

const require = createRequire(import.meta.url)

const RESOURCE = "rest"

const c: Partial<Record<string, REST.Component>> = require(`./${RESOURCE}.components.json`)
const d: REST.Declaration[] = require(`./${RESOURCE}.declarations.json`)
// const m: Partial<Record<string, number>> = require(`./${RESOURCE}.indexes.json`)

export function list(): REST.Declaration[] {
  return d
}

export function resolve(id: string): REST.Component | undefined {
  return c[id]
}

// export function retrieve(id: string): REST.Declaration | undefined {
//   const i = m[id]
//   if (i === undefined) {
//     return
//   }
//   return d[i]
// }
