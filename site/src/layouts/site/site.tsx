import { join } from "node:path"
import { URL, fileURLToPath } from "node:url"
import { OnlyofficeLogo } from "@onlyoffice/documentation-ui-kit-js"
import { SiteFooter } from "@/blocks/site-footer/SiteFooter2.tsx"
import { SiteHeader } from "@/blocks/site-header/SiteHeader2.tsx"
import { SiteNav } from "@/blocks/site-nav/SiteNav2.tsx"
import { bundleAsync } from "lightningcss"
import { h, isValidElement } from "preact"
import { renderToString } from "preact-render-to-string"

const src = fileURLToPath(new URL("../..", import.meta.url))

async function render({ eleventy, collections, page, title, content }) {
  const dark = await build("dark.css")
  const light = await build("light.css")
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

        {/* <link rel="preload" href="/SourceCodePro-Medium.woff2" crossorigin as="font" type="font/woff2" /> */}

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
  if (isValidElement(el)) {
    return "<!DOCTYPE html>" + renderToString(el)
  }
  // todo: log
  return ""
}

async function build(f) {
  const { code } = await bundleAsync({
    filename: join(src, f),
    minify: true
  })
  return code.toString()
}

export { render }
