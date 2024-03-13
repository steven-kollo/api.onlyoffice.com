import "./sr-only.css"

import { Fragment, h } from "preact"
import { SROnly } from "./SROnly.tsx"

export default {
  title: "UI Kit/SR Only",
  render() {
    return (
      <>
        <SROnly>
          text
        </SROnly>
      </>
    )
  }
}
