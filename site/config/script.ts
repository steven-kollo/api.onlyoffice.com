import { Buffer } from "node:buffer"
import { tmpdir } from "node:os"
import { parse } from "node:path"
import type { UserConfig } from "@11ty/eleventy"
import { build } from "esbuild"
import { isBuild, isPreview } from "./mode.ts"

export function scriptPlugin(uc: UserConfig): void {
  uc.addTemplateFormats("ts")
  uc.addExtension("ts", {
    outputFileExtension: "js",
    // read: false,
    compile(_: string, f: string): (() => Promise<Uint8Array>) | undefined {
      const { name } = parse(f)
      if (name !== "main") {
        return
      }
      return () => {
        return buildScript(f)
      }
    }
  })
}

/**
 * @param f The entry point file path.
 * @returns The bundled content.
 */
export async function buildScript(f: string): Promise<Uint8Array> {
  const r = await build({
    bundle: true,
    entryPoints: [f],
    minify: isBuild() || isPreview(),
    outdir: tmpdir(),
    write: false,
  })
  return Buffer.from(r.outputFiles[0].contents)
}
