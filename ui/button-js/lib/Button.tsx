import { clsx } from "clsx"
import { JSX, h } from "preact"

interface ButtonParameters extends JSX.ElementChildrenAttribute {
  sensitive?: "accent"
}

function Button({ sensitive, children }: ButtonParameters): JSX.Element {
  return (
    <button
      class={clsx(
        "button",
        sensitive === "accent" && "button_accent"
      )}
      type="button"
    >{children}</button>
  )
}

export { Button, ButtonParameters }
