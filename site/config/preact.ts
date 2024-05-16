import type {JSX} from "preact"

import {wait} from "@onlyoffice/documentation-utils/wait.ts"
import {renderToStringAsync} from "preact-render-to-string"
import {isValidElement} from "preact"
import {transformMarkup} from "../config/markup.ts"
import {createSuspense} from "../components/suspense.tsx"

declare module "unified" {
  interface CompileResultMap {
    JsxElement: JSX.Element
  }
}

export async function renderToString(el: JSX.Element): Promise<string> {
  // todo: explain. DO NOT DELETE THE HACK BELLOW!
  await wait()

  if (!isValidElement(el)) {
    throw new Error("Invalid element")
  }

  const r = createSuspense()
  const p = renderToStringAsync(el)
  r()
  const c = await p

  return transformMarkup(c)
}
