// @ts-check

import console from "node:console"

/**
 * @param {string} m
 * @param {...any} a
 * @returns {void}
 */
function i(m, ...a) {
  console.log(`declarations: [info] ${m}`, ...a)
}

/**
 * @param {string} m
 * @param {...any} a
 * @returns {void}
 */
function w(m, ...a) {
  console.warn(`declarations: [warn] ${m}`, ...a)
}

export { i, w }
