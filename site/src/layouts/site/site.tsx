import { OnlyofficeLogo } from "@onlyoffice/documentation-ui-kit-js"
import { SiteFooter } from "@/blocks/site-footer/SiteFooter2.tsx"
import { SiteHeader } from "@/blocks/site-header/SiteHeader2.tsx"
import { SiteNav } from "@/blocks/site-nav/SiteNav2.tsx"
import { h, isValidElement } from "preact"
import { renderToString } from "preact-render-to-string"

function render({ collections, page, title, content }) {
  const el = (
    <html>
      <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>{title}</title>
        <link rel="stylesheet" href="/main.css" />
        <script src="/main.js" />
      </head>
      <body>
        <SiteHeader
          logo={<OnlyofficeLogo />}
          nav={<SiteNav page={page} nav={collections.navigation} />}
        />
        {content}
        <SiteFooter />
      </body>
    </html>
  )
  if (isValidElement(el)) {
    return "<!DOCTYPE html>" + renderToString(el)
  }
  // todo: log
  return ""
}

export { render }
