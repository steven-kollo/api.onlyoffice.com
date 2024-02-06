const { html } = require("common-tags")
const { SiteHeader } = require("../../blocks/site-header/SiteHeader.js")
const { SiteFooter } = require("../../blocks/site-footer/SiteFooter.js")
const { SiteNav } = require("../../blocks/site-nav/SiteNav.js")

function render({ collections, page, title, content }) {
  return html`
    <!DOCTYPE html>
    <html>
      <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>${title}</title>
        <link rel="stylesheet" href="/main.css">
        <script src="/main.js"></script>
      </head>
      <body>
        ${SiteHeader({
          logo() {
            return "logo"
          },
          nav() {
            return SiteNav({ page, nav: collections.navigation })
          }
        })}
        ${content}
        ${SiteFooter()}
      </body>
    </html>
  `
}

module.exports = { render }
