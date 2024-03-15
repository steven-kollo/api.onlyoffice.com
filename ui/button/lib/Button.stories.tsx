import colorRegular from "@onlyoffice/documentation-ui-color/color.regular.css?inline"
import { Theme as StorybookTheme } from "@onlyoffice/documentation-ui-storybook"
import typography from "@onlyoffice/documentation-ui-typography/typography.css?inline"
import type { JSX } from "preact"
import { Fragment, h } from "preact"
import button from "./button.css?inline"
import buttonRegular from "./button.regular.css?inline"
import { Button } from "./button.server.ts"

const styles: string[] = [
  colorRegular,
  typography,
  button,
  buttonRegular
]

export default {
  title: "UI Kit/Button",
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
