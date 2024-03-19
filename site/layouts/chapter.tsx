import { Content } from "@onlyoffice/documentation-ui-kit"
import type { JSX } from "preact"
import { h } from "preact"
import { Eleventy } from "../config/context.ts"
import { Chapter } from "../components/chapter/chapter.ts"

export function data() {
  return {
    layout: "page"
  }
}

export function render(
  {
    collections,
    page,
    content
  }: Eleventy.Context
): JSX.Element {
  const c = collections.navigation.find((c) => {
    return page.url.startsWith(c.link)
  })
  // todo: check if c is undefined, in ideal case it should never be undefined.
  return (
    <Chapter>
      <Chapter.Navigation
        chapter={c}
        isExpanded={(c) => {
          return page.url.startsWith(c.link)
        }}
        isCurrent={(c) => {
          return page.url === c.link
        }}
      />
      <Chapter.Content>
        <Content>
          {content}
        </Content>
      </Chapter.Content>
    </Chapter>
  )
}
