import type { JSX } from "preact"
import { Fragment, h } from "preact"

const l: string[] = [
  "OpenSans-Medium.woff2",
  "OpenSans-Regular.woff2",
  "OpenSans-SemiBold.woff2",
  "OpenSans-Bold.woff2",
]

export interface FontProperties {
  root?: string
}

export function Font(
  {
    root = "/"
  }: FontProperties
): JSX.Element {
  return (
    <>
      {l.map((f) => (
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
