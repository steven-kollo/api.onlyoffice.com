import { ChapterNavigation } from "@onlyoffice/documentation-ui-kit"
import { h } from "preact"

function data() {
  return {
    layout: "site/site.tsx"
  }
}

function render({ collections, page, content }) {
  return (
    <div class="product__main">
      <div class="product__inner">
        <nav class="product-nav">
          {collections.navigation.map((c) => (
            page.url.startsWith(c.link) && (
              <ChapterNavigation
                chapter={c}
                isExpanded={(c) => {
                  return page.url.startsWith(c.link)
                }}
                isCurrent={(c) => {
                  return page.url === c.link
                }}
              />
            )
          ))}
        </nav>
        <main class="product__main2">
          <div class="product__inner2">{content}</div>
        </main>
      </div>
    </div>
  )
}

export { data, render }
