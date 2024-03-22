import type { JSX } from "preact"
import { Fragment, h } from "preact"
import { Callback } from "../callback/callback.ts"

export interface Page {
  url: string
  title: string
  children?: string[]
}

export interface RootProperties {
  url: string
  depth?: number
  onRetrieve(url: string): Page | undefined
}

export function Root(
  {
    url,
    depth = 1,
    onRetrieve: retrieve
  }: RootProperties
): JSX.Element {
  let c = -1
  return <List url={url} />

  function List({ url }: { url: string }): JSX.Element {
    const p = retrieve(url)
    if (p === undefined || p.children === undefined) {
      return <></>
    }

    if (c === depth) {
      return <></>
    }
    c += 1

    return (
      <ul>
        {p.children.map((u) => (
          <Item key={u} url={u} />
        ))}
        <Callback cb={() => c -= 1 }/>
      </ul>
    )
  }

  function Item({ url }: { url: string }) {
    const p = retrieve(url)
    if (p === undefined) {
      return <></>
    }
    return (
      <li>
        {p.url
          ? <a href={p.url}>{p.title}</a>
          : p.title
        }
        <List url={url} />
      </li>
    )
  }
}
