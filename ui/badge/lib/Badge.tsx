import type { ClassValue } from "clsx"
import { clsx } from "clsx"
import type { JSX } from "preact"
import { h } from "preact"

export interface BadgeProperties {
  children: any
  variant?: Variant
}

export function Badge(
  {
    children,
    variant: v
  }: BadgeProperties
): JSX.Element {
  const cs: ClassValue = ["badge"]
  if (v !== undefined) {
    const c = resolveVariant(v)
    cs.push(c)
  }

  return <span class={clsx(cs)}>{children}</span>
}

type Variant = "danger" | "support"

function resolveVariant(v: Variant): string {
  switch (v) {
  case "danger":
    return "badge_variant_danger"
  case "support":
    return "badge_variant_support"
  }
}
