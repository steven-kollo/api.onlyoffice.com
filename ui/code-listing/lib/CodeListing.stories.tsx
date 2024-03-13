// import "../../content/lib/content.css"
import "./code-listing.css"
import "./CodeListing.ts"

import { Fragment, h } from "preact"
// import { Content } from "../../content/lib/content.ts"
import { CodeListing } from "./code-listing.server.ts"

export default {
  title: "UI Kit/CodeListing"
}

export const Composition = {
  render() {
    return (
      <>
        <CodeListing groups={
          [
            ["First", <span>hi</span>],
            ["Second", "console.log('hi')"],
          ]
        }>
          {/* todo <CodeListing.Group name="JavaScript">const foo = "bar"</CodeListing.Group> */}
        </CodeListing>
      </>
    )
  }
}
