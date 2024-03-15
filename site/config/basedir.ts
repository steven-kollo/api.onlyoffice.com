import { env } from "node:process"

/**
 * @returns The root directory of the Eleventy project.
 */
export function rootDir(): string {
  const r = env.ELEVENTY_ROOT
  if (r === undefined) {
    throw new Error("ELEVENTY_ROOT is not defined")
  }
  return r
}
