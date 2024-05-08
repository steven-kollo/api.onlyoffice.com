/**
 * {@link https://api.onlyoffice.com/docbuilder/framework ONLYOFFICE Reference}
 */
export interface DocumentBuilder {
  /**
   * {@link https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuilder/createfile ONLYOFFICE Reference}
   */
  CreateFile(extension: "docx" | "pptx" | "xlsx"): void
}
