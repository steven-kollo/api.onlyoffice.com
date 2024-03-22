function data() {
  return {
    layout: "article",
    tags: ["navigation"],
    permalink(data) {
      let p = data.page.filePathStem.replace(/^\/pages/, "")
      p += `.${data.page.outputFileExtension}`
      return p
    },
    eleventyComputed: {
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
