import { h } from "preact"

function SiteFooter() {
  return (
    <footer class="footer">
      <div class="footer__inner">
        <nav class="footer-nav">
          <a class="footer-nav__anchor" href="/">Home site</a>
          <a class="footer-nav__anchor" href="/">For integrators</a>
          <a class="footer-nav__anchor" href="/">Document Builder</a>
          <a class="footer-nav__anchor" href="/">Server Forum</a>
          <a class="footer-nav__anchor" href="/">Help Center</a>
          <a class="footer-nav__anchor" href="/">Legal notice</a>
          <a class="footer-nav__anchor" href="/">GitHub</a>
        </nav>
        <p class="footer__rights">(c) Ascensio System SIA 2018. All right reserved</p>
      </div>
    </footer>
  )
}

function render() {
  return ""
}

export { render, SiteFooter }
