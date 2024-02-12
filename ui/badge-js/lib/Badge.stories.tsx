import { h } from "preact"
import { Badge } from "./Badge.tsx"
import "./badge.css"

export default {
  title: "Components/Badge"
}

export const Default = {
  render() {
    return (
      <p>
        <Badge>info</Badge>
        <Badge sensitive="dangerous">dangerous</Badge>
        <Badge sensitive="subtle">subtle</Badge>
        <Badge sensitive="value">value</Badge>
      </p>
    )
  }
}
