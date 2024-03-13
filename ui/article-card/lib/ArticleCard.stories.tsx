import "@onlyoffice/documentation-ui-content/content.css"
import "./article-card.css"

import { h } from "preact"
import { ArticleCard } from "./ArticleCard.tsx"
import { Content } from "@onlyoffice/documentation-ui-content"

export default {
  title: "UI Kit/ArticleCard"
}

export const Default = {
  render() {
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
}
