import {is, unreachable} from "uvu/assert"
import {test} from "uvu"
import {uniqueString} from "./main.ts"

test("generates a string", () => {
  const s = uniqueString()
  is(typeof s, "string")
})

test("generates a string with 12 characters", () => {
  const s = uniqueString()
  is(s.length, 12)
})

test("generates a unique string", () => {
  const t = new Set()
  for (let i = 0; i < 100_000; i += 1) {
    const s = uniqueString()
    if (t.has(s)) {
      unreachable(`string ${s} already exists with ${i} iterations`)
      return
    }
    t.add(s)
  }
})

test.run()
