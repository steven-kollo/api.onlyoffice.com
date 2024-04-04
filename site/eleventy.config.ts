import {eleventyPlugin as syntaxHighlightPlugin} from "./components/syntax-highlight/syntax-highlight.config.ts"
import {cleanPlugin} from "./config/clean.ts"
import {markupPlugin} from "./config/markup.ts"
import {navigationPlugin} from "./config/navigation.ts"
import {previewPlugin} from "./config/preview.ts"
import {scriptPlugin} from "./config/script.ts"
import {staticPlugin} from "./config/static.ts"
import {stylePlugin} from "./config/style.ts"

import {eleventyPlugin as dataPlugin} from "./config/data.ts"
import type {Eleventy} from "./config/eleventy.ts"
import {eleventyPlugin as sitemapPlugin} from "./config/sitemap.ts"

function config(uc: Eleventy.UserConfig): unknown {
  uc.addPlugin(cleanPlugin)
  uc.addPlugin(staticPlugin)
  uc.addPlugin(markupPlugin)
  uc.addPlugin(stylePlugin)
  uc.addPlugin(scriptPlugin)
  uc.addPlugin(navigationPlugin)
  uc.addPlugin(syntaxHighlightPlugin)
  uc.addPlugin(previewPlugin)

  uc.addPlugin(dataPlugin)
  uc.addPlugin(sitemapPlugin)

  return {
    dir: {
      data: "data",
      includes: "components",
      input: ".",
      layouts: "layouts",
      output: "dist"
    }
  }
}

// Eleventy does not understand the default export.
module.exports = config
