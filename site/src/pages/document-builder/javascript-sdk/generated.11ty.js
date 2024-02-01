// @ts-check

/**
 * @typedef {import("@onlyoffice/documentation-declarations").Declaration} Declaration
 * @typedef {import("@onlyoffice/documentation-declarations").DeclarationType} DeclarationType
 * @typedef {import("@onlyoffice/documentation-declarations").DeclarationValue} DeclarationValue
 * @typedef {import("@onlyoffice/documentation-ui-reflection-webc").ReflectionValue} ReflectionValue
 * @typedef {import("@onlyoffice/documentation-ui-reflection-webc").ReflectionType} ReflectionType
 */

const { basename } = require("node:path")
const { list, retrieve } = require("@onlyoffice/documentation-resources/document-builder.cjs")
const { InlineSignature } = require("../../../blocks/inline-signature/inline-signature.js")

// function L() {
//   return {
//     tag: "l"
//   }
// }

function data() {
  return {
    layout: "sdk/sdk.webc",
    pagination: {
      data: "items",
      size: 1,
      addAllPagesToCollections: true,
      before(data) {
        return data.map(parse)
      }
    },
    // todo: do not forget to remove slice.
    items: (() => {
      const l = list()
      const i = l.find((d) => Object.hasOwn(d, "extends"))
      const r = l.slice(0, 101)
      const i2 = l.find((d) => Object.hasOwn(d, "implements"))
      r.push(i, i2)
      return r
    })(),
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
 * @typedef {Object} U
 * @property {string} name
 * @property {string} description
 */

/**
 * @typedef {Object} Topic
 * @property {string} id
 * @property {() => string} title
 * @property {TopicItem[]} items
 */

/**
 * @typedef {Object} TopicItem
 * @property {string} id
 * @property {() => string} signature
 * @property {() => string} description
 */

/**
 * @param {Declaration} d
 */
function parse(d) {
  const r = {
    meta: d.meta,
    name: d.name,
    kind: d.kind,
    signature: InlineSignature(d, retrieve),
    topics: []
  }

  if (Object.hasOwn(d, "description")) {
    r.description = () => d.description.text
  }

  if (Object.hasOwn(d, "parent")) {
    r.parent = d.parent
  }

  switch (d.kind) {
    case "class":
      if (Object.hasOwn(d, "constructors")) {
        r.topics.push({
          id: "#constructors",
          title() {
            return "Constructors"
          },
          items: d.constructors.flatMap(handle)
        })
      }
      if (Object.hasOwn(d, "instanceProperties")) {
        r.topics.push(handleInstanceProperties(d.instanceProperties))
      }
      if (Object.hasOwn(d, "instanceMethods")) {
        r.topics.push(handleInstanceMethods(d.instanceMethods))
      }
      if (Object.hasOwn(d, "events")) {
        r.topics.push({
          id: "#events",
          title() {
            return "Events"
          },
          items: d.events.flatMap(handle)
        })
      }
      if (Object.hasOwn(d, "extends")) {
        r.topics.push({
          id: "#extends",
          title() {
            return "Extends"
          },
          items: d.extends.flatMap(handle)
        })
      }
      if (Object.hasOwn(d, "implements")) {
        r.topics.push({
          id: "#implements",
          title() {
            return "Implements"
          },
          items: d.implements.flatMap(handle)
        })
      }
      break
    case "constructor":
      if (Object.hasOwn(d.type, "parameters")) {
        r.topics.push(handleParameters(d.type.parameters))
      }
      break
    case "event":
    case "function":
    case "instanceMethod":
      if (Object.hasOwn(d.type, "parameters")) {
        r.topics.push(handleParameters(d.type.parameters))
      }
      if (Object.hasOwn(d.type, "returns")) {
        r.topics.push(handleReturns(d.type.returns))
      }
      break
    case "instanceProperty":
      r.topics.push(handleType(d.type))
      break
    case "object":
      break
    case "property":
      r.topics.push(handleType(d.type))
      break
    case "staticMethod":
      if (Object.hasOwn(d.type, "parameters")) {
        r.topics.push(handleParameters(d.type.parameters))
      }
      if (Object.hasOwn(d.type, "returns")) {
        r.topics.push(handleReturns(d.type.returns))
      }
      break
    case "staticProperty":
      break
    case "type":
      break
    case "union":
      break
    case "unknown":
      break
  }

  function handle(r) {
    const t = retrieve(r.id)
    if (t === undefined) {
      // todo: thrown an error.
      return []
    }
    return inner(t)
  }

  function inner(t) {
    return {
      term: InlineSignature(t, retrieve),
      id: "/",
      link: resolveLink(t),
      description() {
        return t.description?.text || ""
      }
    }
  }

  // function DescriptionTopic() {}
  // function PropertiesTopic() {}
  // function SeeAlsoTopic() {}

  function handleInstanceProperties(properties) {
    return {
      id: "#instance-properties",
      title() {
        return "Instance Properties"
      },
      items: properties.flatMap(handle)
    }
  }

  function handleProperties(properties) {
    return {
      id: "#properties",
      title() {
        return "Properties"
      },
      items: properties.flatMap(handle)
    }
  }

  function handleInstanceMethods(methods) {
    return {
      id: "#instance-methods",
      title() {
        return "Instance Methods"
      },
      items: methods.flatMap(handle)
    }
  }

  function handleParameters(parameters) {
    return {
      id: "#parameters",
      title() {
        return "Parameters"
      },
      items: parameters.map((p) => {
        return {
          term: InlineSignature(p, retrieve),
          id: "/",
          description() {
            return p.description?.text || ""
          }
        }
      })
    }
  }

  function handleReturns(type) {
    return {
      id: "#returns",
      title() {
        return "Returns"
      },
      items: [
        {
          term: InlineSignature(type, retrieve),
          id: "/",
          description() {
            // todo
            return ""
            // return d.type.returns.description?.text || ""
          }
        }
      ]
    }
  }

  function handleType(type) {
    return {
      id: "#type",
      title() {
        return "Type"
      },
      items: [
        {
          term: InlineSignature(type, retrieve),
          id: "/",
          description() {
            // todo
            return ""
            // return d.type.returns.description?.text || ""
          }
        }
      ]
    }
  }

  return r
}

/**
 * @returns {string}
 */
function resolveLink(d) {
  let p = d.meta.package
  if (d.meta.package.startsWith("word")) {
    p = "text"
  } else if (d.meta.package.startsWith("cell")) {
    p = "spreadsheet"
  } else if (d.meta.package.startsWith("slide")) {
    p = "presentation"
  } else if (d.meta.package.startsWith("forms")) {
    p = "form"
  } else if (d.meta.package.startsWith("common")) {
    p = "common"
  } else {
    throw new Error(`pages: unknown package: ${d.meta.package}`)
  }
  let u = `/document-builder/javascript-sdk/${p}/`
  if (Object.hasOwn(d, "parent")) {
    const r = retrieve(d.parent.id)
    if (r !== undefined) {
      u += `${r.name}/`
    }
  }
  // todo: fix this in the declarations package.
  let n = d.name
  if (n.includes("\"")) {
    n = n.replace(/"/g, "")
  }
  u += `${n}/index.html`
  return u
}

function render() {
  return ""
}

module.exports = { data, render }
