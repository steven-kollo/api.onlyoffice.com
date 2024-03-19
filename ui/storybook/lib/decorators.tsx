import type { JSX } from "preact"
import { Fragment, h } from "preact"

export function useStyles(...styles: string[]) {
  styles = [...new Set(styles)]
  return [
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
