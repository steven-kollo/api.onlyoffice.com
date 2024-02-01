export type WriteStream = import("node:fs").WriteStream;
/**
 * @typedef {import("node:fs").WriteStream} WriteStream
 */
/**
 * @param {string} from
 * @param {string} to
 * @param {string} by
 * @returns {Promise<void>}
 */
export function sortJSON(from: string, to: string, by: string): Promise<void>;
/**
 * @param {string} from
 * @param {string} to
 * @returns {Promise<void>}
 */
export function prettifyJSON(from: string, to: string): Promise<void>;
/**
 * @param {WriteStream} w
 * @param {string[]} [args=[]]
 * @returns {Promise<void>}
 */
export function jq(w: WriteStream, args?: string[]): Promise<void>;
