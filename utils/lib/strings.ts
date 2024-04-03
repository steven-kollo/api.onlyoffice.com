/**
 * Capitalizes a kebab-case string.
 * @param s The kebab-case string to capitalize.
 * @returns The capitalized string.
 */
export function capitalizeKebab(s: string): string {
  return s
    .split("-")
    .map((w) => w.charAt(0).toUpperCase() + w.slice(1))
    .join("")
}
