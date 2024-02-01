// @ts-check

/**
 * @typedef {Object} Component
 * @property {string} tag
 * @property {Object} attributes
 */

/**
 * @returns {Component}
 */
function InlineSignature(declaration, retrieve) {
  return {
    tag: "inline-signature",
    attributes: {
      declaration: declaration,
      retrieve: retrieve,
    }
  }
}

module.exports = { InlineSignature }
