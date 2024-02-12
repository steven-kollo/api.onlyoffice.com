import { JSX, h } from "preact"

interface ArticleCardParameters extends JSX.ElementChildrenAttribute {
  sensitive?: "accent"
}

function ArticleCard({ children }: ArticleCardParameters): JSX.Element {
  return (
    <article class="article-card">
      <div class="article-card__inner">
        <img class="article-card__preview" src="https://api.onlyoffice.com/content/img/docbuilder/samples/create-formal-document.svg" />
        {children}
      </div>
    </article>
  )
}

export { ArticleCard, ArticleCardParameters }
