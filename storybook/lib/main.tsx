import type {StorybookConfig} from "@storybook/preact-vite"
import {h} from "preact"
import {renderToString} from "preact-render-to-string"
import {Font} from "../../ui/font/lib/font.server.ts"

export default config()

function config(): StorybookConfig {
  return {
    framework: "@storybook/preact-vite",
    addons: [
      "@storybook/addon-essentials",
      "storybook-addon-paddings"
    ],
    stories: [
      "../../ui/*/lib/*.stories.tsx",
      "../../site/components/*/*.stories.tsx",
      "./*.stories.tsx"
    ],
    staticDirs: [
      "../../ui/font/static"
    ],
    previewHead(head) {
      return head + renderToString(<Font.Links />)
    }
  }
}
