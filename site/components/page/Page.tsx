import { useSlots } from "@onlyoffice/documentation-ui-kit"
import { clsx } from "clsx"
import type { JSX } from "preact"
import { Fragment, h } from "preact"
import { Clone } from "../clone/clone.ts"

export interface RootParameters {
  children: any
}

export function Root(
  {
    children
  }: RootParameters
): JSX.Element {
  const [slots, outer] = useSlots(children, {
    header: Header,
    footer: Footer
  })
  return (
    <div class="page">
      <Clone class="page__header">
        {slots.header}
      </Clone>
      <div class="page__content">
        {outer}
      </div>
      {slots.footer}
    </div>
  )
}

export interface HeaderParameters extends JSX.HTMLAttributes<HTMLElement> {
  // children: any
}

export function Header(
  {
    children,
    ...attributes
  }: HeaderParameters
): JSX.Element {
  const [slots] = useSlots(children, {
    logo: HeaderLogo,
    nav: HeaderNavigation,
  })
  return (
    <header {...attributes} class={clsx(attributes.class, "page-header")}>
      <div class="page-header__inner">
        <div class="page-header__logo">
          {slots.logo}
        </div>
        <div class="page-header__navigation">
          {slots.nav}
        </div>
      </div>
    </header>
  )
}

export interface HeaderLogoParameters {
  children: any
}

export function HeaderLogo(
  {
    children
  }: HeaderLogoParameters
): JSX.Element {
  return <>{children}</>
}

export interface HeaderNavigationParameters {
  children?: any
}

export function HeaderNavigation(
  {
    children
  }: HeaderNavigationParameters
): JSX.Element {
  return (
    <nav class="page-header-nav">
      {children}
    </nav>
  )
}

export interface HeaderNavigationLinkParameters {
  active?: boolean
  href?: string
  children?: any
}

export function HeaderNavigationLink(
  {
    active,
    href,
    children
  }: HeaderNavigationLinkParameters
): JSX.Element {
  return <a class={clsx("page-header-nav__link", active && "page-header-nav__link_active")} href={href}>{children}</a>
}

export function Footer() {
  return (
    <footer class="page-footer">
      <div class="page-footer__inner">
        <nav class="page-footer-nav">
          <a class="page-footer-nav__anchor" href="/">Home site</a>
          <a class="page-footer-nav__anchor" href="/">For integrators</a>
          <a class="page-footer-nav__anchor" href="/">Document Builder</a>
          <a class="page-footer-nav__anchor" href="/">Server Forum</a>
          <a class="page-footer-nav__anchor" href="/">Help Center</a>
          <a class="page-footer-nav__anchor" href="/">Legal notice</a>
          <a class="page-footer-nav__anchor" href="/">GitHub</a>
        </nav>
        <p class="page-footer__rights">(c) Ascensio System SIA 2018. All right reserved</p>
      </div>
    </footer>
  )
}
