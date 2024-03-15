import kit from "@onlyoffice/documentation-ui-kit/kit.css?inline"
import kitRegular from "@onlyoffice/documentation-ui-kit/kit.regular.css?inline"
import { Theme as StorybookTheme } from "@onlyoffice/documentation-ui-storybook"
import type { JSX } from "preact"
import { Fragment, h } from "preact"
import "./chapter.client.ts"
import chapter from "./chapter.css?inline"
import chapterRegular from "./chapter.regular.css?inline"
import { ChapterNavigation } from "./chapter.ts"

const styles: string[] = [
  kit,
  kitRegular,
  chapter,
  chapterRegular
]

export default {
  title: "Site/Chapter",
  decorators: [
    (Story: any): JSX.Element => (
      <>
        {styles.map((s) => (
          <style key={s} dangerouslySetInnerHTML={{ __html: s }} />
        ))}
        <Story />
      </>
    )
  ]
}

export function Composition() {
  return (
    <ChapterNavigation
      chapter={{
        title: "Root Section",
        link: "/",
        children: [
          {
            title: "First Chapter",
            link: "/first-chapter",
            children: [
              {
                title: "First Subchapter",
                link: "/first-chapter/first-subchapter"
              },
              {
                title: "Second Subchapter",
                link: "/first-chapter/second-subchapter"
              }
            ]
          },
          {
            title: "Second Chapter",
            link: "/second-chapter",
            children: [
              {
                title: "First Subchapter",
                link: "/second-chapter/first-subchapter"
              },
              {
                title: "Second Subchapter",
                link: "/second-chapter/second-subchapter"
              }
            ]
          },
          {
            title: "Third Chapter",
            link: "/third-chapter",
            children: [
              {
                title: "First Subchapter",
                link: "/third-chapter/first-subchapter",
                children: [
                  {
                    title: "First Subsubchapter",
                    link: "/third-chapter/first-subchapter/first-subsubchapter"
                  },
                  {
                    title: "Second Subsubchapter",
                    link: "/third-chapter/first-subchapter/second-subsubchapter"
                  }
                ]
              },
              {
                title: "Second Subchapter",
                link: "/third-chapter/second-subchapter"
              }
            ]
          }
        ]
      }}
      isExpanded={(c) => {
        return c.link.startsWith("/third-chapter")
      }}
      isCurrent={(c) => {
        return c.link === "/third-chapter/first-subchapter/first-subsubchapter"
      }}
    />
  )
}

const colors: string[] = [
  "chapter-navigation-background-color",
  "chapter-navigation-foreground-color",
  "chapter-navigation-border-color",
  "chapter-navigation-heading-foreground-color",
  "chapter-navigation-focus-foreground-color",
  "chapter-navigation-dropdown-color"
]

export function Theme(): JSX.Element {
  return (
    <StorybookTheme>
      <StorybookTheme.Color>
        {colors.map((c) => (
          <StorybookTheme.Scale key={c} scale={c} />
        ))}
      </StorybookTheme.Color>
    </StorybookTheme>
  )
}
