import kit from "@onlyoffice/documentation-ui-kit/kit.css?inline"
import kitRegular from "@onlyoffice/documentation-ui-kit/kit.regular.css?inline"
import type { JSX } from "preact"
import { Fragment, h } from "preact"
import { list, retrieve } from "./fixtures/resource.ts"
import { RESTDeclaration } from "./rest-declaration.ts"

const styles: string[] = [
  kit,
  kitRegular
]

export default {
  title: "Site/RESTDeclaration",
  decorators: [
    (Story: any): JSX.Element => (
      <>
        {styles.map((s) => (
          <style key={s} dangerouslySetInnerHTML={{ __html: s }} />
        ))}
        <Story />
      </>
    )
  ]
}

export function Composition(): JSX.Element {
  return (
    <RESTDeclaration
      declaration={list()[0]}
      onHighlightSyntax={({ children }) => children}
      onRenderDescription={({ children }) => children}
      onRetrieve={retrieve}
    />
  )
}
