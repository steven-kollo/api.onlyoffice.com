import { Content } from "@onlyoffice/documentation-ui-kit"
import type { JSX } from "preact"
import { Fragment, h } from "preact"
import { Eleventy } from "../config/context.ts"
import { Chapter } from "../components/chapter/chapter.ts"
import { Tree } from "../components/tree/tree.ts"
import { PageLayout } from "./page.tsx"

export function data() {
  return {
    layout: "base"
  }
}

export function render(
  {
    content,
    ...ctx
  }: Eleventy.Context
): JSX.Element {
  const c = ctx.collections.navigation.find((c) => {
    return ctx.page.url.startsWith(c.link)
  })
  // todo: check if c is undefined, in ideal case it should never be undefined.
  return (
    <PageLayout {...ctx}>
      <Chapter>
        <Chapter.Navigation>
          <Tree>
            {c.children && c.children.map((c) => (
              <Tree.Group key={c.link}>
                <Tree.Link href={c.link} active={ctx.page.url === c.link}>{c.title}</Tree.Link>
                {c.children && <SubTree {...ctx} chapter={c} />}
              </Tree.Group>
            ))}
          </Tree>
        </Chapter.Navigation>
        <Content>
          {content}
        </Content>
      </Chapter>
    </PageLayout>
  )
}

function SubTree(
  {
    chapter: c,
    ...ctx
  }
): JSX.Element {
  return (
    <>
      {c.children && c.children.map((c) => (
        <Tree.Item expanded={ctx.page.url.startsWith(c.link)}>
          <Tree.Link href={c.link} active={ctx.page.url === c.link}>{c.title}</Tree.Link>
          {c.children && <SubTree {...ctx} chapter={c} />}
        </Tree.Item>
      ))}
    </>
  )
}
