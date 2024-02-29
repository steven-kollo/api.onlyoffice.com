declare global {
  interface Window {
    CodeListing: typeof CodeListing
  }

  interface HTMLElementTagNameMap {
    "o-code-listing": CodeListing
  }
}

function define(): void {
  if (window.customElements.get("o-code-listing")) {
    return
  }
  window.CodeListing = CodeListing
  window.customElements.define("o-code-listing", CodeListing)
}

class CodeListing extends HTMLElement {
  connectedCallback(): void {
    const tabs = this.querySelector(".code-listing__tabs")
    if (tabs !== undefined && tabs instanceof HTMLElement) {
      tabs.addEventListener("click", (e) => {
        const t = e.target
        if (t !== null && t instanceof HTMLElement) {
          if (t.classList.contains("code-listing__tab")) {
            const a = tabs.querySelector(".code-listing__tab_active")
            if (a !== null) {
              a.classList.remove("code-listing__tab_active")
            }
            t.classList.add("code-listing__tab_active")

            const g = t.innerText
            const c = this.querySelector(`template[data-group="${g}"]`)
            if (c !== null && c instanceof HTMLTemplateElement) {
              const b = this.querySelector(".code-listing__body")
              if (b !== null && b instanceof HTMLElement) {
                b.innerHTML = ""
                b.replaceWith(c.content.cloneNode(true))
              }
            }
          }
        }
      })
    }
  }
}

define()

export { CodeListing }
