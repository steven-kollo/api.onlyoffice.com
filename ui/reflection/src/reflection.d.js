/**
 * @typedef {Object} ReflectionParameters
 * @property {ReflectionRecord[]} value
 * @slot caption The caption of the table for screen readers only.
 * @slot head The one-line header of the table for screen readers only.
 */

/**
 * @typedef {Object} ReflectionRecord
 * @property {string} name
 * @property {((data: unknown) => string)=} permalink
 * @property {ReflectionType[]} type
 * @property {boolean} required
 * @property {string} description
 * @property {string} default
 * @property {string} example
 */

/**
 * @typedef {Object} ReflectionType
 * @property {string} name
 * @property {((data: unknown) => string)=} permalink
 * @property {ReflectionType[]} child // todo: rename to children
 */

module.exports = {}
