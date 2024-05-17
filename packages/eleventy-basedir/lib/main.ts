import {env} from "node:process"

export function rootDir(): string {
  const r = env.ELEVENTY_ROOT
  if (r === undefined) {
    throw new Error("ELEVENTY_ROOT is not set")
  }
  return r
}
