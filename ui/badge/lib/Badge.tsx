import type { ClassValue } from "clsx"
import { clsx } from "clsx"
import type { JSX } from "preact"
import { h } from "preact"

export interface RootParameters {
  children: any
  variant?: RootVariant
}

export type RootVariant =
  "danger" |
  "neutral" |
  "support"

export function Root(
  {
    children,
    variant: v
  }: RootParameters
): JSX.Element {
  const cv: ClassValue = ["badge"]
  if (v !== undefined) {
    const c = variantClass(v)
    cv.push(c)
  }
  return (
    <span class={clsx(cv)}>{children}</span>
  )
}

function variantClass(v: RootVariant): string {
  switch (v) {
  case "danger":
    return "badge_variant_danger"
  case "neutral":
    return ""
  case "support":
    return "badge_variant_support"
  default:
    console.error(`unknown variant: ${v}`)
    return ""
  }
}
