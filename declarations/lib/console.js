import { Console as NodeConsole } from "node:console"
import pack from "../package.json" assert { type: "json" }

export class Console extends NodeConsole {
  /**
   * @param  {...any} data
   * @returns {void}
   */
  info(...data) {
    super.info(`info ${pack.name}:`, ...data)
  }

  /**
   * @param  {...any} data
   * @returns {void}
   */
  warn(...data) {
    super.warn(`warn ${pack.name}:`, ...data)
  }
}
