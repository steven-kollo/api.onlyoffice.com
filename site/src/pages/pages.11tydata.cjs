function data() {
  return {
    layout: "content/content.tsx",
    tags: ["navigation"],
    permalink(data) {
      let p = data.page.filePathStem.replace(/^\/pages/, "")
      p += `.${data.page.outputFileExtension}`
      return p
    }
  }
}

module.exports = data()
