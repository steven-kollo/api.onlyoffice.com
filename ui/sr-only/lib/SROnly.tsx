import type { JSX } from "preact"
import { Fragment, cloneElement, h, toChildArray } from "preact"

export interface RootParameters {
  children: any
}

export function Root(
  {
    children
  }: RootParameters
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
