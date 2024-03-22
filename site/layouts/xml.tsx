import { h, isValidElement } from "preact"
import { renderToString } from "preact-render-to-string"
import type { Eleventy } from "../config/types.ts"
import { transformMarkup } from "../config/markup.ts"

export async function render({ content }: Eleventy.Context): Promise<string> {
  await new Promise((res) => {
    setTimeout(res, 0)
  })

  if (!isValidElement(content)) {
    throw new Error("Invalid element")
  }


  let c = '<?xml version="1.0" encoding="utf-8"?>' + renderToString(content)
  return transformMarkup(c)
}
