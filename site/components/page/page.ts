import type * as T from "./Page.tsx"
import * as C from "./Page.tsx"

export type PageParameters = T.RootParameters
export type PageHeaderParameters = T.HeaderParameters
export type PageHeaderLogoParameters = T.HeaderLogoParameters
export type PageHeaderNavigationParameters = T.HeaderNavigationParameters

export const Page = Object.assign(C.Root, {
  Header: C.Header,
  HeaderLogo: C.HeaderLogo,
  HeaderNavigation: C.HeaderNavigation,
  Footer: C.Footer
})
