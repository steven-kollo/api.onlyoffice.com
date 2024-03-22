import { ChevronRight2Icon } from "@onlyoffice/documentation-ui-kit"
import { clsx } from "clsx"
import type { JSX } from "preact"
import { Fragment, h, toChildArray } from "preact"

export interface RootProperties {
  children: any
}

export function Root({ children }: RootProperties): JSX.Element {
  const crumbs = toChildArray(children)
  return (
    <div class="breadcrumbs">
      {crumbs.map((c, i) => (
        <Fragment key={i}>{c}{i !== crumbs.length - 1 && <Delimiter />}</Fragment>
      ))}
    </div>
  )
}

export function Delimiter(): JSX.Element {
  return <span class="breadcrumbs__delimiter"><ChevronRight2Icon /></span>
}

export interface CrumbProperties {
  active?: boolean
  children: any
  href?: string
}

export function Crumb({ active, children, href }: CrumbProperties): JSX.Element {
  if (href === undefined) {
    return <span>{children}</span>
  }
  const classes = clsx({
    "breadcrumbs__crumb": true,
    "breadcrumbs__crumb_active": active
  })
  return <a class={classes} href={href}>{children}</a>
}
