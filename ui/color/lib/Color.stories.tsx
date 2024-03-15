import { Theme as StorybookTheme } from "@onlyoffice/documentation-ui-storybook"
import type { JSX } from "preact"
import { Fragment, h } from "preact"
import colorRegular from "./color.regular.css?inline"
import "./color.client.ts"

const styles: string[] = [
  colorRegular
]

export default {
  title: "UI Kit/Color",
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

const colors: string[] = [
  "color-scale-black",
  "color-scale-white",
  // "color-scale-transparent",
  "color-scale-gray-0",
  "color-scale-gray-1",
  "color-scale-gray-2",
  "color-scale-gray-3",
  "color-scale-gray-4",
  "color-scale-gray-5",
  "color-scale-gray-6",
  "color-scale-gray-7",
  "color-scale-gray-8",
  "color-scale-gray-9",
  "color-scale-orange-0",
  "color-scale-orange-1",
  "color-scale-red-0"
]

export function Theme(): JSX.Element {
  return (
    <StorybookTheme>
      <Gray />
      <Orange />
      <Red />
      <Black />
      <White />
    </StorybookTheme>
  )
}

export function Black(): JSX.Element {
  return (
    <Color name="black" />
  )
}

export function White(): JSX.Element {
  return (
    <Color name="white" />
  )
}

export function Gray(): JSX.Element {
  return (
    <Color name="gray" />
  )
}

export function Orange(): JSX.Element {
  return (
    <Color name="orange" />
  )
}

export function Red(): JSX.Element {
  return (
    <Color name="red" />
  )
}

function Color(
  {
    name
  }: {
    name: string
  }
): JSX.Element {
  const l = colors.filter((c) => {
    return c.includes(name)
  })
  return (
    <StorybookTheme.Color>
      {l.map((c) => (
        <StorybookTheme.Scale key={c} scale={c} />
      ))}
    </StorybookTheme.Color>
  )
}
