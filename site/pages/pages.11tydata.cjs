function data() {
  return {
    title: "",
    remote: "",
    layout: "article",
    tags: ["navigation"],
    permalink(data) {
      let p = data.page.filePathStem.replace(/^\/pages/, "")
      p += `.${data.page.outputFileExtension}`
      return p
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

module.exports = data()
