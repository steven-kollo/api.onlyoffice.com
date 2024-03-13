import type { JSX } from "preact"
import { Fragment, cloneElement, h, toChildArray } from "preact"

export interface SROnlyProperties {
  children: any
}

export function SROnly(
  {
    children
  }: SROnlyProperties
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
