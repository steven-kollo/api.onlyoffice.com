import { ChevronRightIcon, useSlots } from "@onlyoffice/documentation-ui-kit"
import { clsx } from "clsx"
import type { JSX } from "preact"
import { Fragment, h } from "preact"

declare global {
  namespace preact {
    namespace JSX {
      interface IntrinsicElements {
        "o-chapter-nav": any
      }
    }
  }
}

export interface Chapter {
  title: string
  link: string
  children?: Chapter[]
}

export interface RootParameters {
  children: any
}

export function Root(
  {
    children
  }: RootParameters
): JSX.Element {
  const [slots] = useSlots(children, {
    nav: Navigation,
    content: Content
  })
  return (
    <div class="product__main">
      <div class="product__inner">
        <nav class="product-nav">
          {slots.nav}
          {/* {collections.navigation.map((c) => (
            page.url.startsWith(c.link) && (
              <Navigation
                chapter={c}
                isExpanded={(c) => {
                  return page.url.startsWith(c.link)
                }}
                isCurrent={(c) => {
                  return page.url === c.link
                }}
              />
            )
          ))} */}
        </nav>
        <main class="product__main2">
          <div class="product__inner2">
            {slots.content}
          </div>
        </main>
      </div>
    </div>
  )
}

export interface NavigationParameters {
  chapter: Chapter
  isExpanded(chapter: Chapter): boolean
  isCurrent(chapter: Chapter): boolean
}

export function Navigation(
  {
    chapter,
    isExpanded,
    isCurrent
  }: NavigationParameters
): JSX.Element {
  return (
    <o-chapter-nav class="tree" role="navigation">
      <div class="tree">
        <ul class="tree__limb tree__limb_bole">
          {chapter.children && chapter.children.map((c) => (
            <li class="tree__branch tree__branch_bole">
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

export function NavigationItem(
  {
    chapter,
    isExpanded,
    isCurrent
  }: NavigationParameters
): JSX.Element {
  return (
    <ul class="tree__limb">
      {chapter.children && chapter.children.map((c) => (
        c.children === undefined
          ? (
            <li class="tree__branch">
              <div class="tree__twig">
                <NavigationLink chapter={c} isCurrent={isCurrent} />
              </div>
            </li>
          )
          : (
            <li class="tree__branch">
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

export function NavigationLink(
  {
    chapter,
    isCurrent
  }: Omit<NavigationParameters, "isExpanded">
): JSX.Element {
  return (
    <a
      class={clsx("tree__leaf", isCurrent(chapter) && "tree__leaf_current")}
      href={chapter.link}
    >{chapter.title}</a>
  )
}

export interface ContentParameters {
  children: any
}

export function Content(
  {
    children
  }: ContentParameters
): JSX.Element {
  return (
    <>
      {children}
    </>
  )
}
