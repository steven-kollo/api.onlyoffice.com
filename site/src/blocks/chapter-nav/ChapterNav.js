// const { ChevronRightIcon } = require("@onlyoffice/documentation-ui-kit-js/kit.js")
const { clsx } = require("clsx")
const { html } = require("common-tags")

function ChapterNav({ page, chapter }) {
  return html`
    <o-page-nav>
      <div class="tree">
        <ul class="tree__limb tree__limb_bole">
          ${chapter.children && chapter.children.map((c) => html`
            <li class="tree__branch tree__branch_bole">
              <div class="tree__twig">
                <a class="tree__leaf tree__leaf_bole" href="${c.link}">${c.title}</a>
              </div>
              ${c.children && ChapterNavItem({ page, chapter: c })}
            </li>
          `)}
        </ul>
      </div>
    </o-page-nav>
  `
}

// todo: chevron #808080.
function ChapterNavItem({ page, chapter }) {
  return html`
    <ul class="tree__limb">
      ${chapter.children.map((c) => html`
        ${c.children === undefined
          ? html`
            <li class="tree__branch">
              <div class="tree__twig">
                ${ChapterNavLink({ page, chapter: c})}
              </div>
            </li>
          `
          : html`
            <li class="tree__branch">
              <div class="tree__twig ${page.url.startsWith(c.link) ? "" : "tree__twig_closed"}">
                <button class="tree__fruit" type="button">h</button>${ChapterNavLink({ page, chapter: c })}
              </div>
              ${ChapterNavItem({ page, chapter: c })}
            </li>
          `}
      `)}
    </ul>
  `
}

function ChapterNavLink({ page, chapter }) {
  return html`
    <a
      class="${clsx("tree__leaf", page.url === chapter.link && "tree__leaf_current")}"
      href="${chapter.link}"
    >${chapter.title}</a>
  `
}

module.exports = { ChapterNav, ChapterNavItem, ChapterNavLink }
