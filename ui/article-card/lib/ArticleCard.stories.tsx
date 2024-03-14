import "@onlyoffice/documentation-ui-content/content.css"
import "./article-card.css"

import { Content } from "@onlyoffice/documentation-ui-content"
import { Theme as StorybookTheme } from "@onlyoffice/documentation-ui-storybook"
import type { JSX } from "preact"
import { h } from "preact"
import { ArticleCard } from "./article-card.server.ts"

export default {
  title: "UI Kit/ArticleCard"
}

export function Composition(): JSX.Element {
  return (
    <ArticleCard>
      <Content>
        <h3>Creates multi-page document with formal styles.</h3>
        <p>This example creates a multi-page formal document with a header, footer, charts and footnotes.</p>
        <p><a href="/">More</a></p>
      </Content>
    </ArticleCard>
  )
}

const colors: string[] = [
  "article-card-shadow-color",
  "article-card-preview-background-color",
  "article-card-border-color"
]

export function Theme(): JSX.Element {
  return (
    <StorybookTheme>
      <StorybookTheme.Color>
        {colors.map((c) => (
          <StorybookTheme.Scale key={c} scale={c} />
        ))}
      </StorybookTheme.Color>
    </StorybookTheme>
  )
}
