// @ts-check

/**
 * @typedef {import("@11ty/eleventy").UserConfig} UserConfig
 */

const { tmpdir } = require("node:os")
const { build } = require("esbuild")
const { isValidElement } = require("preact")
const { render } = require("preact-render-to-string")
const requireFromString = require("require-from-string")

/**
 * @param {UserConfig} uc
 */
function mdxPlugin(uc) {
  uc.addTemplateFormats("mdx")

  uc.addExtension("mdx", {
    outputFileExtension: "html",
    compile(_, f) {
      return async (data) => {
        const { compile } = await import("@mdx-js/mdx")
        const r = await build({
          entryPoints: [f],
          format: "cjs",
          outdir: tmpdir(),
          write: false,
          plugins: [
            {
              name: "mdx",
              setup(build) {
                build.onLoad({ filter: /\.mdx?$/ }, async (...a) => {
                  // todo: explain why this lib
                  // because vfile is already a third-party dependency.
                  // https://www.npmjs.com/package/gray-matter
                  const { read } = await import("to-vfile")
                  const { matter } = await import("vfile-matter")
                  let vf = await read(f)
                  matter(vf, { strip: true })
                  vf = await compile(vf.value, {
                    jsxImportSource: "preact"
                  })
                  return {
                    contents: vf.value
                  }
                })
              },
            }
          ]
        })
        const m = requireFromString(r.outputFiles[0].text)
        const p = m.default()
        if (isValidElement(p)) {
          if (data.layout && (data.layout.endsWith(".jsx") || data.layout.endsWith(".tsx"))) {
            return p
          }
          return render(p)
        }
        console.log(data.page)
        console.log("warn")
        return ""
      }
    }
  })
}

module.exports = { mdxPlugin }
