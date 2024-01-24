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

interface ReflectionValue {
  name: string
  description?: ReflectionContent
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
