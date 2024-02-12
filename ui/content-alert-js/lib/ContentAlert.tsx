import { JSX, h } from "preact"

interface ContentAlertProperties extends JSX.ElementChildrenAttribute {
  // // todo: https://github.com/orgs/community/discussions/16925
  // sensitive?: "note" | "tip" | "important" | "warning" | "caution"
}

function ContentAlert({ children }: ContentAlertProperties): JSX.Element {
  return (
    <div class="content-alert">
      <p class="sr-only"><strong>Note</strong></p>
      {children}
    </div>
  )
}

export { ContentAlert, ContentAlertProperties }
