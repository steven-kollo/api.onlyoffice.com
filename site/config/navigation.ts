import { extname } from "node:path"
import type { UserConfig } from "@11ty/eleventy"
import { isBuild, isPreview } from "./mode.ts"

export interface NavigationItem {
  title: string
  link: string
  children?: NavigationItem[]
}

interface TemporalNavigationItem {
  title: string
  link: string
  order: number
  children: Record<string, TemporalNavigationItem>
}

interface Context {
  hierarchy: string[]
}

const cache = new WeakMap()
const doCache = isBuild() || isPreview()

export function navigationPlugin(uc: UserConfig): void {
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

function navigation(tc: any): NavigationItem[] {
  const ctx: Context = {
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

function collectNavigation(l: any[]): TemporalNavigationItem {
  const temp: TemporalNavigationItem = {
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

function processNavigation(ctx: Context, t: TemporalNavigationItem): NavigationItem {
  const item: NavigationItem = {
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

function preprocessNavigation(ctx: Context, t: TemporalNavigationItem): TemporalNavigationItem {
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
