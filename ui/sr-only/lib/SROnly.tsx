import type { JSX } from "preact"
import { Fragment, cloneElement, h, toChildArray } from "preact"

export interface RootProperties {
  children: any
}

export function Root(
  {
    children
  }: RootProperties
): JSX.Element {
  return (
    <>
      {toChildArray(children).map((child) => (
        cloneElement(child, {
          class: "sr-only"
        })
      ))}
    </>
  )
}
