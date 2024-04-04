import {default as slugify} from "@sindresorhus/slugify"

export function data() {
  return {
    title: "",
    remote: "",
    layout: "article",
    tags: ["navigation"],
    permalink(data) {
      const a = data.page.filePathStem.split("/")
      const s = a
        .slice(2, a.length)
        .map((s) => {
          s = s.toLowerCase()
          return slugify.default(s)
        })
        .join("/")
      return `/${s}.${data.page.outputFileExtension}`
    },
    eleventyComputed: {
      title(data) {
        if (data === undefined) {
          return
        }
        if (data.title === "") {
          return data.page.fileSlug
        }
        return data.title
      },
      layout(data) {
        if (
          data === undefined ||
          data.layout === null
        ) {
          return
        }
        // todo: use smarter logic.
        return `${data.layout}.tsx`
      }
    }
  }
}
