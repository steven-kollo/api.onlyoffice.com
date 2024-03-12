// @ts-check

/**
 * Capitalizes a kebab-case string.
 * @param {string} s The kebab-case string to capitalize.
 * @returns {string} The capitalized string.
 */
export function capitalizeKebab(s) {
  return s
    .split("-")
    .map((w) => w.charAt(0).toUpperCase() + w.slice(1))
    .join("")
}
