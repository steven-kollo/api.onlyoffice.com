// @ts-check

/**
 * @typedef {import("@onlyoffice/documentation-declarations").Declaration} Declaration
 * @typedef {import("@onlyoffice/documentation-declarations").DeclarationType} DeclarationType
 * @typedef {import("@onlyoffice/documentation-declarations").DeclarationValue} DeclarationValue
 * @typedef {import("@onlyoffice/documentation-ui-reflection-webc").ReflectionValue} ReflectionValue
 * @typedef {import("@onlyoffice/documentation-ui-reflection-webc").ReflectionType} ReflectionType
 */

const { basename } = require("node:path")
const builtin = require("@onlyoffice/documentation-declarations/builtin.js")
const { list, retrieve } = require("@onlyoffice/documentation-resources/document-builder.cjs")
const reflection = require("@onlyoffice/documentation-ui-reflection-webc/reflection.cjs")

function data() {
  return {
    layout: "class/class.webc",
    pagination: {
      data: "items",
      size: 1,
      addAllPagesToCollections: true,
      before(data) {
        return data.map(resolveDeclaration)
      }
    },
    // todo: do not forget to remove slice.
    items: list().slice(0, 201),
    permalink(data) {
      return resolveLink(data.pagination.items[0])
    },
    eleventyComputed: {
      title(data) {
        return basename(data.page.url)
      },
      currentName(data) {
        return basename(data.page.url)
      }
    }
  }
}

/**
 * @param {Declaration} d
 * @returns {Declaration}
 */
function resolveDeclaration(d) {
  if (d.parameters !== undefined) {
    d._parameters = d.parameters.map(resolveValue)
  }
  if (d.properties !== undefined) {
    d._properties = d.properties.map(resolveValue)
  }
  if (d.returns !== undefined) {
    d._returns = d.returns.map(resolveValue)
  }
  return d
}

/**
 * @param {DeclarationValue} dv
 * @returns {ReflectionValue}
 */
function resolveValue(dv) {
  /** @type {ReflectionValue} */
  const rv = {
    name: dv.name,
    // todo: permalink
    type: resolveType(dv.type)
  }

  if (dv.description !== undefined) {
    rv.description = {
      text: dv.description.text,
      render: reflection.renderTextContent
    }
  }

  if (dv.default !== undefined) {
    rv.default = dv.default
  }

  return rv
}

/**
 * @param {DeclarationType} dt
 * @returns {ReflectionType}
 */
function resolveType(dt) {
  /** @type {ReflectionType} */
  const rt = {
    name: "",
    render: reflection.renderLiteralType
  }

  if (dt.value !== undefined) {
    rt.value = dt.value
  }

  switch (dt.id) {
    case "array":
      rt.render = reflection.renderArrayType
      break
    case "literal":
    case "object":
      rt.render = reflection.renderLiteralType
      break
    case "optional":
      rt.render = reflection.renderOptionalType
      break
    case "readonly":
      rt.name = "Readonly"
      rt.render = reflection.renderGenericType
      break
    case "record":
      rt.name = "Record"
      rt.render = reflection.renderGenericType
      break
    case "setonly":
      rt.name = "Setonly"
      rt.render = reflection.renderGenericType
      break
    case "union":
      rt.render = reflection.renderUnionType
      break
    default:
      const d = retrieve(dt.id)
      if (d === undefined) {
        // todo: thrown an error on production.
        // throw new Error(`pages: unknown type: ${dt.id}`)
        break
      }
      rt.link = resolveLink(d)
      if (dt.children === undefined) {
        rt.value = d.name
      } else {
        rt.name = d.name
        rt.render = reflection.renderGenericType
      }
      break
  }

  if (dt.children !== undefined) {
    rt.children = dt.children.flatMap((dt) => {
      const rt = resolveType(dt)
      if (rt === undefined) {
        return []
      }
      return rt
    })
  }

  return rt
}

/**
 * @param {Declaration} d
 * @returns {string}
 */
function resolveLink(d) {
  let p = d.meta.package
  switch (d.meta.package) {
    case "word":
      p = "text"
      break
    case "cell":
      p = "spreadsheet"
      break
    case "slide":
      p = "presentation"
      break
    case "forms":
      p = "form"
      break
    default:
      throw new Error(`pages: unknown package: ${d.meta.package}`)
  }
  let u = `/document-builder/javascript-sdk/${p}/`
  if (d.memberof !== undefined) {
    u += `${d.memberof}/`
  }
  u += `${d.name}/index.html`
  return u
}

function render() {
  return ""
}

module.exports = { data, render }
