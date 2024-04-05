import type {Root} from "hast"
import type {Options} from "hast-util-to-jsx-runtime"
import {toJsxRuntime} from "hast-util-to-jsx-runtime"
import {Fragment, jsx, jsxs} from "preact/jsx-runtime"
import type {JSX} from "preact"
import type {Processor} from "unified"

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

// https://github.com/rehypejs/rehype-react/blob/main/lib/index.js#L18
export function rehypePlugin(this: any) {
  const self: Processor<undefined, undefined, undefined, Root, JSX.Element> = this
  self.compiler =
  function compiler(t, f) {
    const o = {filePath: f.path, Fragment, jsx, jsxs} as Options
    return toJsxRuntime(t, o)
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
