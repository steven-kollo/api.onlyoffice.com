import type { JSX } from "preact"
import { h } from "preact"

export interface RootProperties {
  children: any
}

export function Root(
  {
    children
  }: RootProperties
): JSX.Element {
  return (
    <div class="content">
      {children}
    </div>
  )
}

export interface AlertProperties {
  children: any
  variant?: "note" | "warning"
}

export function Alert(
  {
    children,
    variant
  }: AlertProperties
): JSX.Element {
  return (
    <div class="content-alert">
      <p class="sr-only"><strong>{title()}</strong></p>
      {children}
    </div>
  )

  function title(): string {
    switch (variant) {
    case undefined:
    case "note":
      return "Note"
    case "warning":
      return "Warning"
    default:
      throw new Error(`unknown variant: ${variant}`)
    }
  }
}
