import json from "../fixtures/sdkjs-forms.json" assert { type: "json" }
import { parseDeclaration } from "./jsdoc.js"

const r = json.map(parseDeclaration)
console.log(JSON.stringify(r, undefined, 2))
