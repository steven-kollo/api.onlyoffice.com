function data() {
  return {
    layout: "content/content.11ty.js",
    tags: ["navigation"],
    permalink(data) {
      if (data.page.fileSlug.endsWith("11tydata")) {
        return
      }
      let p = data.page.filePathStem.replace(/^\/pages/, "")
      p += `.${data.page.outputFileExtension}`
      return p
    }
  }
}

module.exports = data()
