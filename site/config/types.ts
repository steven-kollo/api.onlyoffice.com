import type { UserConfig as NativeUserConfig } from "@11ty/eleventy"

export namespace Eleventy {
  export type UserConfig = NativeUserConfig

  export interface Context {
    collections: any
    content: any
    eleventy: any
    page: any
    pagination: any

    title: string
    description: string
  }

  // https://github.com/11ty/eleventy/blob/v2.0.1/src/TemplateCollection.js#L5
  export interface TemplateCollection {
    getAll(): Template[]
  }

  // https://github.com/11ty/eleventy/blob/v2.0.1/src/Template.js#L35
  export interface Template {
    data: {
      title?: string
      order?: number
    }
    outputPath: string
    url: string
    date: Date
  }
}
