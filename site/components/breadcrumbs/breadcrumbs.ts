import type * as T from "./Breadcrumbs.tsx"
import * as C from "./Breadcrumbs.tsx"

export type BreadcrumbsProperties = T.RootProperties
export type BreadcrumbsCrumbProperties = T.CrumbProperties

export const Breadcrumbs = Object.assign(C.Root, {
  Crumb: C.Crumb
})
