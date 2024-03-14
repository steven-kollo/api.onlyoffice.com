import type { JSX } from "preact"
import { h } from "preact"

// todo: rename to root

export interface ArticleCardProperties {
  children: any
  // variant?: "accent" // todo
}

export function ArticleCard(
  {
    children,
    // variant
  }: ArticleCardProperties
): JSX.Element {
  return (
    <article class="article-card">
      <div class="article-card__inner">
        {/* <img class="article-card__preview" src="https://api.onlyoffice.com/content/img/docbuilder/samples/create-formal-document.svg" /> */}
        {children}
      </div>
    </article>
  )
}
