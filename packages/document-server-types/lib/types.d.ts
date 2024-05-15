// Provides a declaration of the interfaces that the Document Editor exports.
// Looking ahead, the team in charge of the Document Editor should ideally take
// over the support for this file.

// todo: Revise interfaces, allocate common, remove the any.

declare global {
  interface Window {
    DocsAPI?: typeof DocsAPI
  }
}

declare const DocsAPI: {
  /**
   * {@link https://api.onlyoffice.com/editors/methods ONLYOFFICE Reference}
   */
  DocEditor: typeof DocEditor
}

/**
 * {@link https://api.onlyoffice.com/editors/methods ONLYOFFICE Reference}
 */
declare const DocEditor: {
  /**
   * {@link https://github.com/ONLYOFFICE/web-apps/blob/v8.0.0.15/apps/api/documents/api.js/#L324 ONLYOFFICE Reference}
   */
  (id: string, config: DocEditorConfig): DocEditor

  /**
   * {@link https://github.com/ONLYOFFICE/web-apps/blob/v8.0.0.15/apps/api/documents/api.js/#L845 ONLYOFFICE Reference}
   */
  version(): string

  /**
   * {@link https://github.com/ONLYOFFICE/web-apps/blob/v8.0.0.15/apps/api/documents/api.js/#L831 ONLYOFFICE Reference}
   */
  defaultConfig: DocEditorConfig
}

/**
 * {@link https://api.onlyoffice.com/editors/methods ONLYOFFICE Reference}
 */
export interface DocEditor {
  /**
   * {@link https://github.com/ONLYOFFICE/web-apps/blob/v8.0.0.15/apps/api/documents/api.js/#L810 ONLYOFFICE Reference}
   */
  attachMouseEvents(...args: any): void

  /**
   * {@link https://github.com/ONLYOFFICE/web-apps/blob/v8.0.0.15/apps/api/documents/api.js/#L822 ONLYOFFICE Reference}
   */
  blurFocus(...args: any): void

  /**
   * {@link https://api.onlyoffice.com/editors/methods#createConnector ONLYOFFICE Reference}
   */
  createConnector(): DocEditorConnector

  /**
   * {@link https://api.onlyoffice.com/editors/methods#denyEditingRights ONLYOFFICE Reference}
   */
  denyEditingRights(message?: string): void

  /**
   * {@link https://api.onlyoffice.com/editors/methods#destroyEditor ONLYOFFICE Reference}
   */
  destroyEditor(): void

  /**
   * {@link https://github.com/ONLYOFFICE/web-apps/blob/v8.0.0.15/apps/api/documents/api.js/#L811 ONLYOFFICE Reference}
   */
  detachMouseEvents(...args: any): void

  /**
   * {@link https://api.onlyoffice.com/editors/methods#downloadAs ONLYOFFICE Reference}
   */
  downloadAs(format?: string): void

  /**
   * {@link https://github.com/ONLYOFFICE/web-apps/blob/v8.0.0.15/apps/api/documents/api.js/#L821 ONLYOFFICE Reference}
   */
  grabFocus(...args: any): void

  /**
   * {@link https://api.onlyoffice.com/editors/methods#insertImage ONLYOFFICE Reference}
   */
  insertImage(images: DocEditorInsertImagePayload[]): void

  /**
   * {@link https://github.com/ONLYOFFICE/web-apps/blob/v8.0.0.15/apps/api/documents/api.js/#L807 ONLYOFFICE Reference}
   */
  processMailMerge(...args: any): void

  /**
   * {@link https://github.com/ONLYOFFICE/web-apps/blob/v8.0.0.15/apps/api/documents/api.js/#L801 ONLYOFFICE Reference}
   */
  processRightsChange(...args: any): void

  /**
   * {@link https://github.com/ONLYOFFICE/web-apps/blob/v8.0.0.15/apps/api/documents/api.js/#L800 ONLYOFFICE Reference}
   */
  processSaveResult(...args: any): void

  /**
   * {@link https://api.onlyoffice.com/editors/methods#refreshHistory ONLYOFFICE Reference}
   */
  refreshHistory(history: DocEditorRefreshHistoryPayload): void

  /**
   * {@link https://api.onlyoffice.com/editors/methods#requestClose ONLYOFFICE Reference}
   */
  requestClose(): void

  /**
   * {@link https://github.com/ONLYOFFICE/web-apps/blob/v8.0.0.15/apps/api/documents/api.js/#L809 ONLYOFFICE Reference}
   */
  serviceCommand(...args: any): void

  /**
   * {@link https://api.onlyoffice.com/editors/methods#setActionLink ONLYOFFICE Reference}
   */
  setActionLink(link: string): void

  /**
   * {@link https://github.com/ONLYOFFICE/web-apps/blob/v8.0.0.15/apps/api/documents/api.js/#L805 ONLYOFFICE Reference}
   */
  setEmailAddresses(): void

  /**
   * {@link https://api.onlyoffice.com/editors/methods#setFavorite ONLYOFFICE Reference}
   */
  setFavorite(favorite: boolean): void

  /**
   * {@link https://api.onlyoffice.com/editors/methods#setHistoryData ONLYOFFICE Reference}
   */
  setHistoryData(data: DocEditorHistoryData): void

  /**
   * {@link https://api.onlyoffice.com/editors/methods#setMailMergeRecipients ONLYOFFICE Reference}
   */
  setMailMergeRecipients(recipient: DocEditorMailMergeRecipient): void

  /**
   * {@link https://api.onlyoffice.com/editors/methods#setReferenceData ONLYOFFICE Reference}
   */
  setReferenceData(data: DocEditorReferenceData): void

  /**
   * {@link https://api.onlyoffice.com/editors/methods#setReferenceSource ONLYOFFICE Reference}
   */
  setReferenceSource(source: DocEditorReferenceSource): void

  /**
   * {@link https://api.onlyoffice.com/editors/methods#setRequestedDocument ONLYOFFICE Reference}
   */
  setRequestedDocument(document: DocEditorRequestedDocument): void

  /**
   * {@link https://api.onlyoffice.com/editors/methods#setRequestedSpreadsheet ONLYOFFICE Reference}
   */
  setRequestedSpreadsheet(spreadsheet: DocEditorRequestedSpreadsheet): void

  /**
   * {@link https://api.onlyoffice.com/editors/methods#setRevisedFile ONLYOFFICE Reference}
   */
  setRevisedFile(file: DocEditorRevisedFile): void

  /**
   * {@link https://api.onlyoffice.com/editors/methods#setSharingSettings ONLYOFFICE Reference}
   */
  setSharingSettings(settings: DocEditorSharingSettings): void

  /**
   * {@link https://api.onlyoffice.com/editors/methods#setUsers ONLYOFFICE Reference}
   */
  setUsers(users: DocEditorUsers): void

  /**
   * {@link https://api.onlyoffice.com/editors/methods#showMessage ONLYOFFICE Reference}
   */
  showMessage(title: string, message: string): void

  /**
   * {@link https://github.com/ONLYOFFICE/web-apps/blob/v8.0.0.15/apps/api/documents/api.js/#L814 ONLYOFFICE Reference}
   */
  showSharingSettings(...args: any): void
}

/**
 * {@link https://api.onlyoffice.com/editors/connector ONLYOFFICE Reference}
 */
export interface DocEditorConnector {
  /**
   * {@link https://api.onlyoffice.com/editors/connector#attachEvent ONLYOFFICE Reference}
   */
  attachEvent(name: string, callback: any): void

  /**
   * {@link https://api.onlyoffice.com/editors/connector#callCommand ONLYOFFICE Reference}
   */
  callCommand(command: any, callback?: any, isNoCalc?: boolean): void

  /**
   * {@link https://api.onlyoffice.com/editors/connector#connect ONLYOFFICE Reference}
   */
  connect(): void

  /**
   * {@link https://api.onlyoffice.com/editors/connector#detachEvent ONLYOFFICE Reference}
   */
  detachEvent(name: string): void

  /**
   * {@link https://api.onlyoffice.com/editors/connector#disconnect ONLYOFFICE Reference}
   */
  disconnect(): void

  /**
   * {@link https://api.onlyoffice.com/editors/connector#executeMethod ONLYOFFICE Reference}
   */
  executeMethod(name: string, args: any[], callback: any): void
}

export interface DocEditorInsertImagePayload {
  c: string
  fileType: string
  images: {
    fileType: string,
    url: string
  }[]
  token?: string
  url: string
}

export interface DocEditorRefreshHistoryPayload {
  currentVersion: number
  error?: string
  history: {
    changes?: any
    created: string
    key: string
    serverVersion?: number
    user?: {
      id?: string
      name?: string
    }
  }[]
  version: number
}

export interface DocEditorHistoryData {
  changesUrl?: string
  error?: string
  fileType?: string
  key: string
  previous?: {
    fileType?: string
    key: string
    url: string
  }
  token?: string
  url: string
  version: number
}

export interface DocEditorMailMergeRecipient {
  fileType: string
  token?: string
  url: string
}

export interface DocEditorReferenceData {
  error?: string
  fileType?: string
  path: string
  referenceData?: {
    fileKey: string
    instanceId: string
    key: string
  }
  token?: string
  url: string
}

export interface DocEditorReferenceSource {
  error?: string
  fileType?: string
  path: string
  referenceData?: {
    fileKey: string
    instanceId: string
    key: string
  }
  token?: string
  url: string
}

export interface DocEditorRequestedDocument {
  c: string
  fileType: string
  token?: string
  url: string
}

export interface DocEditorRequestedSpreadsheet {
  c: string
  fileType: string
  token?: string
  url: string
}

export interface DocEditorRevisedFile {
  fileType: string
  token?: string
  url: string
}

export interface DocEditorSharingSettings {
  sharingSettings?: {
    permissions?: string
    user?: string
  }[]
}

export interface DocEditorUsers {
  c: "info" | "mention" | "protect"
  users?: {
    email?: string
    id?: string
    image?: string
    name?: string
  }[]
}

export interface DocEditorConfig {
  /**
   * {@link https://api.onlyoffice.com/editors/config/#documentType ONLYOFFICE Reference}
   */
  documentType: "cell" | "pdf" | "slide" | "word"

  /**
   * {@link https://api.onlyoffice.com/editors/config/#height ONLYOFFICE Reference}
   */
  height?: string

  /**
   * {@link https://api.onlyoffice.com/editors/config/#token ONLYOFFICE Reference}
   */
  token?: string

  /**
   * {@link https://api.onlyoffice.com/editors/config/#type ONLYOFFICE Reference}
   */
  type?: "desktop" | "mobile" | "embedded"

  /**
   * {@link https://api.onlyoffice.com/editors/config/#width ONLYOFFICE Reference}
   */
  width?: string

  /**
   * {@link https://api.onlyoffice.com/editors/config/document ONLYOFFICE Reference}
   */
  document: DocEditorConfigDocument

  /**
   * {@link https://api.onlyoffice.com/editors/config/editor ONLYOFFICE Reference}
   */
  editorConfig?: DocEditorConfigEditorConfig

  /**
   * {@link https://api.onlyoffice.com/editors/config/events ONLYOFFICE Reference}
   */
  events?: DocEditorConfigEvents
}

/**
 * {@link https://api.onlyoffice.com/editors/config/document ONLYOFFICE Reference}
 */
export interface DocEditorConfigDocument {
  /**
   * {@link https://api.onlyoffice.com/editors/config/document#fileType ONLYOFFICE Reference}
   */
  fileType: string

  /**
   * {@link https://api.onlyoffice.com/editors/config/document#key ONLYOFFICE Reference}
   */
  key: string

  /**
   * {@link https://api.onlyoffice.com/editors/config/document#referenceData ONLYOFFICE Reference}
   */
  referenceData?: DocEditorConfigDocumentReferenceData

  /**
   * {@link https://api.onlyoffice.com/editors/config/document#title ONLYOFFICE Reference}
   */
  title: string

  /**
   * {@link https://api.onlyoffice.com/editors/config/document#url ONLYOFFICE Reference}
   */
  url: string

  /**
   * {@link https://api.onlyoffice.com/editors/config/document/info ONLYOFFICE Reference}
   */
  info?: DocEditorConfigDocumentInfo

  /**
   * {@link https://api.onlyoffice.com/editors/config/document/permissions ONLYOFFICE Reference}
   */
  permissions?: DocEditorConfigDocumentPermissions
}

/**
 * {@link https://api.onlyoffice.com/editors/config/document#referenceData ONLYOFFICE Reference}
 */
export interface DocEditorConfigDocumentReferenceData {
  fileKey: string
  instanceId: string
  key: string
}

/**
 * {@link https://api.onlyoffice.com/editors/config/document/info ONLYOFFICE Reference}
 */
export interface DocEditorConfigDocumentInfo {
  /**
   * {@link https://api.onlyoffice.com/editors/config/document/info#author ONLYOFFICE Reference}
   */
  author?: string

  /**
   * {@link https://api.onlyoffice.com/editors/config/document/info#created ONLYOFFICE Reference}
   */
  created?: string

  /**
   * {@link https://api.onlyoffice.com/editors/config/document/info#favorite ONLYOFFICE Reference}
   */
  favorite?: boolean

  /**
   * {@link https://api.onlyoffice.com/editors/config/document/info#folder ONLYOFFICE Reference}
   */
  folder?: string

  /**
   * {@link https://api.onlyoffice.com/editors/config/document/info#owner ONLYOFFICE Reference}
   */
  owner?: string

  /**
   * {@link https://api.onlyoffice.com/editors/config/document/info#sharingSettings ONLYOFFICE Reference}
   */
  sharingSettings?: DocEditorConfigDocumentInfoSharingSetting[]

  /**
   * {@link https://api.onlyoffice.com/editors/config/document/info#uploaded ONLYOFFICE Reference}
   */
  uploaded?: string
}

/**
 * {@link https://api.onlyoffice.com/editors/config/document/info#sharingSettings ONLYOFFICE Reference}
 */
export interface DocEditorConfigDocumentInfoSharingSetting {
  isLink: boolean
  permissions: "Full Access" | "Read Only" | "Deny Access"
  user: string
}

/**
 * {@link https://api.onlyoffice.com/editors/config/document/permissions ONLYOFFICE Reference}
 */
export interface DocEditorConfigDocumentPermissions {
  // todo
}

/**
 * {@link https://api.onlyoffice.com/editors/config/editor ONLYOFFICE Reference}
 */
export interface DocEditorConfigEditorConfig {
  // todo
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events}
 */
export interface DocEditorConfigEvents {
  /**
   * {@link https://api.onlyoffice.com/editors/config/events#onAppReady ONLYOFFICE Reference}
   */
  onAppReady?(): void

  /**
   * {@link https://api.onlyoffice.com/editors/config/events#onCollaborativeChanges ONLYOFFICE Reference}
   */
  onCollaborativeChanges?(): void

  /**
   * {@link https://api.onlyoffice.com/editors/config/events#onDocumentReady ONLYOFFICE Reference}
   */
  onDocumentReady?(): void

  /**
   * {@link https://api.onlyoffice.com/editors/config/events#onDocumentStateChange ONLYOFFICE Reference}
   */
  onDocumentStateChange?(e: DocEditorDocumentStateChangeEvent): void

  /**
   * {@link https://api.onlyoffice.com/editors/config/events#onDownloadAs ONLYOFFICE Reference}
   */
  onDownloadAs?(e: DocEditorDocumentDownloadAsEvent): void

  /**
   * {@link https://api.onlyoffice.com/editors/config/events#onError ONLYOFFICE Reference}
   */
  onError?(e: DocEditorErrorEvent): void

  /**
   * {@link https://api.onlyoffice.com/editors/config/events#onInfo ONLYOFFICE Reference}
   */
  onInfo?(e: DocEditorInfoEvent): void

  /**
   * {@link https://api.onlyoffice.com/editors/config/events#onMakeActionLink ONLYOFFICE Reference}
   */
  onMakeActionLink?(e: DocEditorMakeActionLinkEvent): void

  /**
   * {@link https://api.onlyoffice.com/editors/config/events#onMetaChange ONLYOFFICE Reference}
   */
  onMetaChange?(e: DocEditorMetaChangeEvent): void

  /**
   * {@link https://api.onlyoffice.com/editors/config/events#onOutdatedVersion ONLYOFFICE Reference}
   */
  onOutdatedVersion?(): void

  /**
   * {@link https://api.onlyoffice.com/editors/config/events#onPluginsReady ONLYOFFICE Reference}
   */
  onPluginsReady?(): void

  /**
   * {@link https://api.onlyoffice.com/editors/config/events#onReady ONLYOFFICE Reference}
   * @deprecated Since 5.0, prefer {@link onAppReady} instead.
   */
  onReady?(): void

  /**
   * {@link https://api.onlyoffice.com/editors/config/events#onRequestClose ONLYOFFICE Reference}
   */
  onRequestClose?(): void

  /**
   * {@link https://api.onlyoffice.com/editors/config/events#onRequestCompareFile ONLYOFFICE Reference}
   * @deprecated Since 7.5, prefer {@link onRequestSelectDocument} instead.
   */
  onRequestCompareFile?(): void

  /**
   * {@link https://api.onlyoffice.com/editors/config/events#onRequestCreateNew ONLYOFFICE Reference}
   */
  onRequestCreateNew?(): void

  /**
   * {@link https://api.onlyoffice.com/editors/config/events#onRequestEditRights ONLYOFFICE Reference}
   */
  onRequestEditRights?(): void

  /**
   * {@link https://api.onlyoffice.com/editors/config/events#onRequestHistory ONLYOFFICE Reference}
   */
  onRequestHistory?(): void

  /**
   * {@link https://api.onlyoffice.com/editors/config/events#onRequestHistoryClose ONLYOFFICE Reference}
   */
  onRequestHistoryClose?(): void

  /**
   * {@link https://api.onlyoffice.com/editors/config/events#onRequestHistoryData ONLYOFFICE Reference}
   */
  onRequestHistoryData?(e: DocEditorRequestHistoryDataEvent): void

  /**
   * {@link https://api.onlyoffice.com/editors/config/events#onRequestInsertImage ONLYOFFICE Reference}
   */
  onRequestInsertImage?(e: DocEditorRequestInsertImageEvent): void

  /**
   * {@link https://api.onlyoffice.com/editors/config/events#onRequestMailMergeRecipients ONLYOFFICE Reference}
   * @deprecated Since 7.5, prefer {@link onRequestSelectSpreadsheet} instead.
   */
  onRequestMailMergeRecipients?(): void

  /**
   * {@link https://api.onlyoffice.com/editors/config/events#onRequestOpen ONLYOFFICE Reference}
   */
  onRequestOpen?(e: DocEditorRequestOpenEvent): void

  /**
   * {@link https://api.onlyoffice.com/editors/config/events#onRequestReferenceData ONLYOFFICE Reference}
   */
  onRequestReferenceData?(e: DocEditorRequestReferenceDataEvent): void

  /**
   * {@link https://api.onlyoffice.com/editors/config/events#onRequestReferenceSource ONLYOFFICE Reference}
   */
  onRequestReferenceSource?(e: DocEditorRequestReferenceSourceEvent): void

  /**
   * {@link https://api.onlyoffice.com/editors/config/events#onRequestRename ONLYOFFICE Reference}
   */
  onRequestRename?(e: DocEditorRequestRenameEvent): void

  /**
   * {@link https://api.onlyoffice.com/editors/config/events#onRequestRestore ONLYOFFICE Reference}
   */
  onRequestRestore?(e: DocEditorRequestRestoreEvent): void

  /**
   * {@link https://api.onlyoffice.com/editors/config/events#onRequestSaveAs ONLYOFFICE Reference}
   */
  onRequestSaveAs?(e: DocEditorRequestSaveAsEvent): void

  /**
   * {@link https://api.onlyoffice.com/editors/config/events#onRequestSelectDocument ONLYOFFICE Reference}
   */
  onRequestSelectDocument?(e: DocEditorRequestSelectDocumentEvent): void

  /**
   * {@link https://api.onlyoffice.com/editors/config/events#onRequestSelectSpreadsheet ONLYOFFICE Reference}
   */
  onRequestSelectSpreadsheet?(e: DocEditorRequestSelectSpreadsheetEvent): void

  /**
   * {@link https://api.onlyoffice.com/editors/config/events#onRequestSendNotify ONLYOFFICE Reference}
   */
  onRequestSendNotify?(e: DocEditorRequestSendNotifyEvent): void

  /**
   * {@link https://api.onlyoffice.com/editors/config/events#onRequestSharingSettings ONLYOFFICE Reference}
   */
  onRequestSharingSettings?(): void

  /**
   * {@link https://api.onlyoffice.com/editors/config/events#onRequestUsers ONLYOFFICE Reference}
   */
  onRequestUsers?(e: DocEditorRequestUsersEvent): void

  /**
   * {@link https://api.onlyoffice.com/editors/config/events#onWarning ONLYOFFICE Reference}
   */
  onWarning?(e: DocEditorWarningEvent): void
}

export interface DocEditorDocumentStateChangeEvent {
  data: boolean
}

export interface DocEditorDocumentDownloadAsEvent {
  data: {
    fileType: string
    url: string
  }
}

export interface DocEditorErrorEvent {
  data: {
    errorCode: number
    errorDescription: string
  }
}

export interface DocEditorInfoEvent {
  data: {
    mode: "edit" | "view"
  }
}

export interface DocEditorMakeActionLinkEvent {
  data: unknown
}

export interface DocEditorMetaChangeEvent {
  data: {
    favorite: boolean
    title: string
  }
}

export interface DocEditorRequestHistoryDataEvent {
  data: number
}

export interface DocEditorRequestInsertImageEvent {
  data: {
    c: string
  }
}

export interface DocEditorRequestOpenEvent {
  data: {
    path: string
    referenceData: {
      fileKey: string
      instanceId: string
      key: string
    }
    windowName: string
  }
}

export interface DocEditorRequestReferenceDataEvent {
  data: {
    link: string
    path: string
    referenceData: {
      fileKey: string
      instanceId: string
      key: string
    }
  }
}

export interface DocEditorRequestReferenceSourceEvent {
  data: {
    path: string
    referenceData: {
      fileKey: string
      instanceId: string
      key: string
    }
  }
}

export interface DocEditorRequestRenameEvent {
  data: string
}

export interface DocEditorRequestRestoreEvent {
  data: {
    fileType: string
    url: string
    version: string
  }
}

export interface DocEditorRequestSaveAsEvent {
  data: {
    fileType: string
    title: string
    url: string
  }
}

export interface DocEditorRequestSelectDocumentEvent {
  data: {
    c: string
  }
}

export interface DocEditorRequestSelectSpreadsheetEvent {
  data: {
    c: string
  }
}

export interface DocEditorRequestSendNotifyEvent {
  data: {
    actionLink: unknown
    emails: string[]
    message: string
  }
}

export interface DocEditorRequestUsersEvent {
  data: {
    c: string
    id: string
  }
}

export interface DocEditorWarningEvent {
  data: {
    warningCode: number
    warningDescription: string
  }
}
