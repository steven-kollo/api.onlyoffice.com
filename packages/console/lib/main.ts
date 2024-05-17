import {Console as NodeConsole} from "node:console"

export class Console extends NodeConsole {
  #name: string

  constructor(
    name: string,
    stdout: NodeJS.WritableStream,
    stderr: NodeJS.WritableStream
  ) {
    super(stdout, stderr)
    this.#name = name
  }

  log(...data: Parameters<typeof NodeConsole["prototype"]["log"]>): void {
    super.log(`${this.#prefix()} info:`, ...data)
  }

  warn(...data: Parameters<typeof NodeConsole["prototype"]["warn"]>): void {
    super.warn(`${this.#prefix()} warn:`, ...data)
  }

  error(...data: Parameters<typeof NodeConsole["prototype"]["error"]>): void {
    super.error(`${this.#prefix()} error:`, ...data)
  }

  #prefix(): string {
    const d = new Date().toISOString()
    return `${d} ${this.#name}`
  }
}
