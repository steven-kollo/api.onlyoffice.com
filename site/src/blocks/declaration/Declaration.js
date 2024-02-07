const { html } = require("common-tags")
const {
  CodeListing,
  Content,
  ContentH2,
  DeclarationToken,
  DeclarationReference
} = require("@onlyoffice/documentation-ui-kit-js/kit.js")

/**
 *
 * @param {Object} param0
 * @param {import("@onlyoffice/documentation-declarations").Declaration} param0.declaration
 * @returns
 */
function Declaration({ onRetrieve, onLink, declaration: d }) {
  return Content(() => html`
    <h1>${d.title}</h1>
    ${DeclarationSignature({ onLink, declaration: d })}
    ${ContentH2(() => "Description")}
    <p>${d.description}</p>
    ${DeclarationTopics({ onRetrieve, onLink, declaration: d })}
  `)
}

function DeclarationSignature({ onLink, declaration: d }) {
  return CodeListing(() => {
    return d.signature
      .map((t) => DeclarationToken({ onLink, token: t }))
      .join("")
  })
}

/**
 * @param {Object} param0
 * @param {(d: any) => import("@onlyoffice/documentation-declarations").Declaration} param0.onRetrieve
 * @param {import("@onlyoffice/documentation-declarations").Declaration} param0.declaration
 * @returns
 */
function DeclarationTopics({ onRetrieve, onLink, declaration: d }) {
  let s = ""
  let p = undefined
  let items = []

  // todo: this logic should be part of the declaration package.

  switch (d.kind) {
  // case "alias":
  //   break
  case "class":
    if (d.constructors !== undefined) {
      s += DeclarationTopic({
        onRetrieve,
        onLink,
        title: "Constructors",
        items: d.constructors
      })
    }
    if (d.events !== undefined) {
      s += DeclarationTopic({
        onRetrieve,
        onLink,
        title: "Events",
        items: d.events
      })
    }
    if (d.extends !== undefined) {
      s += DeclarationTopic({
        onRetrieve,
        onLink,
        title: "Extends",
        items: d.extends
      })
    }
    if (d.implements !== undefined) {
      s += DeclarationTopic({
        onRetrieve,
        onLink,
        title: "Implements",
        items: d.implements
      })
    }
    if (d.initializers !== undefined) {
      s += DeclarationTopic({
        onRetrieve,
        onLink,
        title: "Initializers",
        items: d.initializers
      })
    }
    if (d.instanceMethods !== undefined) {
      s += DeclarationTopic({
        onRetrieve,
        onLink,
        title: "Instance Methods",
        items: d.instanceMethods
      })
    }
    if (d.instanceProperties !== undefined) {
      s += DeclarationTopic({
        onRetrieve,
        onLink,
        title: "Instance Properties",
        items: d.instanceProperties
      })
    }
    if (d.typeMethods !== undefined) {
      s += DeclarationTopic({
        onRetrieve,
        onLink,
        title: "Type Methods",
        items: d.typeMethods
      })
    }
    if (d.typeProperties !== undefined) {
      s += DeclarationTopic({
        onRetrieve,
        onLink,
        title: "Type Properties",
        items: d.typeProperties
      })
    }
    if (d.examples !== undefined) {
      s += html`
        ${ContentH2(() => "Examples")}
        ${d.examples.map((e) => CodeListing(() => e))}
      `
    }

    // todo: p = onRetrieve(d.parent)

    break
  case "constructor":
    if (d.type.parameters !== undefined) {
      s += DeclarationTopic2({
        title: "Parameters",
        items: d.type.parameters
      })
    }

    p = onRetrieve(d.parent)
    if (p === undefined || p.kind !== "class") {
      break
    }

    if (d.examples !== undefined) {
      s += html`
        ${ContentH2(() => "Examples")}
        ${d.examples.map((e) => CodeListing(() => e))}
      `
    }

    items = p.constructors.filter((c) => c.id !== d.id)
    if (items.length > 0) {
      s += DeclarationTopic({
        onRetrieve,
        onLink,
        title: "See Also",
        items
      })
    }

    break
  // case "initializer":
  //   break
  case "instanceMethod":
    if (d.type.parameters !== undefined) {
      s += DeclarationTopic2({
        title: "Parameters",
        items: d.type.parameters
      })
    }
    if (d.type.returns !== undefined) {
      s += html`
        ${ContentH2(() => "Returns")}
        <p>${d.type.returns.description}</p>
      `
    }

    if (d.examples !== undefined) {
      s += html`
        ${ContentH2(() => "Examples")}
        ${d.examples.map((e) => CodeListing(() => e))}
      `
    }

    p = onRetrieve(d.parent)
    if (p === undefined || p.kind !== "class") {
      break
    }

    items = p.instanceMethods.filter((c) => c.id !== d.id)
    if (items.length > 0) {
      s += DeclarationTopic({
        onRetrieve,
        onLink,
        title: "See Also",
        items
      })
    }

    break
  case "instanceProperty":
    if (d.examples !== undefined) {
      s += html`
        ${ContentH2(() => "Examples")}
        ${d.examples.map((e) => CodeListing(() => e))}
      `
    }

    p = onRetrieve(d.parent)
    if (p === undefined || p.kind !== "class") {
      break
    }

    items = p.instanceProperties.filter((c) => c.id !== d.id)
    if (items.length > 0) {
      s += DeclarationTopic({
        onRetrieve,
        onLink,
        title: "See Also",
        items
      })
    }
    break
  case "typeMethod":
    if (d.type.parameters !== undefined) {
      s += DeclarationTopic2({
        title: "Parameters",
        items: d.type.parameters
      })
    }
    if (d.type.returns !== undefined) {
      s += html`
        ${ContentH2(() => "Returns")}
        <p>${d.type.returns.description}</p>
      `
    }

    if (d.examples !== undefined) {
      s += html`
        ${ContentH2(() => "Examples")}
        ${d.examples.map((e) => CodeListing(() => e))}
      `
    }

    p = onRetrieve(d.parent)
    if (p === undefined || p.kind !== "class") {
      break
    }

    items = p.typeMethods.filter((c) => c.id !== d.id)
    if (items.length > 0) {
      s += DeclarationTopic({
        onRetrieve,
        onLink,
        title: "See Also",
        items
      })
    }
    break
  case "typeProperty":
    if (d.examples !== undefined) {
      s += html`
        ${ContentH2(() => "Examples")}
        ${d.examples.map((e) => CodeListing(() => e))}
      `
    }

    p = onRetrieve(d.parent)
    if (p === undefined || p.kind !== "class") {
      break
    }

    items = p.typeProperties.filter((c) => c.id !== d.id)
    if (items.length > 0) {
      s += DeclarationTopic({
        onRetrieve,
        onLink,
        title: "See Also",
        items
      })
    }
    break
  case "event":
    if (d.type.parameters !== undefined) {
      s += DeclarationTopic2({
        title: "Parameters",
        items: d.type.parameters
      })
    }

    if (d.examples !== undefined) {
      s += html`
        ${ContentH2(() => "Examples")}
        ${d.examples.map((e) => CodeListing(() => e))}
      `
    }

    p = onRetrieve(d.parent)
    if (p === undefined || p.kind !== "class") {
      break
    }

    items = p.events.filter((c) => c.id !== d.id)
    if (items.length > 0) {
      s += DeclarationTopic({
        onRetrieve,
        onLink,
        title: "See Also",
        items
      })
    }
    break
  case "object":
    break
  case "method":
    break
  case "property":
    break
  case "type":
    if (d.examples !== undefined) {
      s += html`
        ${ContentH2(() => "Examples")}
        ${d.examples.map((e) => CodeListing(() => e))}
      `
    }
    break
  default:
    // todo: log.
    break
  }

  return s
}

/**
 * @param {Object} param0
 * @param {(d: any) => import("@onlyoffice/documentation-declarations").Declaration} param0.onRetrieve
 * @param {string} param0.title
 * @param {import("@onlyoffice/documentation-declarations").ReferenceType[]} param0.items
 */
function DeclarationTopic({ onRetrieve, onLink, title, items }) {
  return html`
    ${ContentH2(() => title)}
    <dl>
      ${items.map((item) => {
        const d = onRetrieve(item)
        if (d === undefined) {
          return
        }
        return html`
          <dt>${DeclarationReference({ onLink, declaration: d })}</dt>
          <dd>${d.description}</dd>
        `
      })}
    </dl>
  `
}

/**
 * @param {Object} param0
 * @param {string} param0.title
 * @param {import("@onlyoffice/documentation-declarations").DeclarationValue[]} param0.items
 */
function DeclarationTopic2({ title, items }) {
  return html`
    ${ContentH2(() => title)}
    <dl>
      ${items.map((item) => {
        return html`
          <dt>${item.name}</dt>
          <dd>${item.description}</dd>
        `
      })}
    </dl>
  `
}

module.exports = { Declaration }
