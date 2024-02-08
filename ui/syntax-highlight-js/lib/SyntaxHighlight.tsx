import { common, createStarryNight } from "@wooorm/starry-night"
import { toJsxRuntime } from "hast-util-to-jsx-runtime"
import { h } from "preact"
import { Fragment, jsx, jsxs } from "preact/jsx-runtime"

let night

// const night = await createStarryNight(common)

function SyntaxHighlight({ syntax, children }) {
  // const scope = night.flagToScope(syntax)
  // console.log("SYNTAX", typeof children, children)
  // const tree = night.highlight(children(), scope)
  // return toJsxRuntime(tree, { Fragment, jsx, jsxs })
  return {children}
}

export { SyntaxHighlight }
