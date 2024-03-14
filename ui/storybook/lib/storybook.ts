import type * as T0 from "./Theme.tsx"
import * as C0 from "./Theme.tsx"

export type ThemeProperties = T0.RootProperties
export type ThemeColorProperties = T0.ColorProperties
export type ThemeScaleProperties = T0.ScaleProperties

export const Theme = Object.assign(C0.Root, {
  Color: C0.Color,
  Scale: C0.Scale
})
