import type { JSX } from "preact"
import { Fragment, h } from "preact"

export function useStyles(...styles: string[]) {
  const uniq = styles.filter((s, i, a) => {
    return a.indexOf(s) === i
  })
  return [
    (Story: any): JSX.Element => (
      <>
        {uniq.map((s) => (
          <style key={s} dangerouslySetInnerHTML={{ __html: s }} />
        ))}
        <Story />
      </>
    )
  ]
}
