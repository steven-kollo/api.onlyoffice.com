import { SROnly } from "@onlyoffice/documentation-ui-sr-only"
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
  variant?: AlertVariant
}

export type AlertVariant =
  "note" |
  "warning"

export function Alert(
  {
    children,
    variant: v
  }: AlertProperties
): JSX.Element {
  return (
    <div class="content-alert">
      <SROnly>
        <p><strong>{alertTitle(v)}</strong></p>
      </SROnly>
      {children}
    </div>
  )
}

function alertTitle(v?: AlertVariant): string {
  const def = "Note"
  if (v === undefined) {
    return def
  }
  switch (v) {
  case "note":
    return "Note"
  case "warning":
    return "Warning"
  default:
    console.error(`unknown variant: ${v}`)
    return def
  }
}
