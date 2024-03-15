import colorRegular from "@onlyoffice/documentation-ui-color/color.regular.css?inline"
import { Theme as StorybookTheme } from "@onlyoffice/documentation-ui-storybook"
import typography from "@onlyoffice/documentation-ui-typography/typography.css?inline"
import type { JSX } from "preact"
import { Fragment, h } from "preact"
import badge from "./badge.css?inline"
import badgeRegular from "./badge.regular.css?inline"
import { Badge } from "./badge.server.ts"

const styles: string[] = [
  colorRegular,
  typography,
  badge,
  badgeRegular
]

export default {
  title: "UI Kit/Badge",
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
