import {starryNight} from "@onlyoffice/eleventy-starry-night"
import {rehypeStarryNight} from "@onlyoffice/rehype-starry-night"
import type {JSX} from "preact"
import {h} from "preact"
import remarkGFM from "remark-gfm"
import remarkParse from "remark-parse"
import remarkRehype from "remark-rehype"
import {unified} from "unified"
import {rehypePlugin as rehypePreact} from "../../config/preact.ts"
import {rehypePlugin as rehypeImage} from "../image/image.config.ts"
import {useSuspense} from "../suspense.tsx"

import rehypeSlug from "rehype-slug"
import rehypeAutolink from "rehype-autolink-headings"

import {remarkDocumentBuilder} from "@onlyoffice/remark-document-builder"
import {rehypeDocumentBuilderContainer} from "../document-builder-container/rehype.ts"

export interface RootParameters {
  children: any
}

export function Root({children}: RootParameters): JSX.Element {
  let result: JSX.Element | null = null

  const Suspense = useSuspense(async () => {
    const v = await unified()
      .use(remarkParse)
      .use(remarkDocumentBuilder)
      .use(remarkGFM)
      .use(remarkRehype)
      .use(rehypeSlug)
      .use(rehypeAutolink, {behavior: "wrap"})
      .use(rehypeImage)
      .use(rehypeStarryNight, starryNight)
      .use(rehypeDocumentBuilderContainer)
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
