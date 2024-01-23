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

const gc = new WeakMap()

/**
 * @param {UserConfig} uc
 * @returns {void}
 */
function navigationPlugin(uc) {
  uc.addCollection("navigation", (c) => {
    if (gc.has(navigationPlugin)) {
      return gc.get(navigationPlugin)
    }
    const list = c.getFilteredByTag("navigation")
    const cache = collect(list)
    const root = resolve(cache)
    gc.set(navigationPlugin, root.children)
    return root.children
  })
}

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
    link: cache.link
  }

  const ch = Object.values(cache.children)
  if (ch.length > 0) {
    item.children = resolveChildren(ch)

    // todo: is it okay? explain why it might happen.
    // todo: thrown an error on production.
    // todo: print a warning on development.
    if (item.link === "") {
      item.link = resolveLink(item.children)
    }
    if (item.title === "") {
      item.title = resolveTitle(item.link)
    }
  }

  return item
}

/**
 * @param {CacheNavigationItem[]} ch
 * @returns {NavigationItem[]}
 */
function resolveChildren(ch) {
  return ch
    .sort((a, b) => {
      const d = a.order - b.order
      if (d !== 0) {
        return d
      }
      return a.title.localeCompare(b.title)
    })
    .map(resolve)
}

/**
 * @param {NavigationItem[]} ch
 * @returns {string}
 */
function resolveLink(ch) {
  let l = ch[0].link
  if (ch.length === 1) {
    const i = l.lastIndexOf("/", l.lastIndexOf("/") - 1)
    l = l.substring(0, i + 1)
  } else {
    for (let i = 1; i < ch.length; i += 1) {
      for (let j = 0; j < l.length; j += 1) {
        if (l[j] !== ch[i].link[j]) {
          l = l.slice(0, j)
          break
        }
      }
    }
  }
  return l
}

/**
 * @param {string} l
 * @returns {string}
 */
function resolveTitle(l) {
  const i = l.lastIndexOf("/", l.lastIndexOf("/") - 1)
  return l.substring(i + 1, l.length - 1)
}

module.exports = { navigationPlugin }
