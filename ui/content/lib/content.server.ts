import type * as T from "./Content.tsx"
import * as C from "./Content.tsx"

export type ContentParameters = T.RootParameters
export type ContentAlertParameters = T.AlertParameters

export const Content = Object.assign(C.Root, {
  Alert: C.Alert
})
