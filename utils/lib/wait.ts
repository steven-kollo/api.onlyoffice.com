/**
 * Pauses the execution for the specified number of milliseconds.
 * @param ms The number of milliseconds to wait. Defaults to 0.
 */
export function wait(ms: number = 0): Promise<void> {
  return new Promise((res) => {
    setTimeout(res, ms)
  })
}
