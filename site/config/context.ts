export namespace Eleventy {
  export interface RenderContext {
    eleventy: any
    collections: any
    page: any
    content: any
    title: string
  }

  // todo
  // export interface PageMetadata {
  //   title: string
  //   description: string
  // }
}
