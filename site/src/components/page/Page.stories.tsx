import { Theme as StorybookTheme } from "@onlyoffice/documentation-ui-storybook"
import type { JSX } from "preact"
import { Fragment, h } from "preact"
import css from "./page.css?inline"
// import "./page.css"

export default {
  title: "Site Components/Page",
  decorators: [
    (Story) => (
      <>
        <style>{css}</style>
        <Story />
      </>
    )
  ]
}

const colors: string[] = [
  "page-background-color",
  "page-foreground-color",
  "page-header-background-color",
  "page-header-border-color",
  "page-header-navigation-foreground-color",
  "page-header-navigation-focus-foreground-color",
  "page-footer-background-color",
  "page-footer-border-color",
  "page-footer-navigation-foreground-color",
  "page-footer-navigation-heading-foreground-color",
  "page-footer-navigation-focus-foreground-color"
]

export function Theme(): JSX.Element {
  return (
    <StorybookTheme>
      <StorybookTheme.Color>
        {colors.map((c) => (
          <StorybookTheme.Scale key={c} scale={c} />
        ))}
      </StorybookTheme.Color>
    </StorybookTheme>
  )
}
