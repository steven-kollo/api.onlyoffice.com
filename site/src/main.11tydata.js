module.exports = {
  eleventyExcludeFromCollections: true,
  permalink(data) {
    return `/${data.page.fileSlug}.${data.page.outputFileExtension}`
  }
}
