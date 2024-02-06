const { clsx } = require("clsx")
const { html } = require("common-tags")

function ChapterNav({ page, chapter }) {
  return html`
    <o-page-nav>
      <div class="tree">
        <ul class="tree__limb tree__limb_bole">
          ${chapter.children.map((c) => html`
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
                <button class="tree__fruit" type="button"><svg fill="none" version="1.1" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="m4.531 2.5923 1e-6 18.815c0 1.3326 1.5415 2.0735 2.5821 1.241l11.76-9.4077c0.79529-0.63623 0.79529-1.8458 0-2.4821l-11.76-9.4077c-1.0406-0.8325-2.5821-0.091605-2.5821 1.241z" fill="#808080" /></svg></button>${ChapterNavLink({ page, chapter: c })}
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
