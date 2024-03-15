import colorRegular from "@onlyoffice/documentation-ui-color/color.regular.css?inline"
import content from "@onlyoffice/documentation-ui-content/content.css?inline"
import contentRegular from "@onlyoffice/documentation-ui-content/content.regular.css?inline"
import { Content } from "@onlyoffice/documentation-ui-content"
import { Theme as StorybookTheme } from "@onlyoffice/documentation-ui-storybook"
import typography from "@onlyoffice/documentation-ui-typography/typography.css?inline"
import type { JSX } from "preact"
import { Fragment, h } from "preact"
import articleCard from "./article-card.css?inline"
import articleCardRegular from "./article-card.regular.css?inline"
import { ArticleCard } from "./article-card.server.ts"

const styles: string[] = [
  colorRegular,
  typography,
  content,
  contentRegular,
  articleCard,
  articleCardRegular
]

export default {
  title: "UI Kit/ArticleCard",
  decorators: [
    (Story: any): JSX.Element => (
      <>
        {styles.map((s) => (
          <style key={s} dangerouslySetInnerHTML={{ __html: s }} />
        ))}
        <Story />
      </>
    )
  ]
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
