// todo: replace all `any` types with proper types.
// todo: explain what this file does.

import {Suspense} from "preact/compat"
import type {JSX} from "preact"
import {Fragment, h} from "preact"

const ctx = createContext()

function createContext() {
  return {
    register(_: Deferred): void {
      throw new Error("Not implemented")
    },
    resolve(): void {
      throw new Error("Not implemented")
    }
  }
}

export function createSuspense() {
  const s: Deferred[] = []
  ctx.register = register
  ctx.resolve = resolve
  return resolve

  function register(d: Deferred): void {
    s.push(d)
  }

  function resolve(): void {
    while (s.length > 0) {
      const d = s.pop()
      if (d) {
        d.resolve()
      }
    }
  }
}

export function useSuspense(cb: any) {
  const d = new Deferred(cb)
  ctx.register(d)

  let r = false
  d.promise.then(() => {
    r = true
  })

  return Consumer

  function Consumer({children}: {children: any}): JSX.Element {
    return (
      <Suspense fallback="This message should not be seen">
        <Suspender>
          {children}
        </Suspender>
      </Suspense>
    )
  }

  function Suspender({children}: {children: any}): JSX.Element {
    if (!r) {
      throw d.promise
    }
    return <>{children}</>
  }
}

class Deferred {
  promise: Promise<any>
  _resolve: any
  // _reject: any

  constructor(cb: any) {
    this.promise = new Promise((res, rej) => {
      this._resolve = res.bind(this, cb())
      // this._reject = rej
    })
  }

  resolve() {
    if (this._resolve) {
      this._resolve()
    }
  }

  // reject() {
  //   if (this._reject) {
  //     this._reject()
  //   }
  // }
}
