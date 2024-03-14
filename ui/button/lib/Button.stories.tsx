import "./button.css"

import { Theme as StorybookTheme } from "@onlyoffice/documentation-ui-storybook"
import type { JSX } from "preact"
import { h } from "preact"
import { Button } from "./button.server.ts"

export default {
  title: "UI Kit/Button"
}

export function Composition(): JSX.Element {
  return (
    <div>
      <p><Button>Default</Button></p>
      <p><Button variant="neutral">Neutral</Button></p>
      <p><Button variant="accent">Accent</Button></p>
    </div>
  )
}

const colors: string[] = [
  "button-neutral-background-color",
  "button-neutral-focus-background-color",
  "button-neutral-foreground-color",
  "button-neutral-focus-foreground-color",
  "button-neutral-border-color",
  "button-neutral-focus-border-color",
  "button-accent-background-color",
  "button-accent-focus-background-color",
  "button-accent-foreground-color",
  "button-accent-focus-foreground-color",
  "button-accent-border-color",
  "button-accent-focus-border-color"
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
