import { wait } from "@onlyoffice/documentation-utils/wait.ts"
import { h, isValidElement } from "preact"
import { renderToString } from "preact-render-to-string"
import type { Eleventy } from "../config/eleventy.ts"
import { transformMarkup } from "../config/markup.ts"

export async function render({ content }: Eleventy.Context): Promise<string> {
  // See the `layouts/html.tsx` for explanation.
  await wait()

  if (!isValidElement(content)) {
    throw new Error("Invalid element")
  }

  const c = '<?xml version="1.0" encoding="utf-8"?>' + renderToString(content)
  return transformMarkup(c)
}
