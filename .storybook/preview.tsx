import type { Preview } from "@storybook/preact"
import { useEffect } from "preact/hooks"
import { h } from "preact"
import "./preview.css"

const preview: Preview = {
  globalTypes: {
    theme: {
      name: "Theme",
      description: "Choose the theme",
      defaultValue: "regular-auto",
      toolbar: {
        icon: "contrast",
        showName: true,
        dynamicTitle: true,
        items: [
          {
            title: "Regular Auto",
            value: "regular-auto"
          },
          {
            title: "Regular Light",
            value: "regular-light"
          },
          {
            title: "Regular Dark",
            value: "regular-dark"
          }
        ]
      }
    }
  },
  parameters: {
    // storybook-addon-paddings
    // todo: https://github.com/rbardini/storybook-addon-paddings/issues/42
    layout: "fullscreen",
    paddings: {
      defaultValue: "Medium",
      values: [
        {
          name: "Small",
          value: "1rem"
        },
        {
          name: "Medium",
          value: "2rem"
        },
        {
          name: "None",
          value: "0px"
        }
      ]
    }
  },
  decorators: [
    (Story, ctx) => {
      const { theme } = ctx.globals
      useEffect(() => {
        const [a, b] = theme.split("-")

        let c = "regular"
        switch (a) {
        case "regular":
          c = a
          break
        default:
          console.error(`unknown color theme: ${a}`)
          break
        }
        document.documentElement.setAttribute("data-dark-theme", c)
        document.documentElement.setAttribute("data-light-theme", c)

        let t = "auto"
        switch (b) {
        case "auto":
        case "light":
        case "dark":
          t = b
          break
        default:
          console.error(`unknown theme preference: ${b}`)
          break
        }
        document.documentElement.setAttribute("data-theme-preference", t)
      }, [theme])

      return <Story />
    }
  ]
}

export default preview
