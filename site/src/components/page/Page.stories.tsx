import kit from "@onlyoffice/documentation-ui-kit/kit.css?inline"
import kitRegular from "@onlyoffice/documentation-ui-kit/kit.regular.css?inline"
import { Theme as StorybookTheme } from "@onlyoffice/documentation-ui-storybook"
import type { JSX } from "preact"
import { Fragment, h } from "preact"
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
    (Story: any): JSX.Element => (
      <>
        {styles.map((s) => (
          <style key={s} dangerouslySetInnerHTML={{ __html: s }} />
        ))}
        <Story />
      </>
    )
  ]
}

export function Composition(): JSX.Element {
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
        content
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