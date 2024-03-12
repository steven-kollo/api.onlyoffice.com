// @ts-check

import { Console as NodeConsole } from "node:console"
import process from "node:process"
import pack from "../package.json" assert { type: "json" }

export class Console extends NodeConsole {
  static console = new Console(pack.name, process.stdout, process.stderr)

  /**
   * @param {string=} name
   * @param {NodeJS.WritableStream} stdout
   * @param {NodeJS.WritableStream} stderr
   */
  constructor(
    name = pack.name,
    stdout = process.stdout,
    stderr = process.stderr
  ) {
    super(stdout, stderr)
    this._name = name
    this._stdout = stdout
    this._stderr = stderr
  }

  /**
   * @param {NodeJS.WritableStream} s
   */
  set stdout(s) {
    this._stdout = s
    Console.console = new Console(this._name, s, this._stderr)
  }

  /**
   * @param {NodeJS.WritableStream} s
   */
  set stderr(s) {
    this._stderr = s
    Console.console = new Console(this._name, this.stdout, s)
  }

  /**
   * @param  {...any} data
   * @returns {void}
   */
  log(...data) {
    this.info(...data)
  }

  /**
   * @param  {...any} data
   * @returns {void}
   */
  info(...data) {
    const d = new Date().toISOString()
    super.info(`${d} ${this._name} info:`, ...data)
  }

  /**
   * @param  {...any} data
   * @returns {void}
   */
  warn(...data) {
    const d = new Date().toISOString()
    super.warn(`${d} ${this._name} warn:`, ...data)
  }
}
