import kit from "@onlyoffice/documentation-ui-kit/kit.css?inline"
import kitRegular from "@onlyoffice/documentation-ui-kit/kit.regular.css?inline"
import { Theme as StorybookTheme, useStyles } from "@onlyoffice/documentation-ui-storybook"
import type { JSX } from "preact"
import { h } from "preact"
import page from "./page.css?inline"
import pageRegular from "./page.regular.css?inline"
import { Page } from "./page.ts"

const styles: string[] = [
  kit,
  kitRegular,
  page,
  pageRegular
]

export default {
  title: "Site/Page",
  decorators: [
    useStyles(...styles)
  ]
}

export function Composition(
  {
    children
  }
): JSX.Element {
  return (
    <Page>
      <Page.Header>
        <Page.HeaderLogo>
          logo
        </Page.HeaderLogo>
        <Page.HeaderNavigation
          nav={[]}
          isCurrent={(link) => false}
        />
      </Page.Header>
      <div>
        {children}
      </div>
      <Page.Footer />
    </Page>
  )
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
