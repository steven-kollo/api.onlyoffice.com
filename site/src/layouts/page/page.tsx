import { Font, OnlyofficeLogo } from "@onlyoffice/documentation-ui-kit"
import type { Eleventy } from "@/config/context.ts"
import { transformMarkup } from "@/config/markup.ts"
import { Page } from "@/src/components/page/page.ts"
import { h, isValidElement } from "preact"
import { renderToString } from "preact-render-to-string"

export async function render(
  {
    eleventy,
    collections,
    page,
    title,
    content
  }: Eleventy.RenderContext
): Promise<string> {
  // todo: cache it!
  // const regular = await buildRegularTheme()

  const el = (
    // todo: do not forget to change the lang after localization.
    <html
      lang="en"
      data-dark-theme="regular"
      data-light-theme="regular"
      data-theme-preference="auto"
    >
      <head>
        <meta charset="utf-8" />
        <title>{title}</title>

        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta name="view-transition" content="same-origin" />
        <meta name="description" content="todo" />
        <meta name="generator" content={eleventy.generator} />

        <Font.Links root="/" />

        <link rel="stylesheet" href="/main.css" />
        {/* <meta name="theme-color" media="(prefers-color-scheme: light)" content="#000000" /> */}
        {/* <meta name="theme-color" media="(prefers-color-scheme: dark)" content="#000000" /> */}
        {/* <style media="(prefers-color-scheme: dark)">{dark}</style> */}
        {/* <style media="(prefers-color-scheme: light)">{light}</style> */}
        {/* <style>{regular}</style> */}

        <script defer src="/main.js" />
      </head>
      <body>
        <Page>
          <Page.Header>
            <Page.HeaderLogo>
              <a href="/"><OnlyofficeLogo /></a>
            </Page.HeaderLogo>
            <Page.HeaderNavigation
              nav={collections.navigation}
              isCurrent={(link) => page.url.startsWith(link)}
            />
          </Page.Header>
          <div>
            {content}
          </div>
          <Page.Footer />
        </Page>
      </body>
    </html>
  )

  if (!isValidElement(el)) {
    throw new Error("Invalid element")
  }

  let c = "<!DOCTYPE html>\n" + renderToString(el)
  return transformMarkup(c)
}
