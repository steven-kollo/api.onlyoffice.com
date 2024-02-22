export interface RESTPath {
  slug: string
  title: string
  endpoint: string
  summary: string
  description?: string
  pathParameters?: RESTParameter[]
  queryParameters?: RESTParameter[]
  bodyParameters?: RESTContent[]
  responses?: RESTResponse[]
  examples?: RESTExample[]
}

export type RESTResponse = RESTResponseMap[keyof RESTResponseMap]

export interface RESTResponseMap {
  array: RESTArrayResponse
  boolean: RESTBooleanResponse
  integer: RESTIntegerResponse
  number: RESTNumberResponse
  object: RESTObjectResponse
  reference: RESTReferenceResponse
  string: RESTStringResponse
  unknown: RESTUnknownResponse
}

export interface RESTArrayResponse extends RESTResponseNode, RESTArrayContent {}

export interface RESTBooleanResponse extends RESTResponseNode, RESTBooleanContent {}

export interface RESTIntegerResponse extends RESTResponseNode, RESTIntegerContent {}

export interface RESTNumberResponse extends RESTResponseNode, RESTNumberContent {}

export interface RESTObjectResponse extends RESTResponseNode, RESTObjectContent {}

export interface RESTReferenceResponse extends RESTResponseNode, RESTReferenceContent {}

export interface RESTStringResponse extends RESTResponseNode, RESTStringContent {}

export interface RESTUnknownResponse extends RESTResponseNode, RESTUnknownContent {}

export interface RESTResponseNode {
  status: number
}

export type RESTContent = RESTContentMap[keyof RESTContentMap]

export interface RESTContentMap {
  array: RESTArrayContent
  boolean: RESTBooleanContent
  integer: RESTIntegerContent
  number: RESTNumberContent
  object: RESTObjectContent
  reference: RESTReferenceContent
  string: RESTStringContent
  unknown: RESTUnknownContent
}

export interface RESTArrayContent extends RESTContentNode, RESTArrayType {}

export interface RESTBooleanContent extends RESTContentNode, RESTBooleanType {}

export interface RESTIntegerContent extends RESTContentNode, RESTIntegerType {}

export interface RESTNumberContent extends RESTContentNode, RESTNumberType {}

export interface RESTObjectContent extends RESTContentNode, RESTObjectType {}

export interface RESTReferenceContent extends RESTContentNode, RESTReferenceType {}

export interface RESTStringContent extends RESTContentNode, RESTStringType {}

export interface RESTUnknownContent extends RESTContentNode, RESTUnknownType {}

export interface RESTContentNode {
  description?: string
  contentType: string
}

export interface RESTExample {
  syntax: string
  code: string
}

export type RESTParameter = RESTParameterMap[keyof RESTParameterMap]

export interface RESTParameterMap {
  array: RESTArrayParameter
  boolean: RESTBooleanParameter
  integer: RESTIntegerParameter
  number: RESTNumberParameter
  object: RESTObjectParameter
  reference: RESTReferenceParameter
  string: RESTStringParameter
  unknown: RESTUnknownParameter
}

export interface RESTArrayParameter extends RESTParameterNode, RESTArrayProperty {}

export interface RESTBooleanParameter extends RESTParameterNode, RESTBooleanProperty {}

export interface RESTIntegerParameter extends RESTParameterNode, RESTIntegerProperty {}

export interface RESTNumberParameter extends RESTParameterNode, RESTNumberProperty {}

export interface RESTObjectParameter extends RESTParameterNode, RESTObjectProperty {}

export interface RESTReferenceParameter extends RESTParameterNode, RESTReferenceProperty {}

export interface RESTStringParameter extends RESTParameterNode, RESTStringProperty {}

export interface RESTUnknownParameter extends RESTParameterNode, RESTUnknownProperty {}

export interface RESTParameterNode extends RESTPropertyNode {
  required?: true
}

export type RESTProperty = RESTPropertyMap[keyof RESTPropertyMap]

export interface RESTPropertyMap {
  array: RESTArrayProperty
  boolean: RESTBooleanProperty
  integer: RESTIntegerProperty
  number: RESTNumberProperty
  object: RESTObjectProperty
  reference: RESTReferenceProperty
  string: RESTStringProperty
  unknown: RESTUnknownProperty
}

export interface RESTArrayProperty extends RESTPropertyNode, RESTArrayType {}

export interface RESTBooleanProperty extends RESTPropertyNode, RESTBooleanType {}

export interface RESTIntegerProperty extends RESTPropertyNode, RESTIntegerType {}

export interface RESTNumberProperty extends RESTPropertyNode, RESTNumberType {}

export interface RESTObjectProperty extends RESTPropertyNode, RESTObjectType {}

export interface RESTReferenceProperty extends RESTPropertyNode, RESTReferenceType {}

export interface RESTStringProperty extends RESTPropertyNode, RESTStringType {}

export interface RESTUnknownProperty extends RESTPropertyNode, RESTUnknownType {}

export interface RESTPropertyNode {
  identifier: string
  description?: string
}

export type RESTType = RESTTypeMap[keyof RESTTypeMap]

export interface RESTTypeMap {
  array: RESTArrayType
  boolean: RESTBooleanType
  integer: RESTIntegerType
  number: RESTNumberType
  object: RESTObjectType
  reference: RESTReferenceType
  string: RESTStringType
  unknown: RESTUnknownType
}

export interface RESTArrayType extends RESTTypeNode {
  type: "array"
  items: RESTType
}

export interface RESTBooleanType extends RESTTypeNode {
  type: "boolean"
}

export interface RESTIntegerType extends RESTTypeNode {
  type: "integer"
}

export interface RESTNumberType extends RESTTypeNode {
  type: "number"
}

export interface RESTObjectType extends RESTTypeNode {
  type: "object"
  properties: RESTProperty[]
}

export interface RESTReferenceType extends RESTTypeNode {
  type: "reference"
  id: string
}

export interface RESTStringType extends RESTTypeNode {
  type: "string"
}

export interface RESTUnknownType extends RESTTypeNode {
  type: "unknown"
}

export interface RESTTypeNode {
  type: string
  format?: string
}
