import { useSlots } from "@onlyoffice/documentation-ui-kit"
import type { JSX } from "preact"
import { Fragment, h } from "preact"

export interface RootParameters {
  children: any
}

export function Root(
  {
    children
  }: RootParameters
): JSX.Element {
  const [slots, outer] = useSlots(children, {
    nav: Navigation,
    breadcrumbs: Breadcrumbs
  })
  return (
    <div class="chapter">
      <div class="chapter__navigation">
        {slots.nav}
      </div>
      <div class="chapter__container">
        <div class="chapter__breadcrumbs">
          {slots.breadcrumbs}
        </div>
        {outer}
      </div>
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

export interface BreadcrumbsParameters {
  children: any
}

export function Breadcrumbs(
  {
    children
  }: NavigationParameters
): JSX.Element {
  return <>{children}</>
}
