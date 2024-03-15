import { Properties as StorybookProperties } from "@onlyoffice/documentation-ui-storybook"
import type { JSX } from "preact"
import { Fragment, h } from "preact"
import typography from "./typography.css?inline"

const styles: string[] = [
  typography
]

export default {
  title: "UI Kit/Typography",
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

const properties: string[] = [
  "typography-monospace-font",
  "typography-sans-serif-font",
  "typography-line-height"
]

export function Properties(): JSX.Element {
  return (
    <StorybookProperties>
      {properties.map((p) => (
        <StorybookProperties.Property key={p} property={p} />
      ))}
    </StorybookProperties>
  )
}
