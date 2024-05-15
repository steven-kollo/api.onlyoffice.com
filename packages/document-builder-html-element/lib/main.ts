/* eslint-disable no-new-func */

import type {DocumentBuilder as IDocumentBuilder} from "@onlyoffice/document-builder-types"
import {DocumentEditor} from "@onlyoffice/document-editor-html-element"
import type {DocEditorConnector} from "@onlyoffice/document-server-types"

declare global {
  interface Window {
    DocumentBuilder: typeof DocumentBuilder
  }

  interface HTMLElementTagNameMap {
    "document-builder": DocumentBuilder
  }

  namespace preact {
    namespace JSX {
      interface IntrinsicElements {
        "document-builder": Partial<Omit<DocumentBuilder, keyof HTMLElement>>
      }
    }
  }
}

function main(): void {
  if (window.customElements.get("document-builder")) {
    return
  }
  window.DocumentBuilder = DocumentBuilder
  window.customElements.define("document-builder", DocumentBuilder)
}

export class DocumentBuilderReady extends Event {
  static get type(): string {
    return "documentbuilderready"
  }

  constructor(eventInitDict?: EventInit) {
    super(DocumentBuilderReady.type, eventInitDict)
  }
}

export interface DocumentBuilderReadyListener extends EventListener {
  (this: DocumentEditor, event: DocumentBuilderReady): void
}

interface DocumentBuilderCommandListener extends EventListener {
  (this: DocumentBuilder, event: DocumentBuilderReady): void
}

type DocumentBuilderCommand = Parameters<DocEditorConnector["callCommand"]>[0]
type DocumentBuilderConnector = DocEditorConnector

export class DocumentBuilder extends DocumentEditor {
  #command: DocumentBuilderCommand | null = null

  get command(): DocumentBuilderCommand | null {
    return this.#command
  }

  set command(c: DocumentBuilderCommand | null) {
    if (this.#commandListener) {
      this.removeEventListener(DocumentBuilderReady.type, this.#commandListener)
      this.#commandListener = null
    }

    if (c) {
      c = new Function(`${banner()}\n\n(${c}).call(undefined, builder)`)
    }

    this.#command = c
    if (!this.#command) {
      return
    }

    if (this.#connector) {
      this.#connector.callCommand(this.#command)
      return
    }

    this.#commandListener = function commandListener() {
      if (!(this.#command && this.#connector)) {
        return
      }
      this.#connector.callCommand(this.#command)
    }
    this.addEventListener(DocumentBuilderReady.type, this.#commandListener)
  }

  #commandListener: DocumentBuilderCommandListener | null = null

  #connector: DocumentBuilderConnector | null = null

  get connector(): DocumentBuilderConnector | null {
    return this.#connector
  }

  #onDocumentBuilderReady: DocumentBuilderReadyListener | null = null

  get onDocumentBuilderReady(): DocumentBuilderReadyListener | null {
    return this.#onDocumentBuilderReady
  }

  set onDocumentBuilderReady(l: DocumentBuilderReadyListener | null) {
    if (this.#onDocumentBuilderReady) {
      this.removeEventListener(DocumentBuilderReady.type, this.#onDocumentBuilderReady)
    }
    this.#onDocumentBuilderReady = l
    if (this.#onDocumentBuilderReady) {
      this.addEventListener(DocumentBuilderReady.type, this.#onDocumentBuilderReady)
    }
  }

  static get observedAttributes(): string[] {
    return [...DocumentEditor.observedAttributes, "command"]
  }

  attributeChangedCallback(n: string, _: string, v: string): void {
    switch (n) {
    case "command":
      this.command = new Function("builder", v) as DocumentBuilderCommand
      break
    default:
      super.attributeChangedCallback(n, _, v)
    }
  }

  static fileType(c: string): string | null {
    let t = ""

    const b = builder()
    b.CreateFile = (e) => {
      t = e
      throw new Error("Stop execution")
    }

    const f = new Function("builder", c) as DocumentBuilderCommand
    try {
      f(b)
    } catch {
      // continue
    }

    if (t === "") {
      return null
    }
    return t
  }

  connectedCallback(): void {
    super.connectedCallback()
    this.addEventListener("documentready", () => {
      if (!this.editor) {
        // throw custom event
        // throw new Error("DocumentEditor is not initialized")
        return
      }

      this.#connector = this.editor.createConnector()

      const e = new DocumentBuilderReady()
      this.dispatchEvent(e)
    })
  }
}

function banner(): string {
  const n = uniqString()
  const m = builder.toString()
  return "// document-builder-element\n" +
    `function ${n}(){return (${m})()};const builder = ${n}();`
}

function uniqString(): string {
  const date = new Date()
  const timestamp = date.getTime()
  return timestamp.toString(36)
}

function builder(): IDocumentBuilder {
  return {
    CloseFile: () => {},
    CreateFile: () => {},
    SaveFile: () => {}
  }
}

main()
