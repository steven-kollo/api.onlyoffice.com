// @ts-check

/**
 * @typedef {import("../index.js").Declaration} Declaration
 * @typedef {import("../index.js").DeclarationContent} DeclarationContent
 * @typedef {import("../index.js").DeclarationType} DeclarationType
 * @typedef {import("../index.js").DeclarationValue} DeclarationValue
 */

/**
 * @typedef {any} JSDoc
 */

/**
 * @param {JSDoc} v
 * @returns {Declaration=}
 */
function parseDeclaration(v) {
  /** @type {Declaration} */
  const d = {
    id: "",
    meta: {
      package: "main"
    },
    name: "",
    summary: "",
    description: {
      syntax: "txt",
      text: ""
    },
    memberOf: {
      id: ""
    },
    type: customType("")
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
  } else {
    delete d.summary
    delete d.description
  }

  /** @type {string} */
  let kind = ""

  if (Object.hasOwn(v, "kind")) {
    kind = v.kind
  }

  if (Object.hasOwn(v, "memberof")) {
    d.memberOf = {
      id: v.memberof
    }
  } else {
    delete d.memberOf
  }

  if (Object.hasOwn(v, "type")) {
    const t = parseType(v)
    if (t !== undefined) {
      d.type = t
    }
  }

  if (Object.hasOwn(v, "properties")) {
    const p = v.properties.flatMap((p) => {
      const v = parseValue(p)
      if (v === undefined) {
        return []
      }
      return v
    })
    if (p.length > 0) {
      // @ts-ignore
      d.type.properties = p
    }
  }

  if (Object.hasOwn(v, "params")) {
    const p = v.params.flatMap((p) => {
      const v = parseValue(p)
      if (v === undefined) {
        return []
      }
      return v
    })
    if (p.length > 0) {
      // @ts-ignore
      d.type.parameters = p
    }
  }

  if (Object.hasOwn(v, "returns")) {
    const p = v.returns.flatMap((p) => {
      const v = parseValue(p)
      if (v === undefined) {
        return []
      }
      return v
    })
    if (p.length > 0) {
      // @ts-ignore
      d.type.returns = p
    }
  }

  if (Object.hasOwn(v, "examples")) {
    d.examples = v.examples.map((e) => {
      /** @type {DeclarationContent} */
      const c = {
        syntax: "js",
        text: e
      }
      return c
    })
  }

  switch (kind) {
    case "class":
      d.type.id = "class"
      break
    case "event":
      d.type.id = "event"
      break
    case "function":
      d.type.id = "function"
      break
    default:
      break
  }

  return d
}

/**
 * @param {JSDoc} v
 * @returns {DeclarationValue=}
 */
function parseValue(v) {
  // delete uses to keep the order of properties.
  /** @type {DeclarationValue} */
  const rv = {
    name: "",
    description: {
      syntax: "txt",
      text: ""
    },
    type: customType(""),
    default: ""
  }
  if (Object.hasOwn(v, "name")) {
    rv.name = v.name
  } else {
    return
  }
  if (Object.hasOwn(v, "description")) {
    rv.description = {
      syntax: "txt",
      text: v.description
    }
  } else {
    delete rv.description
  }
  if (Object.hasOwn(v, "type")) {
    const t = parseType(v)
    if (t === undefined) {
      return
    }
    rv.type = t
  }
  if (Object.hasOwn(v, "defaultvalue")) {
    rv.default = v.defaultvalue
  } else {
    delete rv.default
  }
  return rv
}

/**
 * @param {JSDoc} v
 * @returns {DeclarationType=}
 */
function parseType(v) {
  if (!Object.hasOwn(v.type, "parsedType")) {
    return
  }
  let t = parseTypeComposition(v.type.parsedType)
  if (t === undefined) {
    return
  }
  if (Object.hasOwn(v, "optional") || Object.hasOwn(v, "nullable")) {
    t = {
      id: "optional",
      children: [t]
    }
  }
  return t
}

/**
 * @param {JSDoc} v
 * @returns {DeclarationType=}
 */
function parseTypeComposition(v) {
  // https://github.com/hegemonic/catharsis
  /** @type {DeclarationType=} */
  let t
  switch (v.type) {
    // case "AllLiteral":
    //   break
    // case "FieldType":
    //   break
    // case "FunctionType":
    //   break
    case "NameExpression":
      if (!Object.hasOwn(v, "name")) {
        return
      }
      t = parseTypeUnit(v.name)
      break
    case "NullLiteral":
      t = parseTypeUnit("null")
      break
    // case "RecordType":
    //   break
    case "TypeApplication":
      if (!Object.hasOwn(v, "expression")) {
        return
      }
      t = parseTypeComposition(v.expression)
      if (t === undefined) {
        return
      }
      if (Object.hasOwn(v, "applications")) {
        // @ts-ignore
        t = {
          id: t.id,
          children: v.applications.map(parseTypeComposition)
        }
        if (t.id === "object") {
          // @ts-ignore
          t.id = "record"
        }
      }
      break
    case "TypeUnion":
      if (!Object.hasOwn(v, "elements")) {
        return
      }
      t = {
        id: "union",
        children: v.elements.map(parseTypeComposition)
      }
      break
    case "UndefinedLiteral":
      t = parseTypeUnit("undefined")
      break
    // case "UnknownLiteral":
    //   break
    default:
      break
  }
  return t
}

/**
 * @param {string} s
 * @returns {DeclarationType}
 */
function parseTypeUnit(s) {
  // todo: should we parse primitives with objects or just one of them?
  let t = customType(s)
  switch (s) {
    case "array":
    case "Array":
      t.id = "array"
      break
    case "bool":
    case "boolean":
    case "Boolean":
    case "byte":
    case "null":
    case "Null":
    case "number":
    case "Number":
      t.id = "literal"
      // @ts-ignore
      t.value = s
      break
    case "object":
    case "Object":
      t.id = "object"
      break
    case "string":
    case "String":
    case "undefined":
      t.id = "literal"
      // @ts-ignore
      t.value = s
      break
    default:
      if (isNumberLiteral(s) || isStringLiteral(s)) {
        t.id = "literal"
        // @ts-ignore
        t.value = s
        break
      }
      break
  }
  return t
}

/**
 * @param {string} s
 * @returns {boolean}
 */
function isNumberLiteral(s) {
  return !isNaN(parseFloat(s));
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
 * @param {string} id
 * @param {any} other
 * @returns {DeclarationType}
 */
function customType(id, other = {}) {
  // https://github.com/microsoft/TypeScript/issues/29729
  const t = {
    id: id,
    ...other
  }
  // @ts-ignore
  return t
}

// function retrieveCustomType() {}
// function retrieveBuiltinType() {}

export { parseDeclaration }
