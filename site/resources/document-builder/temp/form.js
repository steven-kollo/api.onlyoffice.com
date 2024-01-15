

/**
 * @class
 * @name Api
 * @description Class representing a base class.
 */

/**
 * @memberof Api
 * @name CreateCheckBoxForm
 * @description Creates a checkbox / radio button with the specified checkbox / radio button properties.
 * @returns {ApiCheckBoxForm}
 * @example
 * builder.CreateFile("docx")
 * const oDocument = Api.GetDocument()
 * let oCheckBoxForm = Api.CreateCheckBoxForm({ "key": "Marital status", "tip": "Specify your marital status", "required": true, "placeholder": "Marital status", "radio": true })
 * const oParagraph = oDocument.GetElement(0)
 * oParagraph.AddElement(oCheckBoxForm)
 * oParagraph.AddText(" Married")
 * oParagraph.AddLineBreak()
 * oCheckBoxForm = Api.CreateCheckBoxForm({ "key": "Marital status", "tip": "Specify your marital status", "required": true, "placeholder": "Marital status", "radio": true })
 * oParagraph.AddElement(oCheckBoxForm)
 * oParagraph.AddText(" Single")
 * builder.SaveFile("docxf", "CreateCheckBoxForm.docxf")
 * builder.CloseFile()
 * @param {CheckBoxFormPr} oFormPr Checkbox | radio button properties.
 */

/**
 * @memberof Api
 * @name CreateComboBoxForm
 * @description Creates a combo box / dropdown list with the specified combo box / dropdown list properties.
 * @returns {ApiComboBoxForm}
 * @example
 * builder.CreateFile("docx")
 * const oDocument = Api.GetDocument()
 * const oComboBoxForm = Api.CreateComboBoxForm({ "key": "Personal information",
 *                                                "tip": "Choose your country",
 *                                                "required": true,
 *                                                "placeholder": "Country",
 *                                                "editable": false,
 *                                                "autoFit": false,
 *                                                "items": [
 *                                                  "Latvia",
 *                                                  "USA",
 *                                                  "UK"
 *                                                ] })
 * const oParagraph = oDocument.GetElement(0)
 * oParagraph.AddElement(oComboBoxForm)
 * builder.SaveFile("docxf", "CreateComboBoxForm.docxf")
 * builder.CloseFile()
 * @param {ComboBoxFormPr} oFormPr Combobox | null dropdown list properties.
 */

/**
 * @memberof ApiDocument
 * @name InsertTextForm
 * @description Inserts a text box with the specified text box properties over the selected text.
 * @returns {ApiTextForm}
 * @example
 * builder.CreateFile("docx")
 * const oDocument = editor.GetDocument()
 * const oParagraph = oDocument.GetElement(0)
 * oParagraph.AddText("First name")
 * oParagraph.Select()
 * oDocument.InsertTextForm({ "key": "Personal information", "tip": "Enter your first name", "required": true, "placeholder": "Name", "comb": true, "maxCharacters": 10, "cellWidth": 3, "multiLine": false, "autoFit": false, "placeholderFromSelection": true, "keepSelectedTextInForm": false })
 * builder.SaveFile("docx", "InsertTextForm.docx")
 * builder.CloseFile()
 * @param {TextFormInsertPr} oFormPr Properties for inserting a text field.
 */

/**
 * @memberof Api
 * @name CreateTextForm
 * @description Creates a text field with the specified text field properties.
 * @returns {ApiTextForm}
 * @example
 * builder.CreateFile("docx")
 * const oDocument = Api.GetDocument()
 * const oTextForm = Api.CreateTextForm({ "key": "Personal information", "tip": "Enter your first name", "required": true, "placeholder": "First name", "comb": true, "maxCharacters": 10, "cellWidth": 3, "multiLine": false, "autoFit": false })
 * const oParagraph = oDocument.GetElement(0)
 * oParagraph.AddElement(oTextForm)
 * builder.SaveFile("docxf", "CreateTextForm.docxf")
 * builder.CloseFile()
 * @param {TextFormPr} oFormPr Text field properties.
 */

/**
 * @memberof Api
 * @name CreatePictureForm
 * @description Creates a picture form with the specified picture form properties.
 * @returns {ApiPictureForm}
 * @example
 * builder.CreateFile("docx")
 * const oDocument = Api.GetDocument()
 * const oPictureForm = Api.CreatePictureForm({ "key": "Personal information", "tip": "Upload your photo", "required": true, "placeholder": "Photo", "scaleFlag": "tooBig", "lockAspectRatio": true, "respectBorders": false, "shiftX": 50, "shiftY": 50 })
 * const oParagraph = oDocument.GetElement(0)
 * oParagraph.AddElement(oPictureForm)
 * oPictureForm.SetImage("https://api.onlyoffice.com/content/img/docbuilder/examples/user-profile.png")
 * builder.SaveFile("docxf", "CreatePictureForm.docxf")
 * builder.CloseFile()
 * @param {PictureFormPr} oFormPr Picture form properties.
 */

/**
 * @class
 * @name ApiDocument
 * @description Inserts a text box with the specified text box properties over the selected text.
 * @prop {TextFormInsertPr} ApiDocumentoFormPr Properties for inserting a text field.
 */