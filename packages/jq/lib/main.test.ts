import {join} from "node:path"
import {URL, fileURLToPath} from "node:url"
import {StringWritable} from "@onlyoffice/stream-string"
import {is} from "uvu/assert"
import {test} from "uvu"
import {jq} from "./main.js"

test("executes jq", async () => {
  const f = join(fixturesDir(), "000.json")
  const w = new StringWritable()
  await jq(w, [".", f])
  is(w.buf, '{\n  "hi": "there"\n}\n')
})

test.run()

function fixturesDir(): string {
  const u = new URL("../fixtures", import.meta.url)
  return fileURLToPath(u)
}
