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

export function render(ctx: Eleventy.Context): JSX.Element {
  return (
    <PageLayout {...ctx}>
      {ctx.content}
    </PageLayout>
  )
}

export interface PageLayoutProperties extends Omit<Eleventy.Context, "content"> {
  children: any
}

export function PageLayout(
  {
    children,
    collections,
    page
  }: PageLayoutProperties
): JSX.Element {
  return (
    <Page>
      <Page.Header>
        <Page.HeaderLogo>
          <a href="/"><OnlyofficeLogo /></a>
        </Page.HeaderLogo>
        <Page.HeaderNavigation>
          {collections.navigation.map((item) => (
            <Page.HeaderNavigationLink
              key={item.link}
              href={item.link}
              active={page.url.startsWith(item.link)}
            >
              {item.title}
            </Page.HeaderNavigationLink>
          ))}
        </Page.HeaderNavigation>
      </Page.Header>
      {children}
      <Page.Footer />
    </Page>
  )
}
