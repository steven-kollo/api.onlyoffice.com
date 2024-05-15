import type {
  DocEditor,
  DocEditorConfig,
  DocEditorDocumentDownloadAsEvent,
  DocEditorDocumentStateChangeEvent,
  DocEditorErrorEvent,
  DocEditorInfoEvent,
  DocEditorMakeActionLinkEvent,
  DocEditorMetaChangeEvent,
  DocEditorRequestHistoryDataEvent,
  DocEditorRequestInsertImageEvent,
  DocEditorRequestOpenEvent,
  DocEditorRequestReferenceDataEvent,
  DocEditorRequestReferenceSourceEvent,
  DocEditorRequestRenameEvent,
  DocEditorRequestRestoreEvent,
  DocEditorRequestSaveAsEvent,
  DocEditorRequestSelectDocumentEvent,
  DocEditorRequestSelectSpreadsheetEvent,
  DocEditorRequestSendNotifyEvent,
  DocEditorRequestUsersEvent,
  DocEditorWarningEvent
} from "@onlyoffice/document-server-types"

declare global {
  interface Window {
    DocumentEditor: typeof DocumentEditor
    DocumentEditorAppReadyEvent: typeof DocumentEditorAppReadyEvent
    DocumentEditorCollaborativeChangesEvent: typeof DocumentEditorCollaborativeChangesEvent
    DocumentEditorDocumentReadyEvent: typeof DocumentEditorDocumentReadyEvent
    DocumentEditorDocumentStateChangeEvent: typeof DocumentEditorDocumentStateChangeEvent
    DocumentEditorDownloadAsEvent: typeof DocumentEditorDownloadAsEvent
    DocumentEditorErrorEvent: typeof DocumentEditorErrorEvent
    DocumentEditorInfoEvent: typeof DocumentEditorInfoEvent
    DocumentEditorMakeActionLinkEvent: typeof DocumentEditorMakeActionLinkEvent
    DocumentEditorMetaChangeEvent: typeof DocumentEditorMetaChangeEvent
    DocumentEditorOutdatedVersionEvent: typeof DocumentEditorOutdatedVersionEvent
    DocumentEditorPluginsReadyEvent: typeof DocumentEditorPluginsReadyEvent
    DocumentEditorReadyEvent: typeof DocumentEditorReadyEvent
    DocumentEditorRequestCloseEvent: typeof DocumentEditorRequestCloseEvent
    DocumentEditorRequestCompareFileEvent: typeof DocumentEditorRequestCompareFileEvent
    DocumentEditorRequestCreateNewEvent: typeof DocumentEditorRequestCreateNewEvent
    DocumentEditorRequestEditRightsEvent: typeof DocumentEditorRequestEditRightsEvent
    DocumentEditorRequestHistoryEvent: typeof DocumentEditorRequestHistoryEvent
    DocumentEditorRequestHistoryCloseEvent: typeof DocumentEditorRequestHistoryCloseEvent
    DocumentEditorRequestHistoryDataEvent: typeof DocumentEditorRequestHistoryDataEvent
    DocumentEditorRequestInsertImageEvent: typeof DocumentEditorRequestInsertImageEvent
    DocumentEditorRequestMailMergeRecipientsEvent: typeof DocumentEditorRequestMailMergeRecipientsEvent
    DocumentEditorRequestOpenEvent: typeof DocumentEditorRequestOpenEvent
    DocumentEditorRequestReferenceDataEvent: typeof DocumentEditorRequestReferenceDataEvent
    DocumentEditorRequestReferenceSourceEvent: typeof DocumentEditorRequestReferenceSourceEvent
    DocumentEditorRequestRenameEvent: typeof DocumentEditorRequestRenameEvent
    DocumentEditorRequestRestoreEvent: typeof DocumentEditorRequestRestoreEvent
    DocumentEditorRequestSaveAsEvent: typeof DocumentEditorRequestSaveAsEvent
    DocumentEditorRequestSelectDocumentEvent: typeof DocumentEditorRequestSelectDocumentEvent
    DocumentEditorRequestSelectSpreadsheetEvent: typeof DocumentEditorRequestSelectSpreadsheetEvent
    DocumentEditorRequestSendNotifyEvent: typeof DocumentEditorRequestSendNotifyEvent
    DocumentEditorRequestSharingSettingsEvent: typeof DocumentEditorRequestSharingSettingsEvent
    DocumentEditorRequestUsersEvent: typeof DocumentEditorRequestUsersEvent
    DocumentEditorWarningEvent: typeof DocumentEditorWarningEvent
  }

  interface HTMLElementTagNameMap {
    "document-editor": DocumentEditor
  }

  namespace preact {
    namespace JSX {
      interface IntrinsicElements {
        "document-editor": Partial<Omit<DocumentEditor, keyof HTMLElement>>
      }
    }
  }
}

function main(): void {
  if (window.customElements.get("document-editor")) {
    return
  }
  window.DocumentEditor = DocumentEditor
  window.customElements.define("document-editor", DocumentEditor)
  window.DocumentEditorAppReadyEvent = DocumentEditorAppReadyEvent
  window.DocumentEditorCollaborativeChangesEvent = DocumentEditorCollaborativeChangesEvent
  window.DocumentEditorDocumentReadyEvent = DocumentEditorDocumentReadyEvent
  window.DocumentEditorDocumentStateChangeEvent = DocumentEditorDocumentStateChangeEvent
  window.DocumentEditorDownloadAsEvent = DocumentEditorDownloadAsEvent
  window.DocumentEditorErrorEvent = DocumentEditorErrorEvent
  window.DocumentEditorInfoEvent = DocumentEditorInfoEvent
  window.DocumentEditorMakeActionLinkEvent = DocumentEditorMakeActionLinkEvent
  window.DocumentEditorMetaChangeEvent = DocumentEditorMetaChangeEvent
  window.DocumentEditorOutdatedVersionEvent = DocumentEditorOutdatedVersionEvent
  window.DocumentEditorPluginsReadyEvent = DocumentEditorPluginsReadyEvent
  window.DocumentEditorReadyEvent = DocumentEditorReadyEvent
  window.DocumentEditorRequestCloseEvent = DocumentEditorRequestCloseEvent
  window.DocumentEditorRequestCompareFileEvent = DocumentEditorRequestCompareFileEvent
  window.DocumentEditorRequestCreateNewEvent = DocumentEditorRequestCreateNewEvent
  window.DocumentEditorRequestEditRightsEvent = DocumentEditorRequestEditRightsEvent
  window.DocumentEditorRequestHistoryEvent = DocumentEditorRequestHistoryEvent
  window.DocumentEditorRequestHistoryCloseEvent = DocumentEditorRequestHistoryCloseEvent
  window.DocumentEditorRequestHistoryDataEvent = DocumentEditorRequestHistoryDataEvent
  window.DocumentEditorRequestInsertImageEvent = DocumentEditorRequestInsertImageEvent
  window.DocumentEditorRequestMailMergeRecipientsEvent = DocumentEditorRequestMailMergeRecipientsEvent
  window.DocumentEditorRequestOpenEvent = DocumentEditorRequestOpenEvent
  window.DocumentEditorRequestReferenceDataEvent = DocumentEditorRequestReferenceDataEvent
  window.DocumentEditorRequestReferenceSourceEvent = DocumentEditorRequestReferenceSourceEvent
  window.DocumentEditorRequestRenameEvent = DocumentEditorRequestRenameEvent
  window.DocumentEditorRequestRestoreEvent = DocumentEditorRequestRestoreEvent
  window.DocumentEditorRequestSaveAsEvent = DocumentEditorRequestSaveAsEvent
  window.DocumentEditorRequestSelectDocumentEvent = DocumentEditorRequestSelectDocumentEvent
  window.DocumentEditorRequestSelectSpreadsheetEvent = DocumentEditorRequestSelectSpreadsheetEvent
  window.DocumentEditorRequestSendNotifyEvent = DocumentEditorRequestSendNotifyEvent
  window.DocumentEditorRequestSharingSettingsEvent = DocumentEditorRequestSharingSettingsEvent
  window.DocumentEditorRequestUsersEvent = DocumentEditorRequestUsersEvent
  window.DocumentEditorWarningEvent = DocumentEditorWarningEvent
}

export interface DocumentEditor extends HTMLElement {
  onerror: DocumentEditorOnErrorEventHandler
  addEventListener<K extends keyof DocumentEditorEventMap>(type: K, listener: (this: DocumentEditor, ev: DocumentEditorEventMap[K]) => any, options?: boolean | AddEventListenerOptions): void
  addEventListener(type: string, listener: EventListenerOrEventListenerObject, options?: boolean | AddEventListenerOptions): void
  removeEventListener<K extends keyof DocumentEditorEventMap>(type: K, listener: (this: DocumentEditor, ev: DocumentEditorEventMap[K]) => any, options?: boolean | EventListenerOptions): void
  removeEventListener(type: string, listener: EventListenerOrEventListenerObject, options?: boolean | EventListenerOptions): void
}

export interface DocumentEditorEventMap extends HTMLElementEventMap {
  appready: DocumentEditorAppReadyEvent
  collaborativechanges: DocumentEditorCollaborativeChangesEvent
  documentready: DocumentEditorDocumentReadyEvent
  documentstatechange: DocumentEditorDocumentStateChangeEvent
  downloadas: DocumentEditorDownloadAsEvent
  error: DocumentEditorErrorEvent
  info: DocumentEditorInfoEvent
  makeactionlink: DocumentEditorMakeActionLinkEvent
  metachange: DocumentEditorMetaChangeEvent
  outdatedversion: DocumentEditorOutdatedVersionEvent
  pluginsready: DocumentEditorPluginsReadyEvent
  ready: DocumentEditorReadyEvent
  requestclose: DocumentEditorRequestCloseEvent
  requestcomparefile: DocumentEditorRequestCompareFileEvent
  requestcreatenew: DocumentEditorRequestCreateNewEvent
  requesteditrights: DocumentEditorRequestEditRightsEvent
  requesthistory: DocumentEditorRequestHistoryEvent
  requesthistoryclose: DocumentEditorRequestHistoryCloseEvent
  requesthistorydata: DocumentEditorRequestHistoryDataEvent
  requestinsertimage: DocumentEditorRequestInsertImageEvent
  requestmailmergerecipients: DocumentEditorRequestMailMergeRecipientsEvent
  requestopen: DocumentEditorRequestOpenEvent
  requestreferencedata: DocumentEditorRequestReferenceDataEvent
  requestreferencesource: DocumentEditorRequestReferenceSourceEvent
  requestrename: DocumentEditorRequestRenameEvent
  requestrestore: DocumentEditorRequestRestoreEvent
  requestsaveas: DocumentEditorRequestSaveAsEvent
  requestselectdocument: DocumentEditorRequestSelectDocumentEvent
  requestselectspreadsheet: DocumentEditorRequestSelectSpreadsheetEvent
  requestsendnotify: DocumentEditorRequestSendNotifyEvent
  requestsharingsettings: DocumentEditorRequestSharingSettingsEvent
  requestusers: DocumentEditorRequestUsersEvent
  warning: DocumentEditorWarningEvent
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onAppReady ONLYOFFICE Reference}
 */
export class DocumentEditorAppReadyEvent extends Event {}

export interface DocumentEditorAppReadyListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorAppReadyEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onCollaborativeChanges ONLYOFFICE Reference}
 */
export class DocumentEditorCollaborativeChangesEvent extends Event {}

export interface DocumentEditorCollaborativeChangesListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorCollaborativeChangesEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onDocumentReady ONLYOFFICE Reference}
 */
export class DocumentEditorDocumentReadyEvent extends Event {}

export interface DocumentEditorDocumentReadyListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorDocumentReadyEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onDocumentStateChange ONLYOFFICE Reference}
 */
export class DocumentEditorDocumentStateChangeEvent extends Event {
  #data: DocumentEditorDocumentStateChangeEventInit["data"]

  get data(): DocumentEditorDocumentStateChangeEventInit["data"] {
    return this.#data
  }

  constructor(type: string, eventInitDict: DocumentEditorDocumentStateChangeEventInit) {
    super(type, eventInitDict)
    this.#data = eventInitDict.data
  }
}

export interface DocumentEditorDocumentStateChangeEventInit extends EventInit, DocEditorDocumentStateChangeEvent {}

export interface DocumentEditorDocumentStateChangeListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorDocumentStateChangeEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onDownloadAs ONLYOFFICE Reference}
 */
export class DocumentEditorDownloadAsEvent extends Event {
  #data: DocumentEditorDownloadAsEventInit["data"]

  get data(): DocumentEditorDownloadAsEventInit["data"] {
    return this.#data
  }

  constructor(type: string, eventInitDict: DocumentEditorDownloadAsEventInit) {
    super(type, eventInitDict)
    this.#data = eventInitDict.data
  }
}

export interface DocumentEditorDownloadAsEventInit extends EventInit, DocEditorDocumentDownloadAsEvent {}

export interface DocumentEditorDownloadAsListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorDownloadAsEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onError ONLYOFFICE Reference}
 */
export class DocumentEditorErrorEvent extends ErrorEvent {
  #data?: DocumentEditorErrorEventInit["data"]

  get data(): DocumentEditorErrorEventInit["data"] | undefined {
    return this.#data
  }

  constructor(type: string, eventInitDict?: DocumentEditorErrorEventInit) {
    let o: DocumentEditorErrorEventInit = {}
    if (eventInitDict) {
      o = {...eventInitDict}
      if (o.error instanceof Error) {
        o.message = o.error.message
      }
    }
    super(type, o)
    if (o) {
      this.#data = o.data
    }
  }
}

export interface DocumentEditorErrorEventInit extends ErrorEventInit {
  data?: DocEditorErrorEvent["data"]
}

export interface DocumentEditorErrorListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorErrorEvent): void
}

export type DocumentEditorOnErrorEventHandler = DocumentEditorOnErrorEventHandlerNonNull | null

export interface DocumentEditorOnErrorEventHandlerNonNull extends OnErrorEventHandlerNonNull {
  (this: DocumentEditor, event: DocumentEditorErrorEvent | string, source?: string, lineno?: number, colno?: number, error?: Error): any
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onInfo ONLYOFFICE Reference}
 */
export class DocumentEditorInfoEvent extends Event {
  #data: DocumentEditorInfoEventInit["data"]

  get data(): DocumentEditorInfoEventInit["data"] {
    return this.#data
  }

  constructor(type: string, eventInitDict: DocumentEditorInfoEventInit) {
    super(type, eventInitDict)
    this.#data = eventInitDict.data
  }
}

export interface DocumentEditorInfoEventInit extends EventInit, DocEditorInfoEvent {}

export interface DocumentEditorInfoListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorInfoEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onMakeActionLink ONLYOFFICE Reference}
 */
export class DocumentEditorMakeActionLinkEvent extends Event {
  #data: DocumentEditorMakeActionLinkEventInit["data"]

  get data(): DocumentEditorMakeActionLinkEventInit["data"] {
    return this.#data
  }

  constructor(type: string, eventInitDict: DocumentEditorMakeActionLinkEventInit) {
    super(type, eventInitDict)
    this.#data = eventInitDict.data
  }
}

export interface DocumentEditorMakeActionLinkEventInit extends EventInit, DocEditorMakeActionLinkEvent {}

export interface DocumentEditorMakeActionLinkListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorMakeActionLinkEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onMetaChange ONLYOFFICE Reference}
 */
export class DocumentEditorMetaChangeEvent extends Event {
  #data: DocumentEditorMetaChangeEventInit["data"]

  get data(): DocumentEditorMetaChangeEventInit["data"] {
    return this.#data
  }

  constructor(type: string, eventInitDict: DocumentEditorMetaChangeEventInit) {
    super(type, eventInitDict)
    this.#data = eventInitDict.data
  }
}

export interface DocumentEditorMetaChangeEventInit extends EventInit, DocEditorMetaChangeEvent {}

export interface DocumentEditorMetaChangeListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorMetaChangeEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onOutdatedVersion ONLYOFFICE Reference}
 */
export class DocumentEditorOutdatedVersionEvent extends Event {}

export interface DocumentEditorOutdatedVersionListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorOutdatedVersionEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onPluginsReady ONLYOFFICE Reference}
 */
export class DocumentEditorPluginsReadyEvent extends Event {}

export interface DocumentEditorPluginsReadyListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorPluginsReadyEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onReady ONLYOFFICE Reference}
 * @deprecated Use {@link DocumentEditorAppReadyEvent} instead
 */
export class DocumentEditorReadyEvent extends Event {}

/**
 * @deprecated Use {@link DocumentEditorAppReadyListener} instead
 */
export interface DocumentEditorReadyListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorReadyEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestClose ONLYOFFICE Reference}
 */
export class DocumentEditorRequestCloseEvent extends Event {}

export interface DocumentEditorRequestCloseListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorRequestCloseEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestCompareFile ONLYOFFICE Reference}
 * @deprecated Prefer {@link DocumentEditorRequestSelectDocumentEvent} instead
 */
export class DocumentEditorRequestCompareFileEvent extends Event {}

/**
 * @deprecated Prefer {@link DocumentEditorRequestSelectDocumentListener} instead
 */
export interface DocumentEditorRequestCompareFileListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorRequestCompareFileEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestCreateNew ONLYOFFICE Reference}
 */
export class DocumentEditorRequestCreateNewEvent extends Event {}

export interface DocumentEditorRequestCreateNewListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorRequestCreateNewEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestEditRights ONLYOFFICE Reference}
 */
export class DocumentEditorRequestEditRightsEvent extends Event {}

export interface DocumentEditorRequestEditRightsListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorRequestEditRightsEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestHistory ONLYOFFICE Reference}
 */
export class DocumentEditorRequestHistoryEvent extends Event {}

export interface DocumentEditorRequestHistoryListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorRequestHistoryEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestHistoryClose ONLYOFFICE Reference}
 */
export class DocumentEditorRequestHistoryCloseEvent extends Event {}

export interface DocumentEditorRequestHistoryCloseListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorRequestHistoryCloseEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestHistoryData ONLYOFFICE Reference}
 */
export class DocumentEditorRequestHistoryDataEvent extends Event {
  #data: DocumentEditorRequestHistoryDataEventInit["data"]

  get data(): DocumentEditorRequestHistoryDataEventInit["data"] {
    return this.#data
  }

  constructor(type: string, eventInitDict: DocumentEditorRequestHistoryDataEventInit) {
    super(type, eventInitDict)
    this.#data = eventInitDict.data
  }
}

export interface DocumentEditorRequestHistoryDataEventInit extends EventInit, DocEditorRequestHistoryDataEvent {}

export interface DocumentEditorRequestHistoryDataListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorRequestHistoryDataEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestInsertImage ONLYOFFICE Reference}
 */
export class DocumentEditorRequestInsertImageEvent extends Event {
  #data: DocumentEditorRequestInsertImageEventInit["data"]

  get data(): DocumentEditorRequestInsertImageEventInit["data"] {
    return this.#data
  }

  constructor(type: string, eventInitDict: DocumentEditorRequestInsertImageEventInit) {
    super(type, eventInitDict)
    this.#data = eventInitDict.data
  }
}

export interface DocumentEditorRequestInsertImageEventInit extends EventInit, DocEditorRequestInsertImageEvent {}

export interface DocumentEditorRequestInsertImageListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorRequestInsertImageEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestMailMergeRecipients ONLYOFFICE Reference}
 * @deprecated Prefer {@link DocumentEditorRequestSelectSpreadsheetEvent} instead.
 */
export class DocumentEditorRequestMailMergeRecipientsEvent extends Event {}

/**
 * @deprecated Prefer {@link DocumentEditorRequestSelectSpreadsheetListener} instead.
 */
export interface DocumentEditorRequestMailMergeRecipientsListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorRequestMailMergeRecipientsEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestOpen ONLYOFFICE Reference}
 */
export class DocumentEditorRequestOpenEvent extends Event {
  #data: DocumentEditorRequestOpenEventInit["data"]

  get data(): DocumentEditorRequestOpenEventInit["data"] {
    return this.#data
  }

  constructor(type: string, eventInitDict: DocumentEditorRequestOpenEventInit) {
    super(type, eventInitDict)
    this.#data = eventInitDict.data
  }
}

export interface DocumentEditorRequestOpenEventInit extends EventInit, DocEditorRequestOpenEvent {}

export interface DocumentEditorRequestOpenListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorRequestOpenEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestReferenceData ONLYOFFICE Reference}
 */
export class DocumentEditorRequestReferenceDataEvent extends Event {
  #data: DocumentEditorRequestReferenceDataEventInit["data"]

  get data(): DocumentEditorRequestReferenceDataEventInit["data"] {
    return this.#data
  }

  constructor(type: string, eventInitDict: DocumentEditorRequestReferenceDataEventInit) {
    super(type, eventInitDict)
    this.#data = eventInitDict.data
  }
}

export interface DocumentEditorRequestReferenceDataEventInit extends EventInit, DocEditorRequestReferenceDataEvent {}

export interface DocumentEditorRequestReferenceDataListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorRequestReferenceDataEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestReferenceSource ONLYOFFICE Reference}
 */
export class DocumentEditorRequestReferenceSourceEvent extends Event {
  #data: DocumentEditorRequestReferenceSourceEventInit["data"]

  get data(): DocumentEditorRequestReferenceSourceEventInit["data"] {
    return this.#data
  }

  constructor(type: string, eventInitDict: DocumentEditorRequestReferenceSourceEventInit) {
    super(type, eventInitDict)
    this.#data = eventInitDict.data
  }
}

export interface DocumentEditorRequestReferenceSourceEventInit extends EventInit, DocEditorRequestReferenceSourceEvent {}

export interface DocumentEditorRequestReferenceSourceListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorRequestReferenceSourceEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestRename ONLYOFFICE Reference}
 */
export class DocumentEditorRequestRenameEvent extends Event {
  #data: DocumentEditorRequestRenameEventInit["data"]

  get data(): DocumentEditorRequestRenameEventInit["data"] {
    return this.#data
  }

  constructor(type: string, eventInitDict: DocumentEditorRequestRenameEventInit) {
    super(type, eventInitDict)
    this.#data = eventInitDict.data
  }
}

export interface DocumentEditorRequestRenameEventInit extends EventInit, DocEditorRequestRenameEvent {}

export interface DocumentEditorRequestRenameListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorRequestRenameEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestRestore ONLYOFFICE Reference}
 */
export class DocumentEditorRequestRestoreEvent extends Event {
  #data: DocumentEditorRequestRestoreEventInit["data"]

  get data(): DocumentEditorRequestRestoreEventInit["data"] {
    return this.#data
  }

  constructor(type: string, eventInitDict: DocumentEditorRequestRestoreEventInit) {
    super(type, eventInitDict)
    this.#data = eventInitDict.data
  }
}

export interface DocumentEditorRequestRestoreEventInit extends EventInit, DocEditorRequestRestoreEvent {}

export interface DocumentEditorRequestRestoreListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorRequestRestoreEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestSaveAs ONLYOFFICE Reference}
 */
export class DocumentEditorRequestSaveAsEvent extends Event {
  #data: DocumentEditorRequestSaveAsEventInit["data"]

  get data(): DocumentEditorRequestSaveAsEventInit["data"] {
    return this.#data
  }

  constructor(type: string, eventInitDict: DocumentEditorRequestSaveAsEventInit) {
    super(type, eventInitDict)
    this.#data = eventInitDict.data
  }
}

export interface DocumentEditorRequestSaveAsEventInit extends EventInit, DocEditorRequestSaveAsEvent {}

export interface DocumentEditorRequestSaveAsListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorRequestSaveAsEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestSelectDocument ONLYOFFICE Reference}
 */
export class DocumentEditorRequestSelectDocumentEvent extends Event {
  #data: DocumentEditorRequestSelectDocumentEventInit["data"]

  get data(): DocumentEditorRequestSelectDocumentEventInit["data"] {
    return this.#data
  }

  constructor(type: string, eventInitDict: DocumentEditorRequestSelectDocumentEventInit) {
    super(type, eventInitDict)
    this.#data = eventInitDict.data
  }
}

export interface DocumentEditorRequestSelectDocumentEventInit extends EventInit, DocEditorRequestSelectDocumentEvent {}

export interface DocumentEditorRequestSelectDocumentListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorRequestSelectDocumentEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestSelectSpreadsheet ONLYOFFICE Reference}
 */
export class DocumentEditorRequestSelectSpreadsheetEvent extends Event {
  #data: DocumentEditorRequestSelectSpreadsheetEventInit["data"]

  get data(): DocumentEditorRequestSelectSpreadsheetEventInit["data"] {
    return this.#data
  }

  constructor(type: string, eventInitDict: DocumentEditorRequestSelectSpreadsheetEventInit) {
    super(type, eventInitDict)
    this.#data = eventInitDict.data
  }
}

export interface DocumentEditorRequestSelectSpreadsheetEventInit extends EventInit, DocEditorRequestSelectSpreadsheetEvent {}

export interface DocumentEditorRequestSelectSpreadsheetListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorRequestSelectSpreadsheetEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestSendNotify ONLYOFFICE Reference}
 */
export class DocumentEditorRequestSendNotifyEvent extends Event {
  #data: DocumentEditorRequestSendNotifyEventInit["data"]

  get data(): DocumentEditorRequestSendNotifyEventInit["data"] {
    return this.#data
  }

  constructor(type: string, eventInitDict: DocumentEditorRequestSendNotifyEventInit) {
    super(type, eventInitDict)
    this.#data = eventInitDict.data
  }
}

export interface DocumentEditorRequestSendNotifyEventInit extends EventInit, DocEditorRequestSendNotifyEvent {}

export interface DocumentEditorRequestSendNotifyListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorRequestSendNotifyEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestSharingSettings ONLYOFFICE Reference}
 */
export class DocumentEditorRequestSharingSettingsEvent extends Event {}

export interface DocumentEditorRequestSharingSettingsListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorRequestSharingSettingsEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestUsers ONLYOFFICE Reference}
 */
export class DocumentEditorRequestUsersEvent extends Event {
  #data: DocumentEditorRequestUsersEventInit["data"]

  get data(): DocumentEditorRequestUsersEventInit["data"] {
    return this.#data
  }

  constructor(type: string, eventInitDict: DocumentEditorRequestUsersEventInit) {
    super(type, eventInitDict)
    this.#data = eventInitDict.data
  }
}

export interface DocumentEditorRequestUsersEventInit extends EventInit, DocEditorRequestUsersEvent {}

export interface DocumentEditorRequestUsersListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorRequestUsersEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onWarning ONLYOFFICE Reference}
 */
export class DocumentEditorWarningEvent extends ErrorEvent {
  #data?: DocumentEditorWarningEventInit["data"]

  get data(): DocumentEditorWarningEventInit["data"] | undefined {
    return this.#data
  }

  constructor(type: string, eventInitDict?: DocumentEditorWarningEventInit) {
    let o: DocumentEditorWarningEventInit = {}
    if (eventInitDict) {
      o = {...eventInitDict}
      if (o.error instanceof Error) {
        o.message = o.error.message
      }
    }
    super(type, o)
    if (o) {
      this.#data = o.data
    }
  }
}

export interface DocumentEditorWarningEventInit extends ErrorEventInit {
  data?: DocEditorWarningEvent["data"]
}

export interface DocumentEditorWarningListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorWarningEvent): void
}

export type DocumentEditorConfig = Omit<DocEditorConfig, "events">

export class DocumentEditor extends HTMLElement {
  #documentServerURL: string = ""

  get documentServerURL(): string {
    return this.#documentServerURL
  }

  set documentServerURL(u: string) {
    this.#documentServerURL = u
  }

  #config: DocumentEditorConfig | null = null

  get config(): DocumentEditorConfig | null {
    return this.#config
  }

  set config(c: DocumentEditorConfig | null) {
    this.#config = c
  }

  #editor: DocEditor | null = null

  get editor(): DocEditor | null {
    return this.#editor
  }

  #onAppReady: DocumentEditorAppReadyListener | null = null

  get onAppReady(): DocumentEditorAppReadyListener | null {
    return this.#onAppReady
  }

  set onAppReady(l: DocumentEditorAppReadyListener | null) {
    if (this.#onAppReady) {
      this.removeEventListener("appready", this.#onAppReady)
    }
    this.#onAppReady = l
    if (this.#onAppReady) {
      this.addEventListener("appready", this.#onAppReady)
    }
  }

  #onCollaborativeChanges: DocumentEditorCollaborativeChangesListener | null = null

  get onCollaborativeChanges(): DocumentEditorCollaborativeChangesListener | null {
    return this.#onCollaborativeChanges
  }

  set onCollaborativeChanges(l: DocumentEditorCollaborativeChangesListener | null) {
    if (this.#onCollaborativeChanges) {
      this.removeEventListener("collaborativechanges", this.#onCollaborativeChanges)
    }
    this.#onCollaborativeChanges = l
    if (this.#onCollaborativeChanges) {
      this.addEventListener("collaborativechanges", this.#onCollaborativeChanges)
    }
  }

  #onDocumentReady: DocumentEditorDocumentReadyListener | null = null

  get onDocumentReady(): DocumentEditorDocumentReadyListener | null {
    return this.#onDocumentReady
  }

  set onDocumentReady(l: DocumentEditorDocumentReadyListener | null) {
    if (this.#onDocumentReady) {
      this.removeEventListener("documentready", this.#onDocumentReady)
    }
    this.#onDocumentReady = l
    if (this.#onDocumentReady) {
      this.addEventListener("documentready", this.#onDocumentReady)
    }
  }

  #onDocumentStateChange: DocumentEditorDocumentStateChangeListener | null = null

  get onDocumentStateChange(): DocumentEditorDocumentStateChangeListener | null {
    return this.#onDocumentStateChange
  }

  set onDocumentStateChange(l: DocumentEditorDocumentStateChangeListener | null) {
    if (this.#onDocumentStateChange) {
      this.removeEventListener("documentstatechange", this.#onDocumentStateChange)
    }
    this.#onDocumentStateChange = l
    if (this.#onDocumentStateChange) {
      this.addEventListener("documentstatechange", this.#onDocumentStateChange)
    }
  }

  #onDownloadAs: DocumentEditorDownloadAsListener | null = null

  get onDownloadAs(): DocumentEditorDownloadAsListener | null {
    return this.#onDownloadAs
  }

  set onDownloadAs(l: DocumentEditorDownloadAsListener | null) {
    if (this.#onDownloadAs) {
      this.removeEventListener("downloadas", this.#onDownloadAs)
    }
    this.#onDownloadAs = l
    if (this.#onDownloadAs) {
      this.addEventListener("downloadas", this.#onDownloadAs)
    }
  }

  #onError: DocumentEditorErrorListener | null = null

  get onError(): DocumentEditorErrorListener | null {
    return this.#onError
  }

  set onError(l: DocumentEditorErrorListener | null) {
    if (this.#onError) {
      this.removeEventListener("error", this.#onError)
    }
    this.#onError = l
    if (this.#onError) {
      this.addEventListener("error", this.#onError)
    }
  }

  #onInfo: DocumentEditorInfoListener | null = null

  get onInfo(): DocumentEditorInfoListener | null {
    return this.#onInfo
  }

  set onInfo(l: DocumentEditorInfoListener | null) {
    if (this.#onInfo) {
      this.removeEventListener("info", this.#onInfo)
    }
    this.#onInfo = l
    if (this.#onInfo) {
      this.addEventListener("info", this.#onInfo)
    }
  }

  #onMakeActionLink: DocumentEditorMakeActionLinkListener | null = null

  get onMakeActionLink(): DocumentEditorMakeActionLinkListener | null {
    return this.#onMakeActionLink
  }

  set onMakeActionLink(l: DocumentEditorMakeActionLinkListener | null) {
    if (this.#onMakeActionLink) {
      this.removeEventListener("makeactionlink", this.#onMakeActionLink)
    }
    this.#onMakeActionLink = l
    if (this.#onMakeActionLink) {
      this.addEventListener("makeactionlink", this.#onMakeActionLink)
    }
  }

  #onMetaChange: DocumentEditorMetaChangeListener | null = null

  get onMetaChange(): DocumentEditorMetaChangeListener | null {
    return this.#onMetaChange
  }

  set onMetaChange(l: DocumentEditorMetaChangeListener | null) {
    if (this.#onMetaChange) {
      this.removeEventListener("metachange", this.#onMetaChange)
    }
    this.#onMetaChange = l
    if (this.#onMetaChange) {
      this.addEventListener("metachange", this.#onMetaChange)
    }
  }

  #onOutdatedVersion: DocumentEditorOutdatedVersionListener | null = null

  get onOutdatedVersion(): DocumentEditorOutdatedVersionListener | null {
    return this.#onOutdatedVersion
  }

  set onOutdatedVersion(l: DocumentEditorOutdatedVersionListener | null) {
    if (this.#onOutdatedVersion) {
      this.removeEventListener("outdatedversion", this.#onOutdatedVersion)
    }
    this.#onOutdatedVersion = l
    if (this.#onOutdatedVersion) {
      this.addEventListener("outdatedversion", this.#onOutdatedVersion)
    }
  }

  #onPluginsReady: DocumentEditorPluginsReadyListener | null = null

  get onPluginsReady(): DocumentEditorPluginsReadyListener | null {
    return this.#onPluginsReady
  }

  set onPluginsReady(l: DocumentEditorPluginsReadyListener | null) {
    if (this.#onPluginsReady) {
      this.removeEventListener("pluginsready", this.#onPluginsReady)
    }
    this.#onPluginsReady = l
    if (this.#onPluginsReady) {
      this.addEventListener("pluginsready", this.#onPluginsReady)
    }
  }

  /**
   * @deprecated Prefer {@link onAppReady} instead.
   */
  #onReady: DocumentEditorReadyListener | null = null

  /**
   * @deprecated Prefer {@link onAppReady} instead.
   */
  get onReady(): DocumentEditorReadyListener | null {
    return this.#onReady
  }

  /**
   * @deprecated Prefer {@link onAppReady} instead.
   */
  set onReady(l: DocumentEditorReadyListener | null) {
    if (this.#onReady) {
      this.removeEventListener("ready", this.#onReady)
    }
    this.#onReady = l
    if (this.#onReady) {
      this.addEventListener("ready", this.#onReady)
    }
  }

  #onRequestClose: DocumentEditorRequestCloseListener | null = null

  get onRequestClose(): DocumentEditorRequestCloseListener | null {
    return this.#onRequestClose
  }

  set onRequestClose(l: DocumentEditorRequestCloseListener | null) {
    if (this.#onRequestClose) {
      this.removeEventListener("requestclose", this.#onRequestClose)
    }
    this.#onRequestClose = l
    if (this.#onRequestClose) {
      this.addEventListener("requestclose", this.#onRequestClose)
    }
  }

  #onRequestCompareFile: DocumentEditorRequestCompareFileListener | null = null

  get onRequestCompareFile(): DocumentEditorRequestCompareFileListener | null {
    return this.#onRequestCompareFile
  }

  set onRequestCompareFile(l: DocumentEditorRequestCompareFileListener | null) {
    if (this.#onRequestCompareFile) {
      this.removeEventListener("requestcomparefile", this.#onRequestCompareFile)
    }
    this.#onRequestCompareFile = l
    if (this.#onRequestCompareFile) {
      this.addEventListener("requestcomparefile", this.#onRequestCompareFile)
    }
  }

  #onRequestCreateNew: DocumentEditorRequestCreateNewListener | null = null

  get onRequestCreateNew(): DocumentEditorRequestCreateNewListener | null {
    return this.#onRequestCreateNew
  }

  set onRequestCreateNew(l: DocumentEditorRequestCreateNewListener | null) {
    if (this.#onRequestCreateNew) {
      this.removeEventListener("requestcreatenew", this.#onRequestCreateNew)
    }
    this.#onRequestCreateNew = l
    if (this.#onRequestCreateNew) {
      this.addEventListener("requestcreatenew", this.#onRequestCreateNew)
    }
  }

  #onRequestEditRights: DocumentEditorRequestEditRightsListener | null = null

  get onRequestEditRights(): DocumentEditorRequestEditRightsListener | null {
    return this.#onRequestEditRights
  }

  set onRequestEditRights(l: DocumentEditorRequestEditRightsListener | null) {
    if (this.#onRequestEditRights) {
      this.removeEventListener("requesteditrights", this.#onRequestEditRights)
    }
    this.#onRequestEditRights = l
    if (this.#onRequestEditRights) {
      this.addEventListener("requesteditrights", this.#onRequestEditRights)
    }
  }

  #onRequestHistory: DocumentEditorRequestHistoryListener | null = null

  get onRequestHistory(): DocumentEditorRequestHistoryListener | null {
    return this.#onRequestHistory
  }

  set onRequestHistory(l: DocumentEditorRequestHistoryListener | null) {
    if (this.#onRequestHistory) {
      this.removeEventListener("requesthistory", this.#onRequestHistory)
    }
    this.#onRequestHistory = l
    if (this.#onRequestHistory) {
      this.addEventListener("requesthistory", this.#onRequestHistory)
    }
  }

  #onRequestHistoryClose: DocumentEditorRequestHistoryCloseListener | null = null

  get onRequestHistoryClose(): DocumentEditorRequestHistoryCloseListener | null {
    return this.#onRequestHistoryClose
  }

  set onRequestHistoryClose(l: DocumentEditorRequestHistoryCloseListener | null) {
    if (this.#onRequestHistoryClose) {
      this.removeEventListener("requesthistoryclose", this.#onRequestHistoryClose)
    }
    this.#onRequestHistoryClose = l
    if (this.#onRequestHistoryClose) {
      this.addEventListener("requesthistoryclose", this.#onRequestHistoryClose)
    }
  }

  #onRequestHistoryData: DocumentEditorRequestHistoryDataListener | null = null

  get onRequestHistoryData(): DocumentEditorRequestHistoryDataListener | null {
    return this.#onRequestHistoryData
  }

  set onRequestHistoryData(l: DocumentEditorRequestHistoryDataListener | null) {
    if (this.#onRequestHistoryData) {
      this.removeEventListener("requesthistorydata", this.#onRequestHistoryData)
    }
    this.#onRequestHistoryData = l
    if (this.#onRequestHistoryData) {
      this.addEventListener("requesthistorydata", this.#onRequestHistoryData)
    }
  }

  #onRequestInsertImage: DocumentEditorRequestInsertImageListener | null = null

  get onRequestInsertImage(): DocumentEditorRequestInsertImageListener | null {
    return this.#onRequestInsertImage
  }

  set onRequestInsertImage(l: DocumentEditorRequestInsertImageListener | null) {
    if (this.#onRequestInsertImage) {
      this.removeEventListener("requestinsertimage", this.#onRequestInsertImage)
    }
    this.#onRequestInsertImage = l
    if (this.#onRequestInsertImage) {
      this.addEventListener("requestinsertimage", this.#onRequestInsertImage)
    }
  }

  /**
   * @deprecated Prefer {@link onRequestSelectSpreadsheet} instead.
   */
  #onRequestMailMergeRecipients: DocumentEditorRequestMailMergeRecipientsListener | null = null

  /**
   * @deprecated Prefer {@link onRequestSelectSpreadsheet} instead.
   */
  get onRequestMailMergeRecipients(): DocumentEditorRequestMailMergeRecipientsListener | null {
    return this.#onRequestMailMergeRecipients
  }

  /**
   * @deprecated Prefer {@link onRequestSelectSpreadsheet} instead.
   */
  set onRequestMailMergeRecipients(l: DocumentEditorRequestMailMergeRecipientsListener | null) {
    if (this.#onRequestMailMergeRecipients) {
      this.removeEventListener("requestmailmergerecipients", this.#onRequestMailMergeRecipients)
    }
    this.#onRequestMailMergeRecipients = l
    if (this.#onRequestMailMergeRecipients) {
      this.addEventListener("requestmailmergerecipients", this.#onRequestMailMergeRecipients)
    }
  }

  #onRequestOpen: DocumentEditorRequestOpenListener | null = null

  get onRequestOpen(): DocumentEditorRequestOpenListener | null {
    return this.#onRequestOpen
  }

  set onRequestOpen(l: DocumentEditorRequestOpenListener | null) {
    if (this.#onRequestOpen) {
      this.removeEventListener("requestopen", this.#onRequestOpen)
    }
    this.#onRequestOpen = l
    if (this.#onRequestOpen) {
      this.addEventListener("requestopen", this.#onRequestOpen)
    }
  }

  #onRequestReferenceData: DocumentEditorRequestReferenceDataListener | null = null

  get onRequestReferenceData(): DocumentEditorRequestReferenceDataListener | null {
    return this.#onRequestReferenceData
  }

  set onRequestReferenceData(l: DocumentEditorRequestReferenceDataListener | null) {
    if (this.#onRequestReferenceData) {
      this.removeEventListener("requestreferencedata", this.#onRequestReferenceData)
    }
    this.#onRequestReferenceData = l
    if (this.#onRequestReferenceData) {
      this.addEventListener("requestreferencedata", this.#onRequestReferenceData)
    }
  }

  #onRequestReferenceSource: DocumentEditorRequestReferenceSourceListener | null = null

  get onRequestReferenceSource(): DocumentEditorRequestReferenceSourceListener | null {
    return this.#onRequestReferenceSource
  }

  set onRequestReferenceSource(l: DocumentEditorRequestReferenceSourceListener | null) {
    if (this.#onRequestReferenceSource) {
      this.removeEventListener("requestreferencesource", this.#onRequestReferenceSource)
    }
    this.#onRequestReferenceSource = l
    if (this.#onRequestReferenceSource) {
      this.addEventListener("requestreferencesource", this.#onRequestReferenceSource)
    }
  }

  #onRequestRename: DocumentEditorRequestRenameListener | null = null

  get onRequestRename(): DocumentEditorRequestRenameListener | null {
    return this.#onRequestRename
  }

  set onRequestRename(l: DocumentEditorRequestRenameListener | null) {
    if (this.#onRequestRename) {
      this.removeEventListener("requestrename", this.#onRequestRename)
    }
    this.#onRequestRename = l
    if (this.#onRequestRename) {
      this.addEventListener("requestrename", this.#onRequestRename)
    }
  }

  #onRequestRestore: DocumentEditorRequestRestoreListener | null = null

  get onRequestRestore(): DocumentEditorRequestRestoreListener | null {
    return this.#onRequestRestore
  }

  set onRequestRestore(l: DocumentEditorRequestRestoreListener | null) {
    if (this.#onRequestRestore) {
      this.removeEventListener("requestrestore", this.#onRequestRestore)
    }
    this.#onRequestRestore = l
    if (this.#onRequestRestore) {
      this.addEventListener("requestrestore", this.#onRequestRestore)
    }
  }

  #onRequestSaveAs: DocumentEditorRequestSaveAsListener | null = null

  get onRequestSaveAs(): DocumentEditorRequestSaveAsListener | null {
    return this.#onRequestSaveAs
  }

  set onRequestSaveAs(l: DocumentEditorRequestSaveAsListener | null) {
    if (this.#onRequestSaveAs) {
      this.removeEventListener("requestsaveas", this.#onRequestSaveAs)
    }
    this.#onRequestSaveAs = l
    if (this.#onRequestSaveAs) {
      this.addEventListener("requestsaveas", this.#onRequestSaveAs)
    }
  }

  #onRequestSelectDocument: DocumentEditorRequestSelectDocumentListener | null = null

  get onRequestSelectDocument(): DocumentEditorRequestSelectDocumentListener | null {
    return this.#onRequestSelectDocument
  }

  set onRequestSelectDocument(l: DocumentEditorRequestSelectDocumentListener | null) {
    if (this.#onRequestSelectDocument) {
      this.removeEventListener("requestselectdocument", this.#onRequestSelectDocument)
    }
    this.#onRequestSelectDocument = l
    if (this.#onRequestSelectDocument) {
      this.addEventListener("requestselectdocument", this.#onRequestSelectDocument)
    }
  }

  #onRequestSelectSpreadsheet: DocumentEditorRequestSelectSpreadsheetListener | null = null

  get onRequestSelectSpreadsheet(): DocumentEditorRequestSelectSpreadsheetListener | null {
    return this.#onRequestSelectSpreadsheet
  }

  set onRequestSelectSpreadsheet(l: DocumentEditorRequestSelectSpreadsheetListener | null) {
    if (this.#onRequestSelectSpreadsheet) {
      this.removeEventListener("requestselectspreadsheet", this.#onRequestSelectSpreadsheet)
    }
    this.#onRequestSelectSpreadsheet = l
    if (this.#onRequestSelectSpreadsheet) {
      this.addEventListener("requestselectspreadsheet", this.#onRequestSelectSpreadsheet)
    }
  }

  #onRequestSendNotify: DocumentEditorRequestSendNotifyListener | null = null

  get onRequestSendNotify(): DocumentEditorRequestSendNotifyListener | null {
    return this.#onRequestSendNotify
  }

  set onRequestSendNotify(l: DocumentEditorRequestSendNotifyListener | null) {
    if (this.#onRequestSendNotify) {
      this.removeEventListener("requestsendnotify", this.#onRequestSendNotify)
    }
    this.#onRequestSendNotify = l
    if (this.#onRequestSendNotify) {
      this.addEventListener("requestsendnotify", this.#onRequestSendNotify)
    }
  }

  #onRequestSharingSettings: DocumentEditorRequestSharingSettingsListener | null = null

  get onRequestSharingSettings(): DocumentEditorRequestSharingSettingsListener | null {
    return this.#onRequestSharingSettings
  }

  set onRequestSharingSettings(l: DocumentEditorRequestSharingSettingsListener | null) {
    if (this.#onRequestSharingSettings) {
      this.removeEventListener("requestsharingsettings", this.#onRequestSharingSettings)
    }
    this.#onRequestSharingSettings = l
    if (this.#onRequestSharingSettings) {
      this.addEventListener("requestsharingsettings", this.#onRequestSharingSettings)
    }
  }

  #onRequestUsers: DocumentEditorRequestUsersListener | null = null

  get onRequestUsers(): DocumentEditorRequestUsersListener | null {
    return this.#onRequestUsers
  }

  set onRequestUsers(l: DocumentEditorRequestUsersListener | null) {
    if (this.#onRequestUsers) {
      this.removeEventListener("requestusers", this.#onRequestUsers)
    }
    this.#onRequestUsers = l
    if (this.#onRequestUsers) {
      this.addEventListener("requestusers", this.#onRequestUsers)
    }
  }

  #onWarning: DocumentEditorWarningListener | null = null

  get onWarning(): DocumentEditorWarningListener | null {
    return this.#onWarning
  }

  set onWarning(l: DocumentEditorWarningListener | null) {
    if (this.#onWarning) {
      this.removeEventListener("warning", this.#onWarning)
    }
    this.#onWarning = l
    if (this.#onWarning) {
      this.addEventListener("warning", this.#onWarning)
    }
  }

  static get observedAttributes(): string[] {
    return [
      "document-server-url",
      "config",
      "onappready",
      "oncollaborativechanges",
      "ondocumentready",
      "ondocumentstatechange",
      "ondownloadas",
      "oninfo",
      "onmakeactionlink",
      "onmetachange",
      "onoutdatedversion",
      "onpluginsready",
      "onready",
      "onrequestclose",
      "onrequestcomparefile",
      "onrequestcreatenew",
      "onrequesteditrights",
      "onrequesthistory",
      "onrequesthistoryclose",
      "onrequesthistorydata",
      "onrequestinsertimage",
      "onrequestmailmergerecipients",
      "onrequestopen",
      "onrequestreferencedata",
      "onrequestreferencesource",
      "onrequestrename",
      "onrequestrestore",
      "onrequestsaveas",
      "onrequestselectdocument",
      "onrequestselectspreadsheet",
      "onrequestsendnotify",
      "onrequestsharingsettings",
      "onrequestusers",
      "onwarning"
    ]
  }

  attributeChangedCallback(n: string, _: string, v: string): void {
    switch (n) {
    case "document-server-url":
      this.documentServerURL = v
      break
    case "config":
      this.config = JSON.parse(v) as DocumentEditorConfig
      break
    case "onappready":
      this.onAppReady = new Function("event", v) as DocumentEditorAppReadyListener
      break
    case "oncollaborativechanges":
      this.onCollaborativeChanges = new Function("event", v) as DocumentEditorCollaborativeChangesListener
      break
    case "ondocumentready":
      this.onDocumentReady = new Function("event", v) as DocumentEditorDocumentReadyListener
      break
    case "ondocumentstatechange":
      this.onDocumentStateChange = new Function("event", v) as DocumentEditorDocumentStateChangeListener
      break
    case "ondownloadas":
      this.onDownloadAs = new Function("event", v) as DocumentEditorDownloadAsListener
      break
    case "oninfo":
      this.onInfo = new Function("event", v) as DocumentEditorInfoListener
      break
    case "onmakeactionlink":
      this.onMakeActionLink = new Function("event", v) as DocumentEditorMakeActionLinkListener
      break
    case "onmetachange":
      this.onMetaChange = new Function("event", v) as DocumentEditorMetaChangeListener
      break
    case "onoutdatedversion":
      this.onOutdatedVersion = new Function("event", v) as DocumentEditorOutdatedVersionListener
      break
    case "onpluginsready":
      this.onPluginsReady = new Function("event", v) as DocumentEditorPluginsReadyListener
      break
    case "onready":
      this.onReady = new Function("event", v) as DocumentEditorReadyListener
      break
    case "onrequestclose":
      this.onRequestClose = new Function("event", v) as DocumentEditorRequestCloseListener
      break
    case "onrequestcomparefile":
      this.onRequestCompareFile = new Function("event", v) as DocumentEditorRequestCompareFileListener
      break
    case "onrequestcreatenew":
      this.onRequestCreateNew = new Function("event", v) as DocumentEditorRequestCreateNewListener
      break
    case "onrequesteditrights":
      this.onRequestEditRights = new Function("event", v) as DocumentEditorRequestEditRightsListener
      break
    case "onrequesthistory":
      this.onRequestHistory = new Function("event", v) as DocumentEditorRequestHistoryListener
      break
    case "onrequesthistoryclose":
      this.onRequestHistoryClose = new Function("event", v) as DocumentEditorRequestHistoryCloseListener
      break
    case "onrequesthistorydata":
      this.onRequestHistoryData = new Function("event", v) as DocumentEditorRequestHistoryDataListener
      break
    case "onrequestinsertimage":
      this.onRequestInsertImage = new Function("event", v) as DocumentEditorRequestInsertImageListener
      break
    case "onrequestmailmergerecipients":
      this.onRequestMailMergeRecipients = new Function("event", v) as DocumentEditorRequestMailMergeRecipientsListener
      break
    case "onrequestopen":
      this.onRequestOpen = new Function("event", v) as DocumentEditorRequestOpenListener
      break
    case "onrequestreferencedata":
      this.onRequestReferenceData = new Function("event", v) as DocumentEditorRequestReferenceDataListener
      break
    case "onrequestreferencesource":
      this.onRequestReferenceSource = new Function("event", v) as DocumentEditorRequestReferenceSourceListener
      break
    case "onrequestrename":
      this.onRequestRename = new Function("event", v) as DocumentEditorRequestRenameListener
      break
    case "onrequestrestore":
      this.onRequestRestore = new Function("event", v) as DocumentEditorRequestRestoreListener
      break
    case "onrequestsaveas":
      this.onRequestSaveAs = new Function("event", v) as DocumentEditorRequestSaveAsListener
      break
    case "onrequestselectdocument":
      this.onRequestSelectDocument = new Function("event", v) as DocumentEditorRequestSelectDocumentListener
      break
    case "onrequestselectspreadsheet":
      this.onRequestSelectSpreadsheet = new Function("event", v) as DocumentEditorRequestSelectSpreadsheetListener
      break
    case "onrequestsendnotify":
      this.onRequestSendNotify = new Function("event", v) as DocumentEditorRequestSendNotifyListener
      break
    case "onrequestsharingsettings":
      this.onRequestSharingSettings = new Function("event", v) as DocumentEditorRequestSharingSettingsListener
      break
    case "onrequestusers":
      this.onRequestUsers = new Function("event", v) as DocumentEditorRequestUsersListener
      break
    case "onwarning":
      this.onWarning = new Function("event", v) as DocumentEditorWarningListener
      break
    default:
      throw new Error(`The attribute '${n}' is not supported`)
    }
  }

  connectedCallback(): void {
    try {
      const p = this.#createPlaceholder()
      const s = this.#createScript(p)
      this.append(p, s)
    } catch (error) {
      const e = new DocumentEditorErrorEvent("error", {error})
      this.dispatchEvent(e)
    }
  }

  #createPlaceholder(): HTMLElement {
    const e = document.createElement("div")
    e.id = this.#placeholderID()
    e.textContent = "Waiting for the Document Editor API to load..."
    e.style.border = "0"
    e.style.clipPath = "rect(0, 0, 0, 0)"
    e.style.height = "1px"
    e.style.overflow = "hidden"
    e.style.overflowWrap = "normal"
    e.style.padding = "0"
    e.style.position = "absolute"
    e.style.width = "1px"
    return e
  }

  #placeholderID(): string {
    let id = "placeholder"
    if (this.id !== "") {
      id = `${this.id}${id}`
    }
    return id
  }

  #createScript(p: HTMLElement): HTMLScriptElement {
    const u = this.#scriptSource()
    const c = this.#scriptConfig()
    const s = document.createElement("script")
    s.async = true
    s.src = u
    s.addEventListener("error", () => {
      const error = new Error(`Failed to load the Document Editor API script from '${u}'`)
      const e = new DocumentEditorErrorEvent("error", {error})
      this.dispatchEvent(e)
    })
    s.addEventListener("load", () => {
      if (!window.DocsAPI) {
        const error = new Error("The Document Editor API is not defined")
        const e = new DocumentEditorErrorEvent("error", {error})
        this.dispatchEvent(e)
        return
      }
      this.#editor = window.DocsAPI.DocEditor(p.id, c)
    })
    return s
  }

  #scriptSource(): string {
    const u = this.#documentServerURL
    if (u === "") {
      throw new Error("The attribute 'document-server-url' is required, but it is missing")
    }
    if (!u.endsWith("/")) {
      throw new Error("The attribute 'document-server-url' must have a trailing slash, but it does not")
    }
    return `${u}web-apps/apps/api/documents/api.js`
  }

  #scriptConfig(): DocEditorConfig {
    const c = this.#config
    if (!c) {
      throw new Error("The attribute 'config' is required, but it is missing")
    }
    return {
      ...c,
      events: {
        onAppReady: () => {
          const e = new DocumentEditorAppReadyEvent("appready")
          this.dispatchEvent(e)
        },
        onCollaborativeChanges: () => {
          const e = new DocumentEditorCollaborativeChangesEvent("collaborativechanges")
          this.dispatchEvent(e)
        },
        onDocumentReady: () => {
          const e = new DocumentEditorDocumentReadyEvent("documentready")
          this.dispatchEvent(e)
        },
        onDocumentStateChange: (ev) => {
          const e = new DocumentEditorDocumentStateChangeEvent("documentstatechange", ev)
          this.dispatchEvent(e)
        },
        onDownloadAs: (ev) => {
          const e = new DocumentEditorDownloadAsEvent("downloadas", ev)
          this.dispatchEvent(e)
        },
        onError: (ev) => {
          const error = new Error(`${ev.data.errorDescription} (${ev.data.errorCode})`)
          const e = new DocumentEditorErrorEvent("error", {...ev, error})
          this.dispatchEvent(e)
        },
        onInfo: (ev) => {
          const e = new DocumentEditorInfoEvent("info", ev)
          this.dispatchEvent(e)
        },
        onMakeActionLink: (ev) => {
          const e = new DocumentEditorMakeActionLinkEvent("makeactionlink", ev)
          this.dispatchEvent(e)
        },
        onMetaChange: (ev) => {
          const e = new DocumentEditorMetaChangeEvent("metachange", ev)
          this.dispatchEvent(e)
        },
        onOutdatedVersion: () => {
          const e = new DocumentEditorOutdatedVersionEvent("outdatedversion")
          this.dispatchEvent(e)
        },
        onPluginsReady: () => {
          const e = new DocumentEditorPluginsReadyEvent("pluginsready")
          this.dispatchEvent(e)
        },
        onReady: () => {
          const e = new DocumentEditorReadyEvent("ready")
          this.dispatchEvent(e)
        },
        onRequestClose: () => {
          const e = new DocumentEditorRequestCloseEvent("requestclose")
          this.dispatchEvent(e)
        },
        onRequestCompareFile: () => {
          const e = new DocumentEditorRequestCompareFileEvent("requestcomparefile")
          this.dispatchEvent(e)
        },
        onRequestCreateNew: () => {
          const e = new DocumentEditorRequestCreateNewEvent("requestcreatenew")
          this.dispatchEvent(e)
        },
        onRequestEditRights: () => {
          const e = new DocumentEditorRequestEditRightsEvent("requesteditrights")
          this.dispatchEvent(e)
        },
        onRequestHistory: () => {
          const e = new DocumentEditorRequestHistoryEvent("requesthistory")
          this.dispatchEvent(e)
        },
        onRequestHistoryClose: () => {
          const e = new DocumentEditorRequestHistoryCloseEvent("requesthistoryclose")
          this.dispatchEvent(e)
        },
        onRequestHistoryData: (ev) => {
          const e = new DocumentEditorRequestHistoryDataEvent("requesthistorydata", ev)
          this.dispatchEvent(e)
        },
        onRequestInsertImage: (ev) => {
          const e = new DocumentEditorRequestInsertImageEvent("requestinsertimage", ev)
          this.dispatchEvent(e)
        },
        onRequestMailMergeRecipients: () => {
          const e = new DocumentEditorRequestMailMergeRecipientsEvent("requestmailmergerecipients")
          this.dispatchEvent(e)
        },
        onRequestOpen: (ev) => {
          const e = new DocumentEditorRequestOpenEvent("requestopen", ev)
          this.dispatchEvent(e)
        },
        onRequestReferenceData: (ev) => {
          const e = new DocumentEditorRequestReferenceDataEvent("requestreferencedata", ev)
          this.dispatchEvent(e)
        },
        onRequestReferenceSource: (ev) => {
          const e = new DocumentEditorRequestReferenceSourceEvent("requestreferencesource", ev)
          this.dispatchEvent(e)
        },
        onRequestRename: (ev) => {
          const e = new DocumentEditorRequestRenameEvent("requestrename", ev)
          this.dispatchEvent(e)
        },
        onRequestRestore: (ev) => {
          const e = new DocumentEditorRequestRestoreEvent("requestrestore", ev)
          this.dispatchEvent(e)
        },
        onRequestSaveAs: (ev) => {
          const e = new DocumentEditorRequestSaveAsEvent("requestsaveas", ev)
          this.dispatchEvent(e)
        },
        onRequestSelectDocument: (ev) => {
          const e = new DocumentEditorRequestSelectDocumentEvent("requestselectdocument", ev)
          this.dispatchEvent(e)
        },
        onRequestSelectSpreadsheet: (ev) => {
          const e = new DocumentEditorRequestSelectSpreadsheetEvent("requestselectspreadsheet", ev)
          this.dispatchEvent(e)
        },
        onRequestSendNotify: (ev) => {
          const e = new DocumentEditorRequestSendNotifyEvent("requestsendnotify", ev)
          this.dispatchEvent(e)
        },
        onRequestSharingSettings: () => {
          const e = new DocumentEditorRequestSharingSettingsEvent("requestsharingsettings")
          this.dispatchEvent(e)
        },
        onRequestUsers: (ev) => {
          const e = new DocumentEditorRequestUsersEvent("requestusers", ev)
          this.dispatchEvent(e)
        },
        onWarning: (ev) => {
          const error = new Error(`${ev.data.warningDescription} (${ev.data.warningCode})`)
          const e = new DocumentEditorWarningEvent("warning", {...ev, error})
          this.dispatchEvent(e)
        }
      }
    }
  }

  // todo: map methods from the this.#editor
}

main()
