import type { REST } from "@onlyoffice/documentation-declarations-types/rest.ts"
import { Markdown } from "@/src/components/markdown/Markdown.tsx"
import type { JSX } from "preact"
import { Fragment, h } from "preact"
import { Declaration } from "./declaration.tsx"

export function data() {
  return {
    layout: "chapter/chapter.tsx"
  }
}

export interface Parameters {
  pagination: {
    items: REST.Request[]
  }
  onRetrieve(id: string): REST.Component | undefined
}

export function render(
  {
    pagination,
    onRetrieve: retrieve
  }: Parameters
): JSX.Element {
  return (
    <>
      {pagination.items.map((d) => (
        <Declaration
          declaration={d}
          onRenderDescription={Markdown}
          onRetrieve={retrieve}
        />
      ))}
    </>
  )
}
