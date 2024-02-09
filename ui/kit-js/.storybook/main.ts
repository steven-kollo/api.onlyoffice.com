/** @type { import('@storybook/html-vite').StorybookConfig } */
const config = {
  framework: "@storybook/preact-vite",
  stories: [
    "../../*-js/lib/*.stories.tsx",
  ],
  staticDirs: [
    "../../primitives/static"
  ]
}

export default config;
