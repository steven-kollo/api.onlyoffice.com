import type {JSX} from "preact"
import {h} from "preact"
import remarkGFM from "remark-gfm"
import remarkParse from "remark-parse"
import remarkRehype from "remark-rehype"
import {unified} from "unified"
import {rehypePlugin as rehypePreact} from "../../config/preact.ts"
import {rehypePlugin as rehypeImage} from "../image/image.config.ts"
import {rehypePlugin as rehypeSyntax} from "../syntax-highlight/syntax-highlight.config.ts"
import {useSuspense} from "../suspense.tsx"

export interface RootParameters {
  children: any
}

export function Root({children}: RootParameters): JSX.Element {
  let result: JSX.Element | null = null

  const Suspense = useSuspense(async () => {
    const v = await unified()
      .use(remarkParse)
      .use(remarkGFM)
      .use(remarkRehype)
      .use(rehypeImage)
      .use(rehypeSyntax)
      .use(rehypePreact)
      .process(children)
    result = v.result as JSX.Element
  })

  return (
    <Suspense>
      <Suspender />
    </Suspense>
  )

  function Suspender() {
    return result
  }
}
