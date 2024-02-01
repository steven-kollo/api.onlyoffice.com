interface ArrayType extends NodeType {
  children: NodeType[]
  render: ArrayMarkup
}

interface ArrayMarkup {
  (t: ArrayType): string
}

interface GenericType extends NodeType {
  name: string
  children: NodeType[]
  render: GenericMarkup
}

interface GenericMarkup {
  (t: GenericType): string
}

interface LiteralType extends NodeType {
  value: unknown
  render: LiteralMarkup
}

interface LiteralMarkup {
  (t: LiteralType): string
}

interface OptionalType extends NodeType {
  children: NodeType[]
  render: OptionalMarkup
}

interface OptionalMarkup {
  (t: OptionalType): string
}

interface UnionType extends NodeType {
  children: NodeType[]
  render: UnionMarkup
}

interface UnionMarkup {
  (t: UnionType): string
}

interface NodeType extends NodeType {
  render: NodeMarkup
}

interface NodeMarkup {
  (t: NodeType): string
}

export {
  ArrayMarkup,
  ArrayType,
  GenericMarkup,
  GenericType,
  LiteralMarkup,
  LiteralType,
  NodeMarkup,
  NodeType,
  OptionalMarkup,
  OptionalType,
  UnionMarkup,
  UnionType
}








interface ReflectionParameters {
  values: ReflectionValue[]

  slots: {
    // The caption of the table for screen readers only.
    caption: string

    // The one-line header of the table for screen readers only.
    head: string

    required: string

    "default-value": string

    example: string
  }
}

// use dl-dt
// name may be a link, may be a anchor

interface ReflectionValue {
  name: string
  description?: ReflectionContent
  // badges?: string[]
  type: ReflectionType
  required?: boolean
  default?: unknown
  example?: string
}

interface ReflectionContent {
  text: string
  render: ReflectionContentRender
}

type ReflectionContentRender = (content: ReflectionContent) => string

interface ReflectionType {
  name: string
  link?: string
  value?: unknown
  children?: ReflectionType[]
  render: ReflectionTypeRender
}

type ReflectionTypeRender = (type: ReflectionType) => string

export {
  ReflectionParameters,
  ReflectionValue,
  ReflectionContent,
  ReflectionContentRender,
  ReflectionType,
  ReflectionTypeRender
}
