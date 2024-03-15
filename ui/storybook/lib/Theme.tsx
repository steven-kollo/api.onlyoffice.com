import { readableColor, toHex } from "color2k"
import { useEffect, useRef, useState } from "preact/hooks"
import type { JSX } from "preact"
import { h } from "preact"
import "./theme.css"

export interface RootProperties {
  children: any
}

export function Root(
  {
    children
  }: RootProperties
): JSX.Element {
  return (
    <div class="storybook-theme">
      {children}
    </div>
  )
}

export interface ColorProperties {
  children: any
}

export function Color(
  {
    children
  }: ColorProperties
): JSX.Element {
  return (
    <div>
      {children}
    </div>
  )
}

export interface ScaleProperties {
  scale: string
}

export function Scale(
  {
    scale
  }: ScaleProperties
): JSX.Element {
  const ref = useRef<HTMLDivElement>(null)
  const [hex, setHex] = useState<string | null>(null)

  const textColor = hex ? readableColor(hex) : "currentColor"

  useEffect(() => {
    window.requestAnimationFrame(() => {
      if (ref.current === null) {
        return
      }
      const s = getComputedStyle(ref.current)
      const rgb = s.getPropertyValue("background-color")
      setHex(toHex(rgb))
    })
  }, [scale])

  return (
    <div
      ref={ref}
      class="storybook-theme-scale"
      style={{
        color: textColor,
        backgroundColor: `var(--${scale})`
      }}
    >
      <code>--{scale}; {hex}</code>
    </div>
  )
}
