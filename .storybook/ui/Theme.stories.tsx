import "./storybook.css"

import type { JSX } from "preact"
import { h } from "preact"
import { Theme as ArticleCardTheme } from "../../ui/article-card/lib/ArticleCard.stories.tsx"
import { Theme as BadgeTheme } from "../../ui/badge/lib/Badge.stories.tsx"
import { Theme as ButtonTheme } from "../../ui/button/lib/Button.stories.tsx"
import { Theme as CodeListingTheme } from "../../ui/code-listing/lib/CodeListing.stories.tsx"
import { Theme as ColorTheme } from "../../ui/color/lib/Color.stories.tsx"
import { Theme as ContentTheme } from "../../ui/content/lib/Content.stories.tsx"

export default {
  title: "UI Kit Composition/Theme"
}

export function Theme(): JSX.Element {
  return (
    <div class="storybook">
      <h2>Color</h2>
      <ColorTheme />

      <h2>ArticleCard</h2>
      <ArticleCardTheme />
      <h2>Badge</h2>
      <BadgeTheme />
      <h2>Button</h2>
      <ButtonTheme />
      <h2>CodeListing</h2>
      <CodeListingTheme />
      <h2>Content</h2>
      <ContentTheme />
    </div>
  )
}
