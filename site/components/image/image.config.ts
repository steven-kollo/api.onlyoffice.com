import {basename, extname} from "node:path"
import eleventyImage from "@11ty/eleventy-img"
import type {Root} from "hast"
import {visit} from "unist-util-visit"
import type {VFile} from "vfile"

// https://github.com/11ty/eleventy-img/issues/206/
// https://github.com/rehypejs/rehype-picture/blob/main/lib/index.js/
// https://www.11ty.dev/docs/plugins/image/#make-your-own-markup
export function rehypePlugin() {
  return async function (tree: Root, file: VFile): Promise<void> {
    visit(tree, "element", function (node, index, parent) {
      if (
        !parent ||
        typeof index !== "number" ||
        node.tagName !== "img"
      ) {
        return
      }

      if (typeof node.properties.src !== "string") {
        // throw new Error("Image src is required")
        return
      }

      if (typeof node.properties.alt !== "string") {
        // throw new Error("Image alt text is required")
      }

      console.log(node)

      // eleventyImage(node.properties.src, {
      //   formats: ["webp"],
      //   urlPath: "/assets/",
      //   outputDir: "./dist/assets/",
      //   filenameFormat(id: string, src: string, width: number, format: string, options: any) {
      //     const e = extname(src)
      //     const n = basename(src, e)
      //     return `${n}-${width}w-${id}.${format}`
      //   }
      // })

      // parent.children[index] = {
      //   type: "element",
      //   tagName: "picture",
      //   properties: {},
      //   children: []
      // }

      // if (node.tagName !== "img") {
      //   return
      // }
    })
  }
}
