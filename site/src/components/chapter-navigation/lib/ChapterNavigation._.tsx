import { h } from "preact"
import { ChapterNavigation } from "./ChapterNavigation.ts"
import "./ChapterNavigation.ts"
import "./chapter-navigation.css"

export default {
  title: "UI Kit/ChapterNavigation"
}

export const Decomposition = {
  render() {
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
}
