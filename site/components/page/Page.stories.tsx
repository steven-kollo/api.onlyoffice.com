import kit from "@onlyoffice/documentation-ui-kit/kit.css?inline"
import kitRegular from "@onlyoffice/documentation-ui-kit/kit.regular.css?inline"
import { OnlyofficeLogo } from "@onlyoffice/documentation-ui-kit"
import { Theme as StorybookTheme, useStyles } from "@onlyoffice/documentation-ui-storybook"
import type { JSX } from "preact"
import { h } from "preact"
import page from "./page.css?inline"
import pageRegular from "./page.regular.css?inline"
import { Page } from "./page.ts"

export const styles: string[] = [
  kit,
  kitRegular,
  page,
  pageRegular
]

export default {
  title: "Site/Page",
  decorators: [
    ...useStyles(...styles)
  ]
}

export interface CompositionParameters {
  children: any
}

export function Composition(
  {
    children
  }: CompositionParameters
): JSX.Element {
  return (
    <Page>
      <Page.Header>
        <Page.HeaderLogo>
          <a href="/"><OnlyofficeLogo /></a>
        </Page.HeaderLogo>
        <Page.HeaderNavigation>
          <Page.HeaderNavigationLink href="/docspace/">DocSpace</Page.HeaderNavigationLink>
          <Page.HeaderNavigationLink active href="/document-server/">Document Server</Page.HeaderNavigationLink>
          <Page.HeaderNavigationLink href="/plugins-and-macros/">Plugins and Macros</Page.HeaderNavigationLink>
          <Page.HeaderNavigationLink href="/document-builder/">Document Builder</Page.HeaderNavigationLink>
          <Page.HeaderNavigationLink href="/desktop-editors/">Desktop Editors</Page.HeaderNavigationLink>
          <Page.HeaderNavigationLink href="/community-server/">Community Server</Page.HeaderNavigationLink>
        </Page.HeaderNavigation>
      </Page.Header>
      {children}
      <Page.Footer />
    </Page>
  )
}

Composition.args = {
  children: "content"
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
