export namespace Eleventy {
  export interface Context {
    collections: any
    content: any
    eleventy: any
    page: any
    pagination: any

    title: string
    description: string
  }
}
