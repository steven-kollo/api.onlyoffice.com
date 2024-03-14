import "./theme.css"

import { useEffect, useRef, useState } from "preact/hooks"
import type { JSX } from "preact"
import { h } from "preact"

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
  const [bg, setBG] = useState<string | null>(null)

  useEffect(() => {
    window.requestAnimationFrame(() => {
      if (ref.current === null) {
        return
      }
      const s = getComputedStyle(ref.current)
      const v = s.getPropertyValue("background-color")
      setBG(v)
    })
  }, [scale])

  return (
    <div
      ref={ref}
      class="storybook-theme-scale"
      style={{
        backgroundColor: `var(--${scale})`,
      }}
    >
      <code>{bg}</code>
    </div>
  )
}
