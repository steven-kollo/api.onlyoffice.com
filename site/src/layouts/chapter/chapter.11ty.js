const { html } = require("common-tags")
const { ChapterNav } = require("../../blocks/chapter-nav/ChapterNav.js")

function data() {
  return {
    layout: "site/site.11ty.js"
  }
}

function render({ collections, page, content }) {
  return html`
    <div class="product__main">
      <div class="product__inner">
        <nav class="product-nav">
          ${collections.navigation.map((c) => {
            return page.url.startsWith(c.link) && ChapterNav({ page, chapter: c })
          })}
        </nav>
        <main class="product__main2">
          <div class="product__inner2">${content}</div>
        </main>
      </div>
    </div>
  `
}

module.exports = { data, render }
