import { clsx } from "clsx"
import { h } from "preact"

function SiteNav({ page, nav }) {
  return (
    <nav class="site-nav">
      {nav.map((item) => (
        <div class="site-nav__container">
          <a
            class={clsx("site-nav__link", page.url.startsWith(item.link) && "site-nav__link_current")}
            href={item.link}
            >{item.title}</a
          >
        </div>
      ))}
    </nav>
  )
}

function render() {
  return ""
}

export { render, SiteNav }
