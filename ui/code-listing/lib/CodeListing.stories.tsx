import colorRegular from "@onlyoffice/documentation-ui-color/color.regular.css?inline"
import { Theme as StorybookTheme } from "@onlyoffice/documentation-ui-storybook"
import typography from "@onlyoffice/documentation-ui-typography/typography.css?inline"
import type { JSX } from "preact"
import { Fragment, h } from "preact"
import codeListing from "./code-listing.css?inline"
import codeListingRegular from "./code-listing.regular.css?inline"
import "./code-listing.client.ts"
import { CodeListing } from "./code-listing.server.ts"

const styles: string[] = [
  colorRegular,
  typography,
  codeListing,
  codeListingRegular
]

export default {
  title: "UI Kit/CodeListing",
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
    <div>
      <CodeListing groups={
        [
          ["First", <span>hi</span>],
          ["Second", "console.log('hi')"],
        ]
      }>
        {/* todo <CodeListing.Group name="JavaScript">const foo = "bar"</CodeListing.Group> */}
      </CodeListing>
    </div>
  )
}

const colors: string[] = [
  "code-listing-background-color",
  "code-listing-foreground-color",
  "code-listing-border-color"
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
