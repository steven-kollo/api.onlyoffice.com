import {env} from "node:process"
import {is, unreachable} from "uvu/assert"
import {test} from "uvu"
import {rootDir} from "./main.js"

test.before.each(() => {
  delete env.ELEVENTY_ROOT
})

test("throws an error if the env variable is not set", () => {
  try {
    rootDir()
    unreachable("should have thrown an error")
  } catch (e) {
    let m = ""
    if (e instanceof Error) {
      m = e.message
    }
    is(m, "ELEVENTY_ROOT is not set")
  }
})

test("returns the value of the env variable", () => {
  env.ELEVENTY_ROOT = "/foo"
  is(rootDir(), "/foo")
})

test.run()
