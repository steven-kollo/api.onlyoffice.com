import { h, Fragment } from "preact"
import { Button } from "./Button.tsx"
import "./button.css"

export default {
  title: "UI Kit/Button"
}

export const Decomposition = {
  render() {
    return (
      <>
        <p><Button>Default</Button></p>
        <p><Button sensitive="accent">Accent</Button></p>
      </>
    )
  }
}
