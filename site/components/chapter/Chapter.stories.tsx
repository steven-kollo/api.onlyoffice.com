import kit from "@onlyoffice/documentation-ui-kit/kit.css?inline"
import kitRegular from "@onlyoffice/documentation-ui-kit/kit.regular.css?inline"
import { Theme as StorybookTheme, useStyles } from "@onlyoffice/documentation-ui-storybook"
import type { JSX } from "preact"
import { h } from "preact"
import { Composition as PageComposition, styles as pageStyles } from "../page/Page.stories.tsx"
import tree from "../tree/tree.css?inline"
import treeRegular from "../tree/tree.regular.css?inline"
import { Tree } from "../tree/tree.ts"
import "../tree/tree.client.ts"
import chapter from "./chapter.css?inline"
import chapterRegular from "./chapter.regular.css?inline"
import { Chapter } from "./chapter.ts"

const styles: string[] = [
  ...pageStyles,
  kit,
  kitRegular,
  tree,
  treeRegular,
  chapter,
  chapterRegular
]

export default {
  title: "Site/Chapter",
  decorators: [
    ...useStyles(...styles)
  ]
}

const c = {
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
}

export function Composition(): JSX.Element {
  return (
    <PageComposition>
      <Chapter>
        <Chapter.Navigation>
          <Tree>
            <Tree.Group>
              <Tree.Link href="/section">Section</Tree.Link>
              <Tree.Item>
                <Tree.Link href="/section/first">First Item</Tree.Link>
              </Tree.Item>
              <Tree.Item>
                <Tree.Link href="/section/second">Second Item</Tree.Link>
              </Tree.Item>
              <Tree.Item>
                <Tree.Link href="/section/third">Third Item</Tree.Link>
                <Tree.Item>
                  <Tree.Link href="/section/third/first">First Subitem</Tree.Link>
                </Tree.Item>
              </Tree.Item>
            </Tree.Group>
          </Tree>
        </Chapter.Navigation>
        content
      </Chapter>
    </PageComposition>
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
