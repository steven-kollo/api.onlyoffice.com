module.exports = {
  layout: "page/page.webc",
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
