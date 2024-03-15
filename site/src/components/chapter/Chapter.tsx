import { ChevronRightIcon } from "@onlyoffice/documentation-ui-kit"
import { clsx } from "clsx"
import type { JSX } from "preact"
import { h } from "preact"

declare global {
  namespace preact {
    namespace JSX {
      interface IntrinsicElements {
        "o-chapter-nav": any
      }
    }
  }
}

// todo
// chapter
//   chapter-navigation
//   chapter-content
// chapter

export interface ChapterNavigationProperties {
  chapter: Chapter
  isExpanded(chapter: Chapter): boolean
  isCurrent(chapter: Chapter): boolean
}

export interface Chapter {
  title: string
  link: string
  children?: Chapter[]
}

export function ChapterNavigation(
  {
    chapter,
    isExpanded,
    isCurrent
  }: ChapterNavigationProperties
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
                <ChapterNavigationItem chapter={c} isExpanded={isExpanded} isCurrent={isCurrent} />
              )}
            </li>
          ))}
        </ul>
      </div>
    </o-chapter-nav>
  )
}

export function ChapterNavigationItem(
  {
    chapter,
    isExpanded,
    isCurrent
  }: ChapterNavigationProperties
): JSX.Element {
  return (
    <ul class="tree__limb">
      {chapter.children && chapter.children.map((c) => (
        c.children === undefined
          ? (
            <li class="tree__branch">
              <div class="tree__twig">
                <ChapterNavigationLink chapter={c} isCurrent={isCurrent} />
              </div>
            </li>
          )
          : (
            <li class="tree__branch">
              <div class={clsx("tree__twig", !isExpanded(c) && "tree__twig_closed")}>
                <button class="tree__fruit" type="button"><ChevronRightIcon /></button><ChapterNavigationLink chapter={c} isCurrent={isCurrent} />
              </div>
              <ChapterNavigationItem chapter={c} isExpanded={isExpanded} isCurrent={isCurrent} />
            </li>
        )
      ))}
    </ul>
  )
}

export function ChapterNavigationLink(
  {
    chapter,
    isCurrent
  }: Omit<ChapterNavigationProperties, "isExpanded">
): JSX.Element {
  return (
    <a
      class={clsx("tree__leaf", isCurrent(chapter) && "tree__leaf_current")}
      href={chapter.link}
    >{chapter.title}</a>
  )
}
