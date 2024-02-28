import type { JSX } from "preact"
import { h, isValidElement } from "preact"

export interface RootProperties {
  children: any
}

export function Root(
  {
    children
  }: RootProperties
): JSX.Element {
  const [s, c] = useSlots(children, {
    header: Header,
    footer: Footer,
  })

  return (
    <div class="page">
      {s.header}
      {c}
      {s.footer}
    </div>
  )
}

export interface HeaderProperties {
  children: any
}

export function Header(
  {
    children
  }: HeaderProperties
): JSX.Element {
  const [s] = useSlots(children, {
    logo: HeaderLogo,
    nav: HeaderNavigation,
  })

  return (
    <header class="page-header">
      <div class="page-header__inner">
        <div class="page-header__logo">
          {s.logo}
        </div>
        <div class="page-header__navigation">{s.nav}</div>
      </div>
    </header>
  )
}

export interface HeaderLogoProperties {
  children: any
}

export function HeaderLogo(
  {
    children
  }: HeaderLogoProperties
): JSX.Element {
  return children
}

export interface HeaderNavigationProperties {
  children: any
}

export function HeaderNavigation(
  {
    children
  }: HeaderNavigationProperties
): JSX.Element {
  return children
}

export interface FooterProperties {
  children: any
}

export function Footer(
  {
    children
  }: FooterProperties
): JSX.Element {
  const [s] = useSlots(children, {
    nav: FooterNavigation,
    rights: FooterRights
  })

  return (
    <footer class="page-footer">
      <div class="page-footer__inner">
        <div class="page-footer__navigation">
          {s.nav}
        </div>
        {/* <nav class="footer-nav">
          <a class="footer-nav__anchor" href="/">Home site</a>
          <a class="footer-nav__anchor" href="/">For integrators</a>
          <a class="footer-nav__anchor" href="/">Document Builder</a>
          <a class="footer-nav__anchor" href="/">Server Forum</a>
          <a class="footer-nav__anchor" href="/">Help Center</a>
          <a class="footer-nav__anchor" href="/">Legal notice</a>
          <a class="footer-nav__anchor" href="/">GitHub</a>
        </nav> */}
        <p class="page-footer__rights">{s.rights}</p>
      </div>
    </footer>
  )
}

export interface FooterNavigationProperties {
  children: any
}

export function FooterNavigation(
  {
    children
  }: FooterNavigationProperties
): JSX.Element {
  return children
}

export interface FooterRightsProperties {
  children: any
}

export function FooterRights(
  {
    children
  }: FooterRightsProperties
): JSX.Element {
  return children
}

// todo: make it normal and extract to a separate file
// https://github.com/primer/react/blob/ea44386e4d7afae7bfd07a679604baaecca55965/packages/react/src/hooks/useSlots.ts#L35
function useSlots<C extends Record<string, any>>(children: any, config: C): [C, any] {
  const n = {}
  const f = []

  const ks = Object.keys(config)
  const vs = Object.values(config)

  children.forEach((c) => {
    if (!isValidElement(c)) {
      f.push(c)
      return
    }
    const i = vs.findIndex((v) => {
      return c.type === v
    })
    if (i === -1) {
      f.push(c)
      return
    }
    const k = ks[i]
    if (n[k]) {
      return
    }
    n[k] = c
  })

  return [n, f]
}
