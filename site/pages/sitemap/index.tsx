import { list, retrieve } from "@/config/sitemap.ts"
import type { JSX } from "preact"
import { h } from "preact"

export function data() {
  return {
    title: "Sitemap",
    layout: "blank",
    eleventyExcludeFromCollections: true
  }
}

export function render(): JSX.Element {
  const l = list()

  return "hi"
}
