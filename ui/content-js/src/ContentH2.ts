import { html } from "common-tags"

function ContentH2(children) {
  return html`
    <h2 class="content-h2">
      <span class="content-h2__inner">
        ${children()}
        <!-- todo: <a class="content-h2__anchor" :href="anchor"></a> -->
      </span>
    </h2>
  `
}

export { ContentH2 }
