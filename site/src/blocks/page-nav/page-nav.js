function define() {
  if (window.customElements.get("o-page-nav")) {
    return
  }
  window.OPageNav = OPageNav
  window.customElements.define("o-page-nav", OPageNav)
}

class OPageNav extends HTMLElement {
  connectedCallback() {
    this.addEventListener("click", (e) => {
      const b = e.target
      if (!(
        b instanceof HTMLButtonElement &&
        b.classList.contains("tree__fruit")
      )) {
        return
      }

      const d = b.parentElement
      if (!d) {
        return
      }
      if (!d.classList.contains("tree__twig")) {
        return
      }

      if (d.classList.contains("tree__twig_closed")) {
        d.classList.remove("tree__twig_closed")
      } else {
        d.classList.add("tree__twig_closed")
      }
    })
  }
}

define()

module.exports = { OPageNav }
