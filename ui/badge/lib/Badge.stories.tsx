import { h } from "preact"
import { Badge } from "./Badge.tsx"
import "./badge.css"

export default {
  title: "UI Kit/Badge"
}

export const Default = {
  render() {
    return (
      <p>
        <Badge>info</Badge>
        <Badge variant="danger">dangerous</Badge>
        <Badge variant="support">subtle</Badge>
      </p>
    )
  }
}
