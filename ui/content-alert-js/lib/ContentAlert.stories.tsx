import { h } from "preact"
import { ContentAlert } from "./ContentAlert.tsx"

import "@onlyoffice/documentation-ui-sr-only/sr-only.css"
import "./content-alert.css"

export default {
  title: "Components/ContentAlert"
}

export const Default = {
  render() {
    return (
      <ContentAlert>
        <p>This is an alert.</p>
      </ContentAlert>
    )
  }
}
