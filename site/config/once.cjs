// @ts-check

/**
 * @typedef {import("../types/once.js").Throttler} Throttler
 */

/**
 * @returns {Throttler}
 */
function once() {
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

module.exports = { once }
