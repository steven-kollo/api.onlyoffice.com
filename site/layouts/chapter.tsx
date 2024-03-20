import { ChevronRightIcon } from "@onlyoffice/documentation-ui-kit"
import { clsx } from "clsx"
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
  return (
    <ChapterLayout {...ctx}>
      {content}
    </ChapterLayout>
  )
}

export interface ChapterLayoutProperties extends Omit<Eleventy.Context, "content"> {
  children: any
}

export function ChapterLayout(
  {
    children,
    ...ctx
  }: ChapterLayoutProperties
): JSX.Element {
  const c = ctx.collections.navigation.find((c) => {
    return ctx.page.url.startsWith(c.link)
  })
  // todo: check if c is undefined, in ideal case it should never be undefined.
  return (
    <PageLayout {...ctx}>
      <Chapter>
        <Chapter.Navigation>
          <List chapter={c} />
          {/* <Navigation
            chapter={c}
            isExpanded={(c) => {
              return ctx.page.url.startsWith(c.link)
            }}
            isCurrent={(c) => {
              return ctx.page.url === c.link
            }}
          /> */}
        </Chapter.Navigation>
        {children}
      </Chapter>
    </PageLayout>
  )
}

function List({ chapter }) {
  return (
    <div>
      {chapter.title}
      {chapter.children && chapter.children.map((c) => (
        <List key={c.link} chapter={c} />
      ))}
    </div>
  )
}

function Navigation(
  {
    chapter,
    isExpanded,
    isCurrent
  }
): JSX.Element {
  return (
    <o-chapter-nav class="tree" role="navigation">
      <div class="tree">
        <ul class="tree__limb tree__limb_bole">
          {chapter.children && chapter.children.map((c) => (
            <li key={c.link} class="tree__branch tree__branch_bole">
              <div class="tree__twig">
                <a class="tree__leaf tree__leaf_bole" href={c.link}>{c.title}</a>
              </div>
              {c.children && (
                <NavigationItem chapter={c} isExpanded={isExpanded} isCurrent={isCurrent} />
              )}
            </li>
          ))}
        </ul>
      </div>
    </o-chapter-nav>
  )
}

function NavigationItem(
  {
    chapter,
    isExpanded,
    isCurrent
  }
): JSX.Element {
  return (
    <ul class="tree__limb">
      {chapter.children && chapter.children.map((c) => (
        c.children === undefined
          ? (
            <li key={c.link} class="tree__branch">
              <div class="tree__twig">
                <NavigationLink chapter={c} isCurrent={isCurrent} />
              </div>
            </li>
          )
          : (
            <li key={c.link} class="tree__branch">
              <div class={clsx("tree__twig", !isExpanded(c) && "tree__twig_closed")}>
                <button class="tree__fruit" type="button"><ChevronRightIcon /></button><NavigationLink chapter={c} isCurrent={isCurrent} />
              </div>
              <NavigationItem chapter={c} isExpanded={isExpanded} isCurrent={isCurrent} />
            </li>
          )
      ))}
    </ul>
  )
}

function NavigationLink(
  {
    chapter,
    isCurrent
  }
): JSX.Element {
  return (
    <a
      class={clsx("tree__leaf", isCurrent(chapter) && "tree__leaf_current")}
      href={chapter.link}
    >{chapter.title}</a>
  )
}
