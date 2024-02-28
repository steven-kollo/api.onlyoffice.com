import type { JSX } from "preact"
import { h } from "preact"
import { Page } from "./page.ts"
import "./stories.css"
import "./page.css"

export default {
  title: "Components/Page",
}

export const Composition = {
  render(): JSX.Element {
    return (
      <Page>
        <Page.Header>
          <Page.HeaderLogo>
            logo
          </Page.HeaderLogo>
          h
          <Page.HeaderNavigation>
            navigation
          </Page.HeaderNavigation>
        </Page.Header>
        c
        <Page.Footer>
          <Page.FooterNavigation>
            navigation
          </Page.FooterNavigation>
          <Page.FooterRights>
            rights
          </Page.FooterRights>
        </Page.Footer>
      </Page>
    )
  }
}
