export interface Throttler {
  <C extends () => void | PromiseLike<void>>(cb: C):
    C extends () => PromiseLike<void> ? PromiseLike<void> : void
}

export function once(): Throttler {
  let d = false
  // @ts-ignore it is safe enough
  // todo: explain
  return function fn(cb) {
    if (d) {
      return
    }
    d = true
    return cb()
  }
}
