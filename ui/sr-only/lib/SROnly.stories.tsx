import "./sr-only.css"

import type { JSX } from "preact"
import { h } from "preact"
import { SROnly } from "./sr-only.server.ts"

export default {
  title: "UI Kit/SROnly"
}

export function Composition(): JSX.Element {
  return (
    <div>
      <p>The paragraph below should be hidden from sight, but still read by screen readers.</p>
      <SROnly>
        <p>
          This is a paragraph of text that should be hidden from sight, but still read by screen readers.
        </p>
      </SROnly>
    </div>
  )
}
