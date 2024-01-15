export type Unknown = UnknownMap[keyof UnknownMap]

export interface UnknownMap {
  class: Class
  description: Description
  event: Event
  example: Example
  global: Global
  memberof: MemberOf
  name: Name
  param: Parameter
  prop: Property
  returns: Returns
}

export interface Class extends Tag {
  tag: "class"
}

export interface Description extends Tag {
  tag: "description"
  content: string
}

export interface Event extends Tag {
  tag: "event"
  parent: string
  name: string
}

export interface Example extends Tag {
  tag: "example"
  content: string
}

export interface Global extends Tag {
  tag: "global"
}

export interface MemberOf extends Tag {
  tag: "memberof"
  parent: string
}

export interface Name extends Tag {
  tag: "name"
  content: string
}

export interface Parameter extends Tag {
  tag: "param"
  type: string
  name: string
  description: string
  optional: boolean
  default: string
}

export interface Property extends Tag {
  tag: "prop"
  type: string
  name: string
  description: string
  optional: boolean
  default: string
}

export interface Returns extends Tag {
  tag: "returns"
  type: string
  description: string
}

export interface Tag {
  tag: string
  normalize(): void
  render(): Promise<string>
}
