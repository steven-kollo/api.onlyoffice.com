import type * as T from "./Page.tsx"
import * as C from "./Page.tsx"

export type PageProperties = T.RootProperties
export type PageHeaderProperties = T.HeaderProperties
export type PageHeaderLogoProperties = T.HeaderLogoProperties
export type PageHeaderNavigationProperties = T.HeaderNavigationProperties
export type PageFooterProperties = T.FooterProperties
export type PageFooterNavigationProperties = T.FooterNavigationProperties
export type PageFooterRightsProperties = T.FooterRightsProperties

export const Page = Object.assign(C.Root, {
  Header: C.Header,
  HeaderLogo: C.HeaderLogo,
  HeaderNavigation: C.HeaderNavigation,
  Footer: C.Footer,
  FooterNavigation: C.FooterNavigation,
  FooterRights: C.FooterRights
})
