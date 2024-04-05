// import {wait} from "@onlyoffice/documentation-utils/wait.ts"
// import {h} from "preact"
import type {Eleventy} from "../config/eleventy.ts"
import {renderToString} from "../config/preact.ts"

export async function render({content}: Eleventy.Context): Promise<string> {
  // // See the `layouts/html.tsx` for explanation.
  // await wait()
  const c = await renderToString(content)
  return `<?xml version="1.0" encoding="utf-8"?>${c}`
}
