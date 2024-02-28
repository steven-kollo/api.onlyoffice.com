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

// todo: @property hasChildren(link: string)
// todo: @property {(link: string) => boolean} isCurrent; it should be a property

/**
 * @typedef {Object} TemporalNavigationItem
 * @property {string} title
 * @property {string} link
 * @property {number} order
 * @property {Record<string, TemporalNavigationItem>} children
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
  const l = tc.getFilteredByTag("navigation")
  const t = collectNavigation(l)
  const r = resolveNavigation(t)
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
 * @param {TemporalNavigationItem} t
 * @returns {NavigationItem}
 */
function resolveNavigation(t) {
  /** @type {NavigationItem} */
  const item = {
    title: t.title,
    link: t.link
  }

  const ch = Object.values(t.children)
  if (ch.length > 0) {
    item.children = resolveChildren(ch)
  }

  return item
}

/**
 * @param {TemporalNavigationItem[]} ch
 * @returns {NavigationItem[]}
 */
function resolveChildren(ch) {
  return ch
    .map((t) => {
      // todo: is it okay? explain why it might happen.
      // todo: thrown an error on production.
      // todo: print a warning on development.
      if (t.link === "" || t.title === "") {
        const ch = Object.values(t.children)
        if (ch.length > 0) {
          t.link = resolveLink(ch)
          t.title = resolveTitle(t.link)
        } else {
          t.link = "/404/index.html"
          t.title = "404"
        }
      }
      return t
    })
    .sort((a, b) => {
      const d = a.order - b.order
      if (d !== 0) {
        return d
      }
      return a.title.localeCompare(b.title)
    })
    .map(resolveNavigation)
}

/**
 * @param {TemporalNavigationItem[]} ch
 * @returns {string}
 */
function resolveLink(ch) {
  let l = ch[0].link
  if (ch.length === 1) {
    const i = l.lastIndexOf("/", l.lastIndexOf("/") - 1)
    l = l.substring(0, i + 1)
  } else {
    let s = l.split("/")
    for (let i = 1; i < ch.length; i += 1) {
      let u = ch[i].link.split("/")
      for (let j = 0; j < s.length; j += 1) {
        if (s[j] !== u[j]) {
          s = s.slice(0, j)
          break
        }
      }
    }
    l = s.join("/") + "/"
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
