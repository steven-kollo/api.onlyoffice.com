import { Console as UtilsConsole } from "@onlyoffice/documentation-utils/console.js"
import pack from "../package.json" assert { type: "json" }

export class Console extends UtilsConsole {
  static console = new Console(pack.name)
}

export const console = Console.console
