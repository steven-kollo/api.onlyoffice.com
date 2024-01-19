// @ts-check

/**
 * @typedef {import("../index.js").Declaration} TDeclaration
 * @typedef {import("../index.js").Content} TContent
 * @typedef {import("../index.js").Array} TArray
 * @typedef {import("../index.js").Boolean} TBoolean
 * @typedef {import("../index.js").Byte} TByte
 * @typedef {import("../index.js").Literal} TLiteral
 * @typedef {import("../index.js").Null} TNull
 * @typedef {import("../index.js").Number} TNumber
 * @typedef {import("../index.js").Object} TObject
 * @typedef {import("../index.js").Optional} TOptional
 * @typedef {import("../index.js").Record} TRecord
 * @typedef {import("../index.js").String} TString
 * @typedef {import("../index.js").Undefined} TUndefined
 * @typedef {import("../index.js").Union} TUnion
 * @typedef {import("../index.js").Generic} TGeneric
 * @typedef {import("../index.js").Type} TType
 * @typedef {import("../index.js").Value} TValue
 */

import * as builtin from "./builtin.js"

/**
 * @typedef {any} JSDoc
 */

/**
 * @typedef {(t: TType) => void} TypeCallback
 */

/**
 * @param {JSDoc} v
 * @param {TypeCallback} cb
 * @returns {TDeclaration=}
 */
function parseDeclaration(v, cb) {
  /** @type {TDeclaration} */
  const d = {
    id: "",
    name: ""
  }

  if (Object.hasOwn(v, "name")) {
    d.name = v.name
  }

  if (Object.hasOwn(v, "summary") && Object.hasOwn(v, "description")) {
    d.summary = v.summary
    d.description = {
      syntax: "txt",
      text: v.description
    }
  } else if (Object.hasOwn(v, "summary")) {
    d.summary = v.summary
  } else if (Object.hasOwn(v, "description")) {
    d.summary = v.description.split("\n")[0]
    d.description = {
      syntax: "txt",
      text: v.description
    }
  }

  if (Object.hasOwn(v, "kind")) {
    d.kind = v.kind
  }

  if (Object.hasOwn(v, "memberof")) {
    d.memberof = v.memberof
  }

  if (Object.hasOwn(v, "type")) {
    const t = parseType(v, cb)
    if (t !== undefined) {
      d.type = t
    }
  }

  if (Object.hasOwn(v, "properties")) {
    const p = v.properties.flatMap((p) => {
      const v = parseValue(p, cb)
      if (v === undefined) {
        return []
      }
      return v
    })
    if (p.length > 0) {
      d.properties = p
    }
  }

  if (Object.hasOwn(v, "params")) {
    const p = v.params.flatMap((p) => {
      const v = parseValue(p, cb)
      if (v === undefined) {
        return []
      }
      return v
    })
    if (p.length > 0) {
      d.parameters = p
    }
  }

  if (Object.hasOwn(v, "returns")) {
    const p = v.returns.flatMap((p) => {
      const v = parseValue(p, cb)
      if (v === undefined) {
        return []
      }
      return v
    })
    if (p.length > 0) {
      d.returns = p
    }
  }

  if (Object.hasOwn(v, "examples")) {
    d.examples = v.examples.map((e) => {
      /** @type {TContent} */
      const c = {
        syntax: "js",
        text: e
      }
      return c
    })
  }

  return d
}

/**
 * @param {JSDoc} v
 * @param {TypeCallback} cb
 * @returns {TValue=}
 */
function parseValue(v, cb) {
  // delete uses to keep the order of properties.
  /** @type {TValue} */
  const rv = {
    name: "",
    description: {
      syntax: "txt",
      text: ""
    },
    type: {
      id: ""
    },
    default: ""
  }
  if (Object.hasOwn(v, "name")) {
    rv.name = v.name
  } else {
    return
  }
  if (Object.hasOwn(v, "description")) {
    /** @type {TContent} */
    const c = {
      syntax: "txt",
      text: v.description
    }
    rv.description = c
  } else {
    delete rv.description
  }
  if (Object.hasOwn(v, "type")) {
    const t = parseType(v, cb)
    if (t === undefined) {
      return
    }
    rv.type = t
  }
  if (Object.hasOwn(v, "defaultvalue")) {
    if (typeof v.defaultvalue === "string") {
      rv.default = v.defaultvalue
    } else {
      rv.default = String(v.defaultvalue)
    }
  } else {
    delete rv.default
  }
  return rv
}

/**
 * @param {JSDoc} v
 * @param {TypeCallback} cb
 * @returns {TType=}
 */
function parseType(v, cb) {
  if (!Object.hasOwn(v.type, "names")) {
    return
  }
  /** @type {TType=} */
  let t
  if (v.type.names.length > 1) {
    /** @type {TUnion} */
    const u = {
      id: builtin.Union.id,
      children: v.type.names.map((n) => {
        return parseTypeString(n, cb)
      })
    }
    t = u
  } else {
    const s = parseTypeString(v.type.names[0], cb)
    if (s === undefined) {
      return
    }
    t = s
  }
  if (Object.hasOwn(v, "optional") || Object.hasOwn(v, "nullable")) {
    /** @type {TOptional} */
    const o = {
      id: builtin.Optional.id,
      children: [t]
    }
    t = o
  }
  return t
}

/**
 * @param {string} s
 * @param {TypeCallback} cb
 * @returns {TType}
 */
function parseTypeString(s, cb) {
  // todo: explain, "#,##0_);(#,##0)".
  const u = parseTypeUnit(s, cb)
  if (builtin.isBuiltin(u)) {
    return u
  }
  return parseTypeComposition(s, cb)
}

/**
 * @param {string} s
 * @param {TypeCallback} cb
 * @returns {TType}
 */
function parseTypeComposition(s, cb) {
  /** @type {TType[]} */
  const st = []

  /** @type {TGeneric} */
  const r = { id: "_root", children: [] }
  st.push(r)

  /** @type {TType} */
  let p

  /** @type {TType} */
  let n

  let b = ""

  for (let i = 0; i < s.length; i += 1) {
    let u = s[i]

    switch (u) {
      case ".":
        if (b !== "") {
          p = st[st.length - 1]
          n = parseTypeUnit(b, cb)
          n.children = []
          n = resolveTypeUnit(n)
          p.children.push(n)
          st.push(n)
        }
        u = ""
        break
      case "<":
        u = ""
        break
      case ",":
        if (b !== "") {
          p = st[st.length - 1]
          n = parseTypeUnit(b, cb)
          p.children.push(n)
        }
        u = ""
        break
      case " ":
        u = ""
        break
      case ">":
        p = st.pop()
        if (b !== "") {
          n = parseTypeUnit(b, cb)
          p.children.push(n)
        }
        u = ""
        break
      case "(":
        p = st[st.length - 1]
        n = { id: builtin.Union.id }
        n.children = []
        p.children.push(n)
        st.push(n)
        u = ""
        break
      case "|":
        if (b !== "") {
          p = st[st.length - 1]
          n = parseTypeUnit(b, cb)
          p.children.push(n)
        }
        u = ""
        break
      case ")":
        p = st.pop()
        if (b !== "") {
          n = parseTypeUnit(b, cb)
          p.children.push(n)
        }
        u = ""
        break
      default:
        break
    }

    let j = i + 1
    while (
      s[j] !== undefined &&
      s[j] !== "." &&
      s[j] !== "<" &&
      s[j] !== "," &&
      s[j] !== " " &&
      s[j] !== ">" &&
      s[j] !== "(" &&
      s[j] !== "|" &&
      s[j] !== ")"
    ) {
      u += s[j]
      i += 1
      j += 1
    }

    b = u
  }

  if (b !== "") {
    p = st[st.length - 1]
    n = parseTypeUnit(b, cb)
    p.children.push(n)
    st.push(n)
  }

  return r.children[0]
}

/**
 * @param {string} s
 * @param {TypeCallback} cb
 * @returns {TType}
 */
function parseTypeUnit(s, cb) {
  // todo: should we parse primitives with objects or just one of them?
  if (s === "array" || s === "Array") {
    /** @type {TArray} */
    const t = {
      id: builtin.Array.id
    }
    return t
  }
  if (s === "bool" || s === "boolean" || s === "Boolean") {
    /** @type {TBoolean} */
    const t = {
      id: builtin.Boolean.id
    }
    return t
  }
  if (s === "byte") {
    /** @type {TByte} */
    const t = {
      id: builtin.Byte.id
    }
    return t
  }
  if (s === "null" || s === "Null") {
    /** @type {TNull} */
    const t = {
      id: builtin.Null.id
    }
    return t
  }
  if (s === "number" || s === "Number") {
    /** @type {TNumber} */
    const t = {
      id: builtin.Number.id
    }
    return t
  }
  if (s === "object" || s === "Object") {
    /** @type {TObject} */
    const t = {
      id: builtin.Object.id,
    }
    return t
  }
  if (s === "string" || s === "String") {
    /** @type {TString} */
    const t = {
      id: builtin.String.id
    }
    return t
  }
  if (s === "undefined") {
    /** @type {TUndefined} */
    const t = {
      id: builtin.Undefined.id
    }
    return t
  }
  if (isLiteralNumber(s)) {
    /** @type {TLiteral} */
    const t = {
      id: builtin.Literal.id,
      value: s
    }
    return t
  }
  if (isLiteralString(s)) {
    /** @type {TLiteral} */
    const t = {
      id: builtin.Literal.id,
      value: s.slice(1, -1)
    }
    return t
  }
  /** @type {TType} */
  const t = {
    id: s,
  }
  cb(t)
  return t
}

/**
 * @param {TType} t
 * @returns {TType}
 */
function resolveTypeUnit(t) {
  if (t.id === builtin.Object.id && Object.hasOwn(t, "children")) {
    /** @type {TRecord} */
    const n = {
      id: builtin.Record.id,
      children: []
    }
    return n
  }
  return t
}

/**
 * @param {string} s
 * @returns {boolean}
 */
function isLiteralNumber(s) {
  return !isNaN(parseFloat(s));
}

/**
 * @param {string} s
 * @returns {boolean}
 */
function isLiteralString(s) {
  return s.startsWith('"') && s.endsWith('"') ||
    s.startsWith("'") && s.endsWith("'")
}

export { parseDeclaration }
