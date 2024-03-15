import type { JSX } from "preact"
import { Fragment, h } from "preact"
import srOnly from "./sr-only.css?inline"
import { SROnly } from "./sr-only.server.ts"

const styles: string[] = [
  srOnly
]

export default {
  title: "UI Kit/SROnly",
  decorators: [
    (Story: any): JSX.Element => (
      <>
        {styles.map((s) => (
          <style key={s} dangerouslySetInnerHTML={{ __html: s }} />
        ))}
        <Story />
      </>
    )
  ]
}

export function Composition(): JSX.Element {
  return (
    <div>
      <p>The paragraph below should be hidden from sight, but still read by screen readers.</p>
      <SROnly>
        <p>
          This is a paragraph of text that should be hidden from sight, but still read by screen readers.
        </p>
      </SROnly>
    </div>
  )
}
