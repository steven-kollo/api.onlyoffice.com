// @ts-check

/**
 * @typedef {import("../types/doclet.js").Doclet} Doclet
 * @typedef {import("../types/doclet.js").DocletCatharsis} DocletCatharsis
 * @typedef {import("../types/doclet.js").DocletParam} DocletParam
 * @typedef {import("../index.js").AliasDeclaration} AliasDeclaration
 * @typedef {import("../index.js").ClassDeclaration} ClassDeclaration
 * @typedef {import("../index.js").ConstructorDeclaration} ConstructorDeclaration
 * @typedef {import("../index.js").CustomType} CustomType
 * @typedef {import("../index.js").Declaration} Declaration
 * @typedef {import("../index.js").DeclarationContent} DeclarationContent
 * @typedef {import("../index.js").DeclarationType} DeclarationType
 * @typedef {import("../index.js").DeclarationValue} DeclarationValue
 * @typedef {import("../index.js").EventDeclaration} EventDeclaration
 * @typedef {import("../index.js").FunctionDeclaration} FunctionDeclaration
 * @typedef {import("../index.js").InstanceMethodDeclaration} InstanceMethodDeclaration
 * @typedef {import("../index.js").InstancePropertyDeclaration} InstancePropertyDeclaration
 * @typedef {import("../index.js").ObjectDeclaration} ObjectDeclaration
 * @typedef {import("../index.js").PropertyDeclaration} PropertyDeclaration
 * @typedef {import("../index.js").UnionDeclaration} UnionDeclaration
 */

import { Transform } from "node:stream"
import { ESLint } from "eslint"

const eslint = new ESLint({
  useEslintrc: false,
  fix: true,
  overrideConfig: {
    extends: ["eslint:recommended"],
    env: {
      browser: true,
      es2022: true
    },
    parserOptions: {
      sourceType: "module",
      ecmaVersion: "latest",
    },
    plugins: ["@stylistic/js"],
    rules: {
      "no-undef": "off",
      "no-unused-vars": ["warn", {
        "vars": "local"
      }],
      "no-var": "warn",
      "prefer-const": "warn",
      "prefer-arrow-callback": "warn",
      "@stylistic/js/array-bracket-newline": ["warn", {
        "multiline": true,
        "minItems": null
      }],
      "@stylistic/js/array-bracket-spacing": ["warn", "never"],
      "@stylistic/js/array-element-newline": ["warn", "always"],
      "@stylistic/js/arrow-spacing": "warn",
      "@stylistic/js/block-spacing": "warn",
      "@stylistic/js/brace-style": "warn",
      "@stylistic/js/comma-dangle": ["warn", "never"],
      "@stylistic/js/comma-spacing": ["warn", {
        "before": false,
        "after": true
      }],
      "@stylistic/js/comma-style": ["warn", "last"],
      "@stylistic/js/function-call-argument-newline": ["warn", "consistent"],
      "@stylistic/js/function-call-spacing": ["warn", "never"],
      "@stylistic/js/function-paren-newline": ["warn", "multiline"],
      "@stylistic/js/implicit-arrow-linebreak": ["warn", "beside"],
      "@stylistic/js/indent": ["warn", 2, {
        "VariableDeclarator": "first",
        "FunctionDeclaration": {
          "parameters": "first"
        },
        "FunctionExpression": {
          "parameters": "first"
        },
        "CallExpression": {
          "arguments": "first"
        },
        "ArrayExpression": "first",
        "ObjectExpression": "first",
        "ImportDeclaration": "first",
        "flatTernaryExpressions": true
      }],
      "@stylistic/js/key-spacing": ["warn", {
        "beforeColon": false,
        "mode": "strict"
      }],
      "@stylistic/js/keyword-spacing": ["warn", {
        "before": true
      }],
      "@stylistic/js/lines-between-class-members": ["warn", "always"],
      "@stylistic/js/max-len": ["warn", {
        "code": 120
      }],
      "@stylistic/js/multiline-ternary": ["warn", "never"],
      "@stylistic/js/new-parens": "warn",
      "@stylistic/js/no-extra-semi": "warn",
      "@stylistic/js/no-mixed-spaces-and-tabs": "warn",
      "@stylistic/js/no-multi-spaces": "warn",
      "@stylistic/js/no-multiple-empty-lines": "warn",
      "@stylistic/js/no-tabs": "warn",
      "@stylistic/js/no-trailing-spaces": "warn",
      "@stylistic/js/no-whitespace-before-property": "warn",
      "@stylistic/js/nonblock-statement-body-position": ["warn", "beside"],
      "@stylistic/js/object-curly-newline": ["warn", {
        "consistent": true
      }],
      "@stylistic/js/object-curly-spacing": ["warn", "always"],
      "@stylistic/js/object-property-newline": ["warn", {
        "allowAllPropertiesOnSameLine": true
      }],
      "@stylistic/js/padded-blocks": ["warn", "never"],
      "@stylistic/js/quotes": ["warn", "double"],
      "@stylistic/js/semi": ["warn", "never"],
      "@stylistic/js/semi-spacing": "warn",
      "@stylistic/js/space-before-blocks": "warn",
      "@stylistic/js/space-before-function-paren": ["warn", {
        "anonymous": "always",
        "named": "never",
        "asyncArrow": "always"
      }],
      "@stylistic/js/space-in-parens": ["warn", "never"],
      "@stylistic/js/eol-last": ["warn", "never"]
    }
  }
})

class PreprocessDeclarations extends Transform {
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

    /** @type {Declaration} */
    let d = {
      id: "",
      meta: {
        package: "main"
      },
      name: "",
      kind: "type",
      type: {
        name: "unknown"
      }
    }

    // todo: "scope": "static"
    // todo: for id const sign = "" (we do not need actually a new const)
    // just add the sign to the id

    if (Object.hasOwn(doc, "meta")) {
      if (Object.hasOwn(doc.meta, "file")) {
        d.meta.package = doc.meta.file
      }
    }

    // In most cases anonymous refer to a global iife.

    if (Object.hasOwn(doc, "inherits")) {
      if (Object.hasOwn(doc, "memberof")) {
        if (doc.memberof === "<anonymous>") {
          return
        }
        const mo = doc.memberof.replace("<anonymous>~", "")
        const cid = createID(d.meta.package, mo)
        const p = doc.inherits.split("#")[0]
        const pid = createID(d.meta.package, p)
        this._cache.populate(cid, "extends", pid)
        this._cache.populate(pid, "implements", cid)
      }
      return
    }

    /** @type {Declaration[]} */
    const ms = []

    if (Object.hasOwn(doc, "name")) {
      d.name = doc.name
    }

    if (Object.hasOwn(doc, "summary") && Object.hasOwn(doc, "description")) {
      d.summary = doc.summary
      d.description = {
        syntax: "txt",
        text: doc.description
      }
    } else if (Object.hasOwn(doc, "summary")) {
      d.summary = doc.summary
    } else if (Object.hasOwn(doc, "description")) {
      const l = doc.description.split("\n")
      if (l.length > 1) {
        d.summary = l[0]
      }
      d.description = {
        syntax: "txt",
        text: doc.description
      }
    }

    let ln = d.name
    if (Object.hasOwn(doc, "memberof")) {
      if (doc.memberof !== "<anonymous>") {
        const mo = doc.memberof.replace("<anonymous>~", "")
        ln = `${mo}#${ln}`
        d.parent = {
          id: createID(d.meta.package, mo)
        }
      }
    }
    d.id = createID(d.meta.package, ln)

    if (Object.hasOwn(doc, "kind")) {
      if (doc.kind === "class") {
        /** @type {ClassDeclaration} */
        const cl = {
          ...d,
          kind: "class"
        }
        delete cl.type
        if (Object.hasOwn(doc, "properties")) {
          cl.instanceProperties = doc.properties.map((p) => {
            const v = praseValue(cl, p)
            /** @type {InstancePropertyDeclaration} */
            const pr = {
              id: createID(cl.meta.package, `${cl.name}#${p.name}`),
              meta: {
                package: cl.meta.package
              },
              name: v.name,
              kind: "instanceProperty",
              parent: {
                id: cl.id
              },
              type: v.type
            }
            if (Object.hasOwn(v, "description")) {
              pr.description = v.description
            }
            ms.push(pr)
            return {
              name: "custom",
              id: pr.id
            }
          })
        }

        /** @type {ConstructorDeclaration} */
        const co = {
          id: createID(cl.meta.package, `${cl.name}#constructor`),
          meta: {
            package: cl.meta.package
          },
          name: "constructor",
          parent: {
            id: cl.id
          },
          kind: "constructor",
          type: {
            name: "function"
          }
        }
        if (Object.hasOwn(doc, "params")) {
          co.type.parameters = doc.params.map((p) => {
            return praseValue(cl, p)
          })
        }
        ms.push(co)
        cl.constructors = [{
          name: "custom",
          id: co.id
        }]

        d = cl
      } else if (doc.kind === "event") {
        /** @type {EventDeclaration} */
        const ev = {
          ...d,
          kind: "event",
          type: {
            name: "function"
          }
        }

        if (Object.hasOwn(doc, "params")) {
          ev.type.parameters = doc.params.map((p) => {
            return praseValue(ev, p)
          })
        }

        if (Object.hasOwn(ev, "parent")) {
          this._cache.populate(ev.parent.id, "events", ev.id)
        }

        d = ev
      } else if (doc.kind === "function") {
        /** @type {FunctionDeclaration} */
        const fu = {
          ...d,
          kind: "function",
          type: {
            name: "function"
          }
        }

        if (Object.hasOwn(doc, "params")) {
          fu.type.parameters = doc.params.map((p) => {
            return praseValue(d, p)
          })
        }
        if (Object.hasOwn(doc, "returns")) {
          // There is no way that the `returns` contains more than one element.
          if (doc.returns.length === 1) {
            fu.type.returns = praseValue(d, doc.returns[0]).type
          }
        }

        if (Object.hasOwn(fu, "parent")) {
          /** @type {InstanceMethodDeclaration} */
          const me = {
            ...fu,
            kind: "instanceMethod"
          }
          this._cache.populate(fu.parent.id, "instanceMethods", fu.id)
          d = me
        } else {
          d = fu
        }
      } else if (doc.kind === "typedef") {
        if (Object.hasOwn(doc, "type") && Object.hasOwn(doc.type, "parsedType")) {
          const t = parseType(d, doc.type.parsedType)
          if (t.name === "object") {
            /** @type {ObjectDeclaration} */
            const ob = {
              ...d,
              kind: "object",
              type: {
                name: "object"
              }
            }

            if (Object.hasOwn(doc, "properties")) {
              ob.type.properties = doc.properties.map((p) => {
                const v = praseValue(ob, p)
                /** @type {PropertyDeclaration} */
                const pr = {
                  id: createID(ob.meta.package, `${ob.name}#${p.name}`),
                  meta: {
                    package: ob.meta.package
                  },
                  name: v.name,
                  kind: "property",
                  parent: {
                    id: ob.id
                  },
                  type: v.type
                }
                if (Object.hasOwn(v, "description")) {
                  pr.description = v.description
                }
                ms.push(pr)
                return {
                  name: "custom",
                  id: pr.id
                }
              })
            }

            d = ob
          } else if (t.name === "union") {
            /** @type {UnionDeclaration} */
            const un = {
              ...d,
              kind: "union",
              type: t
            }
            d = un
          } else {
            d.type = t
          }
        }
      }
    }

    if (Object.hasOwn(doc, "examples")) {
      d.examples = await parseExamples(doc.examples)
    }

    this.push(d)
    ms.forEach((d) => {
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
          /** @type {CustomType} */
          const t = {
            name: "custom",
            id
          }
          return t
        })
      }
      if (Object.hasOwn(dc, "methods")) {
        // todo: resolve ignoring.
        // @ts-ignore
        d.methods = dc.methods.map((id) => {
          /** @type {CustomType} */
          const t = {
            name: "custom",
            id
          }
          return t
        })
      }
      if (Object.hasOwn(dc, "events")) {
        // todo: resolve ignoring.
        // @ts-ignore
        d.events = dc.events.map((id) => {
          /** @type {CustomType} */
          const t = {
            name: "custom",
            id
          }
          return t
        })
      }
      if (Object.hasOwn(dc, "extends")) {
        // todo: resolve ignoring.
        // @ts-ignore
        d.extends = dc.extends.map((id) => {
          /** @type {CustomType} */
          const t = {
            name: "custom",
            id
          }
          return t
        })
      }
      if (Object.hasOwn(dc, "implements")) {
        // todo: resolve ignoring.
        // @ts-ignore
        d.implements = dc.implements.map((id) => {
          /** @type {CustomType} */
          const t = {
            name: "custom",
            id
          }
          return t
        })
      }
    }

    this.push(d)
    cb(null)
  }
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
      name: "unknown"
    }
  }
  if (Object.hasOwn(p, "name")) {
    v.name = p.name
  }
  if (Object.hasOwn(p, "description")) {
    v.description = {
      syntax: "txt",
      text: p.description
    }
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
    name: "unknown"
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
              name: "array",
              children: []
            }
            break
          case "boolean":
          case "Boolean":
          case "number":
          case "Number":
            // todo: non-obvious behavior.
            t = {
              // @ts-ignore
              name: "literal",
              value: ca.name
            }
            break
          case "object":
          case "Object":
            t = {
              name: "object"
            }
            break
          case "string":
          case "String":
            // todo: non-obvious behavior.
            t = {
              // @ts-ignore
              name: "literal",
              value: ca.name
            }
            break
          default:
            if (isNumberLiteral(ca.name)) {
              // todo: what if `Number(ca.name)` is `NaN`?
              t = {
                // @ts-ignore
                name: "literal",
                value: Number(ca.name)
              }
              break
            }
            if (isStringLiteral(ca.name)) {
              t = {
                // @ts-ignore
                name: "literal",
                value: ca.name.slice(1, -1)
              }
              break
            }
            t = {
              name: "custom",
              id: createID(d.meta.package, ca.name)
            }
            break
        }
        break
      case "NullLiteral":
        t = {
          // @ts-ignore
          name: "literal",
          value: "null"
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
          if (t.name === "object") {
            // @ts-ignore
            t.name = "record"
          }
          // @ts-ignore
          t.children = ca.applications.map((a) => {
            return parseType(d, a)
          })
          break
        }
        // @ts-ignore
        t.children = [{
          name: "unknown"
        }]
        break
      case "TypeUnion":
        if (!Object.hasOwn(ca, "elements")) {
          break
        }
        t = {
          name: "union",
          children: ca.elements.map((e) => {
            return parseType(d, e)
          })
        }
        break
      case "UndefinedLiteral":
        t = {
          // @ts-ignore
          name: "literal",
          value: "undefined"
        }
        break
      // case "UnknownLiteral":
      default:
        // todo: should we throw an error here?
        // throw new Error(`Unknown type: ${ca.type}`)
        break
    }
  }
  // todo: separate them, they mean different things.
  if (Object.hasOwn(ca, "optional") || Object.hasOwn(ca, "nullable")) {
    t = {
      name: "optional",
      children: [t]
    }
  }
  return t
}

/**
 * @param {string[]} es
 * @returns {Promise<DeclarationContent[]>}
 */
function parseExamples(es) {
  return Promise.all(es.map(async (e) => {
    /** @type {DeclarationContent} */
    const c = {
      syntax: "js",
      text: e
    }
    const [r] = await eslint.lintText(e)
    if (r.output !== undefined) {
      c.text = r.output
    }
    return c
  }))
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
   * @param {keyof CacheDeclaration} k
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
  PreprocessDeclarations
}
