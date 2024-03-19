import type * as T0 from "./Content.tsx"
import * as C0 from "./Content.tsx"
import type * as T1 from "./Properties.tsx"
import * as C1 from "./Properties.tsx"
import type * as T2 from "./Theme.tsx"
import * as C2 from "./Theme.tsx"

export type ContentParameters = T0.RootParameters

export const Content = Object.assign(C0.Root, {})

export type PropertiesParameters = T1.RootParameters
export type PropertyParameters = T1.PropertyParameters

export const Properties = Object.assign(C1.Root, {
  Property: C1.Property
})

export type ThemeParameters = T2.RootParameters
export type ThemeColorParameters = T2.ColorParameters
export type ThemeScaleParameters = T2.ScaleParameters

export const Theme = Object.assign(C2.Root, {
  Color: C2.Color,
  Scale: C2.Scale
})

export * from "./decorators.tsx"
