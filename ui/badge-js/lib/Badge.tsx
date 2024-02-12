import { clsx } from "clsx"
import { JSX, h } from "preact"

interface BadgeProperties extends JSX.ElementChildrenAttribute {
  sensitive?: "dangerous" | "subtle" | "value"
}

function Badge({ sensitive, children }: BadgeProperties): JSX.Element {
  return (
    <span
      class={clsx(
        "badge",
        sensitive === "dangerous" && "badge_dangerous",
        sensitive === "subtle" && "badge_subtle",
        sensitive === "value" && "badge_value"
      )}
    >{children}</span>
  )
}

export { Badge }
