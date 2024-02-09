import { h } from "preact"
import { CodeListing } from "./CodeListing.tsx"

export default {
  title: "Components/CodeListing",
  render() {
    return (
      <CodeListing>
        const foo = "bar"
      </CodeListing>
    )
  }
}

export const Default = {}
