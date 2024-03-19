import { useSlots } from "@onlyoffice/documentation-ui-kit"
import { clsx } from "clsx"
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
    <div class="page">
      {children}
    </div>
  )
}

export interface HeaderParameters {
  children: any
}

export function Header(
  {
    children
  }: HeaderParameters
): JSX.Element {
  const [slots] = useSlots(children, {
    logo: HeaderLogo,
    nav: HeaderNavigation,
  })
  return (
    <header class="page-header">
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
  return children
}

export interface HeaderNavigationParameters {
  nav: any[]
  isCurrent(link: string): boolean
}

export function HeaderNavigation(
  {
    nav,
    isCurrent
  }: HeaderNavigationParameters
): JSX.Element {
  return (
    <nav class="page-header-nav">
      {nav.map((item) => (
        <div class="page-header-nav__container">
          <a
            class={clsx("page-header-nav__link", isCurrent(item.link) && "page-header-nav__link_current")}
            href={item.link}
          >{item.title}</a>
        </div>
      ))}
    </nav>
  )
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
