import { OnlyofficeLogo } from "@onlyoffice/documentation-ui-kit"
import type { JSX } from "preact"
import { h } from "preact"
import type { Eleventy } from "../config/context.ts"
import { Page } from "../components/page/page.ts"

export function data() {
  return {
    layout: "base"
  }
}

export function render(
  {
    collections,
    page,
    content
  }: Eleventy.Context
): JSX.Element {
  return (
    <Page>
      <Page.Header>
        <Page.HeaderLogo>
          <a href="/"><OnlyofficeLogo /></a>
        </Page.HeaderLogo>
        <Page.HeaderNavigation
          nav={collections.navigation}
          isCurrent={(link) => page.url.startsWith(link)}
        />
      </Page.Header>
      {content}
      <Page.Footer />
    </Page>
  )
}
