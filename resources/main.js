// #/components/schemas/ASC.Core.Common.EF.FireBaseUser           a
// #/components/schemas/ASC.Core.Common.EF.Model.DbTenant         b
// #/components/schemas/ASC.Core.Common.EF.Model.DbTenantPartner  c
// #/components/schemas/ASC.Core.Common.EF.Model.DbTenant         b
// #/components/schemas/ASC.Core.Common.EF.Model.DbTenantPartner  c
// #/components/schemas/ASC.Core.Common.EF.Model.DbTenant         b x
// #/components/schemas/ASC.Core.Common.EF.Model.DbTenantPartner  c

/**
 * types
 * @typedef {T[]} TS
 */

/**
 * references
 * @typedef {Record<string, T>} RS
 */

/**
 * retrieve
 * @callback RE
 * @param {string} n
 * @returns {T | undefined}
 */

/**
 * retriever
 * @typedef {Object} RR
 * @property {RE} re
 * @property {function (string): void } push
 * @property {function (): boolean } is
 * @property {function (): void } pop
 */

/**
 * type
 * @typedef {O | R | L} T
 */

/**
 * object
 * @typedef {Object} O
 * @property {T[]} p
 */

/**
 * reference
 * @typedef {Object} R
 * @property {string} n
 */

/**
 * literal
 * @typedef {Object} L
 */

/**
 * loop
 * @param {TS} ts
 * @param {RE} re
 * @returns {T}
 */
function lo(ts, re) {
  /** @type {string[]} */
  let h = []
  let n = -1

  /** @type {RR} */
  const rr = {
    push(id) {
      const i = h.lastIndexOf(id)
      if (i !== -1) {
        if (n === -1) {
          n = i
        } else {
          if (i - n === 1) {
            n += 1
          } else {
            rr.c()
          }
        }
      }
      h.push(id)
    },
    is() {
      if (n !== -1) {
        const c = h[h.length - 1]
        const p = h[(h.length - 1) - (n + 1)]
        if (c === p) {
          return true
        }
      }
      return false
    },
    pop() {
      h.pop()
      if (rr.is()) {
        rr.c()
      }
    },
    re,
    c() {
      n = -1
    }
  }

  return ts.map((t) => {
    return ha(t, rr)
  })
}

/**
 * handle
 * @param {T} t
 * @param {RR} rr
 * @returns {T}
 */
function ha(t, rr) {
  if ("p" in t) {
    return ho(t, rr)
  }
  if ("n" in t) {
    return hr(t, rr)
  }
  return hl(t)
}

/**
 * handle object
 * @param {O} o
 * @param {RR} rr
 * @returns {T}
 */
function ho(o, rr) {
  return {
    p: o.p.map((p) => {
      return ha(p, rr)
    })
  }
}

/**
 * handle reference
 * @param {R} r
 * @param {RR} rr
 * @returns {T}
 */
function hr(r, rr) {
  rr.push(r.n)
  if (rr.is()) {
    rr.pop()
    return { loop: true }
  }
  let t = rr.re(r.n)
  if (t === undefined) {
    throw new Error(`reference not found: ${r.n}`)
  }
  t = ha(t, rr)
  rr.pop()
  return t
}

/**
 * handle literal
 * @param {L} l
 * @returns {T}
 */
function hl(l) {
  return l
}

/** @type {TS} */
const os = [
  { n: "a" }
]

/** @type {RS} */
const rs = {
  a: {
    p: [
      {
        p: [
          {}
        ]
      },
      {
        n: "b"
      }
    ]
  },
  b: {
    p: [
      {
        p: [
          {
            n: "a"
          }
        ]
      },
      {
        n: "c"
      }
    ]
  },
  c: {
    n: "a"
  }
}

/** @type {RE} */
function re(n) {
  return rs[n]
}

const r = lo(os, re)

console.log(
  JSON.stringify(r) ==
  JSON.stringify(
    [
      // a
      {
        p: [
          {
            p: [
              {}
            ]
          },
          // ab
          {
            p: [
              {
                p: [
                  // aba
                  {
                    p: [
                      {
                        p: [
                          {}
                        ]
                      },
                      // abab
                      {
                        loop: true
                      }
                    ]
                  }
                ]
              },
              // abc
              // abca
              {
                p: [
                  {
                    p: [
                      {}
                    ]
                  },
                  // abcab
                  {
                    p: [
                      {
                        p: [
                          // abcaba
                          {
                            p: [
                              {
                                p: [
                                  {}
                                ]
                              },
                              // abcabab
                              {
                                loop: true
                              }
                            ]
                          }
                        ]
                      },
                      // abcabc
                      {
                        loop: true
                      }
                    ]
                  }
                ]
              }
            ]
          }
        ]
      }
    ]
  )
)
