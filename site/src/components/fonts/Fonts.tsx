import type { JSX } from "preact"
import { Fragment, h } from "preact"

const fonts = [
  "OpenSans-Medium.woff2",
  "OpenSans-Regular.woff2",
  "OpenSans-SemiBold.woff2",
  "OpenSans-Bold.woff2",
]

export interface FontsProperties {
  root: string
}

export function Fonts({ root }: FontsProperties): JSX.Element {
  return (
    <>
      {fonts.map((f) => (
        <link
          rel="preload"
          href={`${root}/${f}`}
          crossorigin=""
          as="font"
          type="font/woff2"
        />
      ))}
    </>
  )
}
