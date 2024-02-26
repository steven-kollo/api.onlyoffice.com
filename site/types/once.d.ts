export interface Throttler {
  <C extends () => void | PromiseLike<void>>(cb: C):
    C extends () => PromiseLike<void> ? PromiseLike<void> : void
}
