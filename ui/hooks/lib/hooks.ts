import { isValidElement } from "preact"

// todo: refactor it.
// https://github.com/primer/react/blob/ea44386e4d7afae7bfd07a679604baaecca55965/packages/react/src/hooks/useSlots.ts#L35
export function useSlots<C extends Record<string, any>>(children: any, config: C): [C, any] {
  const n = {}
  const f = []

  const ks = Object.keys(config)
  const vs = Object.values(config)

  children.forEach((c) => {
    if (!isValidElement(c)) {
      f.push(c)
      return
    }
    const i = vs.findIndex((v) => {
      return c.type === v
    })
    if (i === -1) {
      f.push(c)
      return
    }
    const k = ks[i]
    if (n[k]) {
      return
    }
    n[k] = c
  })

  return [n, f]
}
