declare global {
  interface Window {
    ColorProvider: typeof ColorProvider
  }

  interface HTMLElementTagNameMap {
    "o-color-provider": ColorProvider
  }
}

function define(): void {
  if (window.customElements.get("o-color-provider")) {
    return
  }
  window.ColorProvider = ColorProvider
  window.customElements.define("o-color-provider", ColorProvider)
}

export class ColorProvider extends HTMLElement {
  connectedCallback(): void {
    // todo
  }
}

type ColorTheme = "regular"

function darkTheme(): ColorTheme {
  return colorTheme("dark-theme")
}

function lightTheme(): ColorTheme {
  return colorTheme("light-theme")
}

function colorTheme(n: string): ColorTheme {
  const s = window.localStorage.getItem(n)
  switch (s) {
  case "regular":
    return s
  default:
    return "regular"
  }
}

type ThemePreference = "auto" | "dark" | "light"

function themePreference(): ThemePreference {
  const s = window.localStorage.getItem("theme-preference")
  switch (s) {
  case "auto":
  case "dark":
  case "light":
    return s
  default:
    return "auto"
  }
}

define()
