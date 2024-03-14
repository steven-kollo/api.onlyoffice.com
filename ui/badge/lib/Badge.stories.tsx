import "./badge.css"

import { Theme as StorybookTheme } from "@onlyoffice/documentation-ui-storybook"
import type { JSX } from "preact"
import { h } from "preact"
import { Badge } from "./badge.server.ts"

export default {
  title: "UI Kit/Badge"
}

export function Composition(): JSX.Element {
  return (
    <p>
      <Badge>default</Badge>
      <Badge variant="neutral">neutral</Badge>
      <Badge variant="danger">danger</Badge>
      <Badge variant="support">support</Badge>
    </p>
  )
}

const colors: string[] = [
  "badge-neutral-background-color",
  "badge-neutral-foreground-color",
  "badge-danger-background-color",
  "badge-danger-foreground-color",
  "badge-support-background-color",
  "badge-support-foreground-color"
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
