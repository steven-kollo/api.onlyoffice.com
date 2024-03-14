import "./code-listing.css"
import "./code-listing.client.ts"

import { Theme as StorybookTheme } from "@onlyoffice/documentation-ui-storybook"
import type { JSX } from "preact"
import { h } from "preact"
import { CodeListing } from "./code-listing.server.ts"

export default {
  title: "UI Kit/CodeListing"
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
