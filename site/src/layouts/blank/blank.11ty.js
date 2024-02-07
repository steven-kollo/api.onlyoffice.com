const { html } = require("common-tags")

function data() {
  return {
    layout: "site/site.11ty.js"
  }
}

function render({ content }) {
  return html`
    <main class="blank__main">
      <div class="blank__inner">${content}</div>
    </main>
  `
}

module.exports = { data, render }
