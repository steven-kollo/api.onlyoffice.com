// @ts-check

/**
 * @typedef {import("@11ty/eleventy").UserConfig} UserConfig
 */

const { extname } = require("node:path")
const { isBuild, isPreview } = require("./env.cjs")

/**
 * @typedef {Object} NavigationItem
 * @property {string} title
 * @property {string} link
 * @property {NavigationItem[]=} children
 */

/**
 * @typedef {Object} TemporalNavigationItem
 * @property {string} title
 * @property {string} link
 * @property {number} order
 * @property {Record<string, TemporalNavigationItem>} children
 */

/**
 * @typedef {Object} Context
 * @property {string[]} hierarchy
 */

const cache = new WeakMap()
const doCache = isBuild() || isPreview()

/**
 * @param {UserConfig} uc
 * @returns {void}
 */
function navigationPlugin(uc) {
  uc.addCollection(navigation.name, (tc) => {
    if (doCache) {
      if (cache.has(navigation)) {
        return cache.get(navigation)
      }
      const n = navigation(tc)
      cache.set(navigation, n)
      return n
    }
    return navigation(tc)
  })
}

/**
 * @param {any} tc
 * @returns {NavigationItem[]}
 */
function navigation(tc) {
  /** @type {Context} */
  const ctx = {
    hierarchy: []
  }
  const l = tc.getFilteredByTag("navigation")
  const t = collectNavigation(l)
  const r = processNavigation(ctx, t)
  if (r.children === undefined) {
    return []
  }
  return r.children
}

/**
 * @param {any[]} l
 * @returns {TemporalNavigationItem}
 */
function collectNavigation(l) {
  /** @type {TemporalNavigationItem} */
  const temp = {
    title: "",
    link: "",
    order: 0,
    children: {}
  }

  l.forEach((item) => {
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

    let r = temp.children

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

  return temp
}

/**
 * @param {Context} ctx
 * @param {TemporalNavigationItem} t
 * @returns {NavigationItem}
 */
function processNavigation(ctx, t) {
  /** @type {NavigationItem} */
  const item = {
    title: t.title,
    link: t.link
  }

  const en = Object.entries(t.children)
  if (en.length > 0) {
    item.children = en
      .map(([s, t]) => {
        ctx.hierarchy.push(s)
        t = preprocessNavigation(ctx, t)
        const r = processNavigation(ctx, t)
        ctx.hierarchy.pop()
        return {
          o: t.order,
          r
        }
      })
      .sort((a, b) => {
        const d = a.o - b.o
        if (d !== 0) {
          return d
        }
        return a.r.title.localeCompare(b.r.title)
      })
      .map((t) => {
        return t.r
      })
  }

  return item
}

/**
 * @param {Context} ctx
 * @param {TemporalNavigationItem} t
 * @returns {TemporalNavigationItem}
 */
function preprocessNavigation(ctx, t) {
  // todo: is it okay? explain why it might happen.
  // todo: thrown an error on production.
  // todo: print a warning on development.

  if (t.link === "") {
    t.link = ctx.hierarchy.join("/")
    if (!t.link.startsWith("/")) {
      t.link = `/${t.link}`
    }
    if (!t.link.endsWith("/")) {
      t.link += "/"
    }
  }

  if (t.title === "") {
    const i = t.link.lastIndexOf("/", t.link.lastIndexOf("/") - 1)
    t.title = t.link.substring(i + 1, t.link.length - 1)
  }

  return t
}

module.exports = { navigationPlugin }
