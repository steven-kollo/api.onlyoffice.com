import type * as T0 from "./Content.tsx"
import * as C0 from "./Content.tsx"
import type * as T1 from "./Properties.tsx"
import * as C1 from "./Properties.tsx"
import type * as T2 from "./Theme.tsx"
import * as C2 from "./Theme.tsx"

export type ContentProperties = T0.RootProperties

export const Content = Object.assign(C0.Root, {})

export type PropertiesProperties = T1.RootProperties
export type PropertyProperties = T1.PropertyProperties

export const Properties = Object.assign(C1.Root, {
  Property: C1.Property
})

export type ThemeProperties = T2.RootProperties
export type ThemeColorProperties = T2.ColorProperties
export type ThemeScaleProperties = T2.ScaleProperties

export const Theme = Object.assign(C2.Root, {
  Color: C2.Color,
  Scale: C2.Scale
})
