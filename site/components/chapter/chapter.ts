import type * as T from "./Chapter.tsx"
import * as C from "./Chapter.tsx"

export type ChapterParameters = T.RootParameters
export type ChapterNavigationParameters = T.NavigationParameters

export const Chapter = Object.assign(C.Root, {
  Navigation: C.Navigation
})