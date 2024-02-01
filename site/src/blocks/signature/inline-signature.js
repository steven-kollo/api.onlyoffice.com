// @ts-check

/**
 * todo: it is part of the is.
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

/**
 * @returns {Component}
 */
function BlockSignature(declaration, retrieve, link) {
  return {
    tag: "block-signature",
    attributes: {
      declaration: declaration,
      retrieve: retrieve,
      link: link
    }
  }
}

module.exports = { BlockSignature, InlineSignature }
