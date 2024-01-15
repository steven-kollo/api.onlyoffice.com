// @ts-check

/**
 * @typedef {import("mdast").Code} RemarkCode
 * @typedef {import("mdast").Heading} RemarkHeading
 * @typedef {import("mdast").Html} RemarkHtml
 * @typedef {import("mdast").Link} RemarkLink
 * @typedef {import("mdast").Paragraph} RemarkParagraph
 * @typedef {import("mdast").Root} RemarkRoot
 * @typedef {import("mdast").RootContent} RemarkRootContent
 * @typedef {import("mdast").Strong} RemarkStrong
 * @typedef {import("mdast").Table} RemarkTable
 * @typedef {import("mdast").TableCell} RemarkTableCell
 * @typedef {import("mdast").TableRow} RemarkTableRow
 * @typedef {import("mdast").Text} RemarkText
 * @typedef {import("./index").Class} JSDocClass
 * @typedef {import("./index").Description} JSDocDescription
 * @typedef {import("./index").Event} JSDocEvent
 * @typedef {import("./index").Example} JSDocExample
 * @typedef {import("./index").Global} JSDocGlobal
 * @typedef {import("./index").MemberOf} JSDocMemberOf
 * @typedef {import("./index").Name} JSDocName
 * @typedef {import("./index").Parameter} JSDocParameter
 * @typedef {import("./index").Property} JSDocProperty
 * @typedef {import("./index").Returns} JSDocReturns
 * @typedef {import("./index").Unknown} JSDocUnknown
 */

import { ESLint } from "eslint"

// import risk from "eslint/use-at-your-own-risk"
// const { FlatESLint } = risk

const eslint = new ESLint({
  useEslintrc: false,
  fix: true,
  overrideConfig: {
    extends: [
      "eslint:recommended"
    ],
    parserOptions: {
      sourceType: "module",
      ecmaVersion: "latest",
    },
    plugins: [
      "@stylistic/js"
    ],
    rules: {
      "no-undef": "off",
      "no-var": "warn",
      "prefer-const": "warn",
      "prefer-arrow-callback": "warn",
      "@stylistic/js/array-bracket-newline": [
        "warn",
        { "multiline": true, "minItems": null }
      ],
      "@stylistic/js/array-bracket-spacing": [
        "warn",
        "never"
      ],
      "@stylistic/js/array-element-newline": [
        "warn",
        "always"
      ],
      "@stylistic/js/arrow-spacing": "warn",
      "@stylistic/js/block-spacing": "warn",
      "@stylistic/js/brace-style": "warn",
      "@stylistic/js/comma-dangle": [
        "warn",
        "never"
      ],
      "@stylistic/js/comma-spacing": [
        "warn",
        {
          "before": false, "after": true
        }
      ],
      "@stylistic/js/comma-style": [
        "warn",
        "last"
      ],
      "@stylistic/js/function-call-argument-newline": [
        "warn",
        "consistent"
      ],
      "@stylistic/js/function-call-spacing": [
        "warn",
        "never"
      ],
      "@stylistic/js/function-paren-newline": [
        "warn",
        "multiline"
      ],
      "@stylistic/js/implicit-arrow-linebreak": [
        "warn",
        "beside"
      ],
      "@stylistic/js/indent": [
        "warn",
        2,
        {
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
        }
      ],
      "@stylistic/js/key-spacing": [
        "warn",
        {
          "beforeColon": false, "mode": "strict"
        }
      ],
      "@stylistic/js/keyword-spacing": [
        "warn",
        {
          "before": true
        }
      ],
      "@stylistic/js/lines-between-class-members": [
        "warn",
        "always"
      ],
      "@stylistic/js/max-len": [
        "warn",
        {
          "code": 120
        }
      ],
      "@stylistic/js/multiline-ternary": [
        "warn",
        "never"
      ],
      "@stylistic/js/new-parens": "warn",
      "@stylistic/js/no-extra-semi": "warn",
      "@stylistic/js/no-mixed-spaces-and-tabs": "warn",
      "@stylistic/js/no-multi-spaces": "warn",
      "@stylistic/js/no-multiple-empty-lines": "warn",
      "@stylistic/js/no-tabs": "warn",
      "@stylistic/js/no-trailing-spaces": "warn",
      "@stylistic/js/no-whitespace-before-property": "warn",
      "@stylistic/js/nonblock-statement-body-position": [
        "warn",
        "beside"
      ],
      "@stylistic/js/object-curly-newline": [
        "warn",
        {
          "consistent": true
        }
      ],
      "@stylistic/js/object-curly-spacing": [
        "warn",
        "always"
      ],
      "@stylistic/js/object-property-newline": [
        "warn",
        {
          "allowAllPropertiesOnSameLine": true
        }
      ],
      "@stylistic/js/padded-blocks": [
        "warn",
        "never"
      ],
      "@stylistic/js/quotes": [
        "warn",
        "double"
      ],
      "@stylistic/js/semi": [
        "warn",
        "never"
      ],
      "@stylistic/js/semi-spacing": "warn",
      "@stylistic/js/space-before-blocks": "warn",
      "@stylistic/js/space-before-function-paren": [
        "warn",
        { "anonymous": "always", "named": "never", "asyncArrow": "always" }
      ],
      "@stylistic/js/space-in-parens": [
        "warn",
        "never"
      ],
      "no-unused-vars": [
        "warn",
        {
          "vars": "local"
        }
      ],
      "@stylistic/js/eol-last": [
        "warn",
        "never"
      ]
    },
    env: {
      browser: true,
      es2022: true
    }
  }
})

/** @returns {JSDocClass} */
function cls() {
  return {
    tag: "class",
    normalize() {},
    async render() {
      return `@${this.tag}`
    }
  }
}

/** @returns {JSDocDescription} */
function description() {
  return {
    tag: "description",
    content: "",
    normalize() {
      this.content = this.content.replace(/\n+/g, " ")
    },
    async render() {
      let s = `@${this.tag}`
      if (this.content !== "") {
        s += ` ${this.content}`
      }
      return s
    }
  }
}

/** @returns {JSDocEvent} */
function event() {
  return {
    tag: "event",
    parent: "",
    name: "",
    normalize() {},
    async render() {
      return `@${this.tag} ${this.parent}#${this.name}`
    }
  }
}

/** @returns {JSDocExample} */
function example() {
  return {
    tag: "example",
    content: "",
    normalize() {},
    async render() {
      let s = `@${this.tag}`
      if (this.content !== "") {
        const [c] = await eslint.lintText(this.content)
        if (c && c.output) {
          if (c.output.startsWith("\n")) {
            s += c.output
          } else {
            s += ` ${c.output}`
          }
        }
      }
      return s
    }
  }
}

/** @returns {JSDocGlobal} */
function global() {
  return {
    tag: "global",
    normalize() {},
    async render() {
      return `@${this.tag}`
    }
  }
}

/** @returns {JSDocMemberOf} */
function memberof() {
  return {
    tag: "memberof",
    parent: "",
    normalize() {},
    async render() {
      let s = `@${this.tag}`
      if (this.parent !== "") {
        s += ` ${this.parent}`
      }
      return s
    }
  }
}

/** @returns {JSDocName} */
function name() {
  return {
    tag: "name",
    content: "",
    normalize() {},
    async render() {
      let s = `@${this.tag}`
      if (this.content !== "") {
        s += ` ${this.content}`
      }
      return s
    }
  }
}

/** @returns {JSDocParameter} */
function parameter() {
  const p = pp()
  return {
    ...p,
    tag: "param",
    normalize() {
      // Warn
      const m = this.description.match(/ De[df]ault value is "?([\S\s]*?)"?\.$/)
      if (m) {
        const [s, d] = m
        this.description = this.description.replace(s, "")
        this.default = d
      }
      p.normalize.call(this)
    },
    async render() {
      return p.render.call(this)
    }
  }
}

/** @returns {JSDocProperty} */
function property() {
  const p = pp()
  return {
    ...p,
    tag: "prop",
    normalize() {
      ;(() => {
        const m = this.description.match(/\s*?\*\*Read-only\*\*$/)
        if (!m) {
          return
        }
        const [s] = m
        this.description = this.description.replace(s, "")
        this.type = `Readonly<${this.type}>`
      })()

      ;(() => {
        const m = this.description.match(/\s*?\*\*Set-only\*\*\.?$/)
        if (!m) {
          return
        }
        const [s] = m
        this.description = this.description.replace(s, "")
        // non-standard
        this.type = `Setonly<${this.type}>`
      })()

      ;(() => {
        const m = this.type.match(/This propert((ies)|(ie)|(y)) doesn't return any data\./)
        if (!m) {
          return
        }
        const [s] = m
        this.type = this.type.replace(s, this.name)
      })()

      const m = this.type.match(/ \(([\S\s]*)\)>?$/)
      if (m) {
        let [s, d] = m
        if (s.endsWith(">")) {
          this.type = this.type.replace(s, ">")
        } else {
          this.type = this.type.replace(s, "")
        }
        let p = ""
        if (this.description.endsWith(".")) {
          p = " "
        }
        d = capitalizeFirstLetter(d)
        if (!d.endsWith(".")) {
          d += "."
        }
        this.description += `${p}${d}`
      }

      p.normalize.call(this)
    },
    async render() {
      return p.render.call(this)
    }
  }
}

/** @returns {Omit<JSDocParameter | JSDocProperty, "tag"> & { tag: string }} */
function pp() {
  return {
    tag: "",
    type: "",
    name: "",
    description: "",
    optional: false,
    default: "",
    normalize() {
      if (this.optional) {
        this.type += "="
      }

      if (this.default !== "") {
        let d = this.default
        switch (d) {
          case " ":
            d = "EMPTY_STRING"
            break
        }
        this.name += `=${d}`
      }
    },
    async render() {
      let s = `@${this.tag}`
      if (this.type !== "") {
        s += ` {${this.type}}`
      }
      if (this.name !== "") {
        s += ` ${this.name}`
      }
      if (this.description !== "") {
        s += ` ${this.description}`
      }
      return s
    }
  }
}

/** @return {JSDocReturns} */
function returns() {
  return {
    tag: "returns",
    type: "",
    description: "",
    normalize() {
      if (this.type === "This method doesn't return any data.") {
        this.type = "void"
      } else {
        const m = this.type.match(/ \(([\S\s]*)\)$/)
        if (m) {
          const [s, d] = m
          this.type = this.type.replace(s, "")
          this.description = d
        }
      }

      if (this.type.includes("| |")) {
        this.type = this.type.replace("| |", "|")
      }
    },
    async render() {
      let s = `@${this.tag}`
      if (this.type !== "") {
        s += ` {${this.type}}`
      }
      if (this.description !== "") {
        s += ` ${this.description}`
      }
      return s
    }
  }
}

/**
 * @typedef {JSDocUnknown[]} Block
 */

/**
 * @param {RemarkRoot} t
 * @param {Block} b
 * @returns {void}
 */
function parse(t, b) {
  const cb = callback()
  const s = state()
  parseRoot(t, b, s, cb)
}

/**
 * @callback Callback
 * @param {RemarkRootContent} t
 * @param {Block} b
 * @param {State} s
 * @returns {void}
 */

/** @returns {Callback} */
function callback() {
  return () => {}
}

/**
 * @typedef {Object} State
 * @property {"name" | "description" | "params" | "returns" | "example" | ""} section
 */

/** @returns {State} */
function state() {
  return {
    section: ""
  }
}

/**
 * @param {RemarkRoot} t
 * @param {Block} b
 * @param {State} s
 * @param {Callback} cb
 * @returns {void}
 */
function parseRoot(t, b, s, cb) {
  const f = b[0]
  if (!f) {
    return
  }
  switch (f.tag) {
    case "description":
    case "event":
    case "memberof":
    case "prop":
      parseUnknown(t, b, s, cb)
      return
  }
  /**
   * @param {RemarkRoot} t
   * @param {Block} b
   * @param {State} s
   * @param {Callback} cb
   * @returns {void}
   */
  function parseUnknown(t, b, s, cb) {
    t.children.forEach((c) => {
      parseRootContent(c, b, s, cb)
    })
  }
}

/**
 * @param {RemarkRootContent} t
 * @param {Block} b
 * @param {State} s
 * @param {Callback} cb
 * @returns {void}
 */
function parseRootContent(t, b, s, cb) {
  switch (t.type) {
    case "code":
      parseCode(t, b, s, cb)
      return
    case "heading":
      parseHeading(t, b, s, cb)
      return
    case "html":
      parseHtml(t, b, s, cb)
      return
    case "link":
      parseLink(t, b, s, cb)
      return
    case "paragraph":
      parseParagraph(t, b, s, cb)
      return
    case "strong":
      parseStrong(t, b, s, cb)
      return
    case "table":
      parseTable(t, b, s, cb)
      return
    case "tableCell":
      parseTableCell(t, b, s, cb)
      return
    case "tableRow":
      parseTableRow(t, b, s, cb)
      return
    case "text":
      parseText(t, b, s, cb)
      return
  }
}

/**
 * @param {RemarkCode} t
 * @param {Block} b
 * @param {State} s
 * @param {Callback} cb
 * @returns {void}
 */
function parseCode(t, b, s, cb) {
  const c = b[b.length - 1]
  if (!c) {
    return
  }
  switch (c.tag) {
    case "example":
      c.content += `\n${t.value}`
      cb(t, b, s)
      return
  }
}

/**
 * @param {RemarkHeading} t
 * @param {Block} b
 * @param {State} s
 * @param {Callback} cb
 * @returns {void}
 */
function parseHeading(t, b, s, cb) {
  const f = b[0]
  if (!f) {
    return
  }
  switch (f.tag) {
    case "description":
      parseDescription(t, b, s, cb)
      return
    case "event":
      parseEvent(t, b, s, cb)
      return
    case "memberof":
      parseMemberOr(t, b, s, cb)
      return
    // case "param":
    //   parseParameter(t, b, s, cb)
    //   return
    case "prop":
      parseProperty(t, b, s, cb)
      return
  }
  /**
   * @param {RemarkHeading} t
   * @param {Block} b
   * @param {State} s
   * @param {Callback} cb
   * @returns {void}
   */
  function parseDescription(t, b, s, cb) {
    switch (t.depth) {
      case 1:
        s.section = "description"
        return
      case 2:
        s.section = ""
        return
    }
  }
  /**
   * @param {RemarkHeading} t
   * @param {Block} b
   * @param {State} s
   * @param {Callback} cb
   * @returns {void}
   */
  function parseEvent(t, b, s, cb) {
    switch (t.depth) {
      case 1:
        s.section = "name"
        t.children.forEach((c) => {
          parseRootContent(c, b, s, cb)
        })
        s.section = "description"
        const d = description()
        b.push(d)
        return
      case 2:
        s.section = ""
        t.children.forEach((c) => {
          parseRootContent(c, b, s, cb)
        })
        // false positive
        switch (s.section) {
          case "example":
            const e = example()
            b.push(e)
            break
        }
        return
    }
  }
  /**
   * @param {RemarkHeading} t
   * @param {Block} b
   * @param {State} s
   * @param {Callback} cb
   * @returns {void}
   */
  function parseMemberOr(t, b, s, cb) {
    switch (t.depth) {
      case 1:
        s.section = "name"
        const n = name()
        b.push(n)
        t.children.forEach((c) => {
          parseRootContent(c, b, s, cb)
        })
        s.section = "description"
        const d = description()
        b.push(d)
        return
      case 2:
        s.section = ""
        t.children.forEach((c) => {
          parseRootContent(c, b, s, cb)
        })
        // false positive
        switch (s.section) {
          case "example":
            const e = example()
            b.push(e)
            break
          case "returns":
            const r = returns()
            b.push(r)
            break
        }
        return
    }
  }
  /**
   * @param {RemarkHeading} t
   * @param {Block} b
   * @param {State} s
   * @param {Callback} cb
   * @returns {void}
   */
  function parseProperty(t, b, s, cb) {
    switch (t.depth) {
      case 1:
        s.section = "name"
        t.children.forEach((c) => {
          parseRootContent(c, b, s, cb)
        })
        s.section = "description"
        return
      case 2:
        s.section = ""
        t.children.forEach((c) => {
          parseRootContent(c, b, s, cb)
        })
        return
    }
  }
  // /**
  //  * @param {RemarkHeading} t
  //  * @param {Block} b
  //  * @param {State} s
  //  * @param {Callback} cb
  //  * @returns {void}
  //  */
  // function parseParameter(t, b, s, cb) {
  //   switch (t.depth) {
  //     case 1:
  //       // continue
  //       return
  //     case 2:
  //       s.section = ""
  //       t.children.forEach((c) => {
  //         parseRootContent(c, b, s, cb)
  //       })
  //       return
  //   }
  // }
}

/**
 * @param {RemarkHtml} t
 * @param {Block} b
 * @param {State} s
 * @param {Callback} cb
 */
function parseHtml(t, b, s, cb) {
  cb(t, b, s)
  // switch (u.tag) {
  //   case "description":
  //     parseDescription(t, u, s, cb)
  //     break
  // }
  // /**
  //  * @param {RemarkHtml} t
  //  * @param {JSDocDescription} u
  //  * @param {State} s
  //  * @param {Callback} cb
  //  */
  // function parseDescription(t, u, s, cb) {
  //   switch (s.section) {
  //     case "name":
  //       cb(t, u, s)
  //       return
  //   }
  // }
}

/**
 * @param {RemarkLink} t
 * @param {Block} b
 * @param {State} s
 * @param {Callback} cb
 * @returns {void}
 */
function parseLink(t, b, s, cb) {
  t.children.forEach((c) => {
    parseRootContent(c, b, s, cb)
  })
  // switch (u.tag) {
  //   case "prop":
  //     parseProperty(t, u, s, cb)
  //     return
  // }
  // /**
  //  * @param {RemarkLink} t
  //  * @param {JSDocProperty} u
  //  * @param {State} s
  //  * @param {Callback} cb
  //  * @returns {void}
  //  */
  // function parseProperty(t, u, s, cb) {
  //   switch (s.section) {
  //     case "returns":
  //       t.children.forEach((c) => {
  //         parseRootContent(c, u, s, cb)
  //       })
  //       return
  //   }
  // }
}

/**
 * @param {RemarkParagraph} t
 * @param {Block} b
 * @param {State} s
 * @param {Callback} cb
 * @returns {void}
 */
function parseParagraph(t, b, s, cb) {
  t.children.forEach((c) => {
    parseRootContent(c, b, s, cb)
  })
  // switch (u.tag) {
  //   case "description":
  //     parseDescription(t, u, s, cb)
  //     return
  //   case "prop":
  //     parseProperty(t, u, s, cb)
  //     return
  // }
  // /**
  //  * @param {RemarkParagraph} t
  //  * @param {JSDocDescription} u
  //  * @param {State} s
  //  * @param {Callback} cb
  //  * @returns {void}
  //  */
  // function parseDescription(t, u, s, cb) {
  //   switch (s.section) {
  //     case "name":
  //       return
  //   }
  // }
  // /**
  //  * @param {RemarkParagraph} t
  //  * @param {JSDocProperty} u
  //  * @param {State} s
  //  * @param {Callback} cb
  //  * @returns {void}
  //  */
  // function parseProperty(t, u, s, cb) {
  //   switch (s.section) {
  //     case "description":
  //       t.children.forEach((c) => {
  //         parseRootContent(c, u, s, cb)
  //       })
  //       return
  //     case "returns":
  //       t.children.forEach((c) => {
  //         parseRootContent(c, u, s, cb)
  //       })
  //       return
  //   }
  // }
}

/**
 * @param {RemarkStrong} t
 * @param {Block} b
 * @param {State} s
 * @param {Callback} cb
 * @returns {void}
 */
function parseStrong(t, b, s, cb) {
  const u = b[b.length - 1]
  if (!u) {
    return
  }
  switch (u.tag) {
    case "prop":
      parseProperty(t, b, u, s, cb)
      return
  }
  /**
   * @param {RemarkStrong} t
   * @param {Block} b
   * @param {JSDocProperty} u
   * @param {State} s
   * @param {Callback} cb
   * @returns {void}
   */
  function parseProperty(t, b, u, s, cb) {
    switch (s.section) {
      case "description":
        u.description += "**"
        t.children.forEach((c) => {
          parseRootContent(c, b, s, cb)
        })
        u.description += "**"
        return
    }
  }
}

/**
 * @param {RemarkTable} t
 * @param {Block} b
 * @param {State} s
 * @param {Callback} cb
 * @returns {void}
 */
function parseTable(t, b, s, cb) {
  const f = b[0]
  if (!f) {
    return
  }
  switch (f.tag) {
    case "event":
    case "memberof":
      parseEvent(t, b, s, cb)
      return
  }
  /**
   * @param {RemarkTable} t
   * @param {Block} b
   * @param {State} s
   * @param {Callback} cb
   * @returns {void}
   */
  function parseEvent(t, b, s, cb) {
    switch (s.section) {
      case "params":
        parseParameters(t, b, s, cb)
        return
    }
    /**
     * @param {RemarkTable} t
     * @param {Block} b
     * @param {State} s
     * @param {Callback} cb
     * @returns {void}
     */
    function parseParameters(t, b, s, cb) {
      t.children.slice(1).forEach((c) => {
        const p = parameter()
        b.push(p)
        parseRootContent(c, b, s, cb)
      })
    }
  }
}

/**
 * @param {RemarkTableCell} t
 * @param {Block} b
 * @param {State} s
 * @param {Callback} cb
 * @returns {void}
 */
function parseTableCell(t, b, s, cb) {
  t.children.forEach((c) => {
    parseRootContent(c, b, s, cb)
  })
}

/**
 * @param {RemarkTableRow} t
 * @param {Block} b
 * @param {State} s
 * @param {Callback} cb
 * @returns {void}
 */
function parseTableRow(t, b, s, cb) {
  t.children.forEach((c, i) => {
    const st = s.section
    switch (i) {
      case 0:
        s.section = "name"
        break
      case 1:
        s.section = "returns"
        break
      case 2:
        s.section = "returns"
        break
      case 3:
        s.section = "description"
        break
    }
    parseRootContent(c, b, s, cb)
    s.section = st
  })
}

/**
 * @param {RemarkText} t
 * @param {Block} b
 * @param {State} s
 * @param {Callback} cb
 * @returns {void}
 */
function parseText(t, b, s, cb) {
  // switch (f.tag) {
  //   case "event":
  //     parseEvent(t, b, s, cb)
  //     return
  // }
  parseEvent(t, b, s, cb)
  /**
   * @param {RemarkText} t
   * @param {Block} b
   * @param {State} s
   * @param {Callback} cb
   */
  function parseEvent(t, b, s, cb) {
    // switch (s.section) {
    //   case "name":
    //     return
    // }
    // return
    if (s.section === "") {
      parseSection(t, b, s, cb)
      return
    }
    const c = b[b.length - 1]
    if (!c) {
      return
    }
    switch (c.tag) {
      case "description":
        parseDescription(t, b, c, s, cb)
        return
      case "event":
        parseEvent(t, b, c, s, cb)
        return
      // case "memberof":
      //   parseMemberOf(t, b, c, s, cb)
      //   return
      case "name":
        parseName(t, b, c, s, cb)
        return
      case "param":
        parseParameter(t, b, c, s, cb)
        return
      case "prop":
        parseProperty(t, b, c, s, cb)
        return
      case "returns":
        parseReturns(t, b, c, s, cb)
        return
    }
    /**
     * @param {RemarkText} t
     * @param {Block} b
     * @param {JSDocDescription} c
     * @param {State} s
     * @param {Callback} cb
     * @returns {void}
     */
    function parseDescription(t, b, c, s, cb) {
      switch (s.section) {
        case "description":
          c.content += t.value
          cb(t, b, s)
          return
      }
    }
    /**
     * @param {RemarkText} t
     * @param {Block} b
     * @param {JSDocEvent} c
     * @param {State} s
     * @param {Callback} cb
     * @returns {void}
     */
    function parseEvent(t, b, c, s, cb) {
      switch (s.section) {
        case "name":
          c.name += t.value
          cb(t, b, s)
          return
      }
    }
    /**
     * @param {RemarkText} t
     * @param {Block} b
     * @param {JSDocMemberOf} c
     * @param {State} s
     * @param {Callback} cb
     * @returns {void}
     */
    function parseMemberOf(t, b, c, s, cb) {
      // switch (s.section) {}
    }
    /**
     * @param {RemarkText} t
     * @param {Block} b
     * @param {JSDocName} c
     * @param {State} s
     * @param {Callback} cb
     * @returns {void}
     */
    function parseName(t, b, c, s, cb) {
      switch (s.section) {
        case "name":
          c.content = t.value
          cb(t, b, s)
          return
      }
    }
    /**
     * @param {RemarkText} t
     * @param {Block} b
     * @param {JSDocParameter} c
     * @param {State} s
     * @param {Callback} cb
     * @returns {void}
     */
    function parseParameter(t, b, c, s, cb) {
      switch (s.section) {
        case "description":
          c.description += t.value
          cb(t, b, s)
          return
        case "name":
          c.name += t.value
          cb(t, b, s)
          return
        case "returns":
          switch (t.value) {
            case "Optional":
              c.optional = true
              break
            case "Required":
              c.optional = false
              break
            default:
              c.type += t.value
              break
          }
          cb(t, b, s)
          return
      }
    }
    /**
     * @param {RemarkText} t
     * @param {Block} b
     * @param {JSDocProperty} c
     * @param {State} s
     * @param {Callback} cb
     * @returns {void}
     */
    function parseProperty(t, b, c, s, cb) {
      switch (s.section) {
        case "description":
          c.description += t.value
          cb(t, b, s)
          return
        case "name":
          c.name += t.value
          cb(t, b, s)
          return
        case "returns":
          c.type += t.value
          cb(t, b, s)
          return
        // case "":
        //   parseSection(t, b, s, cb)
        //   return
      }
    }
    /**
     * @param {RemarkText} t
     * @param {Block} b
     * @param {JSDocReturns} c
     * @param {State} s
     * @param {Callback} cb
     * @returns {void}
     */
    function parseReturns(t, b, c, s, cb) {
      switch (s.section) {
        case "returns":
          c.type += t.value
          cb(t, b, s)
          return
      }
    }
    /**
     * @param {RemarkText} t
     * @param {Block} b
     * @param {State} s
     * @param {Callback} cb
     * @returns {void}
     */
    function parseSection(t, b, s, cb) {
      const p = t.position
      if (!p || p.start.column !== 4) {
        return
      }
      switch (t.value) {
        case "Example":
          s.section = "example"
          break
        // Warn
        case "Parameters":
        case "Parametrs":
          s.section = "params"
          break
        case "Returns":
          s.section = "returns"
          break
      }
      cb(t, b, s)
    }
  }
}

function capitalizeFirstLetter(str) {
  return str.charAt(0).toUpperCase() + str.slice(1);
}

export {
  cls,
  description,
  event,
  example,
  global,
  memberof,
  name,
  parameter,
  property,
  returns,
  parse
}

// b - block
// cb - callback
// f - formative
// s - state
// t - tree
// u - unknown
// c - current

// https://github.com/jsdoc/jsdoc/issues/1529
