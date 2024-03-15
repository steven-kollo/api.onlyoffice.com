import type { ClassValue } from "clsx"
import { clsx } from "clsx"
import type { JSX } from "preact"
import { h } from "preact"

export interface RootParameters {
  children: any
  variant?: RootVariant
}

export type RootVariant =
  "accent" |
  "neutral"

export function Root(
  {
    children,
    variant: v
  }: RootParameters
): JSX.Element {
  const cv: ClassValue = ["button"]
  if (v !== undefined) {
    const c = variantClass(v)
    cv.push(c)
  }
  return (
    <button class={clsx(cv)} type="button">{children}</button>
  )
}

function variantClass(v: RootVariant): string {
  switch (v) {
  case "accent":
    return "button_accent"
  case "neutral":
    return ""
  default:
    console.error(`unknown variant: ${v}`)
    return ""
  }
}
