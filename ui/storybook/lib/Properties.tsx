import { useEffect, useRef, useState } from "preact/hooks"
import type { JSX } from "preact"
import { h } from "preact"

export interface RootParameters {
  children: any
}

export function Root(
  {
    children
  }: RootParameters
): JSX.Element {
  return (
    <table>
      <thead>
        <tr>
          <th>Name</th>
          <th>Value</th>
        </tr>
      </thead>
      <tbody>
        {children}
      </tbody>
    </table>
  )
}

export interface PropertyParameters {
  property: string
}

export function Property(
  {
    property: p
  }: PropertyParameters
): JSX.Element {
  const ref = useRef<HTMLTableRowElement>(null)
  const [v, setValue] = useState<string | null>(null)

  const sp = `--storybook-${p}`
  const tp = `--${p}`

  useEffect(() => {
    window.requestAnimationFrame(() => {
      if (ref.current === null) {
        return
      }
      const s = getComputedStyle(ref.current)
      const v = s.getPropertyValue(sp)
      setValue(v)
    })
  }, [p])

  return (
    <tr
      ref={ref}
      style={{
        [sp]: `var(${tp})`
      }}
    >
      <td><code>{tp}</code></td>
      <td><code>{v}</code></td>
    </tr>
  )
}