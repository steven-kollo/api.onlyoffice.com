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
  permalink?: string
  type: ReflectionType
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
  permalink?: string
  value?: unknown
  children?: ReflectionType[]
  render: ReflectionTypeRender
}

type ReflectionTypeRender = (type: ReflectionType, state: ReflectionState) => string

interface ReflectionTypeState {
  required: boolean
}

export {
  ReflectionParameters,
  ReflectionValue,
  ReflectionContent,
  ReflectionContentRender,
  ReflectionType,
  ReflectionTypeRender,
  ReflectionTypeState
}
