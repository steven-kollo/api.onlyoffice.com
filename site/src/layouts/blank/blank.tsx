import { h } from "preact"

function data() {
  return {
    layout: "site/site.tsx"
  }
}

function render({ content }) {
  return (
    <main class="blank__main">
      <div class="blank__inner">{content}</div>
    </main>
  )
}

export { data, render }
