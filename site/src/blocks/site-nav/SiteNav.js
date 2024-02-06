const { clsx } = require("clsx")
const { html } = require("common-tags")

function SiteNav({ page, nav }) {
  return html`
    <nav class="site-nav">
      ${nav.map((item) => html`
        <div class="site-nav__container">
          <a
            class="${clsx("site-nav__link", page.url.startsWith(item.link) && "site-nav__link_current")}"
            href="${item.link}"
            >${item.title}</a
          >
        </div>
      `)}
    </nav>
  `
}

module.exports = { SiteNav }
