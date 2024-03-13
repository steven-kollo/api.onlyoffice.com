import type * as T from "./Content.tsx"
import * as C from "./Content.tsx"

export type ContentProperties = T.RootProperties
export type ContentAlertProperties = T.AlertProperties

export const Content = Object.assign(C.Root, {
  Alert: C.Alert
})
