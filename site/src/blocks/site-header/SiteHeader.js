const { html } = require("common-tags")

function SiteHeader({ logo, nav }) {
  // todo: overload logo and nav.
  return html`
    <header class="site-header">
      <div class="site-header__inner">
        <div class="site-header__logo">
          <a href="/">${logo()}</a>
        </div>
        <div class="site-header__nav">${nav()}</div>
      </div>
    </header>
  `
}

module.exports = { SiteHeader }
