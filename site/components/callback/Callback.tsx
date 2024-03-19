export interface RootParameters {
  cb(): void
}

export function Root(
  {
    cb
  }: RootParameters
): null {
  cb()
  return null
}
