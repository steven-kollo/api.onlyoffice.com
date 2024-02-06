// @ts-check

/**
 * @typedef {import("../index.js").TypeDeclaration} TypeDeclaration
 * @typedef {import("../index.js").ArrayType} ArrayType
 * @typedef {import("../index.js").ClassDeclaration} ClassDeclaration
 * @typedef {import("../index.js").ConstructorDeclaration} ConstructorDeclaration
 * @typedef {import("../index.js").ReferenceType} ReferenceType
 * @typedef {import("../index.js").Declaration} Declaration
 * @typedef {import("../index.js").DeclarationType} DeclarationType
 * @typedef {import("../index.js").DeclarationValue} DeclarationValue
 * @typedef {import("../index.js").EventDeclaration} EventDeclaration
 * @typedef {import("../index.js").FunctionType} FunctionType
 * @typedef {import("../index.js").InstanceMethodDeclaration} InstanceMethodDeclaration
 * @typedef {import("../index.js").InstancePropertyDeclaration} InstancePropertyDeclaration
 * @typedef {import("../index.js").MethodDeclaration} MethodDeclaration
 * @typedef {import("../index.js").OptionalType} OptionalType
 * @typedef {import("../index.js").PropertyDeclaration} PropertyDeclaration
 * @typedef {import("../index.js").RecordType} RecordType
 * @typedef {import("../index.js").UnionType} UnionType
 */

// DecoratorToken
// IdentifierToken
// KeywordToken
// ReferenceToken
// TextToken

// decorator
// identifier
// keyword
// reference
// text

/**
 * @typedef {Object} DeclarationToken
 * @property {string} type
 * @property {string=} id
 * @property {string} text
 */

/**
 * @param {Declaration} d
 * @returns {DeclarationToken[]}
 */
function tokenizeDeclaration(d) {
  let tk = []
  switch (d.kind) {
  // case "alias":
  //   break
  case "class":
    tk = tokenizeClass(d)
    break
  case "constructor":
    tk = tokenizeConstructor(d)
    break
  case "event":
    tk = tokenizeEvent(d)
    break
  // case "initializer":
  //   break
  case "instanceMethod":
    tk = tokenizeMethod(d)
    break
  case "instanceProperty":
    tk = tokenizeProperty(d)
    break
  case "method":
    tk = tokenizeMethod(d)
    break
  case "object":
    break
  case "property":
    tk = tokenizeProperty(d)
    break
  // case "staticMethod":
  //   break
  // case "staticProperty":
  //   break
  case "type":
    tk = tokenizeTypeDeclaration(d)
    break
  default:
    // todo: log an warning
    break
  }
  return tk
}

/**
 * @param {ClassDeclaration} d
 * @returns {DeclarationToken[]}
 */
function tokenizeClass(d) {
  const tk = [
    {
      type: "keyword",
      text: "class"
    },
    {
      type: "text",
      text: " "
    },
    {
      type: "identifier",
      text: d.identifier
    }
  ]
  if (d.extends !== undefined) {
    tk.push(
      {
        type: "text",
        text: " "
      },
      {
        type: "keyword",
        text: "extends"
      },
      {
        type: "text",
        text: " "
      },
    )
    d.extends.forEach((e) => {
      tk.push(
        ...tokenizeReference(e),
        {
          type: "text",
          text: ", "
        }
      )
    })
    tk.pop()
  }
  return tk
}

/**
 * @param {ConstructorDeclaration} d
 * @returns {DeclarationToken[]}
 */
function tokenizeConstructor(d) {
  return [
    {
      type: "text",
      text: "constructor"
    },
    ...tokenizeParameters(d.type)
  ]
}

/**
 * @param {EventDeclaration} d
 * @returns {DeclarationToken[]}
 */
function tokenizeEvent(d) {
  return [
    {
      type: "decoration",
      text: "(event)"
    },
    {
      type: "text",
      text: " "
    },
    {
      type: "identifier",
      text: d.identifier
    },
    ...tokenizeParameters(d.type),
    ...tokenizerReturns(d.type)
  ]
}

// /**
//  * @param {TypeDeclaration} d
//  * @returns {DeclarationToken[]}
//  */
// function tokenizeFunction(d) {
//   return [
//     {
//       type: "text",
//       text: "function"
//     },
//     {
//       type: "text",
//       text: " "
//     },
//     {
//       type: "identifier",
//       text: d.identifier
//     },
//     ...tokenizeParameters(d.type),
//     ...tokenizerReturns(d.type)
//   ]
// }

/**
 * @param {InstanceMethodDeclaration | MethodDeclaration} d
 * @returns {DeclarationToken[]}
 */
function tokenizeMethod(d) {
  return [
    {
      type: "decoration",
      text: "(method)"
    },
    {
      type: "text",
      text: " "
    },
    {
      type: "identifier",
      text: d.identifier
    },
    ...tokenizeParameters(d.type),
    ...tokenizerReturns(d.type)
  ]
}

/**
 * @param {InstancePropertyDeclaration | PropertyDeclaration} d
 * @returns {DeclarationToken[]}
 */
function tokenizeProperty(d) {
  return [
    {
      type: "decoration",
      text: "(property)"
    },
    {
      type: "text",
      text: " "
    },
    {
      type: "identifier",
      text: d.identifier
    },
    {
      type: "text",
      text: ": "
    },
    {
      type: "text",
      text: d.type.type
    }
  ]
}

/**
 * @param {TypeDeclaration} d
 * @returns {DeclarationToken[]}
 */
function tokenizeTypeDeclaration(d) {
  return [
    {
      type: "decoration",
      text: `(${d.type.type})`
    },
    {
      type: "text",
      text: " "
    },
    ...tokenizeType(d.type)
  ]
}

/**
 * @param {DeclarationValue} v
 * @returns {DeclarationToken[]}
 */
function tokenizeValue(v) {
  const tk = [
    {
      type: "text",
      text: v.name
    },
    {
      type: "text",
      text: ": "
    },
    ...tokenizeType(v.type)
  ]
  return tk
}

/**
 *
 * @param {DeclarationType} t
 * @returns {DeclarationToken[]}
 */
function tokenizeType(t) {
  let tk = []
  switch (t.type) {
  case "array":
    tk = tokenizeArray(t)
    break
  case "function":
    // tk = tokenizeFunction(t)
    break
  case "literal":
    tk = [
      {
        type: "text",
        text: String(t.value)
      }
    ]
    break
  case "object":
    break
  case "optional":
    tk = tokenizeOptional(t)
    break
  case "primitive":
    tk = [
      {
        type: "text",
        text: t.name
      }
    ]
    break
  // case "readonly":
  //   break
  case "record":
    tk = tokenizeRecord(t)
    break
  case "reference":
    tk = tokenizeReference(t)
    break
  // case "setonly":
  //   break
  case "union":
    tk = tokenizeUnion(t)
    break
  case "unknown":
    tk = [
      {
        type: "text",
        text: "unknown"
      }
    ]
    break
  default:
    // todo: log
    break
  }
  return tk
}

/**
 * @param {ArrayType} t
 * @returns {DeclarationToken[]}
 */
function tokenizeArray(t) {
  const tk = []
  t.children.forEach((t) => {
    tk.push(
      ...tokenizeType(t),
      {
        type: "text",
        text: ", "
      }
    )
  })
  tk.pop()
  tk.push(
    {
      type: "text",
      text: "[]"
    }
  )
  return tk
}

/**
 * @param {ReferenceType} t
 * @returns {DeclarationToken[]}
 */
function tokenizeReference(t) {
  return [
    {
      type: "reference",
      id: t.id,
      text: t.identifier
    }
  ]
}

/**
 * @param {FunctionType} t
 * @returns {DeclarationToken[]}
 */
function tokenizeParameters(t) {
  const tk = [
    {
      type: "text",
      text: "("
    }
  ]
  if (t.parameters !== undefined) {
    t.parameters.forEach((p) => {
      tk.push(
        ...tokenizeValue(p),
        {
          type: "text",
          text: ", "
        }
      )
    })
    tk.pop()
  }
  tk.push(
    {
      type: "text",
      text: ")"
    }
  )
  return tk
}

/**
 * @param {FunctionType} t
 * @returns {DeclarationToken[]}
 */
function tokenizerReturns(t) {
  const tk = []
  if (t.returns !== undefined) {
    tk.push(
      {
        type: "text",
        text: ": "
      },
      ...tokenizeType(t.returns.type)
    )
  }
  return tk
}

/**
 * @param {OptionalType} t
 * @returns {DeclarationToken[]}
 */
function tokenizeOptional(t) {
  const tk = []
  t.children.forEach((t) => {
    tk.push(
      ...tokenizeType(t),
      {
        type: "text",
        text: ", "
      }
    )
  })
  tk.pop()
  tk.push(
    {
      type: "text",
      text: "?"
    }
  )
  return tk
}

/**
 * @param {RecordType} t
 * @returns {DeclarationToken[]}
 */
function tokenizeRecord(t) {
  const tk = [
    {
      type: "text",
      text: "Record"
    },
    {
      type: "text",
      text: "<"
    }
  ]
  t.children.forEach((t) => {
    tk.push(
      ...tokenizeType(t),
      {
        type: "text",
        text: ", "
      }
    )
  })
  tk.pop()
  tk.push(
    {
      type: "text",
      text: ">"
    }
  )
  return tk
}

/**
 * @param {UnionType} t
 * @returns {DeclarationToken[]}
 */
function tokenizeUnion(t) {
  const tk = []
  t.children.forEach((t) => {
    tk.push(
      ...tokenizeType(t),
      {
        type: "text",
        text: " | "
      }
    )
  })
  tk.pop()
  return tk
}

export { tokenizeDeclaration }
