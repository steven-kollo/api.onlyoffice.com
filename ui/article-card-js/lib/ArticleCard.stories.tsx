import { h } from "preact"
import { ArticleCard } from "./ArticleCard.tsx"
import { Content } from "@onlyoffice/documentation-ui-content-js"
import "@onlyoffice/documentation-ui-content-js/content.css"
import "./article-card.css"

export default {
  title: "Components/ArticleCard"
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
