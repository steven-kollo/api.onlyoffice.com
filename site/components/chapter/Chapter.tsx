import { useSlots } from "@onlyoffice/documentation-ui-kit"
import type { JSX } from "preact"
import { Fragment, h } from "preact"

export interface Chapter {
  title: string
  link: string
  children?: Chapter[]
}

export interface RootParameters {
  children: any
}

export function Root(
  {
    children
  }: RootParameters
): JSX.Element {
  const [slots, outer] = useSlots(children, {
    nav: Navigation
  })
  return (
    <div class="chapter">
      <div class="chapter__navigation">
        {slots.nav}
      </div>
      <main class="chapter__content">
        {outer}
      </main>
    </div>
  )
}

export interface NavigationParameters {
  children: any
}

export function Navigation(
  {
    children
  }: NavigationParameters
): JSX.Element {
  return <>{children}</>
}
