import process from "node:process"
import {Console} from "@onlyoffice/console"
import pack from "../package.json" assert {type: "json"}

export const console = new Console(pack.name, process.stdout, process.stderr)
