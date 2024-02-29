import "../../content-js/lib/content.css"
import "./code-listing.css"
import "./CodeListing.ts"

import { h } from "preact"
import { Content } from "../../content-js/lib/content.ts"
import { CodeListing } from "./code-listing.ts"

export default {
  title: "Components/CodeListing"
}

export const Composition = {
  render() {
    return (
      <Content>
        <CodeListing groups={
          [
            ["First", <span>hi</span>],
            ["Second", "console.log('hi')"],
          ]
        }>
          {/* todo <CodeListing.Group name="JavaScript">const foo = "bar"</CodeListing.Group> */}
        </CodeListing>
      </Content>
    )
  }
}
