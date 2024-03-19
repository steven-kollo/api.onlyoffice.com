import type { JSX } from "preact"
import { h } from "preact"

export interface RootParameters {
  children: any
}

export function Root(
  {
    children
  }: RootParameters
): JSX.Element {
  return (
    <main class="blank__main">
      <div class="blank__inner">{children}</div>
    </main>
  )
}
