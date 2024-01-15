const rawCell = require("./data/cell.json")
// const rawForm = require("@onlyoffice-demo-docs/document-builder/data/form.json")
// const rawSlide = require("@onlyoffice-demo-docs/document-builder/data/slide.json")
// const rawWord = require("@onlyoffice-demo-docs/document-builder/data/word.json")

/**
 * @typedef {import("../../site/blocks/reflection/reflection.js").ReflectionRecord} ReflectionRecord
 */

/**
 * @typedef {Object} TypeDefinition
 * @property {string} type
 * @property {string} name
 * @property {string} memberof
 * @property {string} description
 * @property {ReflectionRecord[]} properties
 * @property {ReflectionRecord[]} parameters
 * @property {ReflectionRecord[]} returns
 * @property {string[]} signatures
 * @property {string[]} examples
 *
 * todo: @property {{ type: string, string: string }} content // type: md, gomd, swiftmd, etc...
 */

function setup() {
  return {
    cell: parse(rawCell),
    // form: parse(rawForm),
    // slide: parse(rawSlide),
    // word: parse(rawWord)
  }
}

/**
 * @param {any} raw
 * @return {TypeDefinition[]}
 */
function parse(raw) {
  const definitions = []

  raw.forEach((o) => {
    const d = createTypeDefinition()

    if (definitions.find((d) => d.name === o.name)) {
      return
    }

    if (!(o.kind === "class" || o.kind == "member")) {
      return
    }

    d.type = o.kind

    if (o.name !== undefined) {
      d.name = o.name
    }

    if (d.memberof !== undefined) {
      d.memberof = o.memberof
    }

    if (o.description !== undefined) {
      d.description = o.description
    }

    if (o.properties !== undefined) {
      d.properties = o.properties.map((p) => {
        const r = createReflectionRecord()

        if (p.name !== undefined) {
          r.name = p.name
        }

        if (p.type !== undefined) {
          r.type = normalizeType(p.type.names)
        }

        if (p.description !== undefined) {
          r.description = p.description
        }

        return r
      })
    }

    if (o.params !== undefined) {
      d.parameters = o.params.map((p) => {
        const r = createReflectionRecord()

        if (p.name !== undefined) {
          r.name = p.name
        }

        if (p.type !== undefined) {
          r.type = normalizeType(p.type.names)
        }

        if (p.optional !== undefined !== undefined) {
          r.required = !!p.optional
        }

        if (p.description !== undefined) {
          r.description = p.description
        }

        if (p.defaultvalue !== undefined) {
          r.default = p.defaultvalue
        }

        return r
      })
    }

    if (o.returns !== undefined) {
      d.returns = o.returns.map((p) => {
        const r = createReflectionRecord()

        if (p.type !== undefined) {
          r.type = normalizeType(p.type.names)
        }

        return r
      })
    }

    if (o.examples !== undefined) {
      d.examples = o.examples
    }

    insert(definitions, d, "name")
  })

  return definitions
}

/**
 * @returns {TypeDefinition}
 */
function createTypeDefinition() {
  return {
    type: "",
    name: "",
    memberof: "",
    description: "",
    signatures: [],
    properties: [],
    parameters: [],
    returns: [],
    examples: []
  }
}

/**
 * @returns {ReflectionRecord}
 */
function createReflectionRecord() {
  return {
    name: "",
    permalink: undefined,
    type: [],
    required: false,
    description: "",
    default: "",
    example: ""
  }
}

/**
 * @param {string[]} a
 * @returns {string}
 */
function normalizeType(a) {
  return a.map((n) => {
    const r = {
      child: []
    }
    let p = r
    const l = n.split(".")
    for (let i = 0; i < l.length; i += 1) {
      const j = l[i].replaceAll("<", "").replaceAll(">", "")
      const c = {
        name: j,
        child: []
      }
      // todo: move to pages
      // switch (j) {
      //   case "Array":
      //   case "Boolean":
      //   case "Number":
      //   case "String":
      //   case "Readonly":
      //   case "Setonly":
      //     break
      //   default:
      //     c.permalink = function permalink(data) {
      //       return `${data.page.url}unknown/index.html`
      //     }
      // }
      p.child.push(c)
      p = c
    }
    return r.child[0]
  })
}

/**
 * @typedef {Object} Definition
 * @property {string} name
 */

/**
 * @param {Definition[]} a
 * @param {Definition} d
 * @param {keyof Definition} k
 * @returns {Definition[]}
 */
function insert(a, d, k) {
  let s = 0
  let e = a.length - 1
  while (s <= e) {
    let m = Math.floor((s + e) / 2)
    if (a[m][k] === d[k]) {
      a.splice(m, 0, d)
      return a
    }
    if (a[m][k] < d[k]) {
      s = m + 1
    } else {
      e = m - 1
    }
  }
  a.splice(s, 0, d)
  return a
}


module.exports = setup()
