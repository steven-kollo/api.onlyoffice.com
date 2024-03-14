import type { JSX } from "preact"
import { Fragment, h } from "preact"

export interface LinksProperties {
  root?: string
}

const fonts: string[] = [
  "OpenSans-Medium.woff2",
  "OpenSans-Regular.woff2",
  "OpenSans-SemiBold.woff2",
  "OpenSans-Bold.woff2",
]

export function Links(
  {
    root = "/"
  }: LinksProperties
): JSX.Element {
  return (
    <>
      {fonts.map((f) => (
        <link
          rel="preload"
          href={`${root}${f}`}
          crossorigin=""
          as="font"
          type="font/woff2"
        />
      ))}
    </>
  )
}
