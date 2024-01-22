// @ts-check

/**
 * @typedef {import("@11ty/eleventy").UserConfig} UserConfig
 */

const { extname } = require("node:path")

/**
 * @typedef {Object} NavigationItem
 * @property {string} title
 * @property {string} link
 * //@property {(page: any) => boolean} isCurrent
 * @property {NavigationItem[]=} children
 */

/**
 * @typedef {Object} CacheNavigationItem
 * @property {string} title
 * @property {string} link
 * @property {number} order
 * @property {Record<string, CacheNavigationItem>} children
 */

/**
 * @param {UserConfig} uc
 * @returns {void}
 */
function navigationPlugin(uc) {
  uc.addCollection("navigation", (c) => {
    // todo: rename tag to the navigation.
    const list = c.getFilteredByTag("product")
    const cache = collect(list)
    const root = resolve(cache)
    return root.children
  })
}

// /**
//  * @param {NavigationItem[]} nav
//  * @returns
//  */
// function pageNavigation(nav) {
//   const item = nav.find((i) => this.page.url.startsWith(i.link))
//   if (item === undefined) {
//     return []
//   }
//   return item.children
// }

/**
 * @param {any[]} list
 * @returns {CacheNavigationItem}
 */
function collect(list) {
  /** @type {CacheNavigationItem} */
  const cache = {
    title: "",
    link: "",
    order: 0,
    children: {}
  }

  list.forEach((item) => {
    if (extname(item.outputPath) !== ".html") {
      return
    }

    const m = item.url.match(/^\/([\S\s]*)\/$/)
    if (!m) {
      return
    }

    const [, u] = m
    if (!u) {
      return
    }

    let r = cache.children

    const us = u.split("/")
    us.forEach((s, i) => {
      if (r[s] === undefined) {
        r[s] = {
          title: "",
          link: "",
          order: 0,
          children: {}
        }
      }

      switch (i) {
        case us.length - 1:
          r[s].title = item.data.title
          r[s].link = item.url
          if (item.data.order !== undefined) {
            r[s].order = item.data.order
          }
          break
        default:
          r = r[s].children
          break
      }
    })
  })

  return cache
}

/**
 * @param {CacheNavigationItem} cache
 * @returns {NavigationItem}
 */
function resolve(cache) {
  /** @type {NavigationItem} */
  const item = {
    title: cache.title,
    link: cache.link,
    // isCurrent: function isCurrent(page) {
    //   // todo: use the this?
    //   return item.link === page.url
    // }
  }

  const ch = Object.values(cache.children)
  if (ch.length > 0) {
    item.children = ch
      .sort((a, b) => {
        const d = a.order - b.order
        if (d !== 0) {
          return d
        }
        return a.title.localeCompare(b.title)
      })
      .map(resolve)
  }

  return item
}

module.exports = { navigationPlugin }
