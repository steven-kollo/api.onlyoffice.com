import { OnlyofficeLogo } from "@onlyoffice/documentation-ui-kit-js"
import { SiteFooter } from "@/src/components/site-footer/SiteFooter.tsx"
import { SiteHeader } from "@/src/components/site-header/SiteHeader.tsx"
import { transformMarkup } from "@/config/markup.cjs"
import { buildDarkStyles, buildLightStyles } from "@/config/styles.cjs"
import { SiteNav } from "@/src/components/site-nav/SiteNav.tsx"
import { h, isValidElement } from "preact"
import { renderToString } from "preact-render-to-string"

async function render({ eleventy, collections, page, title, content }) {
  const dark = await buildDarkStyles()
  const light = await buildLightStyles()

  const el = (
    // todo: do not forget to change the lang after localization.
    <html lang="en">
      <head>
        <meta charset="utf-8" />
        <title>{title}</title>

        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta name="view-transition" content="same-origin" />
        <meta name="description" content="todo" />
        <meta name="generator" content={eleventy.generator} />

        {/* <link rel="preload" href="/SourceCodePro-Medium.woff2" crossorigin="" as="font" type="font/woff2" /> */}

        <link rel="stylesheet" href="/main.css" />
        <meta name="theme-color" media="(prefers-color-scheme: light)" content="#000000" /> {/* todo: content */}
        <meta name="theme-color" media="(prefers-color-scheme: dark)" content="#000000" /> {/* todo: content */}
        <style media="(prefers-color-scheme: dark)">{dark}</style>
        <style media="(prefers-color-scheme: light)">{light}</style>

        <script defer src="/main.js" />
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

  if (!isValidElement(el)) {
    throw new Error("Invalid element")
  }

  let c = "<!DOCTYPE html>\n" + renderToString(el)
  return transformMarkup(c)
}

export { render }
