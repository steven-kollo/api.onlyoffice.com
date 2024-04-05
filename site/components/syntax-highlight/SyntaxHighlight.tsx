import type {JSX} from "preact"
import {unified} from "unified"
import {rehypePlugin as rehypePreact} from "../../config/preact.ts"
import {highlight} from "./syntax-highlight.config.ts"

export interface RootParameters {
  syntax: string
  children: any
}

export function Root({syntax, children}: RootParameters): JSX.Element {
  const v = unified()
    .use(function () {
      this.parser = function parser() {
        return highlight(syntax, children)
      }
    })
    .use(rehypePreact)
    .processSync(children)
  return v.result as JSX.Element
}
