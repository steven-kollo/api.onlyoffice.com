import type { JSX } from "preact"
import { h } from "preact"

export interface RootProperties {
  children: any
}

export function Root(
  {
    children
  }: RootProperties
): JSX.Element {
  return (
    <article class="article-card">
      <div class="article-card__inner">
        <img class="article-card__preview" src="https://api.onlyoffice.com/content/img/docbuilder/samples/create-formal-document.svg" />
        {children}
      </div>
    </article>
  )
}
