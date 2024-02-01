// @ts-check

/**
 * @typedef {import("../index")}
 */

// import { createReadStream, createWriteStream } from "node:fs"
// import Chain from "stream-chain"
// import StreamArray from "stream-json/streamers/StreamArray.js"
// import Disassembler from "stream-json/Disassembler.js"
// import Stringer from "stream-json/Stringer.js"
// import parser from "stream-json"
// import { DeclarationsCache, PostprocessDeclarations, PreprocessDeclarations } from "./jsdoc.js"
// import { prettifyJSON } from "../../scripts/lib/jq.js"

// const p0 = "/Users/vanyauhalin/self/onlyoffice-docs-definitions-demo/dist/sdkjs.json"
// const p1 = "/Users/vanyauhalin/onlyoffice/api.onlyoffice.com/declarations/dist2/output1.json"
// const p2 = "/Users/vanyauhalin/onlyoffice/api.onlyoffice.com/declarations/dist2/output2.json"
// const p3 = "/Users/vanyauhalin/onlyoffice/api.onlyoffice.com/declarations/dist2/output3.json"

// const cache = new DeclarationsCache()

// await new Promise((res, rej) => {
//   const c = new Chain([
//     createReadStream(p0),
//     parser(),
//     new StreamArray(),
//     new PreprocessDeclarations(cache),
//     new Disassembler(),
//     new Stringer({ makeArray: true }),
//     createWriteStream(p1)
//   ])
//   c.on("error", rej)
//   c.on("finish", res)
// })

// await new Promise((res, rej) => {
//   const c = new Chain([
//     createReadStream(p1),
//     parser(),
//     new StreamArray(),
//     new PostprocessDeclarations(cache),
//     new Disassembler(),
//     new Stringer({ makeArray: true }),
//     createWriteStream(p2)
//   ])
//   c.on("error", rej)
//   c.on("finish", res)
// })

// // console.log(JSON.stringify(cache, null, 2))

// await prettifyJSON(p2, p3)
