import type { JSX } from "preact"
import { h } from "preact"
import "./content.css"

export interface RootProperties {
  children: any
}

export function Root(
  {
    children
  }: RootProperties
): JSX.Element {
  return (
    <div class="storybook-content">
      {children}
    </div>
  )
}
