function define() {
  if (window.customElements.get("o-masonry")) return
  window.OMasonry = OMasonry
  window.customElements.define("o-masonry", OMasonry)
}

class OMasonry extends HTMLElement {}

define()

module.exports = { OMasonry }
