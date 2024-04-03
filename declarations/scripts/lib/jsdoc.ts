// @ts-check

/**
 * @typedef {import("../types/doclet.js").Doclet} Doclet
 * @typedef {import("../types/doclet.js").DocletCatharsis} DocletCatharsis
 * @typedef {import("../types/doclet.js").DocletParam} DocletParam
 * @typedef {import("../../types/index.js").AliasDeclaration} AliasDeclaration
 * @typedef {import("../../types/index.js").ClassDeclaration} ClassDeclaration
 * @typedef {import("../../types/index.js").ConstructorDeclaration} ConstructorDeclaration
 * @typedef {import("../../types/index.js").Declaration} Declaration
 * @typedef {import("../../types/index.js").DeclarationMeta} DeclarationMeta
 * @typedef {import("../../types/index.js").DeclarationParent} DeclarationParent
 * @typedef {import("../../types/index.js").DeclarationType} DeclarationType
 * @typedef {import("../../types/index.js").DeclarationValue} DeclarationValue
 * @typedef {import("../../types/index.js").EventDeclaration} EventDeclaration
 * @typedef {import("../../types/index.js").FunctionType} FunctionType
 * @typedef {import("../../types/index.js").InstanceMethodDeclaration} InstanceMethodDeclaration
 * @typedef {import("../../types/index.js").InstancePropertyDeclaration} InstancePropertyDeclaration
 * @typedef {import("../../types/index.js").ObjectDeclaration} ObjectDeclaration
 * @typedef {import("../../types/index.js").PropertyDeclaration} PropertyDeclaration
 * @typedef {import("../../types/index.js").ReferenceType} ReferenceType
 * @typedef {import("../../types/index.js").TypeDeclaration} TypeDeclaration
 */

import { Transform } from "node:stream"
import { createEslint } from "@onlyoffice/documentation-utils/eslint.ts"
import { English } from "sentence-splitter/lang"
import { split } from "sentence-splitter"
import { tokenizeDeclaration, tokenizeType } from "./tokenizer.ts"

const eslint = createEslint()

// todo: rename name to identifier (parameters too)
// todo: rename custom to reference
// todo: delete the syntax property from content
// todo: https://github.com/textlint-rule/sentence-splitter

class PreprocessDeclarations extends Transform {
  /**
   * @param {DeclarationsCache} cache
   */
  constructor(cache) {
    super({ objectMode: true })
    this._i = 0
    this._cache = cache
  }

  _transform(ch, _, cb) {
    this._asyncTransform(ch).then(() => {
      cb(null)
    })
  }

  /**
   * @param {any} ch
   * @returns {Promise<void>}
   */
  async _asyncTransform(ch) {
    /** @type {Doclet} */
    const doc = ch.value

    if (Object.hasOwn(doc, "kind")) {
      if (doc.kind === "package") {
        return
      }
    }

    const meta = parseMeta(doc)

    // todo: "scope": "static"
    // todo: for id const sign = "" (we do not need actually a new const)
    // just add the sign to the id

    // In most cases anonymous refer to a global iife.

    if (Object.hasOwn(doc, "inherits")) {
      if (Object.hasOwn(doc, "memberof")) {
        if (doc.memberof === "<anonymous>") {
          return
        }
        const mo = doc.memberof.replace("<anonymous>~", "")
        const cid = createID(meta.package, mo)
        const p = doc.inherits.split("#")[0]
        const pid = createID(meta.package, p)
        this._cache.populate(cid, "extends", pid)
        this._cache.populate(pid, "implements", cid)
      }
      return
    }

    let d = parseDeclaration(doc, meta)

    /** @type {Declaration[]} */
    const ms = []

    if (Object.hasOwn(doc, "kind")) {
      if (doc.kind === "class") {
        /** @type {ClassDeclaration} */
        const cl = {
          ...d,
          kind: "class"
        }
        // @ts-ignore
        delete cl.type

        if (Object.hasOwn(doc, "properties")) {
          doc.properties.forEach((p) => {
            const pr = createInstanceProperty(p, d)
            ms.push(pr)
            cl.instanceProperties = [{
              type: "reference",
              id: pr.id,
              identifier: p.name
            }]
          })
        }

        const co = createConstructor(doc, cl)
        ms.push(co)

        cl.constructors = [{
          type: "reference",
          id: co.id,
          identifier: co.identifier
        }]
        cl.title = createTitle(cl)
        cl.signature = tokenizeDeclaration(cl)

        d = cl
      } else if (doc.kind === "event") {
        const ev = createEvent(doc, d)

        if (Object.hasOwn(ev, "parent")) {
          this._cache.populate(ev.parent.id, "events", ev.id)
        }

        d = ev
      } else if (doc.kind === "function") {
        const fu = createFunction(doc, d)

        /** @type {Declaration} */
        let td = fu
        if (Object.hasOwn(td, "parent")) {
          /** @type {InstanceMethodDeclaration} */
          // @ts-ignore
          const me = {
            ...td,
            kind: "instanceMethod"
          }
          this._cache.populate(td.parent.id, "instanceMethods", td.id)
          td = me
        }

        td.signature = tokenizeDeclaration(td)
        td.title = createTitle(td)

        d = td
      } else if (doc.kind === "typedef") {
        if (Object.hasOwn(doc, "type") && Object.hasOwn(doc.type, "parsedType")) {
          const t = parseType(d, doc.type.parsedType)
          if (t.type === "object") {
            /** @type {ObjectDeclaration} */
            const ob = {
              ...d,
              kind: "object",
              type: {
                type: "object"
              }
            }

            if (Object.hasOwn(doc, "properties")) {
              ob.type.properties = []
              doc.properties.forEach((p) => {
                const pr = createProperty(p, d)
                ms.push(pr)
                ob.type.properties.push({
                  type: "reference",
                  id: pr.id,
                  identifier: p.name
                })
              })
            }

            ob.title = createTitle(ob)
            d = ob
          } else {
            // @ts-ignore
            d.type = t
            d.signature = tokenizeDeclaration(d)
            d.title = createTitle(d)
          }
        }
      }
    }

    if (Object.hasOwn(doc, "examples")) {
      d.examples = await parseExamples(doc.examples)
    }

    this._cache.index(d.id, this._i)
    this._i += 1
    this.push(d)
    ms.forEach((d) => {
      this._cache.index(d.id, this._i)
      this._i += 1
      this.push(d)
    })
  }
}

class PostprocessDeclarations extends Transform {
  /**
   * @param {DeclarationsCache} cache
   */
  constructor(cache) {
    super({ objectMode: true })
    this._cache = cache
  }

  _transform(ch, _, cb) {
    /** @type {Declaration} */
    const d = ch.value

    const dc = this._cache.retrieve(d.id)
    if (dc !== undefined) {
      if (Object.hasOwn(dc, "instanceMethods")) {
        // todo: resolve ignoring.
        // @ts-ignore
        d.instanceMethods = dc.instanceMethods.map((id) => {
          /** @type {ReferenceType} */
          const t = {
            type: "reference",
            id,
            identifier: ""
          }
          return t
        })
      }
      if (Object.hasOwn(dc, "methods")) {
        // todo: resolve ignoring.
        // @ts-ignore
        d.methods = dc.methods.map((id) => {
          /** @type {ReferenceType} */
          const t = {
            type: "reference",
            id,
            identifier: ""
          }
          return t
        })
      }
      if (Object.hasOwn(dc, "events")) {
        // todo: resolve ignoring.
        // @ts-ignore
        d.events = dc.events.map((id) => {
          /** @type {ReferenceType} */
          const t = {
            type: "reference",
            id,
            identifier: ""
          }
          return t
        })
      }
      if (Object.hasOwn(dc, "extends")) {
        // todo: resolve ignoring.
        // @ts-ignore
        d.extends = dc.extends.map((id) => {
          /** @type {ReferenceType} */
          const t = {
            type: "reference",
            id,
            identifier: ""
          }
          return t
        })
      }
      if (Object.hasOwn(dc, "implements")) {
        // todo: resolve ignoring.
        // @ts-ignore
        d.implements = dc.implements.map((id) => {
          /** @type {ReferenceType} */
          const t = {
            type: "reference",
            id,
            identifier: ""
          }
          return t
        })
      }
    }

    this.push(d)
    cb(null)
  }
}

class PostPostprocessDeclarations extends Transform {
  /**
   * @param {DeclarationsCache} cache
   */
  constructor(cache) {
    super({ objectMode: true })
    this._cache = cache
  }

  _transform(ch, _, cb) {
    this._asyncTransform(ch).then(() => {
      cb(null)
    })
  }

  async _asyncTransform(ch, _, cb) {
    /** @type {Declaration} */
    const d = ch.value

    // todo: remove the postfixes.

    // const heroSection = {
    //   title: d.title,
    //   signature: d.signature
    // }
    // /** @type {any} */
    // const descriptionSection = {
    //   type: "description",
    //   description: d.description
    // }
    /** @type {any} */
    const parametersSection = {
      type: "parameters",
      items: []
    }
    /** @type {any} */
    const returnsSection = {
      type: "returns",
    }
    /** @type {any} */
    const examplesSection = {
      type: "examples",
      items: []
    }
    /** @type {any} */
    const topicsSection = {
      type: "topics",
      items: []
    }
    /** @type {any} */
    const relationshipSection = {
      type: "relationship",
      items: []
    }
    /** @type {any} */
    const seeAlsoSection = {
      type: "seeAlso",
      items: []
    }

    let p
    let items

    switch (d.kind) {
    case "class":
      if (d.examples !== undefined) {
        examplesSection.items = d.examples
      }
      if (d.constructors !== undefined) {
        topicsSection.items.push({
          title: "Constructors",
          items: d.constructors
        })
      }
      if (d.instanceProperties !== undefined) {
        topicsSection.items.push({
          title: "Instance Properties",
          items: d.instanceProperties
        })
      }
      if (d.instanceMethods !== undefined) {
        topicsSection.items.push({
          title: "Instance Methods",
          items: d.instanceMethods
        })
      }
      if (d.typeMethods !== undefined) {
        topicsSection.items.push({
          title: "Type Methods",
          items: d.typeMethods
        })
      }
      if (d.typeProperties !== undefined) {
        topicsSection.items.push({
          title: "Type Properties",
          items: d.typeProperties
        })
      }
      if (d.events !== undefined) {
        topicsSection.items.push({
          title: "Events",
          items: d.events
        })
      }
      if (d.extends !== undefined) {
        relationshipSection.items.push({
          title: "Extends",
          items: d.extends
        })
      }
      if (d.implements !== undefined) {
        relationshipSection.items.push({
          title: "Implements",
          items: d.implements
        })
      }
      break
    case "constructor":
      if (d.examples !== undefined) {
        examplesSection.items = d.examples
      }
      if (d.type.parameters !== undefined) {
        parametersSection.items = d.type.parameters.map((v) => {
          const o = {
            name: v.name,
            signature: tokenizeType(v.type)
          }
          if (v.description !== undefined) {
            o.description = v.description
          }
          if (v.default !== undefined) {
            o.default = v.default
          }
          return o
        })
      }
      if (d.parent !== undefined) {
        // @ts-ignore
        p = await this._cache._onRetrieve(d.parent.id)
        if (p !== undefined && p.kind === "class") {
          items = p.constructors.filter((c) => d.id !== c.id)
          if (items.length > 0) {
            seeAlsoSection.items = items
          }
        }
      }
      break
    case "instanceMethod":
      if (d.examples !== undefined) {
        examplesSection.items = d.examples
      }
      if (d.type.parameters !== undefined) {
        parametersSection.items = d.type.parameters.map((v) => {
          const o = {
            name: v.name,
            signature: tokenizeType(v.type)
          }
          if (v.description !== undefined) {
            o.description = v.description
          }
          if (v.default !== undefined) {
            o.default = v.default
          }
          return o
        })
      }
      if (d.type.returns !== undefined) {
        returnsSection.signature = tokenizeType(d.type.returns.type)
        if (d.type.returns.description !== undefined) {
          returnsSection.description = d.type.returns.description
        }
      }
      if (d.parent !== undefined) {
        // @ts-ignore
        p = await this._cache._onRetrieve(d.parent.id)
        if (p !== undefined && p.kind === "class") {
          items = p.instanceMethods.filter((c) => d.id !== c.id)
          if (items.length > 0) {
            seeAlsoSection.items = items
          }
        }
      }
      break
    case "instanceProperty":
      if (d.examples !== undefined) {
        examplesSection.items = d.examples
      }
      if (d.parent !== undefined) {
        // @ts-ignore
        p = await this._cache._onRetrieve(d.parent.id)
        if (p !== undefined && p.kind === "class") {
          items = p.instanceProperties.filter((c) => d.id !== c.id)
          if (items.length > 0) {
            seeAlsoSection.items = items
          }
        }
      }
      break
    case "typeMethod":
      if (d.examples !== undefined) {
        examplesSection.items = d.examples
      }
      if (d.type.parameters !== undefined) {
        parametersSection.items = d.type.parameters.map((v) => {
          const o = {
            name: v.name,
            signature: tokenizeType(v.type)
          }
          if (v.description !== undefined) {
            o.description = v.description
          }
          if (v.default !== undefined) {
            o.default = v.default
          }
          return o
        })
      }
      if (d.type.returns !== undefined) {
        returnsSection.signature = tokenizeType(d.type.returns.type)
        if (d.type.returns.description !== undefined) {
          returnsSection.description = d.type.returns.description
        }
      }
      if (d.parent !== undefined) {
        // @ts-ignore
        p = await this._cache._onRetrieve(d.parent.id)
        if (p !== undefined && p.kind === "class") {
          items = p.typeMethods.filter((c) => d.id !== c.id)
          if (items.length > 0) {
            seeAlsoSection.items = items
          }
        }
      }
      break
    case "typeProperty":
      if (d.examples !== undefined) {
        examplesSection.items = d.examples
      }
      if (d.parent !== undefined) {
        // @ts-ignore
        p = await this._cache._onRetrieve(d.parent.id)
        if (p !== undefined && p.kind === "class") {
          items = p.typeProperties.filter((c) => d.id !== c.id)
          if (items.length > 0) {
            seeAlsoSection.items = items
          }
        }
      }
      break
    case "event":
      if (d.examples !== undefined) {
        examplesSection.items = d.examples
      }
      if (d.type.parameters !== undefined) {
        parametersSection.items = d.type.parameters.map((v) => {
          const o = {
            name: v.name,
            signature: tokenizeType(v.type)
          }
          if (v.description !== undefined) {
            o.description = v.description
          }
          if (v.default !== undefined) {
            o.default = v.default
          }
          return o
        })
      }
      if (d.parent !== undefined) {
        // @ts-ignore
        p = await this._cache._onRetrieve(d.parent.id)
        if (p !== undefined && p.kind === "class") {
          items = p.events.filter((c) => d.id !== c.id)
          if (items.length > 0) {
            seeAlsoSection.items = items
          }
        }
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
        examplesSection.items = d.examples
      }
      break
    default:
      // todo: throw new Error(`Unknown kind: ${d.kind}`)
    }

    const sections = []
    // if (descriptionSection.description !== undefined) {
    //   sections.push(descriptionSection)
    // }
    if (parametersSection.items.length > 0) {
      sections.push(parametersSection)
    }
    if (returnsSection.description !== undefined || returnsSection.signature !== undefined) {
      sections.push(returnsSection)
    }
    if (examplesSection.items.length > 0) {
      sections.push(examplesSection)
    }
    if (topicsSection.items.length > 0) {
      sections.push(topicsSection)
    }
    if (relationshipSection.items.length > 0) {
      sections.push(relationshipSection)
    }
    if (seeAlsoSection.items.length > 0) {
      sections.push(seeAlsoSection)
    }
    if (sections.length > 0) {
      // @ts-ignore
      d.sections = sections
    }

    this.push(d)
  }
}

/**
 * @param {Doclet} doc
 * @returns {DeclarationMeta}
 */
function parseMeta(doc) {
  /** @type {DeclarationMeta} */
  const m = {
    package: "main"
  }

  if (doc.meta !== undefined) {
    if (doc.meta.file !== undefined) {
      m.package = doc.meta.file
    }
  }

  return m
}

/**
 * @param {Doclet} doc
 * @param {DeclarationMeta} meta
 * @returns {Declaration}
 */
function parseDeclaration(doc, meta) {
  /** @type {Declaration} */
  const d = {
    id: "",
    meta,
    identifier: "",
    title: "",
    kind: "type",
    type: {
      type: "unknown"
    },
    signature: []
  }

  if (doc.name !== undefined) {
    d.identifier = doc.name
    d.title = doc.name
  }

  if (Object.hasOwn(doc, "summary") && Object.hasOwn(doc, "description")) {
    d.summary = doc.summary
    d.description = doc.description
  } else if (Object.hasOwn(doc, "summary")) {
    d.summary = doc.summary
  } else if (Object.hasOwn(doc, "description")) {
    d.summary = parseFirstSentence(doc.description)
    d.description = doc.description
  }

  let ln = d.identifier
  if (Object.hasOwn(doc, "memberof")) {
    if (doc.memberof !== "<anonymous>") {
      const mo = doc.memberof.replace("<anonymous>~", "")
      ln = `${mo}#${ln}`
      d.parent = {
        id: createID(d.meta.package, mo),
        identifier: mo
      }
    }
  }
  d.id = createID(d.meta.package, ln)

  return d
}

// /**
//  * @param {Doclet} doc
//  * @param {Declaration} d
//  * @returns {ClassDeclaration}
//  */
// function createClass(doc, d) {
//   /** @type {ClassDeclaration} */
//   const c = {
//     id: d.id,
//     meta: d.meta,
//     identifier: d.identifier,
//     title: "",
//     kind: "class",
//     signature: []
//   }

//   if (Object.hasOwn(doc, "properties")) {
//     c.instanceProperties = doc.properties.map((dp) => {
//       return createInstanceProperty(p, d)
//     })
//     doc.properties.forEach((p) => {
//       /** @type {InstancePropertyDeclaration} */
//       const pr = createInstanceProperty(p, d)

//       ms.push(pr)
//       cl.instanceProperties = [{
//         type: "reference",
//         id: pr.id,
//         identifier: p.name
//       }]
//     })
//   }

//   return c
// }

/**
 * @param {DocletParam} doc
 * @param {Declaration} d
 * @returns {InstancePropertyDeclaration}
 */
function createInstanceProperty(doc, d) {
  const v = praseValue(d, doc)

  /** @type {InstancePropertyDeclaration} */
  const p = {
    id: createID(d.meta.package, `${d.identifier}#${doc.name}`),
    meta: {
      package: d.meta.package
    },
    identifier: v.name,
    title: v.name,
    kind: "instanceProperty",
    parent: {
      id: d.id,
      identifier: d.identifier
    },
    type: v.type,
    signature: []
  }

  if (Object.hasOwn(v, "description")) {
    p.summary = parseFirstSentence(v.description)
    p.description = v.description
  }

  p.title = createTitle(p)
  p.signature = tokenizeDeclaration(p)

  return p
}

/**
 * @param {Doclet} doc
 * @param {Declaration} d
 * @returns {ConstructorDeclaration}
 */
function createConstructor(doc, d) {
  let identifier = "constructor"

  /** @type {ConstructorDeclaration} */
  const c = {
    id: createID(d.meta.package, `${d.identifier}#${identifier}`),
    meta: {
      package: d.meta.package
    },
    identifier,
    title: identifier,
    parent: {
      id: d.id,
      identifier: d.identifier
    },
    kind: "constructor",
    type: {
      type: "function"
    },
    signature: []
  }

  if (Object.hasOwn(doc, "params")) {
    c.type.parameters = doc.params.map((p) => {
      return praseValue(d, p)
    })
  }

  c.signature = tokenizeDeclaration(c)

  return c
}

/**
 * @param {Doclet} doc
 * @param {Declaration} d
 * @returns
 */
function createEvent(doc, d) {
  /** @type {EventDeclaration} */
  const e = {
    ...d,
    kind: "event",
    type: {
      type: "function"
    }
  }

  if (Object.hasOwn(doc, "params")) {
    e.type.parameters = doc.params.map((p) => {
      return praseValue(e, p)
    })
  }

  e.signature = tokenizeDeclaration(e)
  e.title = createTitle(e)

  return e
}

/**
 * @param {Doclet} doc
 * @param {Declaration} d
 * @returns {TypeDeclaration}
 */
function createFunction(doc, d) {
  /** @type {FunctionType} */
  const t = {
    type: "function"
  }

  /** @type {TypeDeclaration} */
  const f = {
    ...d,
    kind: "type",
    type: t
  }

  if (Object.hasOwn(doc, "params")) {
    t.parameters = doc.params.map((p) => {
      return praseValue(d, p)
    })
  }

  if (Object.hasOwn(doc, "returns")) {
    // There is no way that the `returns` contains more than one element.
    // todo: overloading returns many items.
    if (doc.returns.length === 1) {
      const v = praseValue(d, doc.returns[0])
      t.returns = {
        type: v.type
      }
      if (v.description !== undefined) {
        t.returns.description = v.description
      }
    }
  }

  return f
}

/**
 * @param {Doclet} doc
 * @param {Declaration} d
 * @returns {PropertyDeclaration}
 */
function createProperty(doc, d) {
  const v = praseValue(d, doc)

  /** @type {PropertyDeclaration} */
  const pr = {
    id: createID(d.meta.package, `${d.identifier}#${doc.name}`),
    meta: {
      package: d.meta.package
    },
    identifier: v.name,
    title: v.name,
    kind: "property",
    parent: {
      id: d.id,
      identifier: d.identifier
    },
    type: v.type,
    signature: []
  }

  if (Object.hasOwn(v, "description")) {
    pr.summary = parseFirstSentence(v.description)
    pr.description = v.description
  }

  return pr
}

/**
 * @param {Declaration} d
 * @param {DocletParam} p
 * @returns {DeclarationValue}
 */
function praseValue(d, p) {
  /** @type {DeclarationValue} */
  const v = {
    name: "",
    type: {
      type: "unknown"
    }
  }
  if (Object.hasOwn(p, "name")) {
    v.name = p.name
  }
  if (Object.hasOwn(p, "description")) {
    v.description = p.description
  }
  if (Object.hasOwn(p, "type") && Object.hasOwn(p.type, "parsedType")) {
    v.type = parseType(d, p.type.parsedType)
  }
  if (Object.hasOwn(p, "defaultvalue")) {
    // todo: resolve ignoring.
    // @ts-ignore
    v.default = p.defaultvalue
  }
  return v
}

/**
 * @param {Declaration} d
 * @param {DocletCatharsis} ca
 * @returns {DeclarationType}
 */
function parseType(d, ca) {
  /** @type {DeclarationType} */
  let t = {
    type: "unknown"
  }
  if (Object.hasOwn(ca, "type")) {
    switch (ca.type) {
      // case "AllLiteral":
      // case "FieldType":
      // case "FunctionType":
      case "NameExpression":
        if (!Object.hasOwn(ca, "name")) {
          break
        }
        // todo: should we parse primitives with objects or just one of them?
        switch (ca.name) {
          case "array":
          case "Array":
            t = {
              type: "array",
              children: []
            }
            break
          case "boolean":
          case "Boolean":
            t = {
              type: "primitive",
              name: "boolean"
            }
            break
          case "number":
          case "Number":
            t = {
              type: "primitive",
              name: "number"
            }
            break
          case "object":
          case "Object":
            // todo: object of what?
            t = {
              type: "object"
            }
            break
          case "string":
          case "String":
            t = {
              type: "primitive",
              name: "string"
            }
            break
          default:
            if (isNumberLiteral(ca.name)) {
              // todo: what if `Number(ca.name)` is `NaN`?
              t = {
                type: "literal",
                value: Number(ca.name)
              }
              break
            }
            if (isStringLiteral(ca.name)) {
              t = {
                type: "literal",
                value: ca.name.slice(1, -1)
              }
              break
            }
            t = {
              type: "reference",
              id: createID(d.meta.package, ca.name),
              // @ts-ignore
              identifier: ca.name
            }
            break
        }
        break
      case "NullLiteral":
        t = {
          type: "literal",
          value: null
        }
        break
      // case "RecordType":
      case "TypeApplication":
        if (!Object.hasOwn(ca, "expression")) {
          break
        }
        // todo: should we be checking this more strictly? (see ts-ignore below)
        t = parseType(d, ca.expression)
        if (Object.hasOwn(ca, "applications")) {
          if (t.type === "object") {
            // @ts-ignore
            t.type = "record"
          }
          // @ts-ignore
          t.children = ca.applications.map((a) => {
            return parseType(d, a)
          })
          break
        }
        // @ts-ignore
        t.children = [{
          type: "unknown"
        }]
        break
      case "TypeUnion":
        if (!Object.hasOwn(ca, "elements")) {
          break
        }
        t = {
          type: "union",
          children: ca.elements.map((e) => {
            return parseType(d, e)
          })
        }
        break
      case "UndefinedLiteral":
        t = {
          type: "literal",
          value: undefined
        }
        break
      case "UnknownLiteral":
        t = {
          type: "unknown"
        }
        break
      default:
        // todo: should we throw an error here?
        // throw new Error(`Unknown type: ${ca.type}`)
        break
    }
  }
  // todo: separate them, they mean different things.
  if (Object.hasOwn(ca, "optional") || Object.hasOwn(ca, "nullable")) {
    t = {
      type: "optional",
      children: [t]
    }
  }
  return t
}

/**
 * @param {string[]} es
 * @returns {Promise<string[]>}
 */
function parseExamples(es) {
  return Promise.all(es.map(async (e) => {
    const [r] = await eslint.lintText(e)
    if (r.output !== undefined) {
      e = r.output
    }
    return e
  }))
}

/**
 * @param {Declaration} d
 * @returns {string}
 */
function createTitle(d) {
  return d.identifier
  // let t = ""
  // switch (d.kind) {
  // // case "alias":
  // case "class":
  //   t = d.identifier
  //   break
  // case "constructor":
  // case "event":
  //   t = createFunctionTitle(d)
  //   break
  // // case "initializer":
  // case "instanceMethod":
  //   t = createFunctionTitle(d)
  //   break
  // case "instanceProperty":
  //   t = d.identifier
  //   break
  // case "method":
  //   // t = createFunctionTitle(d)
  //   break
  // case "object":
  //   t = d.identifier
  //   break
  // case "property":
  //   t = d.identifier
  //   break
  // // case "staticMethod":
  // // case "staticProperty":
  // case "type":
  //   t = d.identifier
  //   break
  // }
  // return t
}

// /**
//  * @param {ConstructorDeclaration | EventDeclaration | InstanceMethodDeclaration} d
//  * @returns {string}
//  */
// function createFunctionTitle(d) {
//   let t = `${d.identifier}(`
//   if (d.type.parameters !== undefined) {
//     t += d.type.parameters
//       .map((p) => {
//         return p.name
//       })
//       .join(", ")
//   }
//   t += ")"
//   return t
// }

/**
 * @param {string} s
 * @returns {string}
 */
function parseFirstSentence(s) {
  const r = split(s, {
    AbbrMarker: {
      language: English
    }
  })
  if (r.length === 0) {
    return s
  }
  return r[0].raw
}

/**
 * @param {string} a
 * @param {string} b
 * @returns {string}
 */
function createID(a, b) {
  return `${a};${b}`
}

/**
 * @param {string} s
 * @returns {boolean}
 */
function isNumberLiteral(s) {
  return !isNaN(parseFloat(s))
}

/**
 * @param {string} s
 * @returns {boolean}
 */
function isStringLiteral(s) {
  return s.startsWith('"') && s.endsWith('"') ||
    s.startsWith("'") && s.endsWith("'")
}

/**
 * @typedef {Object} CacheDeclaration
 * @property {string[]=} instanceMethods
 * @property {string[]=} methods
 * @property {string[]=} events
 * @property {string[]=} extends
 * @property {string[]=} implements
 */

class DeclarationsCache {
  constructor() {
    /** @type {Record<string, CacheDeclaration>} */
    this.m = {}
  }

  /**
   * @param {string} id
   * @returns {void}
   */
  setup(id) {
    this.m[id] = {}
  }

  /**
   * @param {string} id
   * @param {keyof Omit<CacheDeclaration, "index">} k
   * @param {string} v
   * @returns {void}
   */
  populate(id, k, v) {
    if (!Object.hasOwn(this.m, id)) {
      this.setup(id)
    }
    if (!Object.hasOwn(this.m[id], k)) {
      this.m[id][k] = []
    }
    if (this.m[id][k].includes(v)) {
      return
    }
    this.m[id][k].push(v)
  }

  /**
   * @param {string} id
   * @param {number} i
   * @returns {void}
   */
  index(id, i) {
    if (!Object.hasOwn(this.m, id)) {
      this.setup(id)
    }
    // @ts-ignore
    this.m[id].index = i
  }

  /**
   * @param {string} id
   * @returns {CacheDeclaration=}
   */
  retrieve(id) {
    return this.m[id]
  }

  /**
   * @returns {void}
   */
  clear() {
    this.m = {}
  }
}

export {
  DeclarationsCache,
  PostprocessDeclarations,
  PostPostprocessDeclarations,
  PreprocessDeclarations
}
