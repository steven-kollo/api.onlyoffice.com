import { clsx } from "clsx"
import type { JSX } from "preact"
import { h } from "preact"

export interface ButtonParameters {
  children: any
  variant?: ButtonVariant
}

export type ButtonVariant = "accent"

export function Button(
  {
    children,
    variant: v
  }: ButtonParameters
): JSX.Element {
  return (
    <button class={clsx("button", resolveVariant(v))} type="button">{children}</button>
  )
}

function resolveVariant(v?: ButtonVariant): string {
  switch (v) {
  case "accent":
    return "button_accent"
  default:
    return ""
  }
}
