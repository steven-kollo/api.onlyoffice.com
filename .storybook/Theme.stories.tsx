import type { JSX } from "preact"
import { h } from "preact"
import { default as chapter, Theme as ChapterTheme } from "../site/src/components/chapter/ChapterNavigation.stories.tsx"
import { default as page, Theme as PageTheme } from "../site/src/components/page/Page.stories.tsx"
import { default as syntaxHighlight, Theme as SyntaxHighlightTheme } from "../site/src/components/syntax-highlight/SyntaxHighlight.stories.tsx"
import { default as articleCard, Theme as ArticleCardTheme } from "../ui/article-card/lib/ArticleCard.stories.tsx"
import { default as badge, Theme as BadgeTheme } from "../ui/badge/lib/Badge.stories.tsx"
import { default as button, Theme as ButtonTheme } from "../ui/button/lib/Button.stories.tsx"
import { default as codeListing, Theme as CodeListingTheme } from "../ui/code-listing/lib/CodeListing.stories.tsx"
import { default as color, Theme as ColorTheme } from "../ui/color/lib/Color.stories.tsx"
import { default as content, Theme as ContentTheme } from "../ui/content/lib/Content.stories.tsx"
import { Content as StorybookContent } from "../ui/storybook/lib/storybook.ts"

export default {
  title: "Composition/Theme",
  decorators: [
    ...color.decorators,

    ...articleCard.decorators,
    ...badge.decorators,
    ...button.decorators,
    ...codeListing.decorators,
    ...content.decorators,

    ...chapter.decorators,
    ...page.decorators,
    ...syntaxHighlight.decorators
  ]
}

export function Theme(): JSX.Element {
  return (
    <StorybookContent>
      <h2>UI Kit</h2>

      <h3>Color</h3>
      <ColorTheme />

      <h3>ArticleCard</h3>
      <ArticleCardTheme />
      <h3>Badge</h3>
      <BadgeTheme />
      <h3>Button</h3>
      <ButtonTheme />
      <h3>CodeListing</h3>
      <CodeListingTheme />
      <h3>Content</h3>
      <ContentTheme />

      <h2>Site</h2>

      <h3>Chapter</h3>
      <ChapterTheme />
      <h3>Page</h3>
      <PageTheme />
      <h3>SyntaxHighlight</h3>
      <SyntaxHighlightTheme />
    </StorybookContent>
  )
}
