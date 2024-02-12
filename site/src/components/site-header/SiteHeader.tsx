import { h } from "preact"

function SiteHeader({ logo, nav }) {
  return (
    <header class="site-header">
      <div class="site-header__inner">
        <div class="site-header__logo">
          <a href="/">{logo}</a>
        </div>
        <div class="site-header__nav">{nav}</div>
      </div>
    </header>
  )
}

export { SiteHeader }
