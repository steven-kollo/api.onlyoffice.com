// @ts-check

// todo: migrate to esm.

/**
 * @typedef {import("../index.js").ReflectionContentRender} ReflectionContentRender
 * @typedef {import("../index.js").ReflectionType} ReflectionType
 * @typedef {import("../index.js").ReflectionTypeRender} ReflectionTypeRender
 */

const { join } = require("node:path")

// todo: delete
/**
 * @returns {string[]}
 */
function components() {
  return [
    src("reflection.webc")
  ]
}

/**
 * @param {string} p
 * @returns {string}
 */
function src(p) {
  return join(__dirname, p)
}

/** @type {ReflectionContentRender} */
function renderTextContent(c) {
  return `<p>${escapeHTML(c.text)}</p>`
}

/**
 * @param {string} s
 * @returns {string}
 */
function escapeHTML(s) {
  return s
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;")
    .replace(/'/g, "&#039;")
}

/** @type {ReflectionTypeRender} */
function renderArrayType(t) {
  let p = "[]"
  if (t.children !== undefined) {
    const c = renderTypeChildren(t.children)
    p = `${c}${p}`
  }
  return p
}

/** @type {ReflectionTypeRender} */
function renderGenericType(t) {
  let p = t.name
  if (t.children !== undefined) {
    const c = renderTypeChildren(t.children, ", ")
    p = `${p}${brackets(c)}`
  }
  return p
}

/** @type {ReflectionTypeRender} */
function renderLiteralType(t) {
  let p = `${t.value}`
  if (t.link !== undefined) {
    p = `<a href="${t.link}">${p}</a>`
  }
  return p
}

/** @type {ReflectionTypeRender} */
function renderOptionalType(t) {
  let p = "?"
  if (t.children !== undefined) {
    const c = renderTypeChildren(t.children)
    p = `${c}${p}`
  }
  return p
}

/** @type {ReflectionTypeRender} */
function renderUnionType(t) {
  let p = ""
  if (t.children !== undefined) {
    p = renderTypeChildren(t.children, " | ")
  }
  return p
}

/**
 * @param {ReflectionType[]} ch
 * @param {string} [sp=""]
 * @returns {string}
 */
function renderTypeChildren(ch, sp = "") {
  return ch.map((t) => t.render(t)).join(sp)
}

/**
 * Wraps the string in angle brackets.
 *
 * @param {string} s
 * @returns {string}
 */
function brackets(s) {
  return `&lt;${s}&gt;`
}

module.exports = {
  components,
  renderTextContent,
  renderArrayType,
  renderGenericType,
  renderLiteralType,
  renderOptionalType,
  renderUnionType
}
