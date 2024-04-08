export function isHTTPURL(u: string): boolean {
  return u.startsWith("http://")
}

export function isHTTPSURL(u: string): boolean {
  return u.startsWith("https://")
}
