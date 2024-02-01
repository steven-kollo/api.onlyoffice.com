// @ts-check

/**
 * @typedef {import("@onlyoffice/documentation-declarations").ArrayType} ArrayType
 * @typedef {import("@onlyoffice/documentation-declarations").ClassDeclaration} ClassDeclaration
 * @typedef {import("@onlyoffice/documentation-declarations").ConstructorDeclaration} ConstructorDeclaration
 * @typedef {import("@onlyoffice/documentation-declarations").CustomType} CustomType
 * @typedef {import("@onlyoffice/documentation-declarations").Declaration} Declaration
 * @typedef {import("@onlyoffice/documentation-declarations").DeclarationType} DeclarationType
 * @typedef {import("@onlyoffice/documentation-declarations").DeclarationValue} DeclarationValue
 * @typedef {import("@onlyoffice/documentation-declarations").EventDeclaration} EventDeclaration
 * @typedef {import("@onlyoffice/documentation-declarations").FunctionDeclaration} FunctionDeclaration
 * @typedef {import("@onlyoffice/documentation-declarations").FunctionType} FunctionType
 * @typedef {import("@onlyoffice/documentation-declarations").InstanceMethodDeclaration} InstanceMethodDeclaration
 * @typedef {import("@onlyoffice/documentation-declarations").InstancePropertyDeclaration} InstancePropertyDeclaration
 * @typedef {import("@onlyoffice/documentation-declarations").MethodDeclaration} MethodDeclaration
 * @typedef {import("@onlyoffice/documentation-declarations").OptionalType} OptionalType
 * @typedef {import("@onlyoffice/documentation-declarations").PropertyDeclaration} PropertyDeclaration
 * @typedef {import("@onlyoffice/documentation-declarations").RecordType} RecordType
 * @typedef {import("@onlyoffice/documentation-declarations").StaticMethodDeclaration} StaticMethodDeclaration
 * @typedef {import("@onlyoffice/documentation-declarations").StaticPropertyDeclaration} StaticPropertyDeclaration
 * @typedef {import("@onlyoffice/documentation-declarations").TypeDeclaration} TypeDeclaration
 * @typedef {import("@onlyoffice/documentation-declarations").UnionType} UnionType
 */

/**
 * // todo: move to the declarations package.
 * @typedef {(id: string) => Declaration | undefined} RetrieveDeclaration
 */

/**
 * @typedef {Object} Parameters
 * @property {Declaration} declaration
 * @property {RetrieveDeclaration} retrieve
 */

/**
 * @typedef {Object} Returns
 * @property {string} signature
 */

/**
 * @this {Parameters & Returns}
 */
function setup() {
  this.webc.attributes.signature = DeclarationSignature(this.declaration, this.retrieve)
}

/**
 * @param {Declaration} d
 * @param {RetrieveDeclaration} r
 */
function DeclarationSignature(d, r) {
  let s = ""
  // todo: merge type with function, object, union and unknown
  // in the declarations package
  switch (d.kind) {
    case "class":
      s += ClassSignature(d)
      break
    case "constructor":
      s += ConstructorSignature(d, r)
      break
    case "event":
      s += EventSignature(d, r)
      break
    case "function":
      s += FunctionSignature(d, r)
      break
    case "instanceMethod":
      s += InstanceMethodSignature(d, r)
      break
    case "instanceProperty":
      s += InstancePropertySignature(d, r)
      break
    case "method":
      s += InstanceMethodSignature(d, r)
      break
    case "object":
      throw new Error("todo")
      break
    case "property":
      s += InstancePropertySignature(d, r)
      break
    case "staticMethod":
      s += StaticMethodSignature(d, r)
      break
    case "staticProperty":
      s += StaticPropertySignature(d, r)
      break
    case "type":
      s += TypeDeclarationSignature(d, r)
      break
    case "union":
      // @ts-ignore
      s += TypeDeclarationSignature(d, r)
      break
    case "unknown":
      throw new Error("todo")
      break
  }
  return s
}

/**
 * @param {ClassDeclaration} d
 * @returns {string}
 */
function ClassSignature(d) {
  return `class ${d.name}`
}

/**
 * @param {ConstructorDeclaration} d
 * @param {RetrieveDeclaration} r
 * @returns {string}
 */
function ConstructorSignature(d, r) {
  let s = "constructor"
  s += ParametersSignature(d.type, r)
  return s
}

/**
 * @param {EventDeclaration} d
 * @param {RetrieveDeclaration} r
 * @returns {string}
 */
function EventSignature(d, r) {
  let s = `(event) ${d.name}`
  s += ParametersSignature(d.type, r)
  s += ReturnsSignature(d.type, r)
  return s
}

/**
 * @param {InstanceMethodDeclaration | MethodDeclaration} d
 * @param {RetrieveDeclaration} r
 * @returns {string}
 */
function InstanceMethodSignature(d, r) {
  let s = `(method) ${d.name}`
  s += ParametersSignature(d.type, r)
  s += ReturnsSignature(d.type, r)
  return s
}

/**
 * @param {StaticMethodDeclaration} d
 * @param {RetrieveDeclaration} r
 * @returns {string}
 */
function StaticMethodSignature(d, r) {
  let s = `(method) static ${d.name}`
  s += ParametersSignature(d.type, r)
  s += ReturnsSignature(d.type, r)
  return s
}

/**
 * @param {FunctionDeclaration} d
 * @param {RetrieveDeclaration} r
 * @returns {string}
 */
function FunctionSignature(d, r) {
  let s = `function ${d.name}`
  s += ParametersSignature(d.type, r)
  s += ReturnsSignature(d.type, r)
  return s
}

/**
 * @param {FunctionType} t
 * @param {RetrieveDeclaration} r
 * @returns {string}
 */
function ParametersSignature(t, r) {
  let p = ""
  if (Object.hasOwn(t, "parameters")) {
    p += t.parameters
      .map((v) => {
        return ValueSignature(v, r)
      })
      .join(", ")
  }
  return parenthesis(p)
}

/**
 * @param {FunctionType} t
 * @param {RetrieveDeclaration} r
 * @returns {string}
 */
function ReturnsSignature(t, r) {
  let s = ""
  if (Object.hasOwn(t, "returns")) {
    s += ": "
    s += TypeSignature(t.returns, r)
  }
  return s
}

/**
 * @param {InstancePropertyDeclaration | PropertyDeclaration} d
 * @param {RetrieveDeclaration} r
 * @returns {string}
 */
function InstancePropertySignature(d, r) {
  let s = ValueSignature(d, r)
  return `(property) ${s}`
}

/**
 * @param {StaticPropertyDeclaration} d
 * @param {RetrieveDeclaration} r
 * @returns {string}
 */
function StaticPropertySignature(d, r) {
  let s = ValueSignature(d, r)
  return `(property) static ${s}`
}

/**
 * @param {DeclarationValue} v
 * @param {RetrieveDeclaration} r
 * @returns {string}
 */
function ValueSignature(v, r) {
  let s = `${v.name}: `
  s += TypeSignature(v.type, r)
  return s
}

/**
 * @param {TypeDeclaration} t
 * @param {RetrieveDeclaration} r
 */
function TypeDeclarationSignature(t, r) {
  let s = ValueSignature(t, r)
  return `(${t.type.name}) ${s}`
}

/**
 * @param {DeclarationType} t
 * @param {RetrieveDeclaration} r
 * @returns {string}
 */
function TypeSignature(t, r) {
  let s = ""
  switch (t.name) {
    case "array":
      s += ArraySignature(t, r)
      break
    case "custom":
      s += ReferenceSignature(t, r)
      break
    case "function":
      // s += LambdaSignature(t, r)
      throw new Error("todo")
      break
    case "optional":
      s += OptionalSignature(t, r)
      break
    case "record":
      s += RecordSignature(t, r)
      break
    case "union":
      s += UnionSignature(t, r)
      break
    case "unknown":
      s += UnknownSignature()
      break
    case "literal":
      s += t.value
      break
  }
  return s
}

/**
 * @param {ArrayType} t
 * @param {RetrieveDeclaration} r
 * @returns {string}
 */
function ArraySignature(t, r) {
  let s = ""
  const ch = t.children.map((t) => {
    return TypeSignature(t, r)
  })
  if (isParenthesisRequired(t)) {
    s += parenthesis(ch.join(", "))
  } else {
    s += ch[0]
  }
  s += "[]"
  return s
}

/**
 * @param {CustomType} t
 * @param {RetrieveDeclaration} r
 */
function ReferenceSignature(t, r) {
  let s = ""
  const d = r(t.id)
  if (d === undefined) {
    s += UnknownSignature()
  } else {
    s += d.name
  }
  return s
}

// /**
//  * @param {FunctionType} t
//  * @param {RetrieveDeclaration} r
//  * @returns {string}
//  */
// function LambdaSignature(t) {
//   let m = `${d.name}(`
//   if (Object.hasOwn(d.type, "parameters")) {
//     m += d.type.parameters.map(ValueSignature).join(", ")
//   }
//   m += ")"
//   if (Object.hasOwn(d.type, "returns")) {
//     m += ": "
//     m += TypeSignature(d.type.returns)
//   }
//   return m
// }

/**
 * @param {OptionalType} t
 * @param {RetrieveDeclaration} r
 * @returns {string}
 */
function OptionalSignature(t, r) {
  let s = ""
  const ch = t.children.map((t) => {
    return TypeSignature(t, r)
  })
  if (isParenthesisRequired(t)) {
    s += parenthesis(ch.join(", "))
  } else {
    s += ch[0]
  }
  s += "?"
  return s
}

/**
 * @param {RecordType} t
 * @param {RetrieveDeclaration} r
 * @returns {string}
 */
function RecordSignature(t, r) {
  let s = "Record"
  const ch = t.children.map((t) => {
    return TypeSignature(t, r)
  })
  s += brackets(ch.join(", "))
  return s
}

/**
 * @param {UnionType} t
 * @param {RetrieveDeclaration} r
 * @returns {string}
 */
function UnionSignature(t, r) {
  let s = ""
  const ch = t.children.map((t) => {
    return TypeSignature(t, r)
  })
  s += ch.join(" | ")
  return s
}

/**
 * @returns {string}
 */
function UnknownSignature() {
  return "unknown"
}

/**
 * @param {DeclarationType} t
 * @returns {boolean}
 */
function isParenthesisRequired(t) {
  // // todo: it is not clear how to handle multiple children.
  // if (t.children.length > 1)
  return true
}

/**
 * @param {string} s
 * @returns {string}
 */
function parenthesis(s) {
  return `(${s})`
}

// todo:
// square brackets
// angle brackets

/**
 * @param {string} s
 * @returns {string}
 */
function brackets(s) {
  return `&lt;${s}&gt;`
}

module.exports = { setup }
