export namespace Eleventy {
  export interface Context {
    eleventy: any
    collections: any
    page: any
    content: any

    title: string
    description: string
  }
}
