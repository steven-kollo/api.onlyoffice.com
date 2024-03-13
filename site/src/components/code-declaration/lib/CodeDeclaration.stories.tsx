import "@onlyoffice/documentation-ui-content/content.css"
import "./code-declaration.css"
import { h } from "preact"
import { CodeDeclaration } from "./CodeDeclaration"

export default {
  title: "CodeDeclaration/CodeDeclaration"
}

export const Composition = {
  render() {
    return (
      <CodeDeclaration
        declaration={d}
        onHighlight={({ children }) => children}
        onLink={() => "https://example.com/"}
        onRetrieve={() => undefined}
      />
    )
  }
}

const d = {
  "id": "word/api_plugins;Api#AddContentControl",
  "meta": {
    "package": "word/api_plugins"
  },
  "identifier": "AddContentControl",
  "title": "AddContentControl(type, commonPr)",
  "kind": "instanceMethod",
  "type": {
    "type": "function",
    "parameters": [
      {
        "name": "type",
        "type": {
          "type": "reference",
          "id": "word/api_plugins;ContentControlType",
          "identifier": "ContentControlType"
        },
        "description": "A numeric value that specifies the content control type. It can have one of the following values: <b>1</b> (block), <b>2</b> (inline), <b>3</b> (row), or <b>4</b> (cell)."
      },
      {
        "name": "commonPr",
        "type": {
          "type": "reference",
          "id": "word/api_plugins;ContentControlProperties",
          "identifier": "ContentControlProperties"
        },
        "description": "The common content control properties.",
        "default": "{}"
      }
    ],
    "returns": {
      "type": {
        "type": "reference",
        "id": "word/api_plugins;ContentControl",
        "identifier": "ContentControl"
      },
      "description": "- A JSON object containing the data about the created content control."
    }
  },
  "signature": [
    {
      "type": "decoration",
      "text": "(method)"
    },
    {
      "type": "text",
      "text": " "
    },
    {
      "type": "identifier",
      "text": "AddContentControl"
    },
    {
      "type": "text",
      "text": "("
    },
    {
      "type": "text",
      "text": "type"
    },
    {
      "type": "text",
      "text": ": "
    },
    {
      "type": "reference",
      "id": "word/api_plugins;ContentControlType",
      "text": "ContentControlType"
    },
    {
      "type": "text",
      "text": ", "
    },
    {
      "type": "text",
      "text": "commonPr"
    },
    {
      "type": "text",
      "text": ": "
    },
    {
      "type": "reference",
      "id": "word/api_plugins;ContentControlProperties",
      "text": "ContentControlProperties"
    },
    {
      "type": "text",
      "text": ")"
    },
    {
      "type": "text",
      "text": ": "
    },
    {
      "type": "reference",
      "id": "word/api_plugins;ContentControl",
      "text": "ContentControl"
    }
  ],
  "summary": "Adds an empty content control to the document.",
  "description": "Adds an empty content control to the document.",
  "parent": {
    "id": "word/api_plugins;Api",
    "identifier": "Api"
  },
  "examples": [
    "const type = 1\nconst properties = { \"Id\": 100, \"Tag\": \"CC_Tag\", \"Lock\": 3 }\nwindow.Asc.plugin.executeMethod(\"AddContentControl\", [\n  type,\n  properties\n])"
  ],
  "sections": [
    {
      "type": "description",
      "description": "Adds an empty content control to the document."
    },
    {
      "type": "parameters",
      "items": [
        {
          "name": "type",
          "type": {
            "type": "reference",
            "id": "word/api_plugins;ContentControlType",
            "identifier": "ContentControlType"
          },
          "description": "A numeric value that specifies the content control type. It can have one of the following values: <b>1</b> (block), <b>2</b> (inline), <b>3</b> (row), or <b>4</b> (cell)."
        },
        {
          "name": "commonPr",
          "type": {
            "type": "reference",
            "id": "word/api_plugins;ContentControlProperties",
            "identifier": "ContentControlProperties"
          },
          "description": "The common content control properties.",
          "default": "{}"
        }
      ]
    },
    {
      "type": "returns",
      "items": [
        {
          "type": {
            "type": "reference",
            "id": "word/api_plugins;ContentControl",
            "identifier": "ContentControl"
          },
          "description": "- A JSON object containing the data about the created content control."
        }
      ]
    },
    {
      "type": "examples",
      "items": [
        "const type = 1\nconst properties = { \"Id\": 100, \"Tag\": \"CC_Tag\", \"Lock\": 3 }\nwindow.Asc.plugin.executeMethod(\"AddContentControl\", [\n  type,\n  properties\n])"
      ]
    },
    {
      "type": "seeAlso",
      "items": [
        {
          "type": "reference",
          "id": "word/api_plugins;Api#OpenFile",
          "identifier": ""
        },
        {
          "type": "reference",
          "id": "word/api_plugins;Api#GetFields",
          "identifier": ""
        },
        {
          "type": "reference",
          "id": "word/api_plugins;Api#InsertAndReplaceContentControls",
          "identifier": ""
        },
        {
          "type": "reference",
          "id": "word/api_plugins;Api#RemoveContentControls",
          "identifier": ""
        },
        {
          "type": "reference",
          "id": "word/api_plugins;Api#GetAllContentControls",
          "identifier": ""
        },
        {
          "type": "reference",
          "id": "word/api_plugins;Api#RemoveContentControl",
          "identifier": ""
        },
        {
          "type": "reference",
          "id": "word/api_plugins;Api#GetCurrentContentControl",
          "identifier": ""
        },
        {
          "type": "reference",
          "id": "word/api_plugins;Api#GetCurrentContentControlPr",
          "identifier": ""
        },
        {
          "type": "reference",
          "id": "word/api_plugins;Api#SelectContentControl",
          "identifier": ""
        },
        {
          "type": "reference",
          "id": "word/api_plugins;Api#MoveCursorToContentControl",
          "identifier": ""
        },
        {
          "type": "reference",
          "id": "word/api_plugins;Api#RemoveSelectedContent",
          "identifier": ""
        },
        {
          "type": "reference",
          "id": "word/api_plugins;Api#AddComment",
          "identifier": ""
        },
        {
          "type": "reference",
          "id": "word/api_plugins;Api#MoveCursorToStart",
          "identifier": ""
        },
        {
          "type": "reference",
          "id": "word/api_plugins;Api#MoveCursorToEnd",
          "identifier": ""
        },
        {
          "type": "reference",
          "id": "word/api_plugins;Api#SearchAndReplace",
          "identifier": ""
        },
        {
          "type": "reference",
          "id": "word/api_plugins;Api#GetFileHTML",
          "identifier": ""
        },
        {
          "type": "reference",
          "id": "word/api_plugins;Api#GetAllComments",
          "identifier": ""
        },
        {
          "type": "reference",
          "id": "word/api_plugins;Api#RemoveComments",
          "identifier": ""
        },
        {
          "type": "reference",
          "id": "word/api_plugins;Api#ChangeComment",
          "identifier": ""
        },
        {
          "type": "reference",
          "id": "word/api_plugins;Api#MoveToComment",
          "identifier": ""
        },
        {
          "type": "reference",
          "id": "word/api_plugins;Api#SetDisplayModeInReview",
          "identifier": ""
        },
        {
          "type": "reference",
          "id": "word/api_plugins;Api#AddContentControlCheckBox",
          "identifier": ""
        },
        {
          "type": "reference",
          "id": "word/api_plugins;Api#AddContentControlPicture",
          "identifier": ""
        },
        {
          "type": "reference",
          "id": "word/api_plugins;Api#AddContentControlList",
          "identifier": ""
        },
        {
          "type": "reference",
          "id": "word/api_plugins;Api#AddContentControlDatePicker",
          "identifier": ""
        },
        {
          "type": "reference",
          "id": "word/api_plugins;Api#GetAllOleObjects",
          "identifier": ""
        },
        {
          "type": "reference",
          "id": "word/api_plugins;Api#RemoveOleObject",
          "identifier": ""
        },
        {
          "type": "reference",
          "id": "word/api_plugins;Api#RemoveOleObjects",
          "identifier": ""
        },
        {
          "type": "reference",
          "id": "word/api_plugins;Api#SelectOleObject",
          "identifier": ""
        },
        {
          "type": "reference",
          "id": "word/api_plugins;Api#InsertOleObject",
          "identifier": ""
        },
        {
          "type": "reference",
          "id": "word/api_plugins;Api#ChangeOleObject",
          "identifier": ""
        },
        {
          "type": "reference",
          "id": "word/api_plugins;Api#ChangeOleObjects",
          "identifier": ""
        },
        {
          "type": "reference",
          "id": "word/api_plugins;Api#AcceptReviewChanges",
          "identifier": ""
        },
        {
          "type": "reference",
          "id": "word/api_plugins;Api#RejectReviewChanges",
          "identifier": ""
        },
        {
          "type": "reference",
          "id": "word/api_plugins;Api#MoveToNextReviewChange",
          "identifier": ""
        },
        {
          "type": "reference",
          "id": "word/api_plugins;Api#GetAllAddinFields",
          "identifier": ""
        },
        {
          "type": "reference",
          "id": "word/api_plugins;Api#UpdateAddinFields",
          "identifier": ""
        },
        {
          "type": "reference",
          "id": "word/api_plugins;Api#AddAddinField",
          "identifier": ""
        },
        {
          "type": "reference",
          "id": "word/api_plugins;Api#RemoveFieldWrapper",
          "identifier": ""
        },
        {
          "type": "reference",
          "id": "word/api_plugins;Api#SetEditingRestrictions",
          "identifier": ""
        },
        {
          "type": "reference",
          "id": "word/api_plugins;Api#GetCurrentWord",
          "identifier": ""
        },
        {
          "type": "reference",
          "id": "word/api_plugins;Api#ReplaceCurrentWord",
          "identifier": ""
        },
        {
          "type": "reference",
          "id": "word/api_plugins;Api#GetCurrentSentence",
          "identifier": ""
        },
        {
          "type": "reference",
          "id": "word/api_plugins;Api#ReplaceCurrentSentence",
          "identifier": ""
        }
      ]
    }
  ]
}
