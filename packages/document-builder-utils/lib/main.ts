import type {DocumentBuilder} from "@onlyoffice/document-builder-types"

export function fileType(c: string): string {
  let t = ""

  const b = builder()
  b.CreateFile = (e) => {
    t = e
    throw new Error("Stop execution")
  }

  const f = new Function("builder", c)
  try {
    f(b)
  } catch {
    // continue
  }

  return t
}

export function builder(): DocumentBuilder {
  return {
    CloseFile: () => {},
    CreateFile: () => {},
    SaveFile: () => {}
  }
}
