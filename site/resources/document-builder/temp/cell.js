

/**
 * @class
 * @name ApiBullet
 * @description Class representing a paragraph bullet.
 */

/**
 * @class
 * @name ApiChart
 * @description Class representing a chart.
 */

/**
 * @class
 * @name ApiColor
 * @description Class representing a base class for the color types.
 */

/**
 * @class
 * @name ApiDocumentContent
 * @description Class representing a container for paragraphs and tables.
 */

/**
 * @class
 * @name ApiDrawing
 * @description Class representing a graphical object.
 */

/**
 * @class
 * @name ApiFill
 * @description Class representing a base class for fill.
 */

/**
 * @class
 * @name ApiFreezePanes
 * @description Class representing a freeze Panes.
 */

/**
 * @class
 * @name ApiGradientStop
 * @description Class representing gradient stop.
 */

/**
 * @class
 * @name ApiOleObject
 * @description Class representing an OLE object.
 */

/**
 * @class
 * @name ApiImage
 * @description Class representing an image.
 */

/**
 * @class
 * @name ApiParaPr
 * @description Class representing the paragraph properties.
 */

/**
 * @class
 * @name ApiParagraph
 * @description Class representing a paragraph.
 */

/**
 * @class
 * @name ApiPresetColor
 * @description Class representing a Preset Color.
 */

/**
 * @class
 * @name ApiRGBColor
 * @description Class representing an RGB Color.
 */

/**
 * @class
 * @name ApiRun
 * @description Class representing a small text block called 'run'.
 */

/**
 * @class
 * @name ApiSchemeColor
 * @description Class representing a Scheme Color.
 */

/**
 * @class
 * @name ApiShape
 * @description Class representing a shape.
 */

/**
 * @class
 * @name ApiStroke
 * @description Class representing a stroke.
 */

/**
 * @class
 * @name ApiTextPr
 * @description Class representing the text properties.
 */

/**
 * @memberof Api
 * @name AddComment
 * @description Adds a comment to the document.
 * @returns {ApiComment | null} returns null if sText is invalid
 * @example
 * builder.CreateFile("xlsx")
 * Api.AddComment("Comment 1", "Bob")
 * Api.AddComment("Comment 2")
 * const arrComments = Api.GetComments()
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("Commet Text: ", arrComments[0].GetText())
 * oWorksheet.GetRange("B1").SetValue("Commet Author: ", arrComments[0].GetAuthorName())
 * builder.SaveFile("xlsx", "AddComment.xlsx")
 * builder.CloseFile()
 * @param {String} sText The comment text.
 * @param {String=} sAuthor The author's name. Default values is username.
 */

/**
 * @event Api#onWorksheetChange
 * @description The callback function which is called when the specified range of the current sheet changes. Please note that the event is not called for the undo/redo operations.
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("A1")
 * oRange.SetValue("1")
 * Api.attachEvent("onWorksheetChange", (oRange) => {
 *   console.log("onWorksheetChange")
 *   console.log(oRange.GetAddress())
 * })
 * builder.SaveFile("xlsx", "attachEvent.xlsx")
 * builder.CloseFile()
 * @param {String} eventName The event name.
 * @param {Function} callback Function to be called when the event fires.
 */

/**
 * @memberof Api
 * @name AddSheet
 * @description Creates a new worksheet. The new worksheet becomes the active sheet.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oSheet = Api.AddSheet("New sheet")
 * builder.SaveFile("xlsx", "AddSheet.xlsx")
 * builder.CloseFile()
 * @param {String} sName The name of a new worksheet.
 */

/**
 * @memberof Api
 * @name AddDefName
 * @description Adds a new name to a range of cells.
 * @returns {Boolean} returns false if sName or sRef are invalid
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * oWorksheet.GetRange("B1").SetValue("2")
 * Api.AddDefName("numbers", "Sheet1!$A$1:$B$1")
 * oWorksheet.GetRange("A3").SetValue("We defined a name 'numbers' for a range of cells A1:B1.")
 * builder.SaveFile("xlsx", "AddDefName.xlsx")
 * builder.CloseFile()
 * @param {String} sName The range name.
 * @param {String} sRef The reference to the specified rangeIt must contain the sheet name, followed by sign ! and a range of cells. Example: "Sheet1!$A$1:$B$2".
 * @param {Boolean} isHidden Defines if the range name is hidden or not.
 */

/**
 * @memberof Api
 * @name CreateBullet
 * @description Creates a bullet for a paragraph with the character or symbol specified with the sSymbol parameter.
 * @returns {ApiBullet}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oBullet = Api.CreateBullet("-")
 * oParagraph.SetBullet(oBullet)
 * oParagraph.AddText(" This is an example of the bulleted paragraph.")
 * builder.SaveFile("xlsx", "CreateBullet.xlsx")
 * builder.CloseFile()
 * @param {String} sSymbol The character or symbol which will be used to create the bullet for the paragraph.
 */

/**
 * @memberof Api
 * @name CreateBlipFill
 * @description Creates a blip fill to apply to the object using the selected image as the object background.
 * @returns {ApiFill}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateBlipFill("https://api.onlyoffice.com/content/img/docbuilder/examples/icon_DocumentEditors.png", "tile")
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 1, 3 * 36000)
 * builder.SaveFile("xlsx", "CreateBlipFill.xlsx")
 * builder.CloseFile()
 * @param {String} sImageUrl The path to the image used for the blip fill (currently only internet URL or Base64 encoded images are supported).
 * @param {BlipFillType} sBlipFillType The type of the fill used for the blip fill (tile or stretch).
 */

/**
 * @memberof Api
 * @name CreateColorFromRGB
 * @description Creates an RGB color setting the appropriate values for the red, green and blue color components.
 * @returns {ApiColor}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oColor = Api.CreateColorFromRGB(255, 111, 61)
 * oWorksheet.GetRange("A2").SetValue("Text with color")
 * oWorksheet.GetRange("A2").SetFontColor(oColor)
 * builder.SaveFile("xlsx", "CreateColorFromRGB.xlsx")
 * builder.CloseFile()
 * @param {byte} r Red color component value.
 * @param {byte} g Green color component value.
 * @param {byte} b Blue color component value.
 */

/**
 * @memberof Api
 * @name CreateGradientStop
 * @description Creates a gradient stop used for different types of gradients.
 * @returns {ApiGradientStop}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateLinearGradientFill([
 *   oGs1,
 *   oGs2
 * ], 5400000)
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 1, 3 * 36000)
 * builder.SaveFile("xlsx", "CreateGradientStop.xlsx")
 * builder.CloseFile()
 * @param {ApiUniColor} oUniColor The color used for the gradient stop.
 * @param {PositivePercentage} nPos The position of the gradient stop measured in 1000th of percent.
 */

/**
 * @memberof Api
 * @name CreateNewHistoryPoint
 * @description Creates a new history point.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("This is just a sample text.")
 * Api.CreateNewHistoryPoint()
 * oWorksheet.GetRange("A3").SetValue("New history point was just created.")
 * builder.SaveFile("xlsx", "CreateNewHistoryPoint.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof Api
 * @name CreateLinearGradientFill
 * @description Creates a linear gradient fill to apply to the object using the selected linear gradient as the object background.
 * @returns {ApiFill}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateLinearGradientFill([
 *   oGs1,
 *   oGs2
 * ], 5400000)
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 1, 3 * 36000)
 * builder.SaveFile("xlsx", "CreateLinearGradientFill.xlsx")
 * builder.CloseFile()
 * @param {Array<ApiGradientStop>} aGradientStop The array of gradient color stops measured in 1000th of percent.
 * @param {PositivePercentage} Angle The angle measured in 60000th of a degree that will define the gradient direction.
 */

/**
 * @memberof Api
 * @name CreateNoFill
 * @description Creates no fill and removes the fill from the element.
 * @returns {ApiFill}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateLinearGradientFill([
 *   oGs1,
 *   oGs2
 * ], 5400000)
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 1, 3 * 36000)
 * builder.SaveFile("xlsx", "CreateNoFill.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof Api
 * @name CreateNumbering
 * @description Creates a bullet for a paragraph with the numbering character or symbol specified with the sType parameter.
 * @returns {ApiBullet}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * let oParagraph = oDocContent.GetElement(0)
 * const oBullet = Api.CreateNumbering("ArabicParenR", 1)
 * oParagraph.SetBullet(oBullet)
 * oParagraph.AddText(" This is an example of the numbered paragraph.")
 * oParagraph = Api.CreateParagraph()
 * oParagraph.SetBullet(oBullet)
 * oParagraph.AddText(" This is an example of the numbered paragraph.")
 * oDocContent.Push(oParagraph)
 * builder.SaveFile("xlsx", "CreateNumbering.xlsx")
 * builder.CloseFile()
 * @param {BulletType} sType The numbering type the paragraphs will be numbered with.
 * @param {Number=} nStartAt The number the first numbered paragraph will start with.
 */

/**
 * @memberof Api
 * @name CreateParagraph
 * @description Creates a new paragraph.
 * @returns {ApiParagraph}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * oDocContent.RemoveAllElements()
 * const oParagraph = Api.CreateParagraph()
 * oParagraph.SetJc("left")
 * oParagraph.AddText("We removed all elements from the shape and added a new paragraph inside it.")
 * oDocContent.Push(oParagraph)
 * builder.SaveFile("xlsx", "CreateParagraph.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof Api
 * @name CreateColorByName
 * @description Creates a color selecting it from one of the available color presets.
 * @returns {ApiColor}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oColor = Api.CreateColorByName("peachPuff")
 * oWorksheet.GetRange("A2").SetValue("Text with color")
 * oWorksheet.GetRange("A2").SetFontColor(oColor)
 * builder.SaveFile("xlsx", "CreateColorByName.xlsx")
 * builder.CloseFile()
 * @param {PresetColor} sPresetColor A preset selected from the list of the available color preset names.
 */

/**
 * @memberof Api
 * @name CreatePresetColor
 * @description Creates a color selecting it from one of the available color presets.
 * @returns {ApiPresetColor}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oPresetColor = Api.CreatePresetColor("peachPuff")
 * const oGs1 = Api.CreateGradientStop(oPresetColor, 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateLinearGradientFill([
 *   oGs1,
 *   oGs2
 * ], 5400000)
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 1, 3 * 36000)
 * builder.SaveFile("xlsx", "CreatePresetColor.xlsx")
 * builder.CloseFile()
 * @param {PresetColor} sPresetColor A preset selected from the list of the available color preset names.
 */

/**
 * @memberof Api
 * @name CreateRGBColor
 * @description Creates an RGB color setting the appropriate values for the red, green and blue color components.
 * @returns {ApiRGBColor}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateLinearGradientFill([
 *   oGs1,
 *   oGs2
 * ], 5400000)
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 1, 3 * 36000)
 * builder.SaveFile("xlsx", "CreateGradientStop.xlsx")
 * builder.CloseFile()
 * @param {byte} r Red color component value.
 * @param {byte} g Green color component value.
 * @param {byte} b Blue color component value.
 */

/**
 * @memberof Api
 * @name CreatePatternFill
 * @description Creates a pattern fill to apply to the object using the selected pattern as the object background.
 * @returns {ApiFill}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreatePatternFill("dashDnDiag", Api.CreateRGBColor(255, 111, 61), Api.CreateRGBColor(51, 51, 51))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 1, 3 * 36000)
 * builder.SaveFile("xlsx", "CreatePatternFill.xlsx")
 * builder.CloseFile()
 * @param {PatternType} sPatternType The pattern type used for the fill selected from one of the available pattern types.
 * @param {ApiUniColor} BgColor The background color used for the pattern creation.
 * @param {ApiUniColor} FgColor The foreground color used for the pattern creation.
 */

/**
 * @memberof Api
 * @name CreateRun
 * @description Creates a new smaller text block to be inserted to the current paragraph or table.
 * @returns {ApiRun}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * let oRun = Api.CreateRun()
 * oRun.AddText("This is just a sample text. ")
 * oParagraph.AddElement(oRun)
 * oRun = Api.CreateRun()
 * oRun.SetFontFamily("Comic Sans MS")
 * oRun.AddText("This is a text run with the font family set to 'Comic Sans MS'.")
 * oParagraph.AddElement(oRun)
 * builder.SaveFile("xlsx", "CreateRun.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof Api
 * @name CreateSchemeColor
 * @description Creates a complex color scheme selecting from one of the available schemes.
 * @returns {ApiSchemeColor}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oSchemeColor = Api.CreateSchemeColor("dk1")
 * const oFill = Api.CreateSolidFill(oSchemeColor)
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * oWorksheet.AddShape("curvedUpArrow", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 1, 3 * 36000)
 * builder.SaveFile("xlsx", "CreateSchemeColor.xlsx")
 * builder.CloseFile()
 * @param {SchemeColorId} sSchemeColorId The color scheme identifier.
 */

/**
 * @memberof Api
 * @name CreateSolidFill
 * @description Creates a solid fill to apply to the object using a selected solid color as the object background.
 * @returns {ApiFill}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRGBColor = Api.CreateRGBColor(255, 111, 61)
 * const oFill = Api.CreateSolidFill(oRGBColor)
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 1, 3 * 36000)
 * builder.SaveFile("xlsx", "CreateSolidFill.xlsx")
 * builder.CloseFile()
 * @param {ApiUniColor} oUniColor The color used for the element fill.
 */

/**
 * @memberof Api
 * @name CreateStroke
 * @description Creates a stroke adding shadows to the element.
 * @returns {ApiStroke}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateLinearGradientFill([
 *   oGs1,
 *   oGs2
 * ], 5400000)
 * const oFill1 = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * const oStroke = Api.CreateStroke(3 * 36000, oFill1)
 * oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 1, 3 * 36000)
 * builder.SaveFile("xlsx", "CreateStroke.xlsx")
 * builder.CloseFile()
 * @param {EMU} nWidth The width of the shadow measured in English measure units.
 * @param {ApiFill} oFill The fill type used to create the shadow.
 */

/**
 * @memberof Api
 * @name CreateTextPr
 * @description Creates the empty text properties.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 80 * 36000, 50 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * oDocContent.RemoveAllElements()
 * const oTextPr = Api.CreateTextPr()
 * oTextPr.SetFontSize(30)
 * oTextPr.SetBold(true)
 * const oParagraph = Api.CreateParagraph()
 * oParagraph.SetJc("left")
 * oParagraph.AddText("This is a sample text with the font size set to 30 and the font weight set to bold.")
 * oParagraph.SetTextPr(oTextPr)
 * oDocContent.Push(oParagraph)
 * builder.SaveFile("xlsx", "CreateTextPr.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof Api
 * @name GetActiveSheet
 * @description Returns an object that represents the active sheet.
 * @returns {ApiWorksheet}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue("2")
 * oWorksheet.GetRange("B2").SetValue("2")
 * oWorksheet.GetRange("A3").SetValue("2x2=")
 * oWorksheet.GetRange("B3").SetValue("=B1*B2")
 * builder.SaveFile("xlsx", "GetActiveSheet.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof Api
 * @name Format
 * @description Returns a class formatted according to the instructions contained in the format expression.
 * @returns {String}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFormat = Api.Format("123456", ["$#,##0"])
 * oWorksheet.GetRange("A1").SetValue(oFormat)
 * builder.SaveFile("xlsx", "Format.xlsx")
 * builder.CloseFile()
 * @param {String} expression Any valid expression.
 * @param {String=} format=null A valid named or user-defined format expression.
 */

/**
 * @memberof Api
 * @name CreateRadialGradientFill
 * @description Creates a radial gradient fill to apply to the object using the selected radial gradient as the object background.
 * @returns {ApiFill}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 1, 3 * 36000)
 * builder.SaveFile("xlsx", "CreateRadialGradientFill.xlsx")
 * builder.CloseFile()
 * @param {Array<ApiGradientStop>} aGradientStop The array of gradient color stops measured in 1000th of percent.
 */

/**
 * @memberof Api
 * @name GetCommentById
 * @description Returns a comment from the current document by its ID.
 * @returns {ApiComment | null}
 * @example
 * builder.CreateFile("xlsx")
 * let oComment = Api.AddComment("Comment", "Bob")
 * const sId = oComment.GetId()
 * oComment = Api.GetCommentById(sId)
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("Commet Text: ", oComment.GetText())
 * oWorksheet.GetRange("B1").SetValue("Commet Author: ", oComment.GetAuthorName())
 * builder.SaveFile("xlsx", "GetCommentById.xlsx")
 * builder.CloseFile()
 * @param {String} sId The comment ID
 */

/**
 * @memberof Api
 * @name GetComments
 * @description Returns an array of ApiComment objects.
 * @returns {Array<ApiComment>}
 * @example
 * builder.CreateFile("xlsx")
 * Api.AddComment("Comment 1", "Bob")
 * Api.AddComment("Comment 2", "Bob")
 * const arrComments = Api.GetComments()
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("Commet Text: ", arrComments[0].GetText())
 * oWorksheet.GetRange("B1").SetValue("Commet Author: ", arrComments[0].GetAuthorName())
 * builder.SaveFile("xlsx", "GetComments.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof Api
 * @name GetDefName
 * @description Returns the ApiName object by the range name.
 * @returns {ApiName}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * oWorksheet.GetRange("B1").SetValue("2")
 * Api.AddDefName("numbers", "Sheet1!$A$1:$B$1")
 * const oDefName = Api.GetDefName("numbers")
 * oWorksheet.GetRange("A3").SetValue("DefName: " + oDefName.GetName())
 * builder.SaveFile("xlsx", "GetDefName.xlsx")
 * builder.CloseFile()
 * @param {String} defName The range name.
 */

/**
 * @memberof Api
 * @name GetFullName
 * @description Returns the full name of the currently opened file.
 * @returns {String}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const sName = Api.GetFullName()
 * oWorksheet.GetRange("B1").SetValue("File name: " + sName)
 * builder.SaveFile("xlsx", "GetFullName.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof Api
 * @name GetLocale
 * @description Returns the current locale ID.
 * @returns {Number}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * Api.SetLocale("en-CA")
 * const nLocale = Api.GetLocale()
 * oWorksheet.GetRange("A1").SetValue("Locale: " + nLocale)
 * builder.SaveFile("xlsx", "GetLocale.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof Api
 * @name GetMailMergeData
 * @description Returns the mail merge data.
 * @returns {Array<Array>}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.SetColumnWidth(0, 20)
 * oWorksheet.GetRange("A1").SetValue("Email address")
 * oWorksheet.GetRange("B1").SetValue("Greeting")
 * oWorksheet.GetRange("C1").SetValue("First name")
 * oWorksheet.GetRange("D1").SetValue("Last name")
 * oWorksheet.GetRange("A2").SetValue("user1@example.com")
 * oWorksheet.GetRange("B2").SetValue("Dear")
 * oWorksheet.GetRange("C2").SetValue("John")
 * oWorksheet.GetRange("D2").SetValue("Smith")
 * oWorksheet.GetRange("A3").SetValue("user2@example.com")
 * oWorksheet.GetRange("B3").SetValue("Hello")
 * oWorksheet.GetRange("C3").SetValue("Kate")
 * oWorksheet.GetRange("D3").SetValue("Cage")
 * const aMailMergeData = Api.GetMailMergeData(0)
 * oWorksheet.GetRange("A5").SetValue("Mail merge data: " + aMailMergeData)
 * builder.SaveFile("xlsx", "GetMailMergeData.xlsx")
 * builder.CloseFile()
 * @param {Number} nSheet The sheet index.
 * @param {Boolean=} bWithFormat=false Specifies that the data will be received with the format.
 */

/**
 * @memberof Api
 * @name GetRange
 * @description Returns the ApiRange object by the range reference.
 * @returns {ApiRange}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = Api.GetRange("A1:C1")
 * oRange.SetFillColor(Api.CreateColorFromRGB(255, 213, 191))
 * oWorksheet.GetRange("A3").SetValue("The color was set to the background of cells A1:C1.")
 * builder.SaveFile("xlsx", "GetRange.xlsx")
 * builder.CloseFile()
 * @param {String} sRange The range of cells from the current sheet.
 */

/**
 * @memberof Api
 * @name GetSheet
 * @description Returns an object that represents a sheet.
 * @returns {ApiWorksheet | null}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetSheet("Sheet1")
 * oWorksheet.GetRange("A1").SetValue("This is a sample text on 'Sheet1'.")
 * builder.SaveFile("xlsx", "GetSheet.xlsx")
 * builder.CloseFile()
 * @param {String | Number} nameOrIndex Sheet name or sheet index.
 */

/**
 * @memberof Api
 * @name GetSelection
 * @description Returns an object that represents the selected range.
 * @returns {ApiRange}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * Api.GetSelection().SetValue("selected")
 * builder.SaveFile("xlsx", "GetSelection.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof Api
 * @name GetFreezePanesType
 * @description Returns freeze panes type.
 * @returns {FreezePaneType}
 * @example
 * builder.CreateFile("xlsx")
 * Api.SetFreezePanesType("column")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("Type: ")
 * oWorksheet.GetRange("B1").SetValue(Api.GetFreezePanesType())
 * builder.SaveFile("xlsx", "GetFreezePanesType.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof Api
 * @name GetSheets
 * @description Returns a sheet collection that represents all the sheets in the active workbook.
 * @returns {Array<ApiWorksheet>}
 * @example
 * builder.CreateFile("xlsx")
 * Api.AddSheet("new_sheet_name")
 * const sheets = Api.GetSheets()
 * const sheet_name1 = sheets[0].GetName()
 * const sheet_name2 = sheets[1].GetName()
 * sheets[1].GetRange("A1").SetValue(sheet_name1)
 * sheets[1].GetRange("A2").SetValue(sheet_name2)
 * builder.SaveFile("xlsx", "GetSheets.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof Api
 * @name GetThemesColors
 * @description Returns a list of all the available theme colors for the spreadsheet.
 * @returns {Array}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const themes = Api.GetThemesColors()
 * for (let i = 0; i < themes.length; ++i) {
 *   oWorksheet.GetRange("A" + (i + 1)).SetValue(themes[i])
 * }
 * builder.SaveFile("xlsx", "GetThemesColors.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof Api
 * @name Intersect
 * @description Returns the ApiRange object that represents the rectangular intersection of two or more ranges. If one or more ranges from a different worksheet are specified, an error will be returned.
 * @returns {ApiRange | null}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange1 = oWorksheet.GetRange("A1:C5")
 * const oRange2 = oWorksheet.GetRange("B2:B4")
 * const oRange = Api.Intersect(oRange1, oRange2)
 * oRange.SetFillColor(Api.CreateColorFromRGB(255, 213, 191))
 * builder.SaveFile("xlsx", "Intersect.xlsx")
 * builder.CloseFile()
 * @param {ApiRange} Range1 One of the intersecting ranges. At least two Range objects must be specified.
 * @param {ApiRange} Range2 One of the intersecting ranges. At least two Range objects must be specified.
 */

/**
 * @memberof Api
 * @name ReplaceTextSmart
 * @description Replaces each paragraph (or text in cell) in the select with the corresponding text from an array of strings.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * oWorksheet.GetRange("A2").SetValue("2")
 * const oRange = oWorksheet.GetRange("A1:A2")
 * oRange.Select()
 * Api.ReplaceTextSmart([
 *   "Cell 1",
 *   "Cell 2"
 * ])
 * builder.SaveFile("xlsx", "ReplaceTextSmart.xlsx")
 * builder.CloseFile()
 * @param {Array} arrString An array of replacement strings.
 * @param {String=} sParaTab=EMPTY_STRING A character which is used to specify the tab in the source text.
 * @param {String=} sParaNewLine=EMPTY_STRING A character which is used to specify the line break character in the source text.
 */

/**
 * @memberof Api
 * @name SetFreezePanesType
 * @description Sets freeze panes type.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * Api.SetFreezePanesType("column")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFreezePanes = oWorksheet.GetFreezePanes()
 * const oRange = oFreezePanes.GetLocation()
 * oWorksheet.GetRange("A1").SetValue("Location: ")
 * oWorksheet.GetRange("B1").SetValue(oRange.GetAddress())
 * builder.SaveFile("xlsx", "SetFreezePanesType.xlsx")
 * builder.CloseFile()
 * @param {FreezePaneType} FreezePaneType The type of freezing ('null' to unfreeze).
 */

/**
 * @memberof Api
 * @name Save
 * @description Saves changes to the specified document.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("This sample text is saved to the worksheet.")
 * Api.Save()
 * builder.SaveFile("xlsx", "Save.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof Api
 * @name SetLocale
 * @description Sets a locale to the document.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * Api.SetLocale("en-CA")
 * oWorksheet.GetRange("A1").SetValue("A sample spreadsheet with the language set to English (Canada).")
 * builder.SaveFile("xlsx", "SetLocale.xlsx")
 * builder.CloseFile()
 * @param {number} LCID The locale specified.
 */

/**
 * @memberof Api
 * @name attachEvent
 * @description Subscribes to the specified event and calls the callback function when the event fires.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("A1")
 * oRange.SetValue("1")
 * Api.attachEvent("onWorksheetChange", (oRange) => {
 *   console.log("onWorksheetChange")
 *   console.log(oRange.GetAddress())
 * })
 * builder.SaveFile("xlsx", "attachEvent.xlsx")
 * builder.CloseFile()
 * @param {String} eventName The event name.
 * @param {Function} callback Function to be called when the event fires.
 */

/**
 * @memberof Api
 * @name RecalculateAllFormulas
 * @description Recalculates all formulas in the active workbook.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(1)
 * oWorksheet.GetRange("C1").SetValue(2)
 * let oRange = oWorksheet.GetRange("A1")
 * oRange.SetValue("=SUM(B1:C1)")
 * oRange = oWorksheet.GetRange("E1")
 * oRange.SetValue("=A1+1")
 * oWorksheet.GetRange("B1").SetValue(3)
 * Api.RecalculateAllFormulas()
 * oWorksheet.GetRange("A3").SetValue("Formulas from cells A1 and E1 were recalculated with a new value from cell C1.")
 * builder.SaveFile("xlsx", "RecalculateAllFormulas.xlsx")
 * builder.CloseFile()
 * @param {Function} fLogger A function which specifies the logger object for checking recalculation of formulas.
 */

/**
 * @memberof Api
 * @name SetThemeColors
 * @description Sets the theme colors to the current spreadsheet.
 * @returns {Boolean} returns false if sTheme isn't a string
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const themes = Api.GetThemesColors()
 * for (let i = 0; i < themes.length; ++i) {
 *   oWorksheet.GetRange("A" + (i + 1)).SetValue(themes[i])
 * }
 * Api.SetThemeColors(themes[3])
 * oWorksheet.GetRange("C3").SetValue("The 'Apex' theme colors were set to the current spreadsheet.")
 * builder.SaveFile("xlsx", "SetThemeColors.xlsx")
 * builder.CloseFile()
 * @param {String} sTheme The color scheme that will be set to the current spreadsheet.
 */

/**
 * @memberof Api
 * @name detachEvent
 * @description Unsubscribes from the specified event.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("A1")
 * oRange.SetValue("1")
 * Api.attachEvent("onWorksheetChange", (oRange) => {
 *   console.log("onWorksheetChange")
 *   console.log(oRange.GetAddress())
 * })
 * Api.detachEvent("onWorksheetChange")
 * builder.SaveFile("xlsx", "detachEvent.xlsx")
 * builder.CloseFile()
 * @param {String} eventName The event name.
 */

/**
 * @memberof ApiBullet
 * @name GetClassType
 * @description Returns a type of the ApiBullet class.
 * @returns {String}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * let oParagraph = oDocContent.GetElement(0)
 * const oBullet = Api.CreateNumbering("ArabicParenR", 1)
 * oParagraph.SetBullet(oBullet)
 * oParagraph.AddText(" This is an example of the bulleted paragraph.")
 * oParagraph = Api.CreateParagraph()
 * oParagraph.SetBullet(oBullet)
 * oParagraph.AddText(" This is an example of the bulleted paragraph.")
 * oDocContent.Push(oParagraph)
 * const sClassType = oBullet.GetClassType()
 * oParagraph = Api.CreateParagraph()
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Class Type = " + sClassType)
 * oDocContent.Push(oParagraph)
 * builder.SaveFile("xlsx", "GetClassType.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiCharacters
 * @name Delete
 * @description Deletes the ApiCharacters object.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("B1")
 * oRange.SetValue("This is just a sample text.")
 * const oCharacters = oRange.GetCharacters(9, 4)
 * oCharacters.Delete()
 * builder.SaveFile("xlsx", "Delete.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiCharacters
 * @name GetCount
 * @description Returns a value that represents a number of objects in the collection.
 * @returns {Number}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("B1")
 * oRange.SetValue("This is just a sample text.")
 * const oCharacters = oRange.GetCharacters(23, 4)
 * const nCount = oCharacters.GetCount()
 * oWorksheet.GetRange("B3").SetValue("Number of characters: " + nCount)
 * builder.SaveFile("xlsx", "GetCount.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiCharacters
 * @name GetFont
 * @description Returns the ApiFont object that represents the font of the specified characters.
 * @returns {ApiFont}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("B1")
 * oRange.SetValue("This is just a sample text.")
 * const oCharacters = oRange.GetCharacters(9, 4)
 * const oFont = oCharacters.GetFont()
 * oFont.SetBold(true)
 * builder.SaveFile("xlsx", "GetFont.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiCharacters
 * @name GetCaption
 * @description Returns a string value that represents the text of the specified range of characters.
 * @returns {String}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("B1")
 * oRange.SetValue("This is just a sample text.")
 * const oCharacters = oRange.GetCharacters(23, 4)
 * const sCaption = oCharacters.GetCaption()
 * oWorksheet.GetRange("B3").SetValue("Caption: " + sCaption)
 * builder.SaveFile("xlsx", "GetCaption.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiCharacters
 * @name GetText
 * @description Returns the text of the specified range of characters.
 * @returns {String}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("B1")
 * oRange.SetValue("This is just a sample text.")
 * const oCharacters = oRange.GetCharacters(23, 4)
 * const sText = oCharacters.GetText()
 * oWorksheet.GetRange("B3").SetValue("Text: " + sText)
 * builder.SaveFile("xlsx", "GetText.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiCharacters
 * @name GetParent
 * @description Returns the parent object of the specified characters.
 * @returns {ApiRange}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("B1")
 * oRange.SetValue("This is just a sample text.")
 * const oCharacters = oRange.GetCharacters(23, 4)
 * const oParent = oCharacters.GetParent()
 * oParent.SetBorders("Bottom", "Thick", Api.CreateColorFromRGB(255, 111, 61))
 * builder.SaveFile("xlsx", "GetParent.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiCharacters
 * @name SetCaption
 * @description Sets a string value that represents the text of the specified range of characters.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("B1")
 * oRange.SetValue("This is just a sample text.")
 * const oCharacters = oRange.GetCharacters(23, 4)
 * oCharacters.SetCaption("string")
 * builder.SaveFile("xlsx", "SetCaption.xlsx")
 * builder.CloseFile()
 * @param {String} Caption A string value that represents the text of the specified range of characters.
 */

/**
 * @memberof ApiCharacters
 * @name SetText
 * @description Sets the text for the specified characters.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("B1")
 * oRange.SetValue("This is just a sample text.")
 * const oCharacters = oRange.GetCharacters(23, 4)
 * oCharacters.SetText("string")
 * builder.SaveFile("xlsx", "SetText.xlsx")
 * builder.CloseFile()
 * @param {String} Text The text to be set.
 */

/**
 * @memberof ApiChart
 * @name AddSeria
 * @description Adds a new series to the current chart.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("A4").SetValue("Cost price")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("B4").SetValue(50)
 * oWorksheet.GetRange("C2").SetValue(240)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("C4").SetValue(120)
 * oWorksheet.GetRange("D2").SetValue(280)
 * oWorksheet.GetRange("D3").SetValue(280)
 * oWorksheet.GetRange("D4").SetValue(160)
 * const oChart = oWorksheet.AddChart("'Sheet1'!$A$1:$D$3", true, "bar3D", 2, 100 * 36000, 70 * 36000, 0, 2 * 36000, 7, 3 * 36000)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.AddSeria("Cost price", "'Sheet1'!$B$4:$D$4")
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * builder.SaveFile("xlsx", "AddSeria.xlsx")
 * builder.CloseFile()
 * @param {String} sNameRange The series name. Can be a range of cells or usual text. For example: 1) "'sheet 1'!$A$2:$A$5" - must be a single cell, row or column, 2) "A1:A5" - must be a single cell, row or column, 3) "Example series".
 * @param {String} sValuesRange A range of cells from the sheet with series values. For example: 1) "'sheet 1'!$A$2:$A$5" - must be a single cell, row or column, 2) "A1:A5" - must be a single cell, row or column.
 * @param {String=} sXValuesRange=undefined A range of cells from the sheet with series x-axis values. It is used with the scatter charts only. For example: 1) "'sheet 1'!$A$2:$A$5" - must be a single cell, row or column, 2) "A1:A5" - must be a single cell, row or column.
 */

/**
 * @memberof ApiChart
 * @name ApplyChartStyle
 * @description Sets a style to the current chart by style ID.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("C2").SetValue(240)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("D2").SetValue(280)
 * oWorksheet.GetRange("D3").SetValue(280)
 * const oChart = oWorksheet.AddChart("'Sheet1'!$A$1:$D$3", true, "bar3D", 2, 100 * 36000, 70 * 36000, 0, 2 * 36000, 5, 3 * 36000)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.ApplyChartStyle(2)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * let oStroke = Api.CreateStroke(0.5 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51)))
 * oChart.SetSeriesOutLine(oStroke, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * oStroke = Api.CreateStroke(0.5 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61)))
 * oChart.SetSeriesOutLine(oStroke, 1, false)
 * builder.SaveFile("xlsx", "ApplyChartStyle.xlsx")
 * builder.CloseFile()
 * @param {Number} nStyleId One of the styles available in the editor. This value must be a positive.
 */

/**
 * @memberof ApiChart
 * @name GetClassType
 * @description Returns a type of the ApiChart class.
 * @returns {String}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("C2").SetValue(240)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("D2").SetValue(280)
 * oWorksheet.GetRange("D3").SetValue(280)
 * const oChart = oWorksheet.AddChart("'Sheet1'!$A$1:$D$3", true, "bar3D", 2, 100 * 36000, 70 * 36000, 0, 2 * 36000, 5, 3 * 36000)
 * oChart.SetTitle("Financial Overview", 13)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * const sClassType = oChart.GetClassType()
 * oWorksheet.GetRange("F1").SetValue("Class Type: " + sClassType)
 * builder.SaveFile("xlsx", "GetClassType.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiChart
 * @name RemoveSeria
 * @description Removes the specified series from the current chart.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("C2").SetValue(240)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("D2").SetValue(280)
 * oWorksheet.GetRange("D3").SetValue(280)
 * const oChart = oWorksheet.AddChart("'Sheet1'!$A$1:$D$3", true, "bar3D", 2, 100 * 36000, 70 * 36000, 0, 2 * 36000, 7, 3 * 36000)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.RemoveSeria(1)
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oWorksheet.GetRange("A5").SetValue("The Estimated Costs series was removed from the current chart.")
 * builder.SaveFile("xlsx", "RemoveSeria.xlsx")
 * builder.CloseFile()
 * @param {Number} nSeria The index of the chart series.
 */

/**
 * @memberof ApiCharacters
 * @name Insert
 * @description Inserts a string replacing the specified characters.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("B1")
 * oRange.SetValue("This is just a sample text.")
 * const oCharacters = oRange.GetCharacters(23, 4)
 * oCharacters.Insert("string")
 * builder.SaveFile("xlsx", "Insert.xlsx")
 * builder.CloseFile()
 * @param {String} String The string to insert.
 */

/**
 * @memberof ApiChart
 * @name SetAxieNumFormat
 * @description Sets the specified numeric format to the axis values.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("C2").SetValue(240)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("D2").SetValue(280)
 * oWorksheet.GetRange("D3").SetValue(280)
 * const oChart = oWorksheet.AddChart("'Sheet1'!$A$1:$D$3", true, "bar3D", 2, 100 * 36000, 70 * 36000, 0, 2 * 36000, 7, 3 * 36000)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.SetAxieNumFormat("0.00", "left")
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * builder.SaveFile("xlsx", "SetAxieNumFormat.xlsx")
 * builder.CloseFile()
 * @param {NumFormat | String} sFormat Numeric format (can be custom format).
 * @param {AxisPos} sAxiePos Axis position.
 */

/**
 * @memberof ApiChart
 * @name SetCatFormula
 * @description Sets a range with the category values to the current chart.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("B4").SetValue(2020)
 * oWorksheet.GetRange("C2").SetValue(240)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("C4").SetValue(2021)
 * oWorksheet.GetRange("D2").SetValue(280)
 * oWorksheet.GetRange("D3").SetValue(280)
 * oWorksheet.GetRange("D4").SetValue(2022)
 * const oChart = oWorksheet.AddChart("'Sheet1'!$A$1:$D$3", true, "bar3D", 2, 100 * 36000, 70 * 36000, 0, 2 * 36000, 7, 3 * 36000)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.SetCatFormula("'Sheet1'!$B$4:$D$4")
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * builder.SaveFile("xlsx", "SetCatFormula.xlsx")
 * builder.CloseFile()
 * @param {String} sRange A range of cells from the sheet with the category names. For example: 1) "'sheet 1'!$A$2:$A$5" - must be a single cell, row or column, 2) "A1:A5" - must be a single cell, row or column.
 */

/**
 * @memberof ApiChart
 * @name SetDataPointFill
 * @description Sets the fill to the data point in the specified chart series.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("C2").SetValue(240)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("D2").SetValue(280)
 * oWorksheet.GetRange("D3").SetValue(280)
 * const oChart = oWorksheet.AddChart("'Sheet1'!$A$1:$D$3", true, "bar3D", 2, 100 * 36000, 70 * 36000, 0, 2 * 36000, 7, 3 * 36000)
 * oChart.SetTitle("Financial Overview", 13)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(128, 128, 128))
 * oChart.SetDataPointFill(oFill, 0, 0, false)
 * builder.SaveFile("xlsx", "SetDataPointFill.xlsx")
 * builder.CloseFile()
 * @param {ApiFill} oFill The fill type used to fill the data point.
 * @param {Number} nSeries The index of the chart series.
 * @param {Number} nDataPoint The index of the data point in the specified chart series.
 * @param {Boolean=} bAllSeries=false Specifies if the fill will be applied to the specified data point in all series.
 */

/**
 * @memberof ApiChart
 * @name SetHorAxisMajorTickMark
 * @description Specifies the major tick mark for the horizontal axis.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("C2").SetValue(240)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("D2").SetValue(280)
 * oWorksheet.GetRange("D3").SetValue(280)
 * const oChart = oWorksheet.AddChart("'Sheet1'!$A$1:$D$3", true, "scatter", 2, 100 * 36000, 70 * 36000, 0, 2 * 36000, 5, 3 * 36000)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.SetHorAxisMajorTickMark("cross")
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetMarkerFill(oFill, 0, 0, true)
 * let oStroke = Api.CreateStroke(0.5 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51)))
 * oChart.SetMarkerOutLine(oStroke, 0, 0, true)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetMarkerFill(oFill, 1, 0, true)
 * oStroke = Api.CreateStroke(0.5 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61)))
 * oChart.SetMarkerOutLine(oStroke, 1, 0, true)
 * builder.SaveFile("xlsx", "SetHorAxisMajorTickMark.xlsx")
 * builder.CloseFile()
 * @param {TickMark} sTickMark The type of tick mark appearance.
 */

/**
 * @memberof ApiChart
 * @name SetHorAxisMinorTickMark
 * @description Specifies the minor tick mark for the horizontal axis.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("C2").SetValue(240)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("D2").SetValue(280)
 * oWorksheet.GetRange("D3").SetValue(280)
 * const oChart = oWorksheet.AddChart("'Sheet1'!$A$1:$D$3", true, "scatter", 2, 100 * 36000, 70 * 36000, 0, 2 * 36000, 5, 3 * 36000)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.SetHorAxisMinorTickMark("out")
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetMarkerFill(oFill, 0, 0, true)
 * let oStroke = Api.CreateStroke(0.5 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51)))
 * oChart.SetMarkerOutLine(oStroke, 0, 0, true)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetMarkerFill(oFill, 1, 0, true)
 * oStroke = Api.CreateStroke(0.5 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61)))
 * oChart.SetMarkerOutLine(oStroke, 1, 0, true)
 * builder.SaveFile("xlsx", "SetHorAxisMinorTickMark.xlsx")
 * builder.CloseFile()
 * @param {TickMark} sTickMark The type of tick mark appearance
 */

/**
 * @memberof ApiChart
 * @name SetHorAxisLablesFontSize
 * @description Specifies the font size to the horizontal axis labels.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("C2").SetValue(240)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("D2").SetValue(280)
 * oWorksheet.GetRange("D3").SetValue(280)
 * const oChart = oWorksheet.AddChart("'Sheet1'!$A$1:$D$3", true, "bar3D", 2, 100 * 36000, 70 * 36000, 0, 2 * 36000, 5, 3 * 36000)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.SetHorAxisLablesFontSize(10)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * builder.SaveFile("xlsx", "SetHorAxisLablesFontSize.xlsx")
 * builder.CloseFile()
 * @param {pt} nFontSize The text size value measured in points.
 */

/**
 * @memberof ApiChart
 * @name SetHorAxisTickLabelPosition
 * @description Sets the possible values for the position of the chart tick labels in relation to the main horizontal label or the chart data values.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("C2").SetValue(240)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("D2").SetValue(280)
 * oWorksheet.GetRange("D3").SetValue(280)
 * const oChart = oWorksheet.AddChart("'Sheet1'!$A$1:$D$3", true, "bar3D", 2, 100 * 36000, 70 * 36000, 0, 2 * 36000, 5, 3 * 36000)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.SetHorAxisTickLabelPosition("high")
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * builder.SaveFile("xlsx", "SetHorAxisTickLabelPosition.xlsx")
 * builder.CloseFile()
 * @param {TickLabelPosition} sTickLabelPosition The position type of the chart horizontal tick labels.
 */

/**
 * @memberof ApiChart
 * @name SetHorAxisOrientation
 * @description Specifies the direction of the data displayed on the horizontal axis.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("C2").SetValue(240)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("D2").SetValue(280)
 * oWorksheet.GetRange("D3").SetValue(280)
 * const oChart = oWorksheet.AddChart("'Sheet1'!$A$1:$D$3", true, "bar3D", 2, 100 * 36000, 70 * 36000, 0, 2 * 36000, 5, 3 * 36000)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.SetHorAxisOrientation(false)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * builder.SaveFile("xlsx", "SetHorAxisOrientation.xlsx")
 * builder.CloseFile()
 * @param {Boolean} bIsMinMax The true value will set the normal data direction for the horizontal axis (from minimum to maximum). The false value will set the inverted data direction for the horizontal axis (from maximum to minimum).
 */

/**
 * @memberof ApiChart
 * @name SetHorAxisTitle
 * @description Specifies the chart horizontal axis title.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("C2").SetValue(240)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("D2").SetValue(280)
 * oWorksheet.GetRange("D3").SetValue(280)
 * const oChart = oWorksheet.AddChart("'Sheet1'!$A$1:$D$3", true, "bar3D", 2, 100 * 36000, 70 * 36000, 0, 2 * 36000, 5, 3 * 36000)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.SetHorAxisTitle("Year", 11)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * builder.SaveFile("xlsx", "SetHorAxisTitle.xlsx")
 * builder.CloseFile()
 * @param {String} sTitle The title which will be displayed for the horizontal axis of the current chart.
 * @param {pt} nFontSize The text size value measured in points.
 * @param {Boolean} bIsBold Specifies if the horizontal axis title is written in bold font or not.
 */

/**
 * @memberof ApiChart
 * @name SetLegendFill
 * @description Sets the fill to the chart legend.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("C2").SetValue(240)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("D2").SetValue(280)
 * oWorksheet.GetRange("D3").SetValue(280)
 * const oChart = oWorksheet.AddChart("'Sheet1'!$A$1:$D$3", true, "bar3D", 2, 100 * 36000, 70 * 36000, 0, 2 * 36000, 7, 3 * 36000)
 * oChart.SetTitle("Financial Overview", 13)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(128, 128, 128))
 * oChart.SetLegendFill(oFill)
 * builder.SaveFile("xlsx", "SetLegendFill.xlsx")
 * builder.CloseFile()
 * @param {ApiFill} oFill The fill type used to fill the legend.
 */

/**
 * @memberof ApiChart
 * @name SetLegendFontSize
 * @description Specifies the legend font size.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("C2").SetValue(240)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("D2").SetValue(280)
 * oWorksheet.GetRange("D3").SetValue(280)
 * const oChart = oWorksheet.AddChart("'Sheet1'!$A$1:$D$3", true, "bar3D", 2, 100 * 36000, 70 * 36000, 0, 2 * 36000, 5, 3 * 36000)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.SetLegendFontSize(13)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * builder.SaveFile("xlsx", "SetLegendFontSize.xlsx")
 * builder.CloseFile()
 * @param {pt} nFontSize The text size value measured in points.
 */

/**
 * @memberof ApiChart
 * @name SetDataPointOutLine
 * @description Sets the outline to the data point in the specified chart series.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("C2").SetValue(240)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("D2").SetValue(280)
 * oWorksheet.GetRange("D3").SetValue(280)
 * const oChart = oWorksheet.AddChart("'Sheet1'!$A$1:$D$3", true, "bar3D", 2, 100 * 36000, 70 * 36000, 0, 2 * 36000, 7, 3 * 36000)
 * oChart.SetTitle("Financial Overview", 13)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * const oStroke = Api.CreateStroke(0.5 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51)))
 * oChart.SetDataPointOutLine(oStroke, 1, 0, false)
 * builder.SaveFile("xlsx", "SetDataPointOutLine.xlsx")
 * builder.CloseFile()
 * @param {ApiStroke} oStroke The stroke used to create the data point outline.
 * @param {Number} nSeries The index of the chart series.
 * @param {Number} nDataPoint The index of the data point in the specified chart series.
 * @param {Number} bAllSeries Specifies if the outline will be applied to the specified data point in all series.
 */

/**
 * @memberof ApiChart
 * @name SetLegendOutLine
 * @description Sets the outline to the chart legend.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("C2").SetValue(240)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("D2").SetValue(280)
 * oWorksheet.GetRange("D3").SetValue(280)
 * const oChart = oWorksheet.AddChart("'Sheet1'!$A$1:$D$3", true, "bar3D", 2, 100 * 36000, 70 * 36000, 0, 2 * 36000, 7, 3 * 36000)
 * oChart.SetTitle("Financial Overview", 13)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * const oStroke = Api.CreateStroke(0.5 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51)))
 * oChart.SetLegendOutLine(oStroke)
 * builder.SaveFile("xlsx", "SetLegendOutLine.xlsx")
 * builder.CloseFile()
 * @param {ApiStroke} oStroke The stroke used to create the legend outline.
 */

/**
 * @memberof ApiChart
 * @name SetLegendPos
 * @description Specifies the chart legend position.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("C2").SetValue(240)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("D2").SetValue(280)
 * oWorksheet.GetRange("D3").SetValue(280)
 * const oChart = oWorksheet.AddChart("'Sheet1'!$A$1:$D$3", true, "bar3D", 2, 100 * 36000, 70 * 36000, 0, 2 * 36000, 5, 3 * 36000)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.SetLegendPos("right")
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * builder.SaveFile("xlsx", "SetLegendPos.xlsx")
 * builder.CloseFile()
 * @param {LegendPos} sLegendPos The position of the chart legend inside the chart window.
 */

/**
 * @memberof ApiChart
 * @name SetMajorHorizontalGridlines
 * @description Specifies the visual properties of the major horizontal gridline.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("C2").SetValue(240)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("D2").SetValue(280)
 * oWorksheet.GetRange("D3").SetValue(280)
 * const oChart = oWorksheet.AddChart("'Sheet1'!$A$1:$D$3", true, "bar3D", 2, 100 * 36000, 70 * 36000, 0, 2 * 36000, 5, 3 * 36000)
 * oChart.SetTitle("Financial Overview", 13)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * const oStroke = Api.CreateStroke(1 * 15000, Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61)))
 * oChart.SetMajorHorizontalGridlines(oStroke)
 * builder.SaveFile("xlsx", "SetMajorHorizontalGridlines.xlsx")
 * builder.CloseFile()
 * @param {ApiStroke} oStroke=null The stroke used to create the element shadow.
 */

/**
 * @memberof ApiChart
 * @name SetMarkerFill
 * @description Sets the fill to the marker in the specified chart series.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("C2").SetValue(240)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("D2").SetValue(280)
 * oWorksheet.GetRange("D3").SetValue(280)
 * const oChart = oWorksheet.AddChart("'Sheet1'!$A$1:$D$3", true, "scatter", 2, 100 * 36000, 70 * 36000, 0, 2 * 36000, 7, 3 * 36000)
 * oChart.SetTitle("Financial Overview", 13)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetMarkerFill(oFill, 0, 0, true)
 * let oStroke = Api.CreateStroke(0.5 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51)))
 * oChart.SetMarkerOutLine(oStroke, 0, 0, true)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetMarkerFill(oFill, 1, 0, true)
 * oStroke = Api.CreateStroke(0.5 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61)))
 * oChart.SetMarkerOutLine(oStroke, 1, 0, true)
 * builder.SaveFile("xlsx", "SetMarkerFill.xlsx")
 * builder.CloseFile()
 * @param {ApiFill} oFill The fill type used to fill the marker.
 * @param {Number} nSeries The index of the chart series.
 * @param {Number} nMarker The index of the marker in the specified chart series.
 * @param {Boolean=} bAllMarkers=false Specifies if the fill will be applied to all markers in the specified chart series.
 */

/**
 * @memberof ApiChart
 * @name SetMarkerOutLine
 * @description Sets the outline to the marker in the specified chart series.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("C2").SetValue(240)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("D2").SetValue(280)
 * oWorksheet.GetRange("D3").SetValue(280)
 * const oChart = oWorksheet.AddChart("'Sheet1'!$A$1:$D$3", true, "scatter", 2, 100 * 36000, 70 * 36000, 0, 2 * 36000, 7, 3 * 36000)
 * oChart.SetTitle("Financial Overview", 13)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetMarkerFill(oFill, 0, 0, true)
 * const oStroke = Api.CreateStroke(0.5 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51)))
 * oChart.SetMarkerOutLine(oStroke, 0, 0, true)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetMarkerFill(oFill, 1, 0, true)
 * oChart.SetMarkerOutLine(oStroke, 1, 0, true)
 * builder.SaveFile("xlsx", "SetMarkerOutLine.xlsx")
 * builder.CloseFile()
 * @param {ApiStroke} oStroke The stroke used to create the marker outline.
 * @param {Number} nSeries The index of the chart series.
 * @param {Number} nMarker The index of the marker in the specified chart series.
 * @param {Boolean=} bAllMarkers=false Specifies if the outline will be applied to all markers in the specified chart series.
 */

/**
 * @memberof ApiChart
 * @name SetMinorVerticalGridlines
 * @description Specifies the visual properties of the major vertical gridline.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("C2").SetValue(240)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("D2").SetValue(280)
 * oWorksheet.GetRange("D3").SetValue(280)
 * const oChart = oWorksheet.AddChart("'Sheet1'!$A$1:$D$3", true, "bar3D", 2, 100 * 36000, 70 * 36000, 0, 2 * 36000, 5, 3 * 36000)
 * oChart.SetTitle("Financial Overview", 13)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * const oStroke = Api.CreateStroke(1 * 15000, Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61)))
 * oChart.SetMajorVerticalGridlines(oStroke)
 * builder.SaveFile("xlsx", "SetMajorVerticalGridlines.xlsx")
 * builder.CloseFile()
 * @param {ApiStroke=} oStroke=null The stroke used to create the element shadow.
 */

/**
 * @memberof ApiChart
 * @name SetMinorVerticalGridlines
 * @description Specifies the visual properties of the minor vertical gridline.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("C2").SetValue(240)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("D2").SetValue(280)
 * oWorksheet.GetRange("D3").SetValue(280)
 * const oChart = oWorksheet.AddChart("'Sheet1'!$A$1:$D$3", true, "bar3D", 2, 100 * 36000, 70 * 36000, 0, 2 * 36000, 5, 3 * 36000)
 * oChart.SetTitle("Financial Overview", 13)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * const oStroke = Api.CreateStroke(1 * 5000, Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61)))
 * oChart.SetMinorVerticalGridlines(oStroke)
 * builder.SaveFile("xlsx", "SetMinorVerticalGridlines.xlsx")
 * builder.CloseFile()
 * @param {ApiStroke} oStroke=null The stroke used to create the element shadow.
 */

/**
 * @memberof ApiChart
 * @name SetMinorHorizontalGridlines
 * @description Specifies the visual properties for the minor horizontal gridlines.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("C2").SetValue(240)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("D2").SetValue(280)
 * oWorksheet.GetRange("D3").SetValue(280)
 * const oChart = oWorksheet.AddChart("'Sheet1'!$A$1:$D$3", true, "bar3D", 2, 100 * 36000, 70 * 36000, 0, 2 * 36000, 5, 3 * 36000)
 * oChart.SetTitle("Financial Overview", 13)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * const oStroke = Api.CreateStroke(1 * 5000, Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61)))
 * oChart.SetMinorHorizontalGridlines(oStroke)
 * builder.SaveFile("xlsx", "SetMinorHorizontalGridlines.xlsx")
 * builder.CloseFile()
 * @param {ApiStroke} oStroke=null The stroke used to create the element shadow.
 */

/**
 * @memberof ApiChart
 * @name SetPlotAreaFill
 * @description Sets the fill to the chart plot area.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("C2").SetValue(240)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("D2").SetValue(280)
 * oWorksheet.GetRange("D3").SetValue(280)
 * const oChart = oWorksheet.AddChart("'Sheet1'!$A$1:$D$3", true, "bar3D", 2, 100 * 36000, 70 * 36000, 0, 2 * 36000, 7, 3 * 36000)
 * oChart.SetTitle("Financial Overview", 13)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(128, 128, 128))
 * oChart.SetPlotAreaFill(oFill)
 * builder.SaveFile("xlsx", "SetPlotAreaFill.xlsx")
 * builder.CloseFile()
 * @param {ApiFill} oFill The fill type used to fill the plot area.
 */

/**
 * @memberof ApiChart
 * @name SetPlotAreaOutLine
 * @description Sets the outline to the chart plot area.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("C2").SetValue(240)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("D2").SetValue(280)
 * oWorksheet.GetRange("D3").SetValue(280)
 * const oChart = oWorksheet.AddChart("'Sheet1'!$A$1:$D$3", true, "bar3D", 2, 100 * 36000, 70 * 36000, 0, 2 * 36000, 7, 3 * 36000)
 * oChart.SetTitle("Financial Overview", 13)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * const oStroke = Api.CreateStroke(0.5 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61)))
 * oChart.SetPlotAreaOutLine(oStroke)
 * builder.SaveFile("xlsx", "SetPlotAreaOutLine.xlsx")
 * builder.CloseFile()
 * @param {ApiStroke} oStroke The stroke used to create the plot area outline.
 */

/**
 * @memberof ApiChart
 * @name SetSeriaValues
 * @description Sets values from the specified range to the specified series.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("B4").SetValue(260)
 * oWorksheet.GetRange("C2").SetValue(240)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("C4").SetValue(270)
 * oWorksheet.GetRange("D2").SetValue(280)
 * oWorksheet.GetRange("D3").SetValue(280)
 * oWorksheet.GetRange("D4").SetValue(300)
 * const oChart = oWorksheet.AddChart("'Sheet1'!$A$1:$D$3", true, "bar3D", 2, 100 * 36000, 70 * 36000, 0, 2 * 36000, 7, 3 * 36000)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.SetSeriaValues("'Sheet1'!$B$4:$D$4", 1)
 * oChart.SetShowPointDataLabel(1, 0, false, false, true, false)
 * oChart.SetShowPointDataLabel(1, 1, false, false, true, false)
 * oChart.SetShowPointDataLabel(1, 2, false, false, true, false)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * builder.SaveFile("xlsx", "SetSeriaValues.xlsx")
 * builder.CloseFile()
 * @param {String} sNameRange The series name. Can be a range of cells or usual text. For example: 1) "'sheet 1'!$A$2:$A$5" - must be a single cell, row or column, 2) "A1:A5" - must be a single cell, row or column, 3) "Example series".
 * @param {Number} nSeria The index of the chart series.
 */

/**
 * @memberof ApiChart
 * @name SetSeriaName
 * @description Sets a name to the specified series.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("C2").SetValue(240)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("D2").SetValue(280)
 * oWorksheet.GetRange("D3").SetValue(280)
 * const oChart = oWorksheet.AddChart("'Sheet1'!$A$1:$D$3", true, "bar3D", 2, 100 * 36000, 70 * 36000, 0, 2 * 36000, 7, 3 * 36000)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.SetSeriaName("Projected Sales", 0)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * builder.SaveFile("xlsx", "SetSeriaName.xlsx")
 * builder.CloseFile()
 * @param {String} sNameRange The series name. Can be a range of cells or usual text. For example: 1) "'sheet 1'!$A$2:$A$5" - must be a single cell, row or column, 2) "A1:A5" - must be a single cell, row or column, 3) "Example series".
 * @param {Number} nSeria The index of the chart series.
 */

/**
 * @memberof ApiChart
 * @name SetSeriesFill
 * @description Sets the fill to the specified chart series.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("C2").SetValue(240)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("D2").SetValue(280)
 * oWorksheet.GetRange("D3").SetValue(280)
 * const oChart = oWorksheet.AddChart("'Sheet1'!$A$1:$D$3", true, "bar3D", 2, 100 * 36000, 70 * 36000, 0, 2 * 36000, 7, 3 * 36000)
 * oChart.SetTitle("Financial Overview", 13)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * builder.SaveFile("xlsx", "SetSeriesFill.xlsx")
 * builder.CloseFile()
 * @param {ApiFill} oFill The fill type used to fill the series.
 * @param {Number} nSeries The index of the chart series.
 * @param {Boolean=} bAll=false Specifies if the fill will be applied to all series.
 */

/**
 * @memberof ApiChart
 * @name SetSeriesOutLine
 * @description Sets the outline to the specified chart series.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("C2").SetValue(240)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("D2").SetValue(280)
 * oWorksheet.GetRange("D3").SetValue(280)
 * const oChart = oWorksheet.AddChart("'Sheet1'!$A$1:$D$3", true, "bar3D", 2, 100 * 36000, 70 * 36000, 0, 2 * 36000, 7, 3 * 36000)
 * oChart.SetTitle("Financial Overview", 13)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * const oStroke = Api.CreateStroke(0.5 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51)))
 * oChart.SetSeriesOutLine(oStroke, 1, false)
 * builder.SaveFile("xlsx", "SetSeriesOutLine.xlsx")
 * builder.CloseFile()
 * @param {ApiStroke} oStroke The stroke used to create the series outline.
 * @param {Number} nSeries The index of the chart series.
 * @param {Boolean=} bAll=false Specifies if the outline will be applied to all series.
 */

/**
 * @memberof ApiChart
 * @name SetShowDataLabels
 * @description Specifies which chart data labels are shown for the chart.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("C2").SetValue(240)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("D2").SetValue(280)
 * oWorksheet.GetRange("D3").SetValue(280)
 * const oChart = oWorksheet.AddChart("'Sheet1'!$A$1:$D$3", true, "bar3D", 2, 100 * 36000, 70 * 36000, 0, 2 * 36000, 5, 3 * 36000)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.SetShowDataLabels(false, false, true, false)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * builder.SaveFile("xlsx", "SetShowDataLabels.xlsx")
 * builder.CloseFile()
 * @param {Boolean} bShowSerName Whether to show or hide the source table column names used for the data which the chart will be build from.
 * @param {Boolean} bShowCatName Whether to show or hide the source table row names used for the data which the chart will be build from.
 * @param {Boolean} bShowVal Whether to show or hide the chart data values.
 * @param {Boolean} bShowPercent Whether to show or hide the percent for the data values (works with stacked chart types).
 */

/**
 * @memberof ApiChart
 * @name SetSeriaXValues
 * @description Sets the x-axis values from the specified range to the specified series. It is used with the scatter charts only.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("B4").SetValue(2017)
 * oWorksheet.GetRange("C2").SetValue(240)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("C4").SetValue(2018)
 * oWorksheet.GetRange("D2").SetValue(280)
 * oWorksheet.GetRange("D3").SetValue(280)
 * oWorksheet.GetRange("D4").SetValue(2019)
 * const oChart = oWorksheet.AddChart("'Sheet1'!$A$1:$D$3", true, "scatter", 2, 100 * 36000, 70 * 36000, 0, 2 * 36000, 7, 3 * 36000)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.SetSeriaXValues("'Sheet1'!$B$4:$D$4", 0)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetMarkerFill(oFill, 0, 0, true)
 * let oStroke = Api.CreateStroke(0.5 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51)))
 * oChart.SetMarkerOutLine(oStroke, 0, 0, true)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetMarkerFill(oFill, 1, 0, true)
 * oStroke = Api.CreateStroke(0.5 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61)))
 * oChart.SetMarkerOutLine(oStroke, 1, 0, true)
 * builder.SaveFile("xlsx", "SetSeriaXValues.xlsx")
 * builder.CloseFile()
 * @param {String} sNameRange The series name. Can be a range of cells or usual text. For example: 1) "'sheet 1'!$A$2:$A$5" - must be a single cell, row or column, 2) "A1:A5" - must be a single cell, row or column, 3) "Example series".
 * @param {Number} nSeria The index of the chart series.
 */

/**
 * @memberof ApiChart
 * @name SetTitle
 * @description Specifies the chart title with the specified parameters.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("C2").SetValue(240)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("D2").SetValue(280)
 * oWorksheet.GetRange("D3").SetValue(280)
 * const oChart = oWorksheet.AddChart("'Sheet1'!$A$1:$D$3", true, "bar3D", 2, 100 * 36000, 70 * 36000, 0, 2 * 36000, 5, 3 * 36000)
 * oChart.SetTitle("Financial Overview", 13)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * builder.SaveFile("xlsx", "SetTitle.xlsx")
 * builder.CloseFile()
 * @param {String} sTitle The title which will be displayed for the current chart.
 * @param {pt} nFontSize The text size value measured in points.
 * @param {Boolean} bIsBold Specifies if the chart title is written in bold font or not.
 */

/**
 * @memberof ApiChart
 * @name SetShowPointDataLabel
 * @description Spicifies the show options for the chart data labels.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("C2").SetValue(240)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("D2").SetValue(280)
 * oWorksheet.GetRange("D3").SetValue(280)
 * const oChart = oWorksheet.AddChart("'Sheet1'!$A$1:$D$3", true, "bar3D", 2, 100 * 36000, 70 * 36000, 0, 2 * 36000, 5, 3 * 36000)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.SetShowPointDataLabel(1, 0, false, false, true, false)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * builder.SaveFile("xlsx", "SetShowPointDataLabel.xlsx")
 * builder.CloseFile()
 * @param {Number} nSeriesIndex The series index from the array of the data used to build the chart from.
 * @param {Number} nPointIndex The point index from this series.
 * @param {Boolean} bShowSerName Whether to show or hide the source table column names used for the data which the chart will be build from.
 * @param {Boolean} bShowCatName Whether to show or hide the source table row names used for the data which the chart will be build from.
 * @param {Boolean} bShowVal Whether to show or hide the chart data values.
 * @param {Boolean} bShowPercent Whether to show or hide the percent for the data values (works with stacked chart types).
 */

/**
 * @memberof ApiChart
 * @name SetVerAxisTitle
 * @description Specifies the chart vertical axis title.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("C2").SetValue(240)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("D2").SetValue(280)
 * oWorksheet.GetRange("D3").SetValue(280)
 * const oChart = oWorksheet.AddChart("'Sheet1'!$A$1:$D$3", true, "bar3D", 2, 100 * 36000, 70 * 36000, 0, 2 * 36000, 5, 3 * 36000)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.SetVerAxisTitle("USD In Hundred Thousands", 10)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * builder.SaveFile("xlsx", "SetVerAxisTitle.xlsx")
 * builder.CloseFile()
 * @param {String} sTitle The title which will be displayed for the vertical axis of the current chart.
 * @param {pt} nFontSize The text size value measured in points.
 * @param {Boolean} bIsBold Specifies if the vertical axis title is written in bold font or not
 */

/**
 * @memberof ApiChart
 * @name SetTitleFill
 * @description Sets the fill to the chart title.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("C2").SetValue(240)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("D2").SetValue(280)
 * oWorksheet.GetRange("D3").SetValue(280)
 * const oChart = oWorksheet.AddChart("'Sheet1'!$A$1:$D$3", true, "bar3D", 2, 100 * 36000, 70 * 36000, 0, 2 * 36000, 7, 3 * 36000)
 * oChart.SetTitle("Financial Overview", 13)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(128, 128, 128))
 * oChart.SetTitleFill(oFill)
 * builder.SaveFile("xlsx", "SetTitleFill.xlsx")
 * builder.CloseFile()
 * @param {ApiFill} oFill The fill type used to fill the title.
 */

/**
 * @memberof ApiChart
 * @name SetVertAxisLablesFontSize
 * @description Specifies the font size to the vertical axis labels.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("C2").SetValue(240)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("D2").SetValue(280)
 * oWorksheet.GetRange("D3").SetValue(280)
 * const oChart = oWorksheet.AddChart("'Sheet1'!$A$1:$D$3", true, "bar3D", 2, 100 * 36000, 70 * 36000, 0, 2 * 36000, 5, 3 * 36000)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.SetVertAxisLablesFontSize(10)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * builder.SaveFile("xlsx", "SetVertAxisLablesFontSize.xlsx")
 * builder.CloseFile()
 * @param {pt} nFontSize The text size value measured in points.
 */

/**
 * @memberof ApiChart
 * @name SetVerAxisOrientation
 * @description Specifies the direction of the data displayed on the vertical axis.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("C2").SetValue(240)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("D2").SetValue(280)
 * oWorksheet.GetRange("D3").SetValue(280)
 * const oChart = oWorksheet.AddChart("'Sheet1'!$A$1:$D$3", true, "bar3D", 2, 100 * 36000, 70 * 36000, 0, 2 * 36000, 5, 3 * 36000)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.SetVerAxisOrientation(false)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * builder.SaveFile("xlsx", "SetVerAxisOrientation.xlsx")
 * builder.CloseFile()
 * @param {Boolean} bIsMinMax The true value will set the normal data direction for the vertical axis (from minimum to maximum). The false value will set the inverted data direction for the vertical axis (from maximum to minimum).
 */

/**
 * @memberof ApiChart
 * @name SetVertAxisMajorTickMark
 * @description Specifies the major tick mark for the vertical axis.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("C2").SetValue(240)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("D2").SetValue(280)
 * oWorksheet.GetRange("D3").SetValue(280)
 * const oChart = oWorksheet.AddChart("'Sheet1'!$A$1:$D$3", true, "scatter", 2, 100 * 36000, 70 * 36000, 0, 2 * 36000, 5, 3 * 36000)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.SetVertAxisMajorTickMark("cross")
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetMarkerFill(oFill, 0, 0, true)
 * let oStroke = Api.CreateStroke(0.5 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51)))
 * oChart.SetMarkerOutLine(oStroke, 0, 0, true)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetMarkerFill(oFill, 1, 0, true)
 * oStroke = Api.CreateStroke(0.5 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61)))
 * oChart.SetMarkerOutLine(oStroke, 1, 0, true)
 * builder.SaveFile("xlsx", "SetVertAxisMajorTickMark.xlsx")
 * builder.CloseFile()
 * @param {TickMark} sTickMark The type of tick mark appearance.
 */

/**
 * @memberof ApiChart
 * @name SetVertAxisMinorTickMark
 * @description Specifies the minor tick mark for the vertical axis.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("C2").SetValue(240)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("D2").SetValue(280)
 * oWorksheet.GetRange("D3").SetValue(280)
 * const oChart = oWorksheet.AddChart("'Sheet1'!$A$1:$D$3", true, "scatter", 2, 100 * 36000, 70 * 36000, 0, 2 * 36000, 5, 3 * 36000)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.SetVertAxisMinorTickMark("out")
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetMarkerFill(oFill, 0, 0, true)
 * let oStroke = Api.CreateStroke(0.5 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51)))
 * oChart.SetMarkerOutLine(oStroke, 0, 0, true)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetMarkerFill(oFill, 1, 0, true)
 * oStroke = Api.CreateStroke(0.5 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61)))
 * oChart.SetMarkerOutLine(oStroke, 1, 0, true)
 * builder.SaveFile("xlsx", "SetVertAxisMinorTickMark.xlsx")
 * builder.CloseFile()
 * @param {TickMark} sTickMark The type of tick mark appearance.
 */

/**
 * @memberof ApiChart
 * @name SetVertAxisTickLabelPosition
 * @description Sets the possible values for the position of the chart tick labels in relation to the main vertical label or the chart data values.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("C2").SetValue(240)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("D2").SetValue(280)
 * oWorksheet.GetRange("D3").SetValue(280)
 * const oChart = oWorksheet.AddChart("'Sheet1'!$A$1:$D$3", true, "bar3D", 2, 100 * 36000, 70 * 36000, 0, 2 * 36000, 5, 3 * 36000)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.SetVertAxisTickLabelPosition("high")
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * builder.SaveFile("xlsx", "SetVertAxisTickLabelPosition.xlsx")
 * builder.CloseFile()
 * @param {TickLabelPosition} sTickLabelPosition The position type of the chart vertical tick labels.
 */

/**
 * @memberof ApiChart
 * @name SetTitleOutLine
 * @description Sets the outline to the chart title.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("C2").SetValue(240)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("D2").SetValue(280)
 * oWorksheet.GetRange("D3").SetValue(280)
 * const oChart = oWorksheet.AddChart("'Sheet1'!$A$1:$D$3", true, "bar3D", 2, 100 * 36000, 70 * 36000, 0, 2 * 36000, 7, 3 * 36000)
 * oChart.SetTitle("Financial Overview", 13)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * const oStroke = Api.CreateStroke(0.5 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51)))
 * oChart.SetTitleOutLine(oStroke)
 * builder.SaveFile("xlsx", "SetTitleOutLine.xlsx")
 * builder.CloseFile()
 * @param {ApiStroke} oStroke The stroke used to create the title outline.
 */

/**
 * @memberof ApiAreas
 * @name GetCount
 * @description Returns a value that represents the number of objects in the collection.
 * @returns {Number}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * let oRange = oWorksheet.GetRange("B1:D1")
 * oRange.SetValue("1")
 * oRange.Select()
 * const oAreas = oRange.GetAreas()
 * const nCount = oAreas.GetCount()
 * oRange = oWorksheet.GetRange("A5")
 * oRange.SetValue("The number of ranges in the areas: ")
 * oRange.AutoFit(false, true)
 * oWorksheet.GetRange("B5").SetValue(nCount)
 * builder.SaveFile("xlsx", "GetCount.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiAreas
 * @name GetItem
 * @description Returns a single object from a collection by its ID.
 * @returns {ApiRange | null} returs null if index isn't correct
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * let oRange = oWorksheet.GetRange("B1:D1")
 * oRange.SetValue("1")
 * oRange.Select()
 * const oAreas = oRange.GetAreas()
 * const oItem = oAreas.GetItem(1)
 * oRange = oWorksheet.GetRange("A5")
 * oRange.SetValue("The first item from the areas: ")
 * oRange.AutoFit(false, true)
 * oWorksheet.GetRange("B5").Paste(oItem)
 * builder.SaveFile("xlsx", "GetItem.xlsx")
 * builder.CloseFile()
 * @param {Number} ind The index number of the object.
 */

/**
 * @memberof ApiAreas
 * @name GetParent
 * @description Returns the parent object for the specified collection.
 * @returns {ApiRange}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * let oRange = oWorksheet.GetRange("B1:D1")
 * oRange.SetValue("1")
 * oRange.Select()
 * const oAreas = oRange.GetAreas()
 * const oParent = oAreas.GetParent()
 * const sType = oParent.GetClassType()
 * oRange = oWorksheet.GetRange("A4")
 * oRange.SetValue("The areas parent: ")
 * oRange.AutoFit(false, true)
 * oWorksheet.GetRange("B4").Paste(oParent)
 * oRange = oWorksheet.GetRange("A5")
 * oRange.SetValue("The type of the areas parent: ")
 * oRange.AutoFit(false, true)
 * oWorksheet.GetRange("B5").SetValue(sType)
 * builder.SaveFile("xlsx", "GetParent.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiComment
 * @name Delete
 * @description Deletes the ApiComment object.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * const oRange = oWorksheet.GetRange("A1")
 * oRange.AddComment("This is just a number.")
 * const oComment = oRange.GetComment()
 * oComment.Delete()
 * oWorksheet.GetRange("A3").SetValue("The comment was just deleted from A1.")
 * builder.SaveFile("xlsx", "Delete.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiComment
 * @name GetClassType
 * @description Returns a type of the ApiComment class.
 * @returns {String}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * const oRange = oWorksheet.GetRange("A1")
 * oRange.AddComment("This is just a number.")
 * const oComment = oRange.GetComment()
 * const sType = oComment.GetClassType()
 * oWorksheet.GetRange("A3").SetValue("Type: " + sType)
 * builder.SaveFile("xlsx", "GetClassType.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiComment
 * @name GetAuthorName
 * @description Returns the comment author's name.
 * @returns {String}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * const oRange = oWorksheet.GetRange("A1")
 * const oComment = oRange.AddComment("This is just a number.")
 * oWorksheet.GetRange("A3").SetValue("Comment's author: ")
 * oWorksheet.GetRange("B3").SetValue(oComment.GetAuthorName())
 * builder.SaveFile("xlsx", "GetAuthorName.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiComment
 * @name GetId
 * @description Returns the current comment ID.
 * @returns {String}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * const oRange = oWorksheet.GetRange("A1")
 * oRange.AddComment("This is just a number.")
 * oWorksheet.GetRange("A3").SetValue("Comment: ")
 * oWorksheet.GetRange("B3").SetValue(oRange.GetComment().GetId())
 * builder.SaveFile("xlsx", "GetId.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiComment
 * @name AddReply
 * @description Adds a reply to a comment.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * const oRange = oWorksheet.GetRange("A1")
 * const oComment = oRange.AddComment("This is just a number.")
 * oComment.AddReply("Reply 1", "John Smith", "uid-1")
 * const oReply = oComment.GetReply()
 * oWorksheet.GetRange("A3").SetValue("Comment's reply text: ")
 * oWorksheet.GetRange("B3").SetValue(oReply.GetText())
 * builder.SaveFile("xlsx", "AddReply.xlsx")
 * builder.CloseFile()
 * @param {String} sText The comment reply text.
 * @param {String=} sAuthorName=current user name The name of the comment reply author.
 * @param {String=} sUserId=current user id The user ID of the comment reply author.
 * @param {Number=} nPos=ApiComment.GetRepliesCount() The comment reply position.
 */

/**
 * @memberof ApiComment
 * @name GetQuoteText
 * @description Returns the quote text of the current comment.
 * @returns {String | null} returns null if comment is added for document
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * const oRange = oWorksheet.GetRange("A1")
 * const oComment = oRange.AddComment("This is just a number.")
 * oWorksheet.GetRange("A3").SetValue("Comment's quote text: ")
 * oWorksheet.GetRange("B3").SetValue(oComment.GetQuoteText())
 * builder.SaveFile("xlsx", "GetQuoteText.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiComment
 * @name GetRepliesCount
 * @description Returns a number of the comment replies.
 * @returns {Number}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * const oRange = oWorksheet.GetRange("A1")
 * const oComment = oRange.AddComment("This is just a number.")
 * oComment.AddReply("Reply 1", "John Smith", "uid-1")
 * oWorksheet.GetRange("A3").SetValue("Comment replies count: ")
 * oWorksheet.GetRange("B3").SetValue(oComment.GetRepliesCount())
 * builder.SaveFile("xlsx", "GetRepliesCount.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiComment
 * @name GetReply
 * @description Returns the specified comment reply.
 * @returns {ApiCommentReply | null} returns null if nIndex isn't correct or reply with this such index doesn't exist
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * const oRange = oWorksheet.GetRange("A1")
 * const oComment = oRange.AddComment("This is just a number.")
 * oComment.AddReply("Reply 1", "John Smith", "uid-1")
 * const oReply = oComment.GetReply()
 * oWorksheet.GetRange("A3").SetValue("Comment's reply text: ")
 * oWorksheet.GetRange("B3").SetValue(oReply.GetText())
 * builder.SaveFile("xlsx", "GetReply.xlsx")
 * builder.CloseFile()
 * @param {Number=} nIndex=0 The comment reply index.
 */

/**
 * @memberof ApiComment
 * @name GetTime
 * @description Returns the timestamp of the comment creation in the current time zone format.
 * @returns {Number}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * const oRange = oWorksheet.GetRange("A1")
 * const oComment = oRange.AddComment("This is just a number.")
 * oWorksheet.GetRange("A3").SetValue("Timestamp: ")
 * oWorksheet.GetRange("B3").SetValue(oComment.GetTime())
 * builder.SaveFile("xlsx", "GetTime.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiComment
 * @name GetTimeUTC
 * @description Returns the timestamp of the comment creation in UTC format.
 * @returns {Number}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * const oRange = oWorksheet.GetRange("A1")
 * const oComment = oRange.AddComment("This is just a number.")
 * oWorksheet.GetRange("A3").SetValue("Timestamp UTC: ")
 * oWorksheet.GetRange("B3").SetValue(oComment.GetTimeUTC())
 * builder.SaveFile("xlsx", "GetTimeUTC.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiComment
 * @name GetUserId
 * @description Returns the user ID of the comment author.
 * @returns {String}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * const oRange = oWorksheet.GetRange("A1")
 * const oComment = oRange.AddComment("This is just a number.")
 * oWorksheet.GetRange("A3").SetValue("Comment's user Id: ")
 * oWorksheet.GetRange("B3").SetValue(oComment.GetUserId())
 * builder.SaveFile("xlsx", "GetUserId.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiComment
 * @name IsSolved
 * @description Checks if a comment is solved or not.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * const oRange = oWorksheet.GetRange("A1")
 * const oComment = oRange.AddComment("This is just a number.")
 * oWorksheet.GetRange("A3").SetValue("Comment is solved: ")
 * oWorksheet.GetRange("B3").SetValue(oComment.IsSolved())
 * builder.SaveFile("xlsx", "IsSolved.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiComment
 * @name RemoveReplies
 * @description Removes the specified comment replies.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * const oRange = oWorksheet.GetRange("A1")
 * const oComment = oRange.AddComment("This is just a number.")
 * oComment.AddReply("Reply 1", "John Smith", "uid-1")
 * oComment.AddReply("Reply 2", "John Smith", "uid-1")
 * oComment.RemoveReplies(0, 1, false)
 * oWorksheet.GetRange("A3").SetValue("Comment replies count: ")
 * oWorksheet.GetRange("B3").SetValue(oComment.GetRepliesCount())
 * builder.SaveFile("xlsx", "RemoveReplies.xlsx")
 * builder.CloseFile()
 * @param {Number=} nPos=0 The position of the first comment reply to remove.
 * @param {Number=} nCount=1 A number of comment replies to remove.
 * @param {Boolean=} bRemoveAll=false Specifies whether to remove all comment replies or not.
 */

/**
 * @memberof ApiComment
 * @name SetSolved
 * @description Marks a comment as solved.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * const oRange = oWorksheet.GetRange("A1")
 * const oComment = oRange.AddComment("This is just a number.", "John Smith")
 * oWorksheet.GetRange("A3").SetValue("Comment is solved: ")
 * oComment.SetSolved(true)
 * oWorksheet.GetRange("B3").SetValue(oComment.GetSolved())
 * builder.SaveFile("xlsx", "SetSolved.xlsx")
 * builder.CloseFile()
 * @param {Boolean} bSolved Specifies if a comment is solved or not.
 */

/**
 * @memberof ApiComment
 * @name SetAuthorName
 * @description Sets the comment author's name.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * const oRange = oWorksheet.GetRange("A1")
 * const oComment = oRange.AddComment("This is just a number.", "John Smith")
 * oWorksheet.GetRange("A3").SetValue("Comment's author: ")
 * oComment.SetAuthorName("Mark Potato")
 * oWorksheet.GetRange("B3").SetValue(oComment.GetAuthorName())
 * builder.SaveFile("xlsx", "SetAuthorName.xlsx")
 * builder.CloseFile()
 * @param {String} sAuthorName The comment author's name.
 */

/**
 * @memberof ApiComment
 * @name SetText
 * @description Sets the comment text.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * const oRange = oWorksheet.GetRange("A1")
 * const oComment = oRange.AddComment("This is just a number.")
 * oComment.SetText("New comment text")
 * builder.SaveFile("xlsx", "SetText.xlsx")
 * builder.CloseFile()
 * @param {String} text New text for comment.
 */

/**
 * @memberof ApiComment
 * @name SetTime
 * @description Sets the timestamp of the comment creation in the current time zone format.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * const oRange = oWorksheet.GetRange("A1")
 * const oComment = oRange.AddComment("This is just a number.", "John Smith")
 * oWorksheet.GetRange("A3").SetValue("Timestamp: ")
 * oComment.SetTime(Date.now())
 * oWorksheet.GetRange("B3").SetValue(oComment.GetTime())
 * builder.SaveFile("xlsx", "SetTime.xlsx")
 * builder.CloseFile()
 * @param {Number | String} nTimeStamp The timestamp of the comment creation in the current time zone format
 */

/**
 * @memberof ApiComment
 * @name GetText
 * @description Returns the comment text.
 * @returns {String}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * const oRange = oWorksheet.GetRange("A1")
 * oRange.AddComment("This is just a number.")
 * oWorksheet.GetRange("A3").SetValue("Comment: ")
 * oWorksheet.GetRange("B3").SetValue(oRange.GetComment().GetText())
 * builder.SaveFile("xlsx", "GetText.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiComment
 * @name SetTimeUTC
 * @description Sets the timestamp of the comment creation in UTC format.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * const oRange = oWorksheet.GetRange("A1")
 * const oComment = oRange.AddComment("This is just a number.", "John Smith")
 * oWorksheet.GetRange("A3").SetValue("Timestamp UTC: ")
 * oComment.SetTimeUTC(Date.now())
 * oWorksheet.GetRange("B3").SetValue(oComment.GetTimeUTC())
 * builder.SaveFile("xlsx", "SetTimeUTC.xlsx")
 * builder.CloseFile()
 * @param {Number | String} nTimeStamp The timestamp of the comment creation in UTC format.
 */

/**
 * @memberof ApiCommentReply
 * @name GetAuthorName
 * @description Returns the comment reply author's name.
 * @returns {String}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * const oRange = oWorksheet.GetRange("A1")
 * const oComment = oRange.AddComment("This is just a number.")
 * oComment.AddReply("Reply 1", "John Smith", "uid-1")
 * const oReply = oComment.GetReply()
 * oWorksheet.GetRange("A3").SetValue("Comment's reply author: ")
 * oWorksheet.GetRange("B3").SetValue(oReply.GetAuthorName())
 * builder.SaveFile("xlsx", "GetAuthorName.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiCommentReply
 * @name GetTimeUTC
 * @description Returns the timestamp of the comment reply creation in UTC format.
 * @returns {Number}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * const oRange = oWorksheet.GetRange("A1")
 * const oComment = oRange.AddComment("This is just a number.")
 * oComment.AddReply("Reply 1", "John Smith", "uid-1")
 * const oReply = oComment.GetReply()
 * oWorksheet.GetRange("A3").SetValue("Comment's reply timestamp UTC: ")
 * oWorksheet.GetRange("B3").SetValue(oReply.GetTimeUTC())
 * builder.SaveFile("xlsx", "GetTimeUTC.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiComment
 * @name SetUserId
 * @description Sets the user ID to the comment author.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * const oRange = oWorksheet.GetRange("A1")
 * const oComment = oRange.AddComment("This is just a number.", "John Smith")
 * oWorksheet.GetRange("A3").SetValue("Comment's user Id: ")
 * oComment.SetUserId("uid-2")
 * oWorksheet.GetRange("B3").SetValue(oComment.GetUserId())
 * builder.SaveFile("xlsx", "SetUserId.xlsx")
 * builder.CloseFile()
 * @param {String} sUserId The user ID of the comment author.
 */

/**
 * @memberof ApiCommentReply
 * @name GetTime
 * @description Returns the timestamp of the comment reply creation in the current time zone format.
 * @returns {Number}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * const oRange = oWorksheet.GetRange("A1")
 * const oComment = oRange.AddComment("This is just a number.")
 * oComment.AddReply("Reply 1", "John Smith", "uid-1")
 * const oReply = oComment.GetReply()
 * oWorksheet.GetRange("A3").SetValue("Comment's reply timestamp: ")
 * oWorksheet.GetRange("B3").SetValue(oReply.GetTime())
 * builder.SaveFile("xlsx", "GetTime.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiCommentReply
 * @name GetUserId
 * @description Returns the user ID of the comment reply author.
 * @returns {String}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * const oRange = oWorksheet.GetRange("A1")
 * const oComment = oRange.AddComment("This is just a number.")
 * oComment.AddReply("Reply 1", "John Smith", "uid-1")
 * const oReply = oComment.GetReply()
 * oWorksheet.GetRange("A3").SetValue("Comment's reply user Id: ")
 * oWorksheet.GetRange("B3").SetValue(oReply.GetUserId())
 * builder.SaveFile("xlsx", "GetUserId.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiCommentReply
 * @name GetText
 * @description Returns the comment reply text.
 * @returns {String}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * const oRange = oWorksheet.GetRange("A1")
 * const oComment = oRange.AddComment("This is just a number.")
 * oComment.AddReply("Reply 1", "John Smith", "uid-1")
 * const oReply = oComment.GetReply()
 * oWorksheet.GetRange("A3").SetValue("Comment's reply text: ")
 * oWorksheet.GetRange("B3").SetValue(oReply.GetText())
 * builder.SaveFile("xlsx", "GetText.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiCommentReply
 * @name GetClassType
 * @description Returns a type of the ApiCommentReply class.
 * @returns {String}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * const oRange = oWorksheet.GetRange("A1")
 * const oComment = oRange.AddComment("This is just a number.")
 * oComment.AddReply("Reply 1", "John Smith", "uid-1")
 * const oReply = oComment.GetReply()
 * const sType = oReply.GetClassType()
 * oWorksheet.GetRange("A3").SetValue("Type: " + sType)
 * builder.SaveFile("xlsx", "GetClassType.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiCommentReply
 * @name SetTime
 * @description Sets the timestamp of the comment reply creation in the current time zone format.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * const oRange = oWorksheet.GetRange("A1")
 * const oComment = oRange.AddComment("This is just a number.")
 * oComment.AddReply("Reply 1", "John Smith", "uid-1")
 * const oReply = oComment.GetReply()
 * oReply.SetTime(Date.now())
 * oWorksheet.GetRange("A3").SetValue("Comment's reply timestamp: ")
 * oWorksheet.GetRange("B3").SetValue(oReply.GetTime())
 * builder.SaveFile("xlsx", "SetTime.xlsx")
 * builder.CloseFile()
 * @param {Number | String} nTimeStamp The timestamp of the comment reply creation in the current time zone format
 */

/**
 * @memberof ApiCommentReply
 * @name SetAuthorName
 * @description Sets the comment reply author's name.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * const oRange = oWorksheet.GetRange("A1")
 * const oComment = oRange.AddComment("This is just a number.")
 * oComment.AddReply("Reply 1", "John Smith", "uid-1")
 * const oReply = oComment.GetReply()
 * oReply.SetAuthorName("Mark Potato")
 * oWorksheet.GetRange("A3").SetValue("Comment's reply author: ")
 * oWorksheet.GetRange("B3").SetValue(oReply.GetAuthorName())
 * builder.SaveFile("xlsx", "SetAuthorName.xlsx")
 * builder.CloseFile()
 * @param {String} sAuthorName The comment reply author's name.
 */

/**
 * @memberof ApiCommentReply
 * @name SetText
 * @description Sets the comment reply text.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * const oRange = oWorksheet.GetRange("A1")
 * const oComment = oRange.AddComment("This is just a number.")
 * oComment.AddReply("Reply 1", "John Smith", "uid-1")
 * const oReply = oComment.GetReply()
 * oReply.SetText("New reply text.")
 * oWorksheet.GetRange("A3").SetValue("Comment's reply text: ")
 * oWorksheet.GetRange("B3").SetValue(oReply.GetText())
 * builder.SaveFile("xlsx", "SetText.xlsx")
 * builder.CloseFile()
 * @param {String} text The comment reply text.
 */

/**
 * @memberof ApiColor
 * @name GetClassType
 * @description Returns a type of the ApiColor class.
 * @returns {String}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oColor = Api.CreateColorFromRGB(255, 111, 61)
 * oWorksheet.GetRange("A2").SetValue("Text with color")
 * oWorksheet.GetRange("A2").SetFontColor(oColor)
 * const sColorClassType = oColor.GetClassType()
 * oWorksheet.GetRange("A4").SetValue("Class type = " + sColorClassType)
 * builder.SaveFile("xlsx", "GetClassType.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiDocumentContent
 * @name AddElement
 * @description Adds a paragraph or a table or a blockLvl content control using its position in the document content.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 200 * 36000, 60 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * oDocContent.RemoveAllElements()
 * const oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("We removed all elements from the shape and added a new paragraph inside it.")
 * oDocContent.AddElement(oParagraph)
 * oDocContent.Push(oParagraph)
 * builder.SaveFile("xlsx", "AddElement.xlsx")
 * builder.CloseFile()
 * @param {Number} nPos The position where the current element will be added.
 * @param {DocumentElement} oElement The document element which will be added at the current position.
 */

/**
 * @memberof ApiDocumentContent
 * @name GetClassType
 * @description Returns a type of the ApiDocumentContent class.
 * @returns {String}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 200 * 36000, 60 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const sClassType = oDocContent.GetClassType()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Class Type = " + sClassType)
 * builder.SaveFile("xlsx", "GetClassType.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiCommentReply
 * @name SetTimeUTC
 * @description Sets the timestamp of the comment reply creation in UTC format.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * const oRange = oWorksheet.GetRange("A1")
 * const oComment = oRange.AddComment("This is just a number.")
 * oComment.AddReply("Reply 1", "John Smith", "uid-1")
 * const oReply = oComment.GetReply()
 * oReply.SetTimeUTC(Date.now())
 * oWorksheet.GetRange("A3").SetValue("Comment's reply timestamp UTC: ")
 * oWorksheet.GetRange("B3").SetValue(oReply.GetTimeUTC())
 * builder.SaveFile("xlsx", "SetTimeUTC.xlsx")
 * builder.CloseFile()
 * @param {Number | String} nTimeStamp The timestamp of the comment reply creation in UTC format.
 */

/**
 * @memberof ApiDocumentContent
 * @name GetElement
 * @description Returns an element by its position in the document.
 * @returns {DocumentElement}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 200 * 36000, 60 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oParaPr = oParagraph.GetParaPr()
 * oParaPr.SetJc("center")
 * oParagraph.AddText("This is a paragraph with the text in it aligned by the center. ")
 * oParagraph.AddText("The justification is specified in the paragraph style. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.")
 * builder.SaveFile("xlsx", "GetElement.xlsx")
 * builder.CloseFile()
 * @param {Number} nPos The element position that will be taken from the document.
 */

/**
 * @memberof ApiCommentReply
 * @name SetUserId
 * @description Sets the user ID to the comment reply author.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * const oRange = oWorksheet.GetRange("A1")
 * const oComment = oRange.AddComment("This is just a number.")
 * oComment.AddReply("Reply 1", "John Smith", "uid-1")
 * const oReply = oComment.GetReply()
 * oReply.SetUserId("uid-2")
 * oWorksheet.GetRange("A3").SetValue("Comment's reply user Id: ")
 * oWorksheet.GetRange("B3").SetValue(oReply.GetUserId())
 * builder.SaveFile("xlsx", "SetUserId.xlsx")
 * builder.CloseFile()
 * @param {String} sUserId The user ID of the comment author.
 */

/**
 * @memberof ApiDocumentContent
 * @name GetElementsCount
 * @description Returns a number of elements in the current document content.
 * @returns {Number}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 200 * 36000, 60 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("We got the first paragraph inside the shape.")
 * oParagraph.AddLineBreak()
 * oParagraph.AddText("Number of elements inside the shape: " + oDocContent.GetElementsCount())
 * oParagraph.AddLineBreak()
 * oParagraph.AddText("Line breaks are NOT counted into the number of elements.")
 * builder.SaveFile("xlsx", "GetElementsCount.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiDocumentContent
 * @name RemoveAllElements
 * @description Removes all the elements from the current document or from the current document element. When all elements are removed, a new empty paragraph is automatically created. If you want to add content to this paragraph, use the ApiDocumentContent#GetElement method.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * let oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("This is just a sample paragraph.")
 * oDocContent.RemoveAllElements()
 * oParagraph = Api.CreateParagraph()
 * oParagraph.SetJc("left")
 * oParagraph.AddText("We removed all elements from the shape and added a new paragraph inside it.")
 * oDocContent.Push(oParagraph)
 * builder.SaveFile("xlsx", "RemoveAllElements.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiDocumentContent
 * @name Push
 * @description Pushes a paragraph or a table to actually add it to the document.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * oDocContent.RemoveAllElements()
 * const oParagraph = Api.CreateParagraph()
 * oParagraph.SetJc("left")
 * oParagraph.AddText("We removed all elements from the shape and added a new paragraph inside it.")
 * oDocContent.Push(oParagraph)
 * builder.SaveFile("xlsx", "Push.xlsx")
 * builder.CloseFile()
 * @param {DocumentElement} oElement The element type which will be pushed to the document.
 */

/**
 * @memberof ApiDrawing
 * @name GetClassType
 * @description Returns a type of the ApiDrawing class.
 * @returns {String}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oDrawing = oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * oDrawing.SetSize(120 * 36000, 70 * 36000)
 * oDrawing.SetPosition(0, 2 * 36000, 1, 3 * 36000)
 * const sClassType = oDrawing.GetClassType()
 * oWorksheet.SetColumnWidth(0, 15)
 * oWorksheet.SetColumnWidth(1, 10)
 * oWorksheet.GetRange("A1").SetValue("Class Type = " + sClassType)
 * builder.SaveFile("xlsx", "GetClassType.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiDrawing
 * @name GetHeight
 * @description Returns the height of the current drawing.
 * @returns {EMU}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oDrawing = oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * oDrawing.SetSize(120 * 36000, 70 * 36000)
 * oDrawing.SetPosition(0, 2 * 36000, 1, 3 * 36000)
 * const nHeight = oDrawing.GetHeight()
 * oWorksheet.GetRange("A1").SetValue("Drawing height = " + nHeight)
 * builder.SaveFile("xlsx", "GetHeight.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiDrawing
 * @name GetLockValue
 * @description Returns the lock value for the specified lock type of the current drawing.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oDrawing = oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * oDrawing.SetSize(120 * 36000, 70 * 36000)
 * oDrawing.SetPosition(0, 2 * 36000, 1, 3 * 36000)
 * oDrawing.SetLockValue("noSelect", true)
 * const bLockValue = oDrawing.GetLockValue("noSelect")
 * oWorksheet.GetRange("A1").SetValue("This drawing cannot be selected: " + bLockValue)
 * builder.SaveFile("xlsx", "GetLockValue.xlsx")
 * builder.CloseFile()
 * @param {DrawingLockType} sType Lock type in the string format.
 */

/**
 * @memberof ApiDocumentContent
 * @name RemoveElement
 * @description Removes an element using the position specified.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 200 * 36000, 60 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * let oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("This is paragraph #1.")
 * for (let nParaIncrease = 1; nParaIncrease < 5; ++nParaIncrease) {
 *   oParagraph = Api.CreateParagraph()
 *   oParagraph.AddText("This is paragraph #" + (nParaIncrease + 1) + ".")
 *   oDocContent.Push(oParagraph)
 * }
 * oDocContent.RemoveElement(2)
 * oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("We removed paragraph #3, check that out above.")
 * oDocContent.Push(oParagraph)
 * builder.SaveFile("xlsx", "RemoveElement.xlsx")
 * builder.CloseFile()
 * @param {Number} nPos The element number (position) in the document or inside other element.
 */

/**
 * @memberof ApiDrawing
 * @name SetLockValue
 * @description Sets the lock value to the specified lock type of the current drawing.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oDrawing = oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * oDrawing.SetSize(120 * 36000, 70 * 36000)
 * oDrawing.SetPosition(0, 2 * 36000, 1, 3 * 36000)
 * oDrawing.SetLockValue("noSelect", true)
 * const bLockValue = oDrawing.GetLockValue("noSelect")
 * oWorksheet.GetRange("A1").SetValue("This drawing cannot be selected: " + bLockValue)
 * builder.SaveFile("xlsx", "SetLockValue.xlsx")
 * builder.CloseFile()
 * @param {DrawingLockType} sType Lock type in the string format.
 * @param {Boolean} bValue Specifies if the specified lock is applied to the current drawing.
 */

/**
 * @memberof ApiDrawing
 * @name SetPosition
 * @description Changes the position for the drawing object. Please note that the horizontal and vertical offsets are calculated within the limits of the specified column and row cells only. If this value exceeds the cell width or height, another vertical/horizontal position will be set.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oDrawing = oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * oDrawing.SetSize(120 * 36000, 70 * 36000)
 * oDrawing.SetPosition(0, 2 * 36000, 2, 3 * 36000)
 * builder.SaveFile("xlsx", "SetPosition.xlsx")
 * builder.CloseFile()
 * @param {Number} nFromCol The number of the column where the beginning of the drawing object will be placed.
 * @param {EMU} nColOffset The offset from the nFromCol column to the left part of the drawing object measured in English measure units.
 * @param {Number} nFromRow The number of the row where the beginning of the drawing object will be placed.
 * @param {EMU} nRowOffset The offset from the nFromRow row to the upper part of the drawing object measured in English measure units.
 */

/**
 * @memberof ApiDrawing
 * @name GetWidth
 * @description Returns the width of the current drawing.
 * @returns {EMU}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oDrawing = oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * oDrawing.SetSize(120 * 36000, 70 * 36000)
 * oDrawing.SetPosition(0, 2 * 36000, 1, 3 * 36000)
 * const nWidth = oDrawing.GetWidth()
 * oWorksheet.GetRange("A1").SetValue("Drawing width = " + nWidth)
 * builder.SaveFile("xlsx", "GetWidth.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiFont
 * @name GetColor
 * @description Returns the font color property of the specified font.
 * @returns {ApiColor | null}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("B1")
 * oRange.SetValue("This is just a sample text.")
 * let oCharacters = oRange.GetCharacters(9, 4)
 * let oFont = oCharacters.GetFont()
 * let oColor = Api.CreateColorFromRGB(255, 111, 61)
 * oFont.SetColor(oColor)
 * oColor = oFont.GetColor()
 * oCharacters = oRange.GetCharacters(16, 6)
 * oFont = oCharacters.GetFont()
 * oFont.SetColor(oColor)
 * builder.SaveFile("xlsx", "GetColor.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiFont
 * @name GetItalic
 * @description Returns the italic property of the specified font.
 * @returns {Boolean | null}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("B1")
 * oRange.SetValue("This is just a sample text.")
 * const oCharacters = oRange.GetCharacters(9, 4)
 * const oFont = oCharacters.GetFont()
 * oFont.SetItalic(true)
 * const bItalic = oFont.GetItalic()
 * oWorksheet.GetRange("B3").SetValue("Italic property: " + bItalic)
 * builder.SaveFile("xlsx", "GetItalic.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiFont
 * @name GetBold
 * @description Returns the bold property of the specified font.
 * @returns {Boolean | null}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("B1")
 * oRange.SetValue("This is just a sample text.")
 * const oCharacters = oRange.GetCharacters(9, 4)
 * const oFont = oCharacters.GetFont()
 * oFont.SetBold(true)
 * const bBold = oFont.GetBold()
 * oWorksheet.GetRange("B3").SetValue("Bold property: " + bBold)
 * builder.SaveFile("xlsx", "GetBold.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiFont
 * @name GetName
 * @description Returns the font name property of the specified font.
 * @returns {String | null}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("B1")
 * oRange.SetValue("This is just a sample text.")
 * const oCharacters = oRange.GetCharacters(9, 4)
 * const oFont = oCharacters.GetFont()
 * oFont.SetName("Font 1")
 * const sFontName = oFont.GetName()
 * oWorksheet.GetRange("B3").SetValue("Font name: " + sFontName)
 * builder.SaveFile("xlsx", "GetName.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiFont
 * @name GetParent
 * @description Returns the parent ApiCharacters object of the specified font.
 * @returns {ApiCharacters}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("B1")
 * oRange.SetValue("This is just a sample text.")
 * const oCharacters = oRange.GetCharacters(23, 4)
 * const oFont = oCharacters.GetFont()
 * const oParent = oFont.GetParent()
 * oParent.SetText("string")
 * builder.SaveFile("xlsx", "GetParent.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiDrawing
 * @name SetSize
 * @description Sets the size of the object (image, shape, chart) bounding box.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oDrawing = oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * oDrawing.SetSize(120 * 36000, 70 * 36000)
 * oDrawing.SetPosition(0, 2 * 36000, 2, 3 * 36000)
 * builder.SaveFile("xlsx", "SetSize.xlsx")
 * builder.CloseFile()
 * @param {EMU} nWidth The object width measured in English measure units.
 * @param {EMU} nHeight The object height measured in English measure units.
 */

/**
 * @memberof ApiFont
 * @name GetSize
 * @description Returns the font size property of the specified font.
 * @returns {Number | null}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("B1")
 * oRange.SetValue("This is just a sample text.")
 * const oCharacters = oRange.GetCharacters(9, 4)
 * const oFont = oCharacters.GetFont()
 * oFont.SetSize(18)
 * const nSize = oFont.GetSize()
 * oWorksheet.GetRange("B3").SetValue("Size property: " + nSize)
 * builder.SaveFile("xlsx", "GetSize.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiFont
 * @name GetSuperscript
 * @description Returns the superscript property of the specified font.
 * @returns {Boolean | null}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("B1")
 * oRange.SetValue("This is just a sample text.")
 * const oCharacters = oRange.GetCharacters(9, 4)
 * const oFont = oCharacters.GetFont()
 * oFont.SetSuperscript(true)
 * const bSuperscript = oFont.GetSuperscript()
 * oWorksheet.GetRange("B3").SetValue("Superscript property: " + bSuperscript)
 * builder.SaveFile("xlsx", "GetSuperscript.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiFont
 * @name GetSubscript
 * @description Returns the subscript property of the specified font.
 * @returns {Boolean | null}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("B1")
 * oRange.SetValue("This is just a sample text.")
 * const oCharacters = oRange.GetCharacters(9, 4)
 * const oFont = oCharacters.GetFont()
 * oFont.SetSubscript(true)
 * const bSubscript = oFont.GetSubscript()
 * oWorksheet.GetRange("B3").SetValue("Subscript property: " + bSubscript)
 * builder.SaveFile("xlsx", "GetSubscript.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiFont
 * @name SetBold
 * @description Sets the bold property to the specified font.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("B1")
 * oRange.SetValue("This is just a sample text.")
 * const oCharacters = oRange.GetCharacters(9, 4)
 * const oFont = oCharacters.GetFont()
 * oFont.SetBold(true)
 * builder.SaveFile("xlsx", "SetBold.xlsx")
 * builder.CloseFile()
 * @param {Boolean} isBold Specifies that the text characters are displayed bold.
 */

/**
 * @memberof ApiFont
 * @name SetColor
 * @description Sets the font color property to the specified font.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("B1")
 * oRange.SetValue("This is just a sample text.")
 * const oCharacters = oRange.GetCharacters(9, 4)
 * const oFont = oCharacters.GetFont()
 * const oColor = Api.CreateColorFromRGB(255, 111, 61)
 * oFont.SetColor(oColor)
 * builder.SaveFile("xlsx", "SetColor.xlsx")
 * builder.CloseFile()
 * @param {ApiColor} Color Font color.
 */

/**
 * @memberof ApiFont
 * @name GetStrikethrough
 * @description Returns the strikethrough property of the specified font.
 * @returns {Boolean | null}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("B1")
 * oRange.SetValue("This is just a sample text.")
 * const oCharacters = oRange.GetCharacters(9, 4)
 * const oFont = oCharacters.GetFont()
 * oFont.SetStrikethrough(true)
 * const bStrikethrough = oFont.GetStrikethrough()
 * oWorksheet.GetRange("B3").SetValue("Strikethrough property: " + bStrikethrough)
 * builder.SaveFile("xlsx", "GetStrikethrough.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiFont
 * @name SetItalic
 * @description Sets the italic property to the specified font.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("B1")
 * oRange.SetValue("This is just a sample text.")
 * const oCharacters = oRange.GetCharacters(9, 4)
 * const oFont = oCharacters.GetFont()
 * oFont.SetItalic(true)
 * builder.SaveFile("xlsx", "SetItalic.xlsx")
 * builder.CloseFile()
 * @param {Boolean} isItalic Specifies that the text characters are displayed italic.
 */

/**
 * @memberof ApiFont
 * @name GetUnderline
 * @description Returns the type of underline applied to the specified font.
 * @returns {XlUnderlineStyle | null}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("B1")
 * oRange.SetValue("This is just a sample text.")
 * const oCharacters = oRange.GetCharacters(9, 4)
 * const oFont = oCharacters.GetFont()
 * oFont.SetUnderline("xlUnderlineStyleSingle")
 * const sUnderline = oFont.GetUnderline()
 * oWorksheet.GetRange("B3").SetValue("Underline property: " + sUnderline)
 * builder.SaveFile("xlsx", "GetUnderline.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiFont
 * @name SetName
 * @description Sets the font name property to the specified font.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("B1")
 * oRange.SetValue("This is just a sample text.")
 * const oCharacters = oRange.GetCharacters(9, 4)
 * const oFont = oCharacters.GetFont()
 * oFont.SetName("Font 1")
 * const sFontName = oFont.GetName()
 * oWorksheet.GetRange("B3").SetValue("Font name: " + sFontName)
 * builder.SaveFile("xlsx", "SetName.xlsx")
 * builder.CloseFile()
 * @param {String} FontName Font name.
 */

/**
 * @memberof ApiFont
 * @name SetSize
 * @description Sets the font size property to the specified font.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("B1")
 * oRange.SetValue("This is just a sample text.")
 * const oCharacters = oRange.GetCharacters(9, 4)
 * const oFont = oCharacters.GetFont()
 * oFont.SetSize(18)
 * builder.SaveFile("xlsx", "SetSize.xlsx")
 * builder.CloseFile()
 * @param {Number} Size Font size.
 */

/**
 * @memberof ApiFont
 * @name SetStrikethrough
 * @description Sets the strikethrough property to the specified font.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("B1")
 * oRange.SetValue("This is just a sample text.")
 * const oCharacters = oRange.GetCharacters(9, 4)
 * const oFont = oCharacters.GetFont()
 * oFont.SetStrikethrough(true)
 * builder.SaveFile("xlsx", "SetStrikethrough.xlsx")
 * builder.CloseFile()
 * @param {Boolean} isStrikethrough Specifies that the text characters are displayed strikethrough.
 */

/**
 * @memberof ApiFont
 * @name SetUnderline
 * @description Sets an underline of the type specified in the request to the current font.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("B1")
 * oRange.SetValue("This is just a sample text.")
 * const oCharacters = oRange.GetCharacters(9, 4)
 * const oFont = oCharacters.GetFont()
 * oFont.SetUnderline("xlUnderlineStyleSingle")
 * builder.SaveFile("xlsx", "SetUnderline.xlsx")
 * builder.CloseFile()
 * @param {XlUnderlineStyle} Underline Underline type.
 */

/**
 * @memberof ApiFont
 * @name SetSubscript
 * @description Sets the subscript property to the specified font.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("B1")
 * oRange.SetValue("This is just a sample text.")
 * const oCharacters = oRange.GetCharacters(9, 4)
 * const oFont = oCharacters.GetFont()
 * oFont.SetSubscript(true)
 * builder.SaveFile("xlsx", "SetSubscript.xlsx")
 * builder.CloseFile()
 * @param {Boolean} isSubscript Specifies that the text characters are displayed subscript.
 */

/**
 * @memberof ApiFreezePanes
 * @name FreezeColumns
 * @description Freeze the first column or columns of the worksheet in place.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFreezePanes = oWorksheet.GetFreezePanes()
 * oFreezePanes.FreezeColumns(1)
 * builder.SaveFile("xlsx", "FreezeColumns.xlsx")
 * builder.CloseFile()
 * @param {Number=} count=0 Optional number of columns to freeze, or zero to unfreeze all columns.
 */

/**
 * @memberof ApiFreezePanes
 * @name FreezeAt
 * @description Sets the frozen cells in the active worksheet view. The range provided corresponds to cells that will be frozen in the top- and left-most pane.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFreezePanes = oWorksheet.GetFreezePanes()
 * const oRange = Api.GetRange("H2:K4")
 * oFreezePanes.FreezeAt(oRange)
 * builder.SaveFile("xlsx", "FreezeAt.xlsx")
 * builder.CloseFile()
 * @param {ApiRange | String} frozenRange A range that represents the cells to be frozen panes.
 */

/**
 * @memberof ApiFreezePanes
 * @name FreezeRows
 * @description Freeze the top row or rows of the worksheet in place.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFreezePanes = oWorksheet.GetFreezePanes()
 * oFreezePanes.FreezeRows(1)
 * builder.SaveFile("xlsx", "FreezeRows.xlsx")
 * builder.CloseFile()
 * @param {Number=} count=0 Optional number of rows to freeze, or zero to unfreeze all rows.
 */

/**
 * @memberof ApiFreezePanes
 * @name GetLocation
 * @description Gets a range that describes the frozen cells in the active worksheet view.
 * @returns {ApiRange | null} returns null if there is no frozen pane.
 * @example
 * builder.CreateFile("xlsx")
 * Api.FreezePanes("column")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFreezePanes = oWorksheet.GetFreezePanes()
 * const oRange = oFreezePanes.GetLocation()
 * oWorksheet.GetRange("A1").SetValue("Location: ")
 * oWorksheet.GetRange("B1").SetValue(oRange.GetAddress())
 * builder.SaveFile("xlsx", "GetLocation.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiFill
 * @name GetClassType
 * @description Returns a type of the ApiFill class.
 * @returns {String}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateLinearGradientFill([
 *   oGs1,
 *   oGs2
 * ], 5400000)
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 1, 3 * 36000)
 * const sClassType = oFill.GetClassType()
 * oWorksheet.SetColumnWidth(0, 15)
 * oWorksheet.SetColumnWidth(1, 10)
 * oWorksheet.GetRange("A1").SetValue("Class Type = " + sClassType)
 * builder.SaveFile("xlsx", "GetClassType.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiImage
 * @name GetClassType
 * @description Returns a type of the ApiImage class.
 * @returns {String}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oImage = oWorksheet.AddImage("https://api.onlyoffice.com/content/img/docbuilder/examples/coordinate_aspects.png", 60 * 36000, 35 * 36000, 0, 2 * 36000, 2, 3 * 36000)
 * const sClassType = oImage.GetClassType()
 * oWorksheet.SetColumnWidth(0, 15)
 * oWorksheet.SetColumnWidth(1, 10)
 * oWorksheet.GetRange("A1").SetValue("Class Type = ")
 * oWorksheet.GetRange("B1").SetValue(sClassType)
 * builder.SaveFile("xlsx", "GetClassType.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiGradientStop
 * @name GetClassType
 * @description Returns a type of the ApiGradientStop class.
 * @returns {String}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateLinearGradientFill([
 *   oGs1,
 *   oGs2
 * ], 5400000)
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 1, 3 * 36000)
 * const sClassType = oGs1.GetClassType()
 * oWorksheet.SetColumnWidth(0, 15)
 * oWorksheet.SetColumnWidth(1, 10)
 * oWorksheet.GetRange("A1").SetValue("Class Type = " + sClassType)
 * builder.SaveFile("xlsx", "GetClassType.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiFont
 * @name SetSuperscript
 * @description Sets the superscript property to the specified font.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("B1")
 * oRange.SetValue("This is just a sample text.")
 * const oCharacters = oRange.GetCharacters(9, 4)
 * const oFont = oCharacters.GetFont()
 * oFont.SetSuperscript(true)
 * builder.SaveFile("xlsx", "SetSuperscript.xlsx")
 * builder.CloseFile()
 * @param {Boolean} isSuperscript Specifies that the text characters are displayed superscript.
 */

/**
 * @memberof ApiFreezePanes
 * @name Unfreeze
 * @description Removes all frozen panes in the worksheet.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * Api.FreezePanes("column")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFreezePanes = oWorksheet.GetFreezePanes()
 * oFreezePanes.Unfreeze()
 * const oRange = oFreezePanes.GetLocation()
 * oWorksheet.GetRange("A1").SetValue("Location: ")
 * oWorksheet.GetRange("B1").SetValue(oRange + "")
 * builder.SaveFile("xlsx", "Unfreeze.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiOleObject
 * @name GetApplicationId
 * @description Returns the application ID from the current OLE object.
 * @returns {String}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oOleObject = oWorksheet.AddOleObject("https://api.onlyoffice.com/content/img/docbuilder/examples/ole-object-image.png", 130 * 36000, 90 * 36000, "https://youtu.be/SKGz4pmnpgY", "asc.{38E022EA-AD92-45FC-B22B-49DF39746DB4}", 0, 2 * 36000, 4, 3 * 36000)
 * const sAppId = oOleObject.GetApplicationId()
 * oWorksheet.GetRange("A1").SetValue("The OLE object application ID: " + sAppId)
 * builder.SaveFile("xlsx", "GetApplicationId.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiOleObject
 * @name GetClassType
 * @description Returns a type of the ApiOleObject class.
 * @returns {String}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oOleObject = oWorksheet.AddOleObject("https://api.onlyoffice.com/content/img/docbuilder/examples/ole-object-image.png", 130 * 36000, 90 * 36000, "https://youtu.be/SKGz4pmnpgY", "asc.{38E022EA-AD92-45FC-B22B-49DF39746DB4}", 0, 2 * 36000, 4, 3 * 36000)
 * const sType = oOleObject.GetClassType()
 * oWorksheet.GetRange("A1").SetValue("Class type: " + sType)
 * builder.SaveFile("xlsx", "GetClassType.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiOleObject
 * @name GetData
 * @description Returns the string data from the current OLE object.
 * @returns {String}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oOleObject = oWorksheet.AddOleObject("https://api.onlyoffice.com/content/img/docbuilder/examples/ole-object-image.png", 130 * 36000, 90 * 36000, "https://youtu.be/SKGz4pmnpgY", "asc.{38E022EA-AD92-45FC-B22B-49DF39746DB4}", 0, 2 * 36000, 4, 3 * 36000)
 * const sData = oOleObject.GetData()
 * oWorksheet.GetRange("A1").SetValue("The OLE object data: " + sData)
 * builder.SaveFile("xlsx", "GetData.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiName
 * @name GetName
 * @description Returns a type of the ApiName class.
 * @returns {String}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * oWorksheet.GetRange("B1").SetValue("2")
 * Api.AddDefName("numbers", "Sheet1!$A$1:$B$1")
 * const oDefName = Api.GetDefName("numbers")
 * oWorksheet.GetRange("A3").SetValue("Name: " + oDefName.GetName())
 * builder.SaveFile("xlsx", "GetName.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiName
 * @name Delete
 * @description Deletes the DefName object.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * oWorksheet.GetRange("B1").SetValue("2")
 * Api.AddDefName("numbers", "Sheet1!$A$1:$B$1")
 * const oDefName = Api.GetDefName("numbers")
 * oDefName.Delete()
 * oWorksheet.GetRange("A3").SetValue("The name 'numbers' of the range A1:B1 was deleted.")
 * builder.SaveFile("xlsx", "Delete.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiName
 * @name SetName
 * @description Sets a string value representing the object name.
 * @returns {Boolean} returns false if sName is invalid
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * oWorksheet.GetRange("B1").SetValue("2")
 * Api.AddDefName("name", "Sheet1!$A$1:$B$1")
 * const oDefName = Api.GetDefName("name")
 * oDefName.SetName("new_name")
 * const oNewDefName = Api.GetDefName("new_name")
 * oWorksheet.GetRange("A3").SetValue("The new name of the range: " + oNewDefName.GetName())
 * builder.SaveFile("xlsx", "SetName.xlsx")
 * builder.CloseFile()
 * @param {String} sName New name for the range.
 */

/**
 * @memberof ApiName
 * @name GetRefersTo
 * @description Returns a formula that the name is defined to refer to.
 * @returns {String}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * oWorksheet.GetRange("B1").SetValue("2")
 * oWorksheet.GetRange("C1").SetValue("=SUM(A1:B1)")
 * Api.AddDefName("summa", "Sheet1!$A$1:$B$1")
 * const oDefName = Api.GetDefName("summa")
 * oDefName.SetRefersTo("=SUM(A1:B1)")
 * oWorksheet.GetRange("A3").SetValue("The name 'summa' refers to the formula from the cell C1.")
 * oWorksheet.GetRange("A4").SetValue("Formula: " + oDefName.GetRefersTo())
 * builder.SaveFile("xlsx", "GetRefersTo.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiName
 * @name GetRefersToRange
 * @description Returns the ApiRange object by its name.
 * @returns {ApiRange}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * oWorksheet.GetRange("B1").SetValue("2")
 * Api.AddDefName("numbers", "Sheet1!$A$1:$B$1")
 * const oDefName = Api.GetDefName("numbers")
 * const oRange = oDefName.GetRefersToRange()
 * oRange.SetBold(true)
 * builder.SaveFile("xlsx", "GetRefersToRange.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiName
 * @name SetRefersTo
 * @description Sets a formula that the name is defined to refer to.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * oWorksheet.GetRange("B1").SetValue("2")
 * oWorksheet.GetRange("C1").SetValue("=SUM(A1:B1)")
 * Api.AddDefName("summa", "Sheet1!$A$1:$B$1")
 * const oDefName = Api.GetDefName("summa")
 * oDefName.SetRefersTo("=SUM(A1:B1)")
 * oWorksheet.GetRange("A3").SetValue("The name 'summa' refers to the formula from the cell C1.")
 * builder.SaveFile("xlsx", "SetRefersTo.xlsx")
 * builder.CloseFile()
 * @param {String} sRef The range reference which must contain the sheet name, followed by sign ! and a range of cells. Example: "Sheet1!$A$1:$B$2".
 */

/**
 * @memberof ApiOleObject
 * @name SetData
 * @description Sets the data to the current OLE object.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oOleObject = oWorksheet.AddOleObject("https://api.onlyoffice.com/content/img/docbuilder/examples/ole-object-image.png", 130 * 36000, 90 * 36000, "https://youtu.be/SKGz4pmnpgY", "asc.{38E022EA-AD92-45FC-B22B-49DF39746DB4}", 0, 2 * 36000, 4, 3 * 36000)
 * oOleObject.SetData("https://youtu.be/eJxpkjQG6Ew")
 * builder.SaveFile("xlsx", "SetData.xlsx")
 * builder.CloseFile()
 * @param {String} sData The OLE object string data.
 */

/**
 * @memberof ApiOleObject
 * @name SetApplicationId
 * @description Sets the application ID to the current OLE object.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oOleObject = oWorksheet.AddOleObject("https://api.onlyoffice.com/content/img/docbuilder/examples/ole-object-image.png", 130 * 36000, 90 * 36000, "https://youtu.be/SKGz4pmnpgY", "asc.{38E022EA-AD92-45FC-B22B-49DF39746DB4}", 0, 2 * 36000, 4, 3 * 36000)
 * oOleObject.SetApplicationId("asc.{E5773A43-F9B3-4E81-81D9-CE0A132470E7}")
 * builder.SaveFile("xlsx", "SetApplicationId.xlsx")
 * builder.CloseFile()
 * @param {String} sAppId The application ID associated with the curent OLE object.
 */

/**
 * @memberof ApiParaPr
 * @name GetIndFirstLine
 * @description Returns the paragraph first line indentation.
 * @returns {twips | undefined}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * let oParagraph = oDocContent.GetElement(0)
 * const oParaPr = oParagraph.GetParaPr()
 * oParaPr.SetIndFirstLine(1440)
 * oParagraph.AddText("This is the first paragraph with the indent of 1 inch set to the first line. ")
 * oParagraph.AddText("This indent is set by the paragraph style. No paragraph inline style is applied. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.")
 * const nIndFirstLine = oParaPr.GetIndFirstLine()
 * oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("First line indent: " + nIndFirstLine)
 * oDocContent.Push(oParagraph)
 * builder.SaveFile("xlsx", "GetIndFirstLine.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParaPr
 * @name GetIndLeft
 * @description Returns the paragraph left side indentation.
 * @returns {twips | undefined}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * let oParagraph = oDocContent.GetElement(0)
 * const oParaPr = oParagraph.GetParaPr()
 * oParaPr.SetIndLeft(2880)
 * oParagraph.AddText("This is the first paragraph with the indent of 2 inches set to it. ")
 * oParagraph.AddText("This indent is set by the paragraph style. No paragraph inline style is applied. ")
 * const nIndLeft = oParaPr.GetIndLeft()
 * oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("Left indent: " + nIndLeft)
 * oDocContent.Push(oParagraph)
 * builder.SaveFile("xlsx", "GetIndLeft.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParaPr
 * @name GetClassType
 * @description Returns a type of the ApiParaPr class.
 * @returns {String}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * let oParagraph = oDocContent.GetElement(0)
 * const oParaPr = oParagraph.GetParaPr()
 * const sClassType = oParaPr.GetClassType()
 * oParaPr.SetIndFirstLine(1440)
 * oParagraph.AddText("This is the first paragraph with the indent of 1 inch set to the first line. ")
 * oParagraph.AddText("This indent is set by the paragraph style. No paragraph inline style is applied. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.")
 * oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("Class Type = " + sClassType)
 * oDocContent.Push(oParagraph)
 * builder.SaveFile("xlsx", "GetClassType.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParaPr
 * @name GetSpacingLineRule
 * @description Returns the paragraph line spacing rule.
 * @returns {LineSpacingRule}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * let oParagraph = oDocContent.GetElement(0)
 * const oParaPr = oParagraph.GetParaPr()
 * oParaPr.SetSpacingLine(3 * 240, "auto")
 * oParagraph.AddText("Paragraph 1. Spacing: 3 times of a common paragraph line spacing.")
 * oParagraph.AddLineBreak()
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.")
 * const sSpacingLineRule = oParaPr.GetSpacingLineRule()
 * oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("Spacing line rule : " + sSpacingLineRule)
 * oDocContent.Push(oParagraph)
 * builder.SaveFile("xlsx", "GetSpacingLineRule.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParaPr
 * @name GetIndRight
 * @description Returns the paragraph right side indentation.
 * @returns {twips | undefined}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * let oParagraph = oDocContent.GetElement(0)
 * const oParaPr = oParagraph.GetParaPr()
 * oParaPr.SetIndRight(2880)
 * oParaPr.SetJc("right")
 * oParagraph.AddText("This is the first paragraph with the right offset of 2 inches set to it. ")
 * oParagraph.AddText("This indent is set by the paragraph style. No paragraph inline style is applied. ")
 * const nIndRight = oParaPr.GetIndRight()
 * oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("Right indent: " + nIndRight)
 * oDocContent.Push(oParagraph)
 * builder.SaveFile("xlsx", "GetIndRight.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParaPr
 * @name GetSpacingAfter
 * @description Returns the spacing after value of the current paragraph.
 * @returns {twips}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * let oParagraph = oDocContent.GetElement(0)
 * const oParaPr = oParagraph.GetParaPr()
 * oParaPr.SetSpacingAfter(1440)
 * oParagraph.AddText("This is an example of setting a space after a paragraph. ")
 * oParagraph.AddText("The second paragraph will have an offset of one inch from the top. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.")
 * const nSpacingAfter = oParaPr.GetSpacingAfter()
 * oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("Spacing after : " + nSpacingAfter)
 * oDocContent.Push(oParagraph)
 * builder.SaveFile("xlsx", "GetSpacingAfter.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParaPr
 * @name GetSpacingBefore
 * @description Returns the spacing before value of the current paragraph.
 * @returns {twips}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * let oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("This is an example of setting a space before a paragraph.")
 * oParagraph.AddText("The second paragraph will have an offset of one inch from the top. ")
 * oParagraph.AddText("This is due to the fact that the second paragraph has this offset enabled.")
 * const oParagraph2 = Api.CreateParagraph()
 * oParagraph2.AddText("This is the second paragraph and it is one inch away from the first paragraph.")
 * oDocContent.Push(oParagraph2)
 * const oParaPr = oParagraph2.GetParaPr()
 * oParaPr.SetSpacingBefore(1440)
 * const nSpacingBefore = oParaPr.GetSpacingBefore()
 * oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("Spacing before: " + nSpacingBefore)
 * oDocContent.Push(oParagraph)
 * builder.SaveFile("xlsx", "GetSpacingBefore.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParaPr
 * @name GetSpacingLineValue
 * @description Returns the paragraph line spacing value.
 * @returns {twips | line240 | undefined}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * let oParagraph = oDocContent.GetElement(0)
 * const oParaPr = oParagraph.GetParaPr()
 * oParaPr.SetSpacingLine(3 * 240, "auto")
 * oParagraph.AddText("Paragraph 1. Spacing: 3 times of a common paragraph line spacing.")
 * oParagraph.AddLineBreak()
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.")
 * const nSpacingLineValue = oParaPr.GetSpacingLineValue()
 * oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("Spacing line value : " + nSpacingLineValue)
 * oDocContent.Push(oParagraph)
 * builder.SaveFile("xlsx", "GetSpacingLineValue.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParaPr
 * @name SetBullet
 * @description Sets the bullet or numbering to the current paragraph.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oParaPr = oParagraph.GetParaPr()
 * const oBullet = Api.CreateBullet("-")
 * oParaPr.SetBullet(oBullet)
 * oParagraph.AddText(" This is an example of the bulleted paragraph.")
 * builder.SaveFile("xlsx", "SetBullet.xlsx")
 * builder.CloseFile()
 * @param {ApiBullet} oBullet The bullet object created with the Api#CreateBullet or Api#CreateNumbering method.
 */

/**
 * @memberof ApiParaPr
 * @name SetIndFirstLine
 * @description Sets the paragraph first line indentation.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oParaPr = oParagraph.GetParaPr()
 * oParaPr.SetIndFirstLine(1440)
 * oParagraph.AddText("This is the first paragraph with the indent of 1 inch set to the first line. ")
 * oParagraph.AddText("This indent is set by the paragraph style. No paragraph inline style is applied. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.")
 * builder.SaveFile("xlsx", "SetIndFirstLine.xlsx")
 * builder.CloseFile()
 * @param {twips} nValue The paragraph first line indentation value measured in twentieths of a point (1/1440 of an inch).
 */

/**
 * @memberof ApiParaPr
 * @name SetIndRight
 * @description Sets the paragraph right side indentation.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oParaPr = oParagraph.GetParaPr()
 * oParaPr.SetIndRight(2880)
 * oParagraph.AddText("This is the first paragraph with the right offset of 2 inches set to it. ")
 * oParagraph.AddText("This offset is set by the paragraph style. No paragraph inline style is applied. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * builder.SaveFile("xlsx", "SetIndRight.xlsx")
 * builder.CloseFile()
 * @param {twips} nValue The paragraph right side indentation value measured in twentieths of a point (1/1440 of an inch).
 */

/**
 * @memberof ApiParaPr
 * @name GetJc
 * @description Returns the paragraph contents justification.
 * @returns {ContenJustification}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * let oParagraph = oDocContent.GetElement(0)
 * const oParaPr = oParagraph.GetParaPr()
 * oParaPr.SetJc("center")
 * oParagraph.AddText("This is a paragraph with the text in it aligned by the center. ")
 * oParagraph.AddText("The justification is specified in the paragraph style. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.")
 * const sJc = oParaPr.GetJc()
 * oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("Justification: " + sJc)
 * oDocContent.Push(oParagraph)
 * builder.SaveFile("xlsx", "GetJc.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParaPr
 * @name SetIndLeft
 * @description Sets the paragraph left side indentation.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oParaPr = oParagraph.GetParaPr()
 * oParaPr.SetIndLeft(2880)
 * oParagraph.AddText("This is the first paragraph with the indent of 2 inches set to it. ")
 * oParagraph.AddText("This indent is set by the paragraph style. No paragraph inline style is applied. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * builder.SaveFile("xlsx", "SetIndLeft.xlsx")
 * builder.CloseFile()
 * @param {twips} nValue The paragraph left side indentation value measured in twentieths of a point (1/1440 of an inch).
 */

/**
 * @memberof ApiParaPr
 * @name SetJc
 * @description Sets the paragraph contents justification.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oParaPr = oParagraph.GetParaPr()
 * oParaPr.SetJc("center")
 * oParagraph.AddText("This is a paragraph with the text in it aligned by the center. ")
 * oParagraph.AddText("The justification is specified in the paragraph style. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.")
 * builder.SaveFile("xlsx", "SetJc.xlsx")
 * builder.CloseFile()
 * @param {ContentJustification} sJc The justification type that will be applied to the paragraph contents.
 */

/**
 * @memberof ApiParaPr
 * @name SetSpacingLine
 * @description Sets the paragraph line spacing. If the value of the sLineRule parameter is either "atLeast" or "exact", then the value of nLine will be interpreted as twentieths of a point. If the value of the sLineRule parameter is "auto", then the value of the nLine parameter will be interpreted as 240ths of a line.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oParaPr = oParagraph.GetParaPr()
 * oParaPr.SetSpacingLine(3 * 240, "auto")
 * oParagraph.AddText("Paragraph 1. Spacing: 3 times of a common paragraph line spacing.")
 * oParagraph.AddLineBreak()
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * builder.SaveFile("xlsx", "SetSpacingLine.xlsx")
 * builder.CloseFile()
 * @param {twips | line240} nLine The line spacing value measured either in twentieths of a point (1/1440 of an inch) or in 240ths of a line.
 * @param {LineRule} sLineRule The rule that determines the measuring units of the line spacing.
 */

/**
 * @memberof ApiParaPr
 * @name SetTabs
 * @description Specifies a sequence of custom tab stops which will be used for any tab characters in the current paragraph. : The lengths of aPos array and aVal array  BE equal to each other.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 150 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oParaPr = oParagraph.GetParaPr()
 * oParaPr.SetTabs([
 *   1440,
 *   2880,
 *   4320
 * ], [
 *   "left",
 *   "center",
 *   "right"
 * ])
 * oParagraph.AddTabStop()
 * oParagraph.AddText("Custom tab - 1 inch left")
 * oParagraph.AddLineBreak()
 * oParagraph.AddTabStop()
 * oParagraph.AddTabStop()
 * oParagraph.AddText("Custom tab - 2 inches center")
 * oParagraph.AddLineBreak()
 * oParagraph.AddTabStop()
 * oParagraph.AddTabStop()
 * oParagraph.AddTabStop()
 * oParagraph.AddText("Custom tab - 3 inches right")
 * builder.SaveFile("xlsx", "SetTabs.xlsx")
 * builder.CloseFile()
 * @param {Array<twips>} aPos An array of the positions of custom tab stops with respect to the current page margins measured in twentieths of a point (1/1440 of an inch).
 * @param {Array<TabJc>} aVal An array of the styles of custom tab stops, which determines the behavior of the tab stop and the alignment which will be applied to text entered at the current custom tab stop.
 */

/**
 * @memberof ApiParaPr
 * @name SetSpacingBefore
 * @description Sets the spacing before the current paragraph. If the value of the isBeforeAuto parameter is true, then any value of the nBefore is ignored. If isBeforeAuto parameter is not specified, then it will be interpreted as false.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * let oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("This is an example of setting a space before a paragraph. ")
 * oParagraph.AddText("The second paragraph will have an offset of one inch from the top. ")
 * oParagraph.AddText("This is due to the fact that the second paragraph has this offset enabled.")
 * oParagraph = Api.CreateParagraph()
 * const oParaPr = oParagraph.GetParaPr()
 * oParaPr.SetSpacingBefore(1440)
 * oParagraph.AddText("This is the second paragraph and it is one inch away from the first paragraph.")
 * oDocContent.Push(oParagraph)
 * builder.SaveFile("xlsx", "SetSpacingBefore.xlsx")
 * builder.CloseFile()
 * @param {twips} nBefore The value of the spacing before the current paragraph measured in twentieths of a point (1/1440 of an inch).
 * @param {Boolean=} isBeforeAuto=false The true value disables the spacing before the current paragraph.
 */

/**
 * @memberof ApiParagraph
 * @name AddElement
 * @description Adds an element to the current paragraph.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * oRun.AddText("This is just a sample text run. Nothing special.")
 * oParagraph.AddElement(oRun)
 * builder.SaveFile("xlsx", "AddElement.xlsx")
 * builder.CloseFile()
 * @param {ParagraphContent} oElement The document element which will be added at the current position. Returns false if the oElement type is not supported by a paragraph.
 * @param {Number=} nPos=null The position where the current element will be added. If this value is not specified, then the element will be added at the end of the current paragraph.
 */

/**
 * @memberof ApiParaPr
 * @name SetSpacingAfter
 * @description Sets the spacing after the current paragraph. If the value of the isAfterAuto parameter is true, then any value of the nAfter is ignored. If isAfterAuto parameter is not specified, then it will be interpreted as false.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * let oParagraph = oDocContent.GetElement(0)
 * const oParaPr = oParagraph.GetParaPr()
 * oParaPr.SetSpacingAfter(1440)
 * oParagraph.AddText("This is an example of setting a space after a paragraph. ")
 * oParagraph.AddText("The second paragraph will have an offset of one inch from the top. ")
 * oParagraph.AddText("This is due to the fact that the first paragraph has this offset enabled.")
 * oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("This is the second paragraph and it is one inch away from the first paragraph.")
 * oDocContent.Push(oParagraph)
 * builder.SaveFile("xlsx", "SetSpacingAfter.xlsx")
 * builder.CloseFile()
 * @param {twips} nAfter The value of the spacing after the current paragraph measured in twentieths of a point (1/1440 of an inch).
 * @param {Boolean=} isAfterAuto=false The true value disables the spacing after the current paragraph.
 */

/**
 * @memberof ApiParagraph
 * @name AddLineBreak
 * @description Adds a line break to the current position and starts the next element from a new line.
 * @returns {ApiRun}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("This is a text inside the shape aligned left.")
 * oParagraph.AddLineBreak()
 * oParagraph.AddText("This is a text after the line break.")
 * builder.SaveFile("xlsx", "AddLineBreak.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParagraph
 * @name AddTabStop
 * @description Adds a tab stop to the current paragraph.
 * @returns {ApiRun}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("This is just a sample text. After it three tab stops will be added.")
 * oParagraph.AddTabStop()
 * oParagraph.AddTabStop()
 * oParagraph.AddTabStop()
 * oParagraph.AddText("This is the text which starts after the tab stops.")
 * builder.SaveFile("xlsx", "AddTabStop.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParagraph
 * @name AddText
 * @description Adds some text to the current paragraph.
 * @returns {ApiRun}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("This is a text inside the shape aligned left.")
 * oParagraph.AddLineBreak()
 * oParagraph.AddText("This is a text after the line break.")
 * builder.SaveFile("xlsx", "AddText.xlsx")
 * builder.CloseFile()
 * @param {String=} sText The text that we want to insert into the current document element.
 */

/**
 * @memberof ApiParagraph
 * @name Delete
 * @description Deletes the current paragraph.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * oDocContent.RemoveAllElements()
 * const oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("This is just a sample text.")
 * oDocContent.Push(oParagraph)
 * oParagraph.Delete()
 * oWorksheet.GetRange("A9").SetValue("The paragraph from the shape content was removed.")
 * builder.SaveFile("xlsx", "Delete.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParagraph
 * @name GetClassType
 * @description Returns a type of the ApiParagraph class.
 * @returns {String}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const sClassType = oParagraph.GetClassType()
 * oParagraph.AddText("Class Type = " + sClassType)
 * builder.SaveFile("xlsx", "GetClassType.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParagraph
 * @name GetElement
 * @description Returns a paragraph element using the position specified.
 * @returns {ParagraphContent}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.RemoveAllElements()
 * let oRun = Api.CreateRun()
 * oRun.AddText("This is the text for the first text run. Do not forget a space at its end to separate from the second one. ")
 * oParagraph.AddElement(oRun)
 * oRun = Api.CreateRun()
 * oRun.AddText("This is the text for the second run. We will set it bold afterwards. It also needs space at its end. ")
 * oParagraph.AddElement(oRun)
 * oRun = Api.CreateRun()
 * oRun.AddText("This is the text for the third run. It ends the paragraph.")
 * oParagraph.AddElement(oRun)
 * oRun = oParagraph.GetElement(2)
 * oRun.SetBold(true)
 * builder.SaveFile("xlsx", "GetElement.xlsx")
 * builder.CloseFile()
 * @param {Number} nPos The position where the element which content we want to get must be located.
 */

/**
 * @memberof ApiParagraph
 * @name GetIndFirstLine
 * @description Returns the paragraph first line indentation.Inherited From: ApiParaPr#GetIndFirstLine
 * @returns {twips | undefined}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * let oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("This is a paragraph with the indent of 1 inch set to the first line. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.")
 * oParagraph.SetIndFirstLine(1440)
 * const nIndFirstLine = oParagraph.GetIndFirstLine()
 * oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("First line indent: " + nIndFirstLine)
 * oDocContent.Push(oParagraph)
 * builder.SaveFile("xlsx", "GetIndFirstLine.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParagraph
 * @name GetElementsCount
 * @description Returns a number of elements in the current paragraph.
 * @returns {Number}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.RemoveAllElements()
 * const oRun = Api.CreateRun()
 * oRun.AddText("Number of paragraph elements at this point: ")
 * oRun.AddTabStop()
 * oRun.AddText("" + oParagraph.GetElementsCount())
 * oRun.AddLineBreak()
 * oParagraph.AddElement(oRun)
 * oRun.AddText("Number of paragraph elements after we added a text run: ")
 * oRun.AddTabStop()
 * oRun.AddText("" + oParagraph.GetElementsCount())
 * builder.SaveFile("xlsx", "GetElementsCount.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParagraph
 * @name GetIndLeft
 * @description Returns the paragraph left side indentation.Inherited From: ApiParaPr#GetIndLeft
 * @returns {twips | undefined}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * let oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("This is a paragraph with the indent of 2 inches set to it. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.SetIndLeft(2880)
 * const nIndLeft = oParagraph.GetIndLeft()
 * oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("Left indent: " + nIndLeft)
 * oDocContent.Push(oParagraph)
 * builder.SaveFile("xlsx", "GetIndLeft.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParagraph
 * @name GetIndRight
 * @description Returns the paragraph right side indentation.Inherited From: ApiParaPr#GetIndRight
 * @returns {twips | undefined}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * let oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("This is a paragraph with the right offset of 2 inches set to it. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.SetJc("right")
 * oParagraph.SetIndRight(2880)
 * const nIndRight = oParagraph.GetIndRight()
 * oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("Right indent: " + nIndRight)
 * oDocContent.Push(oParagraph)
 * builder.SaveFile("xlsx", "GetIndRight.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParagraph
 * @name GetJc
 * @description Returns the paragraph contents justification.Inherited From: ApiParaPr#GetJc
 * @returns {ContentJustification}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * let oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("This is a paragraph with the text in it aligned by the center. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.")
 * oParagraph.SetJc("center")
 * const sJc = oParagraph.GetJc()
 * oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("Justification: " + sJc)
 * oDocContent.Push(oParagraph)
 * builder.SaveFile("xlsx", "GetJc.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParagraph
 * @name GetNext
 * @description Returns the next paragraph.
 * @returns {ApiParagraph | null}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * oDocContent.RemoveAllElements()
 * const oParagraph1 = Api.CreateParagraph()
 * oParagraph1.AddText("This is the first paragraph.")
 * oDocContent.Push(oParagraph1)
 * const oParagraph2 = Api.CreateParagraph()
 * oParagraph2.AddText("This is the second paragraph.")
 * oDocContent.Push(oParagraph2)
 * const oNextParagraph = oParagraph1.GetNext()
 * oNextParagraph.SetBold(true)
 * builder.SaveFile("xlsx", "GetNext.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParagraph
 * @name Copy
 * @description Creates a paragraph copy. Ingnore comments, footnote references, complex fields.
 * @returns {ApiParagraph}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("This is a text inside the shape aligned left.")
 * oParagraph.AddLineBreak()
 * oParagraph.AddText("This is a text after the line break.")
 * const oParagraph2 = oParagraph.Copy()
 * oDocContent.Push(oParagraph2)
 * builder.SaveFile("xlsx", "Copy.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParagraph
 * @name GetParaPr
 * @description Returns the paragraph properties.
 * @returns {ApiParaPr}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * let oParagraph = oDocContent.GetElement(0)
 * const oParaPr = oParagraph.GetParaPr()
 * oParaPr.SetSpacingAfter(1440)
 * oParagraph.AddText("This is an example of setting a space after a paragraph. ")
 * oParagraph.AddText("The second paragraph will have an offset of one inch from the top. ")
 * oParagraph.AddText("This is due to the fact that the first paragraph has this offset enabled.")
 * oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("This is the second paragraph and it is one inch away from the first paragraph.")
 * oDocContent.Push(oParagraph)
 * builder.SaveFile("xlsx", "GetParaPr.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParagraph
 * @name GetPrevious
 * @description Returns the previous paragraph.
 * @returns {ApiParagraph | null}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * oDocContent.RemoveAllElements()
 * const oParagraph1 = Api.CreateParagraph()
 * oParagraph1.AddText("This is the first paragraph.")
 * oDocContent.Push(oParagraph1)
 * const oParagraph2 = Api.CreateParagraph()
 * oParagraph2.AddText("This is the second paragraph.")
 * oDocContent.Push(oParagraph2)
 * const oPreviousParagraph = oParagraph2.GetPrevious()
 * oPreviousParagraph.SetBold(true)
 * builder.SaveFile("xlsx", "GetPrevious.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParagraph
 * @name GetSpacingAfter
 * @description Returns the spacing after value of the current paragraph.Inherited From: ApiParaPr#GetSpacingAfter
 * @returns {twips}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph1 = oDocContent.GetElement(0)
 * oParagraph1.AddText("This is an example of setting a space after a paragraph. ")
 * oParagraph1.AddText("The second paragraph will have an offset of one inch from the top. ")
 * oParagraph1.AddText("This is due to the fact that the first paragraph has this offset enabled.")
 * oParagraph1.SetSpacingAfter(1440)
 * const oParagraph2 = Api.CreateParagraph()
 * oParagraph2.AddText("This is the second paragraph and it is one inch away from the first paragraph.")
 * oParagraph2.AddLineBreak()
 * const nSpacingAfter = oParagraph1.GetSpacingAfter()
 * oParagraph2.AddText("Spacing after: " + nSpacingAfter)
 * oDocContent.Push(oParagraph2)
 * builder.SaveFile("xlsx", "GetSpacingAfter.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParagraph
 * @name GetSpacingLineRule
 * @description Returns the paragraph line spacing rule.Inherited From: ApiParaPr#GetSpacingLineRule
 * @returns {LineRule}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 80 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetSpacingLine(3 * 240, "auto")
 * oParagraph.AddText("Paragraph 1. Spacing: 3 times of a common paragraph line spacing.")
 * oParagraph.AddLineBreak()
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddLineBreak()
 * const sSpacingLineRule = oParagraph.GetSpacingLineRule()
 * oParagraph.AddText("Spacing line rule: " + sSpacingLineRule)
 * builder.SaveFile("xlsx", "GetSpacingLineRule.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParagraph
 * @name RemoveElement
 * @description Removes an element using the position specified. If the element you remove is the last paragraph element (i.e. all the elements are removed from the paragraph), a new empty run is automatically created. If you want to add content to this run, use the ApiParagraph#GetElement method.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.RemoveAllElements()
 * let oRun = Api.CreateRun()
 * oRun.AddText("This is the first paragraph element. ")
 * oParagraph.AddElement(oRun)
 * oRun = Api.CreateRun()
 * oRun.AddText("This is the second paragraph element. ")
 * oParagraph.AddElement(oRun)
 * oRun = Api.CreateRun()
 * oRun.AddText("This is the third paragraph element (it will be removed from the paragraph and we will not see it). ")
 * oParagraph.AddElement(oRun)
 * oParagraph.AddLineBreak()
 * oRun = Api.CreateRun()
 * oRun.AddText("This is the fourth paragraph element - it became the third, because we removed the previous run from the paragraph. ")
 * oParagraph.AddElement(oRun)
 * oParagraph.AddLineBreak()
 * oRun = Api.CreateRun()
 * oRun.AddText("Please note that line breaks are not counted into paragraph elements!")
 * oParagraph.AddElement(oRun)
 * oParagraph.RemoveElement(3)
 * builder.SaveFile("xlsx", "RemoveElement.xlsx")
 * builder.CloseFile()
 * @param {Number} nPos The element position which we want to remove from the paragraph.
 */

/**
 * @memberof ApiParagraph
 * @name GetSpacingLineValue
 * @description Returns the paragraph line spacing value.Inherited From: ApiParaPr#GetSpacingLineValue
 * @returns {twips  | line240 | undefined}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 80 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetSpacingLine(3 * 240, "auto")
 * oParagraph.AddText("Paragraph 1. Spacing: 3 times of a common paragraph line spacing.")
 * oParagraph.AddLineBreak()
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddLineBreak()
 * const nSpacingLineValue = oParagraph.GetSpacingLineValue()
 * oParagraph.AddText("Spacing line value: " + nSpacingLineValue)
 * builder.SaveFile("xlsx", "GetSpacingLineValue.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParagraph
 * @name SetBullet
 * @description Sets the bullet or numbering to the current paragraph. Inherited From: ApiParaPr#SetBullet
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oBullet = Api.CreateBullet("-")
 * oParagraph.SetBullet(oBullet)
 * oParagraph.AddText(" This is an example of the bulleted paragraph.")
 * builder.SaveFile("xlsx", "SetBullet.xlsx")
 * builder.CloseFile()
 * @param {ApiBullet} oBullet The bullet object created with the Api#CreateBullet or Api#CreateNumbering method.
 */

/**
 * @memberof ApiParagraph
 * @name RemoveAllElements
 * @description Removes all the elements from the current paragraph. When all the elements are removed from the paragraph, a new empty run is automatically created. If you want to add content to this run, use the ApiParagraph#GetElement method.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * let oRun = Api.CreateRun()
 * oRun.AddText("This is the first text run in the current paragraph.")
 * oParagraph.AddElement(oRun)
 * oParagraph.RemoveAllElements()
 * oRun = Api.CreateRun()
 * oRun.AddText("We removed all the paragraph elements and added a new text run inside it.")
 * oParagraph.AddElement(oRun)
 * oDocContent.Push(oParagraph)
 * builder.SaveFile("xlsx", "RemoveAllElements.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParagraph
 * @name SetIndFirstLine
 * @description Sets the paragraph first line indentation. Inherited From: ApiParaPr#SetIndFirstLine
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * let oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("This is a paragraph with the indent of 1 inch set to the first line. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.")
 * oParagraph.SetIndFirstLine(1440)
 * oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("This is a paragraph without any indent set to the first line. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.")
 * oDocContent.Push(oParagraph)
 * builder.SaveFile("xlsx", "SetIndFirstLine.xlsx")
 * builder.CloseFile()
 * @param {twips} nValue The paragraph first line indentation value measured in twentieths of a point (1/1440 of an inch).
 */

/**
 * @memberof ApiParagraph
 * @name SetIndLeft
 * @description Sets the paragraph left side indentation. Inherited From: ApiParaPr#SetIndLeft
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * let oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("This is a paragraph with the indent of 2 inches set to it. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.SetIndLeft(2880)
 * oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("This is a paragraph without any indent set to it. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oDocContent.Push(oParagraph)
 * builder.SaveFile("xlsx", "SetIndLeft.xlsx")
 * builder.CloseFile()
 * @param {twips} nValue The paragraph left side indentation value measured in twentieths of a point (1/1440 of an inch).
 */

/**
 * @memberof ApiParagraph
 * @name GetSpacingBefore
 * @description Returns the spacing before value of the current paragraph.Inherited From: ApiParaPr#GetSpacingBefore
 * @returns {twips}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * let oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("This is an example of setting a space before a paragraph.")
 * oParagraph.AddText("The second paragraph will have an offset of one inch from the top. ")
 * oParagraph.AddText("This is due to the fact that the second paragraph has this offset enabled.")
 * const oParagraph2 = Api.CreateParagraph()
 * oParagraph2.AddText("This is the second paragraph and it is one inch away from the first paragraph.")
 * oParagraph2.SetSpacingBefore(1440)
 * oDocContent.Push(oParagraph2)
 * const nSpacingBefore = oParagraph2.GetSpacingBefore()
 * oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("Spacing before: " + nSpacingBefore)
 * oDocContent.Push(oParagraph)
 * builder.SaveFile("xlsx", "GetSpacingBefore.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParagraph
 * @name SetIndRight
 * @description Sets the paragraph right side indentation. Inherited From: ApiParaPr#SetIndRight
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * let oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("This is a paragraph with the right offset of 2 inches set to it. ")
 * oParagraph.AddText("We also aligned the text in it by the right side. ")
 * oParagraph.AddText("This sentence is used to add lines for demonstrative purposes.")
 * oParagraph.SetJc("right")
 * oParagraph.SetIndRight(2880)
 * oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("This is a paragraph without any offset set to it. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oDocContent.Push(oParagraph)
 * builder.SaveFile("xlsx", "SetIndRight.xlsx")
 * builder.CloseFile()
 * @param {twips} nValue The paragraph right side indentation value measured in twentieths of a point (1/1440 of an inch).
 */

/**
 * @memberof ApiParagraph
 * @name SetJc
 * @description Sets the paragraph contents justification. Inherited From: ApiParaPr#SetJc
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * let oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("This is a paragraph with the text in it aligned by the center. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.")
 * oParagraph.SetJc("center")
 * oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("This is a paragraph with the text in it aligned by the right side. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.")
 * oParagraph.SetJc("right")
 * oDocContent.Push(oParagraph)
 * oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("This is a paragraph with the text in it aligned by the left side. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.")
 * oParagraph.SetJc("left")
 * oDocContent.Push(oParagraph)
 * builder.SaveFile("xlsx", "SetJc.xlsx")
 * builder.CloseFile()
 * @param {ContentJustification} sJc The justification type that will be applied to the paragraph contents.
 */

/**
 * @memberof ApiParagraph
 * @name SetSpacingAfter
 * @description Sets the spacing after the current paragraph. If the value of the isAfterAuto parameter is true, then any value of the nAfter is ignored. If isAfterAuto parameter is not specified, then it will be interpreted as false. Inherited From: ApiParaPr#SetSpacingAfter
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * let oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("This is an example of setting a space after a paragraph. ")
 * oParagraph.AddText("The second paragraph will have an offset of one inch from the top. ")
 * oParagraph.AddText("This is due to the fact that the first paragraph has this offset enabled.")
 * oParagraph.SetSpacingAfter(1440)
 * oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("This is the second paragraph and it is one inch away from the first paragraph.")
 * oDocContent.Push(oParagraph)
 * builder.SaveFile("xlsx", "SetSpacingAfter.xlsx")
 * builder.CloseFile()
 * @param {twips} nAfter The value of the spacing after the current paragraph measured in twentieths of a point (1/1440 of an inch).
 * @param {Boolean=} isAfterAuto The true value disables the spacing after the current paragraph.
 */

/**
 * @memberof ApiParagraph
 * @name SetTabs
 * @description Specifies a sequence of custom tab stops which will be used for any tab characters in the current paragraph. : The lengths of aPos array and aVal array  BE equal to each other. Inherited From: ApiParaPr#SetTabs
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 150 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetTabs([
 *   1440,
 *   2880,
 *   4320
 * ], [
 *   "left",
 *   "center",
 *   "right"
 * ])
 * oParagraph.AddTabStop()
 * oParagraph.AddText("Custom tab - 1 inch left")
 * oParagraph.AddLineBreak()
 * oParagraph.AddTabStop()
 * oParagraph.AddTabStop()
 * oParagraph.AddText("Custom tab - 2 inches center")
 * oParagraph.AddLineBreak()
 * oParagraph.AddTabStop()
 * oParagraph.AddTabStop()
 * oParagraph.AddTabStop()
 * oParagraph.AddText("Custom tab - 3 inches right")
 * builder.SaveFile("xlsx", "SetTabs.xlsx")
 * builder.CloseFile()
 * @param {Array<twips>} aPos An array of the positions of custom tab stops with respect to the current page margins measured in twentieths of a point (1/1440 of an inch).
 * @param {Array<TabJc>} aVal An array of the styles of custom tab stops, which determines the behavior of the tab stop and the alignment which will be applied to text entered at the current custom tab stop.
 */

/**
 * @memberof ApiParagraph
 * @name SetSpacingLine
 * @description Sets the paragraph line spacing. If the value of the sLineRule parameter is either "atLeast" or "exact", then the value of nLine will be interpreted as twentieths of a point. If the value of the sLineRule parameter is "auto", then the value of the nLine parameter will be interpreted as 240ths of a line. Inherited From: ApiParaPr#SetSpacingLine
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * let oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetSpacingLine(2 * 240, "auto")
 * oParagraph.AddText("Paragraph 1. Spacing: 2 times of a common paragraph line spacing.")
 * oParagraph.AddLineBreak()
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph = Api.CreateParagraph()
 * oParagraph.SetSpacingLine(200, "exact")
 * oParagraph.AddText("Paragraph 2. Spacing: exact 10 points.")
 * oParagraph.AddLineBreak()
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oDocContent.Push(oParagraph)
 * builder.SaveFile("xlsx", "SetSpacingLine.xlsx")
 * builder.CloseFile()
 * @param {twips | line240} nLine The line spacing value measured either in twentieths of a point (1/1440 of an inch) or in 240ths of a line.
 * @param {LineRule} sLineRule The rule that determines the measuring units of the line spacing.
 */

/**
 * @memberof ApiRange
 * @name AddComment
 * @description Adds a comment to the current range.
 * @returns {ApiComment | null} returns null if comment can't be added
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("A1")
 * oRange.SetValue("1")
 * oRange.AddComment("This is just a number.")
 * oWorksheet.GetRange("A3").SetValue("The comment was added to the cell A1.")
 * oWorksheet.GetRange("A4").SetValue("Comment: " + oRange.GetComment().GetText())
 * builder.SaveFile("xlsx", "AddComment.xlsx")
 * builder.CloseFile()
 * @param {String} sText The comment text.
 * @param {String=} sText=username The comment text.
 */

/**
 * @memberof ApiRange
 * @name Clear
 * @description Clears the current range.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("A1:B1")
 * oRange.SetValue("1")
 * oRange.Clear()
 * oWorksheet.GetRange("A2").SetValue("The range A1:B1 was just cleared.")
 * builder.SaveFile("xlsx", "Clear.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiRange
 * @name AutoFit
 * @description Changes the width of the columns or the height of the rows in the range to achieve the best fit.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("A1")
 * oRange.SetValue("This is an example of the column width autofit.")
 * oRange.AutoFit(false, true)
 * builder.SaveFile("xlsx", "AutoFit.xlsx")
 * builder.CloseFile()
 * @param {Boolean} bRows Specifies if the width of the columns will be autofit.
 * @param {Boolean} bCols Specifies if the height of the rows will be autofit.
 */

/**
 * @memberof ApiParagraph
 * @name SetSpacingBefore
 * @description Sets the spacing before the current paragraph. If the value of the isBeforeAuto parameter is true, then any value of the nBefore is ignored. If isBeforeAuto parameter is not specified, then it will be interpreted as false. Inherited From: ApiParaPr#SetSpacingBefore
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * let oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("This is an example of setting a space before a paragraph. ")
 * oParagraph.AddText("The second paragraph will have an offset of one inch from the top. ")
 * oParagraph.AddText("This is due to the fact that the second paragraph has this offset enabled.")
 * oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("This is the second paragraph and it is one inch away from the first paragraph.")
 * oParagraph.SetSpacingBefore(1440)
 * oDocContent.Push(oParagraph)
 * builder.SaveFile("xlsx", "SetSpacingBefore.xlsx")
 * builder.CloseFile()
 * @param {twips} nBefore The value of the spacing before the current paragraph measured in twentieths of a point (1/1440 of an inch).
 * @param {Boolean=} isBeforeAuto The true value disables the spacing before the current paragraph.
 */

/**
 * @memberof ApiRange
 * @name Copy
 * @description Copies a range to the specified range.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("A1")
 * oRange.SetValue("This is a sample text which is copied to the range A3.")
 * oRange.Copy(oWorksheet.GetRange("A3"))
 * builder.SaveFile("xlsx", "Copy.xlsx")
 * builder.CloseFile()
 * @param {ApiRange} destination Specifies a new range to which the specified range will be copied.
 */

/**
 * @memberof ApiPresetColor
 * @name GetClassType
 * @description Returns a type of the ApiPresetColor class.
 * @returns {String}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oPresetColor = Api.CreatePresetColor("peachPuff")
 * const oGs1 = Api.CreateGradientStop(oPresetColor, 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateLinearGradientFill([
 *   oGs1,
 *   oGs2
 * ], 5400000)
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 1, 3 * 36000)
 * const sClassType = oPresetColor.GetClassType()
 * oWorksheet.SetColumnWidth(0, 15)
 * oWorksheet.SetColumnWidth(1, 10)
 * oWorksheet.GetRange("A1").SetValue("Class Type = ")
 * oWorksheet.GetRange("B1").SetValue(sClassType)
 * builder.SaveFile("xlsx", "GetClassType.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiRange
 * @name Delete
 * @description Deletes the Range object.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B4").SetValue("1")
 * oWorksheet.GetRange("C4").SetValue("2")
 * oWorksheet.GetRange("D4").SetValue("3")
 * oWorksheet.GetRange("C5").SetValue("5")
 * const oRange = oWorksheet.GetRange("C4")
 * oRange.Delete("up")
 * builder.SaveFile("xlsx", "Delete.xlsx")
 * builder.CloseFile()
 * @param {String} shift Specifies how to shift cells to replace the deleted cells ("up", "left").
 */

/**
 * @memberof ApiRange
 * @name Find
 * @description Finds specific information in the current range.
 * @returns {ApiRange | null} returns null if the current range does not contain such text
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("A4").SetValue("Cost price")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("B4").SetValue(50)
 * oWorksheet.GetRange("C2").SetValue(200)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("C4").SetValue(120)
 * oWorksheet.GetRange("D2").SetValue(200)
 * oWorksheet.GetRange("D3").SetValue(200)
 * oWorksheet.GetRange("D4").SetValue(160)
 * const oRange = oWorksheet.GetRange("A2:D4")
 * const oSearchData = {
 *   What: "200",
 *   After: oWorksheet.GetRange("B1"),
 *   LookIn: "xlValues",
 *   LookAt: "xlWhole",
 *   SearchOrder: "xlByColumns",
 *   SearchDirection: "xlNext",
 *   MatchCase: true
 * }
 * const oSearchRange = oRange.Find(oSearchData)
 * oSearchRange.SetFillColor(Api.CreateColorFromRGB(255, 213, 191))
 * builder.SaveFile("xlsx", "Find.xlsx")
 * builder.CloseFile()
 * @param {XlSearchData} oSearchData The search data used to make search.
 */

/**
 * @memberof ApiRange
 * @name FindPrevious
 * @description Continues a search that was begun with the ApiRange#Find method. Finds the previous cell that matches those same conditions and returns the ApiRange object that represents that cell. This does not affect the selection or the active cell.
 * @returns {ApiRange | null} returns null if the range does not contain such text
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("A4").SetValue("Cost price")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("B4").SetValue(50)
 * oWorksheet.GetRange("C2").SetValue(200)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("C4").SetValue(120)
 * oWorksheet.GetRange("D2").SetValue(200)
 * oWorksheet.GetRange("D3").SetValue(200)
 * oWorksheet.GetRange("D4").SetValue(160)
 * const oRange = oWorksheet.GetRange("A2:D4")
 * const oSearchRange = oRange.Find("200", "B1", "xlValues", "xlWhole", "xlByColumns", "xlNext", true)
 * oSearchRange.SetFillColor(Api.CreateColorFromRGB(255, 213, 191))
 * const oNextSearchRange = oRange.FindNext(oSearchRange)
 * oNextSearchRange.SetFillColor(Api.CreateColorFromRGB(255, 213, 191))
 * const oPrevSearchRange = oRange.FindPrevious(oNextSearchRange)
 * oPrevSearchRange.SetValue(0)
 * builder.SaveFile("xlsx", "FindPrevious.xlsx")
 * builder.CloseFile()
 * @param {ApiRange} Before The cell before which the search will start. If this argument is not specified, the search starts from the last cell found.
 */

/**
 * @memberof ApiRange
 * @name End
 * @description Returns a Range object that represents the end in the specified direction in the specified range.
 * @returns {ApiRange}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("C4:D5")
 * oRange.End("xlToLeft").SetFillColor(Api.CreateColorFromRGB(255, 213, 191))
 * builder.SaveFile("xlsx", "End.xlsx")
 * builder.CloseFile()
 * @param {Direction} direction The direction of end in the specified range.
 */

/**
 * @memberof ApiRange
 * @name ForEach
 * @description Executes a provided function once for each cell.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * oWorksheet.GetRange("B1").SetValue("2")
 * oWorksheet.GetRange("C1").SetValue("3")
 * const oRange = oWorksheet.GetRange("A1:C1")
 * oRange.ForEach((range) => {
 *   const sValue = range.GetValue()
 *   if (sValue != "1") {
 *     range.SetBold(true)
 *   }
 * })
 * builder.SaveFile("xlsx", "ForEach.xlsx")
 * builder.CloseFile()
 * @param {Function} fCallback A function which will be executed for each cell.
 */

/**
 * @memberof ApiRange
 * @name GetAreas
 * @description Returns a collection of the ranges.
 * @returns {ApiAreas}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * let oRange = oWorksheet.GetRange("B1:D1")
 * oRange.SetValue("1")
 * oRange.Select()
 * const oAreas = oRange.GetAreas()
 * const nCount = oAreas.GetCount()
 * oRange = oWorksheet.GetRange("A5")
 * oRange.SetValue("The number of ranges in the areas: ")
 * oRange.AutoFit(false, true)
 * oWorksheet.GetRange("B5").SetValue(nCount)
 * builder.SaveFile("xlsx", "GetAreas.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiRange
 * @name GetAddress
 * @description Returns the range address.
 * @returns {String | null}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * oWorksheet.GetRange("B1").SetValue("2")
 * const sAddress = oWorksheet.GetRange("A1").GetAddress(true, true, "xlA1", false)
 * oWorksheet.GetRange("A3").SetValue("Address: ")
 * oWorksheet.GetRange("B3").SetValue(sAddress)
 * builder.SaveFile("xlsx", "GetAddress.xlsx")
 * builder.CloseFile()
 * @param {Boolean} RowAbs Defines if the link to the row is absolute or not.
 * @param {Boolean} ColAbs Defines if the link to the column is absolute or not.
 * @param {String} RefStyle The reference style.
 * @param {Boolean} External Defines if the range is in the current file or not.
 * @param {ApiRange} RelativeTo The range which the current range is relative to.
 */

/**
 * @memberof ApiRange
 * @name GetClassType
 * @description Returns a type of the ApiRange class.
 * @returns {String}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("A1")
 * oRange.SetValue("This is just a sample text in the cell A1.")
 * const sClassType = oRange.GetClassType()
 * oWorksheet.GetRange("A3").SetValue("Class type: " + sClassType)
 * builder.SaveFile("xlsx", "GetClassType.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiRange
 * @name GetCells
 * @description Returns a Range object that represents all the cells in the specified range or a specified cell.
 * @returns {ApiRange}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("A1:C3")
 * oRange.GetCells(2, 1).SetFillColor(Api.CreateColorFromRGB(255, 213, 191))
 * builder.SaveFile("xlsx", "GetCells.xlsx")
 * builder.CloseFile()
 * @param {Number} row The row number or the cell number (if only row is defined).
 * @param {Number} col The column number.
 */

/**
 * @memberof ApiRange
 * @name GetCharacters
 * @description Returns the ApiCharacters object that represents a range of characters within the object text. Use the ApiCharacters object to format characters within a text string.
 * @returns {ApiCharacters}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("B1")
 * oRange.SetValue("This is just a sample text.")
 * const oCharacters = oRange.GetCharacters(9, 4)
 * const oFont = oCharacters.GetFont()
 * oFont.SetBold(true)
 * builder.SaveFile("xlsx", "GetCharacters.xlsx")
 * builder.CloseFile()
 * @param {Number} Start The first character to be returned. If this argument is either 1 or omitted, this property returns a range of characters starting with the first character.
 * @param {Number} Length The number of characters to be returned. If this argument is omitted, this property returns the remainder of the string (everything after the Start character).
 */

/**
 * @memberof ApiRange
 * @name GetCol
 * @description Returns a column number for the selected cell.
 * @returns {Number}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("D9").GetCol()
 * oWorksheet.GetRange("A2").SetValue(oRange.toString())
 * builder.SaveFile("xlsx", "GetCol.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiRange
 * @name FindNext
 * @description Continues a search that was begun with the ApiRange#Find method. Finds the next cell that matches those same conditions and returns the ApiRange object that represents that cell. This does not affect the selection or the active cell.
 * @returns {ApiRange | null} returns null if the range does not contain such text
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("A4").SetValue("Cost price")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("B4").SetValue(50)
 * oWorksheet.GetRange("C2").SetValue(200)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("C4").SetValue(120)
 * oWorksheet.GetRange("D2").SetValue(200)
 * oWorksheet.GetRange("D3").SetValue(200)
 * oWorksheet.GetRange("D4").SetValue(160)
 * const oRange = oWorksheet.GetRange("A2:D4")
 * const oSearchRange = oRange.Find("200", "B1", "xlValues", "xlWhole", "xlByColumns", "xlNext", true)
 * oSearchRange.SetFillColor(Api.CreateColorFromRGB(255, 213, 191))
 * const oNextSearchRange = oRange.FindNext(oSearchRange)
 * oNextSearchRange.SetFillColor(Api.CreateColorFromRGB(255, 213, 191))
 * builder.SaveFile("xlsx", "FindNext.xlsx")
 * builder.CloseFile()
 * @param {ApiRange} After The cell after which the search will start. If this argument is not specified, the search starts from the last cell found.
 */

/**
 * @memberof ApiRange
 * @name GetCols
 * @description Returns a Range object that represents the columns in the specified range.
 * @returns {ApiRange | null}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("A1:C3")
 * oRange.GetCols(2).SetFillColor(Api.CreateColorFromRGB(255, 213, 191))
 * builder.SaveFile("xlsx", "GetCols.xlsx")
 * builder.CloseFile()
 * @param {Number} nCol The column number.
 */

/**
 * @memberof ApiRange
 * @name GetColumnWidth
 * @description Returns the column width value.
 * @returns {Number}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const sWidth = oWorksheet.GetRange("A1").GetColumnWidth()
 * oWorksheet.GetRange("A1").SetValue("Width: ")
 * oWorksheet.GetRange("B1").SetValue(sWidth)
 * builder.SaveFile("xlsx", "GetColumnWidth.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiRange
 * @name GetComment
 * @description Returns the ApiComment object of the current range.
 * @returns {ApiComment | null} returns null if range does not consist of one cell
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("A1")
 * oRange.SetValue("1")
 * oRange.AddComment("This is just a number.")
 * oWorksheet.GetRange("A3").SetValue("Comment: " + oRange.GetComment().GetText())
 * builder.SaveFile("xlsx", "GetComment.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiRange
 * @name GetFillColor
 * @description Returns the background color for the current cell range. Returns 'No Fill' when the color of the background in the cell / cell range is null.
 * @returns {ApiColor | String} return 'No Fill' when the color to the background in the cell / cell range is null
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.SetColumnWidth(0, 60)
 * const oRange = oWorksheet.GetRange("A1")
 * oRange.SetFillColor(Api.CreateColorFromRGB(255, 213, 191))
 * oRange.SetValue("This is the cell with a color set to its background.")
 * const oFillColor = oRange.GetFillColor()
 * oWorksheet.GetRange("A3").SetValue("This is another cell with the same color set to its background")
 * oWorksheet.GetRange("A3").SetFillColor(oFillColor)
 * builder.SaveFile("xlsx", "GetFillColor.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiRange
 * @name GetDefName
 * @description Returns the ApiName object of the current range.
 * @returns {ApiName}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * oWorksheet.GetRange("B1").SetValue("2")
 * Api.AddDefName("numbers", "Sheet1!$A$1:$B$1")
 * const oRange = oWorksheet.GetRange("A1:B1")
 * const oDefName = oRange.GetDefName()
 * oWorksheet.GetRange("A3").SetValue("DefName: " + oDefName.GetName())
 * builder.SaveFile("xlsx", "GetDefName.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiRange
 * @name GetCount
 * @description Returns the cells count in the currrent range.
 * @returns {Number}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * oWorksheet.GetRange("B1").SetValue("2")
 * oWorksheet.GetRange("C1").SetValue("3")
 * const nCount = oWorksheet.GetRange("A1:C1").GetCount()
 * oWorksheet.GetRange("A4").SetValue("Count: ")
 * oWorksheet.GetRange("B4").SetValue(nCount)
 * builder.SaveFile("xlsx", "GetCount.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiRange
 * @name GetFormula
 * @description Returns a formula of the specified range.
 * @returns {String | Array<Array>}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(1)
 * oWorksheet.GetRange("C1").SetValue(2)
 * const oRange = oWorksheet.GetRange("A1")
 * oRange.SetValue("=SUM(B1:C1)")
 * const sFormula = oRange.GetFormula()
 * oWorksheet.GetRange("A3").SetValue("Formula from cell A1: " + sFormula)
 * builder.SaveFile("xlsx", "GetFormula.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiRange
 * @name GetHidden
 * @description Returns the value hiding property. The specified range must span an entire column or row.
 * @returns {Boolean} returns true if the values in the range specified are hidden
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRows("1:3")
 * oRange.SetHidden(true)
 * oWorksheet.GetRange("A1").SetValue("1")
 * oWorksheet.GetRange("B1").SetValue("2")
 * oWorksheet.GetRange("C1").SetValue("3")
 * const bHidden = oRange.GetHidden()
 * oWorksheet.GetRange("A4").SetValue("The values from A1:C1 are hidden: " + bHidden)
 * builder.SaveFile("xlsx", "GetHidden.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiRange
 * @name GetNumberFormat
 * @description Returns a value that represents the format code for the current range.
 * @returns {XlNumberFormat | null} returns null if all cells in the specified range don't have the same number format
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("B2")
 * oRange.SetValue(3)
 * const sFormat = oRange.GetNumberFormat()
 * oWorksheet.GetRange("B3").SetValue("Number format: " + sFormat)
 * builder.SaveFile("xlsx", "GetNumberFormat.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiRange
 * @name GetRow
 * @description Returns a row number for the selected cell.
 * @returns {Number}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("A9").GetRow()
 * oWorksheet.GetRange("A2").SetValue(oRange.toString())
 * builder.SaveFile("xlsx", "GetRow.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiRange
 * @name GetRowHeight
 * @description Returns the row height value.
 * @returns {pt}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const nHeight = oWorksheet.GetRange("A1").GetRowHeight()
 * oWorksheet.GetRange("A1").SetValue("Height: ")
 * oWorksheet.GetRange("B1").SetValue(nHeight)
 * builder.SaveFile("xlsx", "GetRowHeight.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiRange
 * @name GetRows
 * @description Returns a Range object that represents the rows in the specified range. If the specified row is outside the Range object, a new Range will be returned that represents the cells between the columns of the original range in the specified row.
 * @returns {ApiRange | null}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("1:3")
 * for (let i=1; i <= 3; i++) {
 *   const oRows = oRange.GetRows(i)
 *   oRows.SetValue(i)
 * }
 * builder.SaveFile("xlsx", "GetRows.xlsx")
 * builder.CloseFile()
 * @param {Number} nRow The row number (starts counting from 1, the 0 value returns an error).
 */

/**
 * @memberof ApiRange
 * @name GetText
 * @description Returns the text of the specified range.
 * @returns {String | Array<Array>}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("text1")
 * oWorksheet.GetRange("B1").SetValue("text2")
 * oWorksheet.GetRange("C1").SetValue("text3")
 * const oRange = oWorksheet.GetRange("A1:C1")
 * const sText = oRange.GetText()
 * oWorksheet.GetRange("A3").SetValue("Text from the cell A1: " + sText)
 * builder.SaveFile("xlsx", "GetText.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiRange
 * @name GetValue
 * @description Returns a value of the specified range.
 * @returns {String | Array<Array>}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * const sValue = oWorksheet.GetRange("A1").GetValue()
 * oWorksheet.GetRange("A3").SetValue("Value of the cell A1: ")
 * oWorksheet.GetRange("B3").SetValue(sValue)
 * builder.SaveFile("xlsx", "GetValue.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiRange
 * @name GetValue2
 * @description Returns the Value2 property (value without format) of the specified range.
 * @returns {String | Array<Array>}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFormat = Api.Format("123456", ["$#,##0"])
 * const oRange = oWorksheet.GetRange("A1")
 * oRange.SetValue(oFormat)
 * const sValue2 = oRange.GetValue2()
 * oWorksheet.GetRange("A3").SetValue("Value of the cell A1 without format: " + sValue2)
 * builder.SaveFile("xlsx", "GetValue2.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiRange
 * @name GetWorksheet
 * @description Returns the Worksheet object that represents the worksheet containing the specified range. It will be available in the read-only mode.
 * @returns {ApiWorksheet}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("A1:C1")
 * oRange.SetValue("1")
 * const oSheet = oRange.GetWorksheet()
 * oWorksheet.GetRange("A3").SetValue("Worksheet name: " + oSheet.GetName())
 * builder.SaveFile("xlsx", "GetWorksheet.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiRange
 * @name GetWrapText
 * @description Returns the information about the wrapping cell style.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("A1")
 * oRange.SetValue("This is the text wrapped to fit the cell size.")
 * oRange.SetWrap(true)
 * oWorksheet.GetRange("A3").SetValue("The text in the cell A1 is wrapped: " + oRange.GetWrapText())
 * builder.SaveFile("xlsx", "GetWrapText.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiRange
 * @name Merge
 * @description Merges the selected cell range into a single cell or a cell row.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A3:E8").Merge(true)
 * oWorksheet.GetRange("A9:E14").Merge(false)
 * builder.SaveFile("xlsx", "Merge.xlsx")
 * builder.CloseFile()
 * @param {Boolean} isAcross When set to "true", the cells within the selected range will be merged along the rows, but remain split in the columns. When set to "false", the whole selected range of cells will be merged into a single cell.
 */

/**
 * @memberof ApiRange
 * @name Paste
 * @description Pastes the Range object to the specified range.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B4").SetValue("1")
 * oWorksheet.GetRange("C4").SetValue("2")
 * oWorksheet.GetRange("D4").SetValue("3")
 * const oRangeFrom = oWorksheet.GetRange("B4:D4")
 * const oRange = oWorksheet.GetRange("A1:C1")
 * oRange.Paste(oRangeFrom)
 * builder.SaveFile("xlsx", "Paste.xlsx")
 * builder.CloseFile()
 * @param {ApiRange} rangeFrom Specifies the range to be pasted to the current range
 */

/**
 * @memberof ApiRange
 * @name GetOrientation
 * @description Returns the current range angle.
 * @returns {Angle}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * oWorksheet.GetRange("B1").SetValue("2")
 * const oRange = oWorksheet.GetRange("A1:B1")
 * oRange.SetOrientation("xlUpward")
 * const sOrientation = oRange.GetOrientation()
 * oWorksheet.GetRange("A3").SetValue("Orientation: " + sOrientation)
 * builder.SaveFile("xlsx", "GetOrientation.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiRange
 * @name Replace
 * @description Replaces specific information to another one in a range.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("A4").SetValue("Cost price")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("B4").SetValue(50)
 * oWorksheet.GetRange("C2").SetValue(200)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("C4").SetValue(120)
 * oWorksheet.GetRange("D2").SetValue(200)
 * oWorksheet.GetRange("D3").SetValue(200)
 * oWorksheet.GetRange("D4").SetValue(160)
 * const oRange = oWorksheet.GetRange("A2:D4")
 * const oReplaceData = {
 *   What: "200",
 *   Replacement: "0",
 *   LookAt: "xlWhole",
 *   SearchOrder: "xlByColumns",
 *   SearchDirection: "xlNext",
 *   MatchCase: true,
 *   ReplaceAll: true
 * }
 * oRange.Replace(oReplaceData)
 * builder.SaveFile("xlsx", "Replace.xlsx")
 * builder.CloseFile()
 * @param {XlReplaceData} oReplaceData The data used to make search and replace.
 */

/**
 * @memberof ApiRange
 * @name Select
 * @description Selects the current range.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("A1:C1")
 * oRange.SetValue("1")
 * oRange.Select()
 * Api.GetSelection().SetValue("selected")
 * builder.SaveFile("xlsx", "Select.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiRange
 * @name SetAlignHorizontal
 * @description Sets the horizontal alignment of the text in the current cell range.
 * @returns {Boolean} return false if sAligment doesn't exist
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A2").SetValue("2")
 * const oRange = oWorksheet.GetRange("A1:D5")
 * oRange.SetAlignHorizontal("center")
 * builder.SaveFile("xlsx", "SetAlignHorizontal.xlsx")
 * builder.CloseFile()
 * @param {XlHorAlign} sAlignment The horizontal alignment that will be applied to the cell contents.
 */

/**
 * @memberof ApiRange
 * @name SetBold
 * @description Sets the bold property to the text characters in the current cell or cell range.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A2").SetValue("Bold text")
 * oWorksheet.GetRange("A2").SetBold(true)
 * oWorksheet.GetRange("A3").SetValue("Normal text")
 * builder.SaveFile("xlsx", "SetBold.xlsx")
 * builder.CloseFile()
 * @param {Boolean} isBold Specifies that the contents of the current cell / cell range are displayed bold.
 */

/**
 * @memberof ApiRange
 * @name SetBorders
 * @description Sets the border to the cell / cell range with the parameters specified.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.SetColumnWidth(0, 50)
 * oWorksheet.GetRange("A2").SetBorders("Bottom", "Thick", Api.CreateColorFromRGB(255, 111, 61))
 * oWorksheet.GetRange("A2").SetValue("This is a cell with a bottom border")
 * builder.SaveFile("xlsx", "SetBorders.xlsx")
 * builder.CloseFile()
 * @param {BordersIndex} bordersIndex Specifies the cell border position.
 * @param {LineStyle} lineStyle Specifies the line style used to form the cell border.
 * @param {ApiColor} oColor The color object which specifies the color to be set to the cell border.
 */

/**
 * @memberof ApiRange
 * @name SetFillColor
 * @description Sets the background color to the current cell range with the previously created color object. Sets 'No Fill' when previously created color object is null.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.SetColumnWidth(0, 50)
 * oWorksheet.GetRange("A2").SetFillColor(Api.CreateColorFromRGB(255, 213, 191))
 * oWorksheet.GetRange("A2").SetValue("This is the cell with a color set to its background")
 * oWorksheet.GetRange("A4").SetValue("This is the cell with a default background color")
 * builder.SaveFile("xlsx", "SetFillColor.xlsx")
 * builder.CloseFile()
 * @param {ApiColor} oColor The color object which specifies the color to be set to the background in the cell / cell range.
 */

/**
 * @memberof ApiRange
 * @name SetColumnWidth
 * @description Sets the width of all the columns in the current range. One unit of column width is equal to the width of one character in the Normal style. For proportional fonts, the width of the character 0 (zero) is used.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetColumnWidth(20)
 * builder.SaveFile("xlsx", "SetColumnWidth.xlsx")
 * builder.CloseFile()
 * @param {Number} nWidth The width of the column divided by 7 pixels.
 */

/**
 * @memberof ApiRange
 * @name SetAlignVertical
 * @description Sets the vertical alignment of the text in the current cell range.
 * @returns {Boolean} return false if sAligment doesn't exist
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("A1:D5")
 * oWorksheet.GetRange("A2").SetValue("This is just a sample text distributed in the A2 cell.")
 * oRange.SetAlignVertical("distributed")
 * builder.SaveFile("xlsx", "SetAlignVertical.xlsx")
 * builder.CloseFile()
 * @param {XlVertAlign} sAligment The vertical alignment that will be applied to the cell contents.
 */

/**
 * @memberof ApiRange
 * @name SetFontName
 * @description Sets the specified font family as the font name for the current cell range.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A2").SetValue("2")
 * const oRange = oWorksheet.GetRange("A1:D5")
 * oRange.SetFontName("Arial")
 * builder.SaveFile("xlsx", "SetFontName.xlsx")
 * builder.CloseFile()
 * @param {String} sName The font family name used for the current cell range.
 */

/**
 * @memberof ApiRange
 * @name SetFontColor
 * @description Sets the text color to the current cell range with the previously created color object.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A2").SetFontColor(Api.CreateColorFromRGB(255, 111, 61))
 * oWorksheet.GetRange("A2").SetValue("This is the text with a color set to it")
 * oWorksheet.GetRange("A4").SetValue("This is the text with a default color")
 * builder.SaveFile("xlsx", "SetFontColor.xlsx")
 * builder.CloseFile()
 * @param {ApiColor} oColor The color object which specifies the color to be set to the text in the cell / cell range.
 */

/**
 * @memberof ApiRange
 * @name SetFontSize
 * @description Sets the font size to the characters of the current cell range.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A2").SetValue("2")
 * const oRange = oWorksheet.GetRange("A1:D5")
 * oRange.SetFontSize(20)
 * builder.SaveFile("xlsx", "SetFontSize.xlsx")
 * builder.CloseFile()
 * @param {pt} nSize The font size value measured in points.
 */

/**
 * @memberof ApiRange
 * @name SetItalic
 * @description Sets the italic property to the text characters in the current cell or cell range.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A2").SetValue("Italicized text")
 * oWorksheet.GetRange("A2").SetItalic(true)
 * oWorksheet.GetRange("A3").SetValue("Normal text")
 * builder.SaveFile("xlsx", "SetItalic.xlsx")
 * builder.CloseFile()
 * @param {Boolean} isItalic Specifies that the contents of the current cell / cell range are displayed italicized.
 */

/**
 * @memberof ApiRange
 * @name SetNumberFormat
 * @description Specifies whether a number in the cell should be treated like number, currency, date, time, etc. or just like text.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.SetColumnWidth(0, 30)
 * oWorksheet.SetColumnWidth(1, 30)
 * oWorksheet.GetRange("A2").SetNumberFormat("General")
 * oWorksheet.GetRange("A2").SetValue("123456")
 * oWorksheet.GetRange("B2").SetValue("General")
 * oWorksheet.GetRange("A3").SetNumberFormat("0.00")
 * oWorksheet.GetRange("A3").SetValue("123456")
 * oWorksheet.GetRange("B3").SetValue("Number")
 * oWorksheet.GetRange("A4").SetNumberFormat("$#,##0.00")
 * oWorksheet.GetRange("A4").SetValue("123456")
 * oWorksheet.GetRange("B4").SetValue("Currency")
 * oWorksheet.GetRange("A5").SetNumberFormat("_($* #,##0.00_)")
 * oWorksheet.GetRange("A5").SetValue("123456")
 * oWorksheet.GetRange("B5").SetValue("Accounting")
 * oWorksheet.GetRange("A6").SetNumberFormat("m/d/yyyy")
 * oWorksheet.GetRange("A6").SetValue("123456")
 * oWorksheet.GetRange("B6").SetValue("DateShort")
 * oWorksheet.GetRange("A7").SetNumberFormat("[$-F800]dddd, mmmm dd, yyyy")
 * oWorksheet.GetRange("A7").SetValue("123456")
 * oWorksheet.GetRange("B7").SetValue("DateLong")
 * oWorksheet.GetRange("A8").SetNumberFormat("[$-F400]h:mm:ss AM/PM")
 * oWorksheet.GetRange("A8").SetValue("123456")
 * oWorksheet.GetRange("B8").SetValue("Time")
 * oWorksheet.GetRange("A9").SetNumberFormat("0.00%")
 * oWorksheet.GetRange("A9").SetValue("123456")
 * oWorksheet.GetRange("B9").SetValue("Percentage")
 * oWorksheet.GetRange("A10").SetNumberFormat("0%")
 * oWorksheet.GetRange("A10").SetValue("123456")
 * oWorksheet.GetRange("B10").SetValue("Percent")
 * oWorksheet.GetRange("A11").SetNumberFormat("# ?/?")
 * oWorksheet.GetRange("A11").SetValue("123456")
 * oWorksheet.GetRange("B11").SetValue("Fraction")
 * oWorksheet.GetRange("A12").SetNumberFormat("0.00E+00")
 * oWorksheet.GetRange("A12").SetValue("123456")
 * oWorksheet.GetRange("B12").SetValue("Scientific")
 * oWorksheet.GetRange("A13").SetNumberFormat("@")
 * oWorksheet.GetRange("A13").SetValue("123456")
 * oWorksheet.GetRange("B13").SetValue("Text")
 * builder.SaveFile("xlsx", "SetNumberFormat.xlsx")
 * builder.CloseFile()
 * @param {XlNumberFormat} sFormat Specifies the mask applied to the number in the cell.
 */

/**
 * @memberof ApiRange
 * @name Insert
 * @description Inserts a cell or a range of cells into the worksheet or macro sheet and shifts other cells away to make space.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B4").SetValue("1")
 * oWorksheet.GetRange("C4").SetValue("2")
 * oWorksheet.GetRange("D4").SetValue("3")
 * oWorksheet.GetRange("C5").SetValue("5")
 * const oRange = oWorksheet.GetRange("C4")
 * oRange.Insert("down")
 * builder.SaveFile("xlsx", "Insert.xlsx")
 * builder.CloseFile()
 * @param {String} shift Specifies which way to shift the cells ("right", "down").
 */

/**
 * @memberof ApiRange
 * @name SetOffset
 * @description Sets the cell offset.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B3").SetValue("Old Range")
 * const oRange = oWorksheet.GetRange("B3")
 * oRange.SetOffset(2, 2)
 * oRange.SetValue("New Range")
 * builder.SaveFile("xlsx", "SetOffset.xlsx")
 * builder.CloseFile()
 * @param {Number} nRow The row number.
 * @param {Number} nCol The column number.
 */

/**
 * @memberof ApiRange
 * @name SetOrientation
 * @description Sets an angle to the current cell range.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * oWorksheet.GetRange("B1").SetValue("2")
 * const oRange = oWorksheet.GetRange("A1:B1")
 * oRange.SetOrientation("xlUpward")
 * builder.SaveFile("xlsx", "SetOrientation.xlsx")
 * builder.CloseFile()
 * @param {Angle} angle Specifies the range angle.
 */

/**
 * @memberof ApiRange
 * @name SetRowHeight
 * @description Sets the row height value.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetRowHeight(32)
 * builder.SaveFile("xlsx", "SetRowHeight.xlsx")
 * builder.CloseFile()
 * @param {pt} nHeight The row height in the current range measured in points.
 */

/**
 * @memberof ApiRange
 * @name SetHidden
 * @description Sets the value hiding property. The specified range must span an entire column or row.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRows("1:3")
 * oRange.SetHidden(true)
 * oWorksheet.GetRange("A1").SetValue("1")
 * oWorksheet.GetRange("B1").SetValue("2")
 * oWorksheet.GetRange("C1").SetValue("3")
 * const bHidden = oRange.GetHidden()
 * oWorksheet.GetRange("A4").SetValue("The values from A1:C1 are hidden: " + bHidden)
 * builder.SaveFile("xlsx", "SetHidden.xlsx")
 * builder.CloseFile()
 * @param {Boolean} isHidden Specifies if the values in the current range are hidden or not.
 */

/**
 * @memberof ApiRange
 * @name SetSort
 * @description Sorts the cells in the given range by the parameters specified in the request.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue(2015)
 * oWorksheet.GetRange("A3").SetValue(2018)
 * oWorksheet.GetRange("A4").SetValue(2014)
 * oWorksheet.GetRange("A5").SetValue(2010)
 * oWorksheet.GetRange("B1").SetValue(150)
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(260)
 * oWorksheet.GetRange("B4").SetValue(120)
 * oWorksheet.GetRange("B5").SetValue(100)
 * oWorksheet.GetRange("C1").SetValue("C")
 * oWorksheet.GetRange("C2").SetValue("B")
 * oWorksheet.GetRange("C3").SetValue("A")
 * oWorksheet.GetRange("C4").SetValue("G")
 * oWorksheet.GetRange("C5").SetValue("E")
 * oWorksheet.GetRange("A1:C5").SetSort("A1:A5", "xlAscending", "B1:B5", "xlDescending", "C1:C5", "xlAscending", "xlYes", "xlSortColumns")
 * builder.SaveFile("xlsx", "SetSort.xlsx")
 * builder.CloseFile()
 * @param {ApiRange | String} key1 First sort field.
 * @param {SortOrder} sSortOrder1 The sort order for the values specified in Key1.
 * @param {ApiRange | String} key2 Second sort field.
 * @param {SortOrder} sSortOrder2 The sort order for the values specified in Key2.
 * @param {ApiRange | String} key3 Third sort field.
 * @param {SortOrder} sSortOrder3 The sort order for the values specified in Key3.
 * @param {SortHeader} sHeader Specifies whether the first row contains header information.
 * @param {SortOrientation} sOrientation Specifies if the sort should be by row (default) or column.
 */

/**
 * @memberof ApiRange
 * @name SetStrikeout
 * @description Specifies that the contents of the cell / cell range are displayed with a single horizontal line through the center of the contents.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A2").SetValue("Struckout text")
 * oWorksheet.GetRange("A2").SetStrikeout(true)
 * oWorksheet.GetRange("A3").SetValue("Normal text")
 * builder.SaveFile("xlsx", "SetStrikeout.xlsx")
 * builder.CloseFile()
 * @param {Boolean} isStrikeout Specifies if the contents of the current cell / cell range are displayed struck through.
 */

/**
 * @memberof ApiRange
 * @name UnMerge
 * @description Splits the selected merged cell range into the single cells.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A3:E8").Merge(true)
 * oWorksheet.GetRange("A5:E5").UnMerge()
 * builder.SaveFile("xlsx", "UnMerge.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiRange
 * @name SetWrap
 * @description Specifies whether the words in the cell must be wrapped to fit the cell size or not.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRange = oWorksheet.GetRange("A1")
 * oRange.SetValue("This is the text wrapped to fit the cell size.")
 * oRange.SetWrap(true)
 * oWorksheet.GetRange("A3").SetValue("The text in the cell A1 is wrapped: " + oRange.GetWrapText())
 * builder.SaveFile("xlsx", "SetWrap.xlsx")
 * builder.CloseFile()
 * @param {Boolean} isWrap Specifies if the words in the cell will be wrapped to fit the cell size.
 */

/**
 * @memberof ApiRange
 * @name SetValue
 * @description Sets a value to the current cell or cell range.
 * @returns {Boolean} returns false if such a range does not exist
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue("2")
 * oWorksheet.GetRange("B2").SetValue("2")
 * oWorksheet.GetRange("A3").SetValue("2x2=")
 * oWorksheet.GetRange("B3").SetValue("=B1*B2")
 * builder.SaveFile("xlsx", "SetValue.xlsx")
 * builder.CloseFile()
 * @param {String | Boolean | Number | Array<String | Boolean | Number> | Array<Array<String | Boolean | Number>>} data The general value for the cell or cell range.
 */

/**
 * @memberof ApiRange
 * @name SetUnderline
 * @description Specifies that the contents of the current cell / cell range are displayed along with a line appearing directly below the character.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A2").SetValue("The text underlined with a single line")
 * oWorksheet.GetRange("A2").SetUnderline("single")
 * oWorksheet.GetRange("A4").SetValue("Normal text")
 * builder.SaveFile("xlsx", "SetUnderline.xlsx")
 * builder.CloseFile()
 * @param {XlUnderlineType} undelineType Specifies the type of the line displayed under the characters.
 */

/**
 * @memberof ApiRun
 * @name AddLineBreak
 * @description Adds a line break to the current run position and starts the next element from a new line.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * oRun.AddText("This is the text for the first line. Nothing special.")
 * oRun.AddLineBreak()
 * oRun.AddText("This is the text which starts from the beginning of the second line. ")
 * oRun.AddText("It is written in two text runs, you need a space at the end of the first run sentence to separate them.")
 * oParagraph.AddElement(oRun)
 * builder.SaveFile("xlsx", "AddLineBreak.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiRun
 * @name AddTabStop
 * @description Adds a tab stop to the current run.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * oRun.SetFontSize(30)
 * oRun.AddText("This is just a sample text. After it three tab stops will be added.")
 * oRun.AddTabStop()
 * oRun.AddTabStop()
 * oRun.AddTabStop()
 * oRun.AddText("This is the text which starts after the tab stops.")
 * oParagraph.AddElement(oRun)
 * builder.SaveFile("xlsx", "AddTabStop.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiRun
 * @name Delete
 * @description Deletes the current run.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * oRun.AddText("This is just a sample text.")
 * oParagraph.AddElement(oRun)
 * oRun.Delete()
 * oWorksheet.GetRange("A9").SetValue("The run from the shape content was removed.")
 * builder.SaveFile("xlsx", "Delete.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiRun
 * @name ClearContent
 * @description Clears the content from the current run.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * let oParagraph = oDocContent.GetElement(0)
 * let oRun = Api.CreateRun()
 * oRun.SetFontSize(30)
 * oRun.AddText("This is just a sample text. ")
 * oRun.AddText("But you will not see it in the resulting document, as it will be cleared.")
 * oParagraph.AddElement(oRun)
 * oRun.ClearContent()
 * oParagraph = Api.CreateParagraph()
 * oRun = Api.CreateRun()
 * oRun.AddText("The text in the previous paragraph cannot be seen, as it has been cleared.")
 * oParagraph.AddElement(oRun)
 * oDocContent.Push(oParagraph)
 * builder.SaveFile("xlsx", "ClearContent.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiRun
 * @name AddText
 * @description Adds some text to the current run.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * oRun.SetFontSize(30)
 * oRun.AddText("This is just a sample text. Nothing special.")
 * oParagraph.AddElement(oRun)
 * builder.SaveFile("xlsx", "AddText.xlsx")
 * builder.CloseFile()
 * @param {String} sText The text which will be added to the current run.
 */

/**
 * @memberof ApiRun
 * @name Copy
 * @description Creates a copy of the current run.
 * @returns {ApiRun}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * oRun.AddText("This is just a sample text that was copied. ")
 * oParagraph.AddElement(oRun)
 * const oCopyRun = oRun.Copy()
 * oParagraph.AddElement(oCopyRun)
 * builder.SaveFile("xlsx", "Copy.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiRun
 * @name GetFontNames
 * @description Returns all font names from all elements inside the current run.
 * @returns {Array}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * let oParagraph = oDocContent.GetElement(0)
 * let oRun = Api.CreateRun()
 * oRun.AddText("This is just a sample text. ")
 * oParagraph.AddElement(oRun)
 * oRun = Api.CreateRun()
 * oRun.SetFontFamily("Comic Sans MS")
 * oRun.AddText("This is a text run with the font family set to 'Comic Sans MS'.")
 * oParagraph.AddElement(oRun)
 * oParagraph.AddLineBreak()
 * const aFontNames = oRun.GetFontNames()
 * oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("Run font names: ")
 * oParagraph.AddLineBreak()
 * for (let i = 0; i < aFontNames.length; i++) {
 *   oParagraph.AddText(aFontNames[i])
 *   oParagraph.AddLineBreak()
 * }
 * oDocContent.Push(oParagraph)
 * builder.SaveFile("xlsx", "GetFontNames.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiRun
 * @name GetTextPr
 * @description Returns the text properties of the current run.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * const oTextPr = oRun.GetTextPr()
 * oTextPr.SetFontSize(30)
 * oParagraph.SetJc("left")
 * oRun.AddText("This is a sample text inside the shape with the font size set to 15 points using the text properties.")
 * oParagraph.AddElement(oRun)
 * builder.SaveFile("xlsx", "GetTextPr.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiRun
 * @name RemoveAllElements
 * @description Removes all the elements from the current run.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * oRun.AddText("This is just a sample text.")
 * oRun.RemoveAllElements()
 * oRun.AddText("All elements from this run were removed before adding this text.")
 * oParagraph.AddElement(oRun)
 * builder.SaveFile("xlsx", "RemoveAllElements.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiRun
 * @name SetCaps
 * @description Specifies that any lowercase characters in the current text run are formatted for display only as their capital letter character equivalents.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * let oRun = Api.CreateRun()
 * oRun.AddText("This is just a sample text. ")
 * oParagraph.AddElement(oRun)
 * oRun = Api.CreateRun()
 * oRun.SetCaps(true)
 * oRun.AddText("This is a text run with the font set to capitalized letters.")
 * oParagraph.AddElement(oRun)
 * builder.SaveFile("xlsx", "SetCaps.xlsx")
 * builder.CloseFile()
 * @param {Boolean} isCaps Specifies that the contents of the current run are displayed capitalized.
 */

/**
 * @memberof ApiRun
 * @name SetBold
 * @description Sets the bold property to the text character.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * let oRun = Api.CreateRun()
 * oRun.AddText("This is just a sample text. ")
 * oParagraph.AddElement(oRun)
 * oRun = Api.CreateRun()
 * oRun.SetBold(true)
 * oRun.AddText("This is a text run with the font set to bold.")
 * oParagraph.AddElement(oRun)
 * builder.SaveFile("xlsx", "SetBold.xlsx")
 * builder.CloseFile()
 * @param {Boolean} isBold Specifies that the contents of the current run are displayed bold.
 */

/**
 * @memberof ApiRun
 * @name SetColor
 * @description Sets the text color for the current text run in the RGB format.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * oRun.AddText("This is a text run with the font color set to gray.")
 * oParagraph.AddElement(oRun)
 * oRun.SetColor(128, 128, 128)
 * builder.SaveFile("xlsx", "SetColor.xlsx")
 * builder.CloseFile()
 * @param {byte} r Red color component value.
 * @param {byte} g Green color component value.
 * @param {byte} b Blue color component value.
 * @param {Boolean=} isAuto If this parameter is set to "true", then r,g,b parameters will be ignored. Default values is "false".
 */

/**
 * @memberof ApiRun
 * @name GetClassType
 * @description Returns a type of the ApiRun class.
 * @returns {String}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * const sClassType = oRun.GetClassType()
 * oRun.SetFontSize(30)
 * oRun.AddText("Class Type = " + sClassType)
 * oParagraph.AddElement(oRun)
 * builder.SaveFile("xlsx", "GetClassType.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiRun
 * @name SetFill
 * @description Sets the text color to the current text run.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * let oRun = Api.CreateRun()
 * oRun.AddText("This is just a sample text. ")
 * oParagraph.AddElement(oRun)
 * oRun = Api.CreateRun()
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(128, 128, 128))
 * oRun.SetFill(oFill)
 * oRun.AddText("This is a text run with the font color set to gray.")
 * oParagraph.AddElement(oRun)
 * builder.SaveFile("xlsx", "SetFill.xlsx")
 * builder.CloseFile()
 * @param {ApiFill} oApiFill The color or pattern used to fill the text color.
 */

/**
 * @memberof ApiRun
 * @name SetFontFamily
 * @description Sets all 4 font slots with the specified font family.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * let oRun = Api.CreateRun()
 * oRun.AddText("This is just a sample text. ")
 * oParagraph.AddElement(oRun)
 * oRun = Api.CreateRun()
 * oRun.SetFontFamily("Comic Sans MS")
 * oRun.AddText("This is a text run with the font family set to 'Comic Sans MS'.")
 * oParagraph.AddElement(oRun)
 * builder.SaveFile("xlsx", "SetFontFamily.xlsx")
 * builder.CloseFile()
 * @param {String} sFontFamily The font family or families used for the current text run.
 */

/**
 * @memberof ApiRun
 * @name SetHighlight
 * @description Specifies a highlighting color which is applied as a background to the contents of the current run.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * let oRun = Api.CreateRun()
 * oRun.AddText("This is just a sample text. ")
 * oParagraph.AddElement(oRun)
 * oRun = Api.CreateRun()
 * oRun.SetHighlight("lightGray")
 * oRun.AddText("This is a text run with the text highlighted with light gray color.")
 * oParagraph.AddElement(oRun)
 * builder.SaveFile("xlsx", "SetHighlight.xlsx")
 * builder.CloseFile()
 * @param {highlightColor} sColor Available highlight color.
 */

/**
 * @memberof ApiRun
 * @name SetDoubleStrikeout
 * @description Specifies that the contents of the current run are displayed with two horizontal lines through each character displayed on the line.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * let oRun = Api.CreateRun()
 * oRun.AddText("This is just a sample text. ")
 * oParagraph.AddElement(oRun)
 * oRun = Api.CreateRun()
 * oRun.SetDoubleStrikeout(true)
 * oRun.AddText("This is a text run with the text struck out with two lines.")
 * oParagraph.AddElement(oRun)
 * builder.SaveFile("xlsx", "SetDoubleStrikeout.xlsx")
 * builder.CloseFile()
 * @param {Boolean} isDoubleStrikeout Specifies that the contents of the current run are displayed double struck through.
 */

/**
 * @memberof ApiRun
 * @name SetItalic
 * @description Sets the italic property to the text character.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * let oRun = Api.CreateRun()
 * oRun.AddText("This is just a sample text. ")
 * oParagraph.AddElement(oRun)
 * oRun = Api.CreateRun()
 * oRun.SetItalic(true)
 * oRun.AddText("This is a text run with the font set to italicized letters.")
 * oParagraph.AddElement(oRun)
 * builder.SaveFile("xlsx", "SetItalic.xlsx")
 * builder.CloseFile()
 * @param {Boolean} isItalic Specifies that the contents of the current run are displayed italicized.
 */

/**
 * @memberof ApiRun
 * @name SetLanguage
 * @description Specifies the languages which will be used to check spelling and grammar (if requested) when processing the contents of this text run.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * oRun.AddText("This is a text run with the text language set to English (Canada).")
 * oRun.SetLanguage("en-CA")
 * oParagraph.AddElement(oRun)
 * builder.SaveFile("xlsx", "SetLanguage.xlsx")
 * builder.CloseFile()
 * @param {String} sLangId The possible value for this parameter is a language identifier as defined by RFC 4646/BCP 47. Example: "en-CA".
 */

/**
 * @memberof ApiRun
 * @name SetOutLine
 * @description Sets the text outline to the current text run. Inherited From: ApiTextPr#SetOutLine
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * let oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * let oRun = Api.CreateRun()
 * oRun.AddText("This is just a sample text. ")
 * oParagraph.AddElement(oRun)
 * oRun = Api.CreateRun()
 * oStroke = Api.CreateStroke(0.2 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(128, 128, 128)))
 * oRun.SetOutLine(oStroke)
 * oRun.AddText("This is a text run with the gray text outline.")
 * oParagraph.AddElement(oRun)
 * builder.SaveFile("xlsx", "SetOutLine.xlsx")
 * builder.CloseFile()
 * @param {ApiStroke} oStroke The stroke used to create the text outline.
 */

/**
 * @memberof ApiRun
 * @name SetShd
 * @description Specifies the shading applied to the contents of the current text run.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * let oRun = Api.CreateRun()
 * oRun.AddText("This is just a sample text. ")
 * oParagraph.AddElement(oRun)
 * oRun = Api.CreateRun()
 * oRun.SetShd("clear", 255, 111, 61)
 * oRun.AddText("This is a text run with the text shading set to orange.")
 * oParagraph.AddElement(oRun)
 * builder.SaveFile("xlsx", "SetShd.xlsx")
 * builder.CloseFile()
 * @param {ShdType} sType The shading type applied to the contents of the current text run.
 * @param {byte} r Red color component value.
 * @param {byte} g Green color component value.
 * @param {byte} b Blue color component value.
 */

/**
 * @memberof ApiRun
 * @name SetPosition
 * @description Specifies an amount by which text is raised or lowered for this run in relation to the default baseline of the surrounding non-positioned text.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * let oRun = Api.CreateRun()
 * oRun.AddText("This is just a sample text.")
 * oParagraph.AddElement(oRun)
 * oRun = Api.CreateRun()
 * oRun.AddText("This is a text run with the text raised 10 half-points.")
 * oRun.SetPosition(10)
 * oParagraph.AddElement(oRun)
 * oRun = Api.CreateRun()
 * oRun.AddText("This is a text run with the text lowered 16 half-points.")
 * oRun.SetPosition(-16)
 * oParagraph.AddElement(oRun)
 * builder.SaveFile("xlsx", "SetPosition.xlsx")
 * builder.CloseFile()
 * @param {hps} nPosition Specifies a positive (raised text) or negative (lowered text) measurement in half-points (1/144 of an inch).
 */

/**
 * @memberof ApiRun
 * @name SetSmallCaps
 * @description Specifies that all the small letter characters in this text run are formatted for display only as their capital letter character equivalents which are two points smaller than the actual font size specified for this text.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * let oRun = Api.CreateRun()
 * oRun.AddText("This is just a sample text. ")
 * oParagraph.AddElement(oRun)
 * oRun = Api.CreateRun()
 * oRun.SetSmallCaps(true)
 * oRun.AddText("This is a text run with the font set to small capitalized letters.")
 * oParagraph.AddElement(oRun)
 * builder.SaveFile("xlsx", "SetSmallCaps.xlsx")
 * builder.CloseFile()
 * @param {Boolean} isSmallCaps Specifies if the contents of the current run are displayed capitalized two points smaller or not.
 */

/**
 * @memberof ApiRun
 * @name SetFontSize
 * @description Sets the font size to the characters of the current text run.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * let oRun = Api.CreateRun()
 * oRun.AddText("This is just a sample text. ")
 * oParagraph.AddElement(oRun)
 * oRun = Api.CreateRun()
 * oRun.SetFontSize(30)
 * oRun.AddText("This is a text run with the font size set to 15 points (30 half-points).")
 * oParagraph.AddElement(oRun)
 * builder.SaveFile("xlsx", "SetFontSize.xlsx")
 * builder.CloseFile()
 * @param {hps} nSize The text size value measured in half-points (1/144 of an inch).
 */

/**
 * @memberof ApiRun
 * @name SetSpacing
 * @description Sets the text spacing measured in twentieths of a point.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * let oRun = Api.CreateRun()
 * oRun.AddText("This is just a sample text. ")
 * oParagraph.AddElement(oRun)
 * oRun = Api.CreateRun()
 * oRun.SetSpacing(80)
 * oRun.AddText("This is a text run with the text spacing set to 4 points (20 twentieths of a point).")
 * oParagraph.AddElement(oRun)
 * builder.SaveFile("xlsx", "SetSpacing.xlsx")
 * builder.CloseFile()
 * @param {twips} nSpacing The value of the text spacing measured in twentieths of a point (1/1440 of an inch).
 */

/**
 * @memberof ApiRun
 * @name SetStrikeout
 * @description Specifies that the contents of the current run are displayed with a single horizontal line through the center of the line.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * let oRun = Api.CreateRun()
 * oRun.AddText("This is just a sample text. ")
 * oParagraph.AddElement(oRun)
 * oRun = Api.CreateRun()
 * oRun.SetStrikeout(true)
 * oRun.AddText("This is a text run with the text struck out with a single line.")
 * oParagraph.AddElement(oRun)
 * builder.SaveFile("xlsx", "SetStrikeout.xlsx")
 * builder.CloseFile()
 * @param {Boolean} isStrikeout Specifies that the contents of the current run are displayed struck through.
 */

/**
 * @memberof ApiRun
 * @name SetStyle
 * @description Sets a style to the current run.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * let oRun = Api.CreateRun()
 * oRun.AddText("This is just a sample text. ")
 * oRun.AddText("The text properties are changed and the style is added to the paragraph. ")
 * oParagraph.AddElement(oRun)
 * // todo_example in cells we don't have ability to create a style
 * // var oMyNewRunStyle = oDocument.CreateStyle("My New Run Style", "run");
 * const oTextPr = oMyNewRunStyle.GetTextPr()
 * oRun = Api.CreateRun()
 * // oRun.SetStyle(oMyNewRunStyle);
 * oRun.AddText("This is a text run with its own style.")
 * oParagraph.AddElement(oRun)
 * builder.SaveFile("xlsx", "SetStyle.xlsx")
 * builder.CloseFile()
 * @param {ApiStyle} oStyle The style which must be applied to the text run.
 */

/**
 * @memberof ApiRun
 * @name SetUnderline
 * @description Specifies that the contents of the current run are displayed along with a line appearing directly below the character (less than all the spacing above and below the characters on the line).
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * let oRun = Api.CreateRun()
 * oRun.AddText("This is just a sample text. ")
 * oParagraph.AddElement(oRun)
 * oRun = Api.CreateRun()
 * oRun.SetUnderline(true)
 * oRun.AddText("This is a text run with the text underlined with a single line.")
 * oParagraph.AddElement(oRun)
 * builder.SaveFile("xlsx", "SetUnderline.xlsx")
 * builder.CloseFile()
 * @param {Boolean} isUnderline Specifies that the contents of the current run are displayed underlined.
 */

/**
 * @memberof ApiRun
 * @name SetTextPr
 * @description Sets the text properties to the current run.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * oRun.AddText("This is a sample text with the font size set to 15 points and the font weight set to bold.")
 * const oTextPr = oRun.GetTextPr()
 * oTextPr.SetFontSize(30)
 * oTextPr.SetBold(true)
 * oRun.SetTextPr(oTextPr)
 * oParagraph.AddElement(oRun)
 * builder.SaveFile("xlsx", "SetTextPr.xlsx")
 * builder.CloseFile()
 * @param {ApiTextPr} oTextPr The text properties that will be set to the current run.
 */

/**
 * @memberof ApiRun
 * @name SetVertAlign
 * @description Specifies the alignment which will be applied to the contents of the current run in relation to the default appearance of the text run.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * let oRun = Api.CreateRun()
 * oRun.AddText("This is just a sample text. ")
 * oParagraph.AddElement(oRun)
 * oRun = Api.CreateRun()
 * oRun.SetVertAlign("subscript")
 * oRun.AddText("This is a text run with the text aligned below the baseline vertically. ")
 * oParagraph.AddElement(oRun)
 * oRun = Api.CreateRun()
 * oRun.SetVertAlign("baseline")
 * oRun.AddText("This is a text run with the text aligned by the baseline vertically. ")
 * oParagraph.AddElement(oRun)
 * oRun = Api.CreateRun()
 * oRun.SetVertAlign("superscript")
 * oRun.AddText("This is a text run with the text aligned above the baseline vertically.")
 * oParagraph.AddElement(oRun)
 * builder.SaveFile("xlsx", "SetVertAlign.xlsx")
 * builder.CloseFile()
 * @param {VertAlign} sType The vertical alignment type applied to the text contents.
 */

/**
 * @memberof ApiRGBColor
 * @name GetClassType
 * @description Returns a type of the ApiRGBColor class.
 * @returns {String}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oRGBColor = Api.CreateRGBColor(255, 213, 191)
 * const oGs1 = Api.CreateGradientStop(oRGBColor, 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateLinearGradientFill([
 *   oGs1,
 *   oGs2
 * ], 5400000)
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 1, 3 * 36000)
 * const sClassType = oRGBColor.GetClassType()
 * oWorksheet.SetColumnWidth(0, 15)
 * oWorksheet.SetColumnWidth(1, 10)
 * oWorksheet.GetRange("A1").SetValue("Class Type = ")
 * oWorksheet.GetRange("B1").SetValue(sClassType)
 * builder.SaveFile("xlsx", "GetClassType.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiStroke
 * @name GetClassType
 * @description Returns a type of the ApiStroke class.
 * @returns {String}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateLinearGradientFill([
 *   oGs1,
 *   oGs2
 * ], 5400000)
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 1, 3 * 36000)
 * const sClassType = oStroke.GetClassType()
 * oWorksheet.SetColumnWidth(0, 15)
 * oWorksheet.SetColumnWidth(1, 10)
 * oWorksheet.GetRange("A1").SetValue("Class Type = ")
 * oWorksheet.GetRange("B1").SetValue(sClassType)
 * builder.SaveFile("xlsx", "GetClassType.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiSchemeColor
 * @name GetClassType
 * @description Returns a type of the ApiSchemeColor class.
 * @returns {String}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oSchemeColor = Api.CreateSchemeColor("dk1")
 * const oFill = Api.CreateSolidFill(oSchemeColor)
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * oWorksheet.AddShape("curvedUpArrow", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 1, 3 * 36000)
 * const sClassType = oSchemeColor.GetClassType()
 * oWorksheet.SetColumnWidth(0, 15)
 * oWorksheet.SetColumnWidth(1, 10)
 * oWorksheet.GetRange("A1").SetValue("Class Type = ")
 * oWorksheet.GetRange("B1").SetValue(sClassType)
 * builder.SaveFile("xlsx", "GetClassType.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiRun
 * @name SetTextFill
 * @description Sets the text fill to the current text run. Inherited From: ApiTextPr#SetTextFill
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * let oRun = Api.CreateRun()
 * oRun.AddText("This is just a sample text. ")
 * oParagraph.AddElement(oRun)
 * oRun = Api.CreateRun()
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(128, 128, 128))
 * oRun.SetTextFill(oFill)
 * oRun.AddText("This is a text run with the gray text.")
 * oParagraph.AddElement(oRun)
 * builder.SaveFile("xlsx", "SetTextFill.xlsx")
 * builder.CloseFile()
 * @param {ApiFill} oApiFill The color or pattern used to fill the text color.
 */

/**
 * @memberof ApiShape
 * @name GetContent
 * @description Returns the shape inner contents where a paragraph or text runs can be inserted.
 * @returns {ApiDocumentContent | null}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oContent = oShape.GetContent()
 * oContent.RemoveAllElements()
 * const oParagraph = Api.CreateParagraph()
 * oParagraph.SetJc("left")
 * oParagraph.AddText("We removed all elements from the shape and added a new paragraph inside it.")
 * oContent.Push(oParagraph)
 * builder.SaveFile("xlsx", "GetContent.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiShape
 * @name GetDocContent
 * @description Deprecated in 6.2. Returns the shape inner contents where a paragraph or text runs can be inserted.
 * @returns {ApiDocumentContent | null}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetDocContent()
 * oDocContent.RemoveAllElements()
 * const oParagraph = Api.CreateParagraph()
 * oParagraph.SetJc("left")
 * oParagraph.AddText("We removed all elements from the shape and added a new paragraph inside it.")
 * oDocContent.Push(oParagraph)
 * builder.SaveFile("xlsx", "GetDocContent.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiShape
 * @name GetClassType
 * @description Returns a type of the ApiShape class.
 * @returns {String}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 2, 3 * 36000)
 * const sClassType = oShape.GetClassType()
 * oWorksheet.SetColumnWidth(0, 15)
 * oWorksheet.SetColumnWidth(1, 10)
 * oWorksheet.GetRange("A1").SetValue("Class Type = ")
 * oWorksheet.GetRange("B1").SetValue(sClassType)
 * builder.SaveFile("xlsx", "GetClassType.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiTextPr
 * @name GetClassType
 * @description Returns a type of the ApiTextPr class.
 * @returns {String}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * const oTextPr = oRun.GetTextPr()
 * oTextPr.SetFontSize(30)
 * oParagraph.SetJc("left")
 * const sClassType = oTextPr.GetClassType()
 * oRun.AddText("Class Type = " + sClassType)
 * oParagraph.AddElement(oRun)
 * builder.SaveFile("xlsx", "GetClassType.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiTextPr
 * @name SetCaps
 * @description Specifies that any lowercase characters in the text run are formatted for display only as their capital letter character equivalents.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * const oTextPr = oRun.GetTextPr()
 * oTextPr.SetFontSize(30)
 * oTextPr.SetCaps(true)
 * oParagraph.SetJc("left")
 * oRun.AddText("This is a sample text inside the shape set to capital letters using the text properties.")
 * oParagraph.AddElement(oRun)
 * builder.SaveFile("xlsx", "SetCaps.xlsx")
 * builder.CloseFile()
 * @param {Boolean} isCaps Specifies that the contents of the current run are displayed capitalized.
 */

/**
 * @memberof ApiTextPr
 * @name SetBold
 * @description Sets the bold property to the text character.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * const oTextPr = oRun.GetTextPr()
 * oTextPr.SetFontSize(30)
 * oTextPr.SetBold(true)
 * oParagraph.SetJc("left")
 * oRun.AddText("This is a sample text inside the shape with the font weight set to bold using the text properties.")
 * oParagraph.AddElement(oRun)
 * builder.SaveFile("xlsx", "SetBold.xlsx")
 * builder.CloseFile()
 * @param {Boolean} isBold Specifies that the contents of the current run are displayed bold.
 */

/**
 * @memberof ApiTextPr
 * @name SetFill
 * @description Sets the text color to the current text run.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * const oTextPr = oRun.GetTextPr()
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(128, 128, 128))
 * oTextPr.SetFill(oFill)
 * oRun.AddText("This is a text run with the font color set to gray.")
 * oParagraph.AddElement(oRun)
 * builder.SaveFile("xlsx", "SetFill.xlsx")
 * builder.CloseFile()
 * @param {ApiFill} oApiFill The color or pattern used to fill the text color.
 */

/**
 * @memberof ApiTextPr
 * @name SetDoubleStrikeout
 * @description Specifies that the contents of the run are displayed with two horizontal lines through each character displayed on the line.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * const oTextPr = oRun.GetTextPr()
 * oTextPr.SetFontSize(30)
 * oTextPr.SetDoubleStrikeout(true)
 * oParagraph.SetJc("left")
 * oRun.AddText("This is a sample text inside the shape struck out with two lines using the text properties.")
 * oParagraph.AddElement(oRun)
 * builder.SaveFile("xlsx", "SetDoubleStrikeout.xlsx")
 * builder.CloseFile()
 * @param {Boolean} isDoubleStrikeout Specifies that the contents of the current run are displayed double struck through.
 */

/**
 * @memberof ApiTextPr
 * @name SetFontFamily
 * @description Sets all 4 font slots with the specified font family.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * const oTextPr = oRun.GetTextPr()
 * oTextPr.SetFontSize(30)
 * oTextPr.SetFontFamily("Comic Sans MS")
 * oParagraph.SetJc("left")
 * oRun.AddText("This is a sample text inside the shape with the font family set to 'Comic Sans MS' using the text properties.")
 * oParagraph.AddElement(oRun)
 * builder.SaveFile("xlsx", "SetFontFamily.xlsx")
 * builder.CloseFile()
 * @param {String} sFontFamily The font family or families used for the current text run.
 */

/**
 * @memberof ApiShape
 * @name SetVerticalTextAlign
 * @description Sets the vertical alignment to the shape content where a paragraph or text runs can be inserted.
 * @returns {Boolean} returns false if shape or aligment doesn't exist
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 50 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * oDocContent.RemoveAllElements()
 * oShape.SetVerticalTextAlign("bottom")
 * const oParagraph = Api.CreateParagraph()
 * oParagraph.SetJc("left")
 * oParagraph.AddText("We removed all elements from the shape and added a new paragraph inside it ")
 * oParagraph.AddText("aligning it vertically by the bottom.")
 * oDocContent.Push(oParagraph)
 * builder.SaveFile("xlsx", "SetVerticalTextAlign.xlsx")
 * builder.CloseFile()
 * @param {VerticalTextAlign} VerticalAlign The type of the vertical alignment for the shape inner contents.
 */

/**
 * @memberof ApiTextPr
 * @name SetFontSize
 * @description Sets the font size to the characters of the current text run.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * const oTextPr = oRun.GetTextPr()
 * oTextPr.SetFontSize(30)
 * oParagraph.SetJc("left")
 * oRun.AddText("This is a sample text inside the shape with the font size set to 15 points using the text properties.")
 * oParagraph.AddElement(oRun)
 * builder.SaveFile("xlsx", "SetFontSize.xlsx")
 * builder.CloseFile()
 * @param {hps} nSize The text size value measured in half-points (1/144 of an inch).
 */

/**
 * @memberof ApiTextPr
 * @name SetItalic
 * @description Sets the italic property to the text character.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * const oTextPr = oRun.GetTextPr()
 * oTextPr.SetFontSize(30)
 * oTextPr.SetItalic(true)
 * oParagraph.SetJc("left")
 * oRun.AddText("This is a sample text inside the shape with the font set to italicized letters using the text properties.")
 * oParagraph.AddElement(oRun)
 * builder.SaveFile("xlsx", "SetItalic.xlsx")
 * builder.CloseFile()
 * @param {Boolean} isItalic Specifies that the contents of the current run are displayed italicized.
 */

/**
 * @memberof ApiTextPr
 * @name SetOutLine
 * @description Sets the text outline to the current text run.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * let oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * const oTextPr = oRun.GetTextPr()
 * oTextPr.SetFontSize(30)
 * oStroke = Api.CreateStroke(0.2 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(128, 128, 128)))
 * oTextPr.SetOutLine(oStroke)
 * oParagraph.SetJc("left")
 * oRun.AddText("This is a text run with the gray text outline set using the text properties.")
 * oParagraph.AddElement(oRun)
 * builder.SaveFile("xlsx", "SetOutLine.xlsx")
 * builder.CloseFile()
 * @param {ApiStroke} oStroke The stroke used to create the text outline.
 */

/**
 * @memberof ApiTextPr
 * @name SetSpacing
 * @description Sets the text spacing measured in twentieths of a point.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * const oTextPr = oRun.GetTextPr()
 * oTextPr.SetFontSize(30)
 * oTextPr.SetSpacing(80)
 * oParagraph.SetJc("left")
 * oRun.AddText("This is a sample text inside the shape with the spacing set to 4 points (80 twentieths of a point).")
 * oParagraph.AddElement(oRun)
 * builder.SaveFile("xlsx", "SetSpacing.xlsx")
 * builder.CloseFile()
 * @param {twips} nSpacing The value of the text spacing measured in twentieths of a point (1/1440 of an inch).
 */

/**
 * @memberof ApiTextPr
 * @name SetStrikeout
 * @description Specifies that the contents of the run are displayed with a single horizontal line through the center of the line.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * const oTextPr = oRun.GetTextPr()
 * oTextPr.SetFontSize(30)
 * oTextPr.SetStrikeout(true)
 * oParagraph.SetJc("left")
 * oRun.AddText("This is a struck out text inside the shape.")
 * oParagraph.AddElement(oRun)
 * builder.SaveFile("xlsx", "SetStrikeout.xlsx")
 * builder.CloseFile()
 * @param {Boolean} isStrikeout Specifies that the contents of the current run are displayed struck through.
 */

/**
 * @memberof ApiTextPr
 * @name SetTextFill
 * @description Sets the text fill to the current text run.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * const oTextPr = oRun.GetTextPr()
 * oTextPr.SetFontSize(30)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(128, 128, 128))
 * oRun.SetTextFill(oFill)
 * oParagraph.SetJc("left")
 * oRun.AddText("This is a text run with the gray text set using the text properties.")
 * oParagraph.AddElement(oRun)
 * builder.SaveFile("xlsx", "SetTextFill.xlsx")
 * builder.CloseFile()
 * @param {ApiFill} oApiFill The color or pattern used to fill the text color.
 */

/**
 * @memberof ApiTextPr
 * @name SetUnderline
 * @description Specifies that the contents of the current run are displayed along with a line appearing directly below the character (less than all the spacing above and below the characters on the line).
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * const oTextPr = oRun.GetTextPr()
 * oTextPr.SetFontSize(30)
 * oTextPr.SetUnderline(true)
 * oParagraph.SetJc("left")
 * oRun.AddText("This is an underlined text inside the shape.")
 * oParagraph.AddElement(oRun)
 * builder.SaveFile("xlsx", "SetUnderline.xlsx")
 * builder.CloseFile()
 * @param {Boolean} isUnderline Specifies that the contents of the current run are displayed underlined.
 */

/**
 * @memberof ApiUniColor
 * @name GetClassType
 * @description Returns a type of the ApiUniColor class.
 * @returns {String}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oPresetColor = Api.CreatePresetColor("peachPuff")
 * const oGs1 = Api.CreateGradientStop(oPresetColor, 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateLinearGradientFill([
 *   oGs1,
 *   oGs2
 * ], 5400000)
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 1, 3 * 36000)
 * const sClassType = oPresetColor.GetClassType()
 * oWorksheet.SetColumnWidth(0, 15)
 * oWorksheet.SetColumnWidth(1, 10)
 * oWorksheet.GetRange("A1").SetValue("Class Type = ")
 * oWorksheet.GetRange("B1").SetValue(sClassType)
 * builder.SaveFile("xlsx", "GetClassType.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiWorksheet
 * @name AddChart
 * @description Creates a chart of the specified type from the selected data range of the current sheet. Please note that the horizontal and vertical offsets are calculated within the limits of the specified column and row cells only. If this value exceeds the cell width or height, another vertical/horizontal position will be set.
 * @returns {ApiChart}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("C2").SetValue(240)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("D2").SetValue(280)
 * oWorksheet.GetRange("D3").SetValue(280)
 * const oChart = oWorksheet.AddChart("'Sheet1'!$A$1:$D$3", true, "bar3D", 2, 100 * 36000, 70 * 36000, 0, 2 * 36000, 7, 3 * 36000)
 * oChart.SetTitle("Financial Overview", 13)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * builder.SaveFile("xlsx", "AddChart.xlsx")
 * builder.CloseFile()
 * @param {String} sDataRange The selected cell range which will be used to get the data for the chart, formed specifically and including the sheet name.
 * @param {Boolean} bInRows Specifies whether to take the data from the rows or from the columns. If true, the data from the rows will be used.
 * @param {ChartType} sType The chart type used for the chart display.
 * @param {Number} nStyleIndex The chart color style index (can be 1 - 48, as described in OOXML specification).
 * @param {EMU} nExtX The chart width in English measure units
 * @param {EMU} nExtY The chart height in English measure units.
 * @param {Number} nFromCol The number of the column where the beginning of the chart will be placed.
 * @param {EMU} nColOffset The offset from the nFromCol column to the left part of the chart measured in English measure units.
 * @param {Number} nFromRow The number of the row where the beginning of the chart will be placed.
 * @param {EMU} nRowOffset The offset from the nFromRow row to the upper part of the chart measured in English measure units.
 */

/**
 * @memberof ApiTextPr
 * @name SetVertAlign
 * @description Specifies the alignment which will be applied to the contents of the current run in relation to the default appearance of the text run.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * const oTextPr = oRun.GetTextPr()
 * oTextPr.SetVertAlign("superscript")
 * oParagraph.SetJc("left")
 * oRun.AddText("This is a text inside the shape with vertical alignment set to 'superscript'.")
 * oParagraph.AddElement(oRun)
 * builder.SaveFile("xlsx", "SetVertAlign.xlsx")
 * builder.CloseFile()
 * @param {VertAlign} sType The vertical alignment type applied to the text contents.
 */

/**
 * @memberof ApiWorksheet
 * @name AddDefName
 * @description Adds a new name to the current worksheet.
 * @returns {Boolean} returns false if sName or sRef are invalid
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * oWorksheet.GetRange("B1").SetValue("2")
 * oWorksheet.AddDefName("numbers", "Sheet1!$A$1:$B$1")
 * oWorksheet.GetRange("A3").SetValue("We defined a name 'numbers' for a range of cells A1:B1.")
 * builder.SaveFile("xlsx", "AddDefName.xlsx")
 * builder.CloseFile()
 * @param {String} sName The range name.
 * @param {String} sRef Must contain the sheet name, followed by sign ! and a range of cells. Example: "Sheet1!$A$1:$B$2".
 * @param {Boolean} isHidden Defines if the range name is hidden or not.
 */

/**
 * @memberof ApiWorksheet
 * @name AddOleObject
 * @description Adds an OLE object to the current sheet with the parameters specified.
 * @returns {ApiOleObject}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.AddOleObject("https://api.onlyoffice.com/content/img/docbuilder/examples/ole-object-image.png", 130 * 36000, 90 * 36000, "https://youtu.be/SKGz4pmnpgY", "asc.{38E022EA-AD92-45FC-B22B-49DF39746DB4}", 0, 2 * 36000, 4, 3 * 36000)
 * builder.SaveFile("xlsx", "AddOleObject.xlsx")
 * builder.CloseFile()
 * @param {String} sImageSrc The image source where the image to be inserted should be taken from (currently, only internet URL or Base64 encoded images are supported).
 * @param {EMU} nWidth The OLE object width in English measure units.
 * @param {EMU} nHeight The OLE object height in English measure units.
 * @param {String} sData The OLE object string data.
 * @param {String} sAppId The application ID associated with the current OLE object.
 * @param {Number} nFromCol The number of the column where the beginning of the OLE object will be placed.
 * @param {EMU} nColOffset The offset from the nFromCol column to the left part of the OLE object measured in English measure units.
 * @param {Number} nFromRow The number of the row where the beginning of the OLE object will be placed.
 * @param {EMU} nRowOffset The offset from the nFromRow row to the upper part of the OLE object measured in English measure units.
 */

/**
 * @memberof ApiTextPr
 * @name SetSmallCaps
 * @description Specifies that all the small letter characters in the text run are formatted for display only as their capital letter character equivalents which are two points smaller than the actual font size specified for this text.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * const oTextPr = oRun.GetTextPr()
 * oTextPr.SetFontSize(30)
 * oTextPr.SetSmallCaps(true)
 * oParagraph.SetJc("left")
 * oRun.AddText("This is a sample text inside the shape with the font set to small capitalized letters.")
 * oParagraph.AddElement(oRun)
 * builder.SaveFile("xlsx", "SetSmallCaps.xlsx")
 * builder.CloseFile()
 * @param {Boolean} isSmallCaps Specifies if the contents of the current run are displayed capitalized two points smaller or not.
 */

/**
 * @memberof ApiWorksheet
 * @name AddImage
 * @description Adds an image to the current sheet with the parameters specified.
 * @returns {ApiImage}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.AddImage("https://api.onlyoffice.com/content/img/docbuilder/examples/coordinate_aspects.png", 60 * 36000, 35 * 36000, 0, 2 * 36000, 0, 3 * 36000)
 * builder.SaveFile("xlsx", "AddImage.xlsx")
 * builder.CloseFile()
 * @param {String} sImageSrc The image source where the image to be inserted should be taken from (currently only internet URL or Base64 encoded images are supported).
 * @param {EMU} nWidth The image width in English measure units.
 * @param {EMU} nHeight The image height in English measure units.
 * @param {Number} nFromCol The number of the column where the beginning of the image will be placed.
 * @param {EMU} nColOffset The offset from the nFromCol column to the left part of the image measured in English measure units.
 * @param {Number} nFromRow The number of the row where the beginning of the image will be placed.
 * @param {EMU} nRowOffset The offset from the nFromRow row to the upper part of the image measured in English measure units.
 */

/**
 * @memberof ApiWorksheet
 * @name AddShape
 * @description Adds a shape to the current sheet with the parameters specified. Please note that the horizontal and vertical offsets are calculated within the limits of the specified column and row cells only. If this value exceeds the cell width or height, another vertical/horizontal position will be set.
 * @returns {ApiShape}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateLinearGradientFill([
 *   oGs1,
 *   oGs2
 * ], 5400000)
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * builder.SaveFile("xlsx", "AddShape.xlsx")
 * builder.CloseFile()
 * @param {ShapeType=} sType=rect The shape type which specifies the preset shape geometry.
 * @param {EMU} nWidth The shape width in English measure units.
 * @param {EMU} nHeight The shape height in English measure units.
 * @param {ApiFill} oFill The color or pattern used to fill the shape.
 * @param {ApiStroke} oStroke The stroke used to create the element shadow.
 * @param {Number} nFromCol The number of the column where the beginning of the shape will be placed.
 * @param {EMU} nColOffset The offset from the nFromCol column to the left part of the shape measured in English measure units.
 * @param {Number} nFromRow The number of the row where the beginning of the shape will be placed.
 * @param {EMU} nRowOffset The offset from the nFromRow row to the upper part of the shape measured in English measure units.
 */

/**
 * @memberof ApiWorksheet
 * @name AddWordArt
 * @description Adds a Text Art object to the current sheet with the parameters specified.
 * @returns {ApiDrawing}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oTextPr = Api.CreateTextPr()
 * oTextPr.SetFontSize(72)
 * oTextPr.SetBold(true)
 * oTextPr.SetCaps(true)
 * oTextPr.SetColor(51, 51, 51, false)
 * oTextPr.SetFontFamily("Comic Sans MS")
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(1 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51)))
 * oWorksheet.AddWordArt(oTextPr, "onlyoffice", "textArchUp", oFill, oStroke, 0, 100 * 36000, 20 * 36000, 0, 2, 2 * 36000, 3 * 36000)
 * builder.SaveFile("xlsx", "AddWordArt.xlsx")
 * builder.CloseFile()
 * @param {ApiTextPr=} oTextPr=Api.CreateTextPr() The text properties.
 * @param {String=} sText=Your text here The text for the Text Art object.
 * @param {TextTransform=} sTransform=textNoShape Text transform type.
 * @param {ApiFill=} oFill=Api.CreateNoFill() The color or pattern used to fill the Text Art object.
 * @param {ApiStroke=} oStroke The stroke used to create the Text Art object shadow.
 * @param {Number=} nRotAngle=Api.CreateStroke(0, Api.CreateNoFill()) Rotation angle.
 * @param {EMU=} nWidth=1828800 The Text Art width measured in English measure units.
 * @param {EMU=} nHeight=1828800 The Text Art heigth measured in English measure units.
 * @param {Number=} nFromCol=0 The column number where the beginning of the Text Art object will be placed.
 * @param {Number=} nFromRow=0 The row number where the beginning of the Text Art object will be placed.
 * @param {EMU=} nColOffset=0 The offset from the nFromCol column to the left part of the Text Art object measured in English measure units.
 * @param {EMU=} nRowOffset=0 The offset from the nFromRow row to the upper part of the Text Art object measured in English measure units.
 */

/**
 * @memberof ApiWorksheet
 * @name FormatAsTable
 * @description Formats the selected range of cells from the current sheet as a table (with the first row formatted as a header). As the first row is always formatted as a table header, you need to select at least two rows for the table to be formed correctly.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.FormatAsTable("A1:E10")
 * builder.SaveFile("xlsx", "FormatAsTable.xlsx")
 * builder.CloseFile()
 * @param {String} sRange The range of cells from the current sheet which will be formatted as a table.
 */

/**
 * @memberof ApiWorksheet
 * @name GetAllCharts
 * @description Returns all charts from the current sheet.
 * @returns {Array<ApiChart>}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("C2").SetValue(240)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("D2").SetValue(280)
 * oWorksheet.GetRange("D3").SetValue(280)
 * const oChart = oWorksheet.AddChart("'Sheet1'!$A$1:$D$3", true, "bar3D", 2, 100 * 36000, 70 * 36000, 0, 2 * 36000, 7, 3 * 36000)
 * oChart.SetTitle("Financial Overview", 13)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * const aCharts = oWorksheet.GetAllCharts()
 * const oStroke = Api.CreateStroke(1 * 5000, Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61)))
 * aCharts[0].SetMinorHorizontalGridlines(oStroke)
 * builder.SaveFile("xlsx", "GetAllCharts.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiWorksheet
 * @name GetActiveCell
 * @description Returns an object that represents an active cell.
 * @returns {ApiRange}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oActiveCell = oWorksheet.GetActiveCell()
 * oActiveCell.SetValue("This sample text was placed in an active cell.")
 * builder.SaveFile("xlsx", "GetActiveCell.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiWorksheet
 * @name Delete
 * @description Deletes the current worksheet.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * Api.AddSheet("New sheet")
 * const oSheet = Api.GetActiveSheet()
 * oSheet.Delete()
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A3").SetValue("This method just deleted the second sheet from this spreadsheet.")
 * builder.SaveFile("xlsx", "Delete.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiWorksheet
 * @name GetAllDrawings
 * @description Returns all drawings from the current sheet.
 * @returns {Array<ApiDrawing>}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("B1").SetValue(2014)
 * oWorksheet.GetRange("C1").SetValue(2015)
 * oWorksheet.GetRange("D1").SetValue(2016)
 * oWorksheet.GetRange("A2").SetValue("Projected Revenue")
 * oWorksheet.GetRange("A3").SetValue("Estimated Costs")
 * oWorksheet.GetRange("B2").SetValue(200)
 * oWorksheet.GetRange("B3").SetValue(250)
 * oWorksheet.GetRange("C2").SetValue(240)
 * oWorksheet.GetRange("C3").SetValue(260)
 * oWorksheet.GetRange("D2").SetValue(280)
 * oWorksheet.GetRange("D3").SetValue(280)
 * const oDrawing = oWorksheet.AddChart("'Sheet1'!$A$1:$D$3", true, "bar3D", 2, 100 * 36000, 70 * 36000, 0, 2 * 36000, 7, 3 * 36000)
 * oDrawing.SetTitle("Financial Overview", 13)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oDrawing.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oDrawing.SetSeriesFill(oFill, 1, false)
 * const aDrawings = oWorksheet.GetAllDrawings()
 * aDrawings[0].SetSize(150 * 36000, 100 * 36000)
 * builder.SaveFile("xlsx", "GetAllDrawings.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiWorksheet
 * @name GetAllImages
 * @description Returns all images from the current sheet.
 * @returns {Array<ApiImage>}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.AddImage("https://api.onlyoffice.com/content/img/docbuilder/examples/coordinate_aspects.png", 60 * 36000, 35 * 36000, 0, 2 * 36000, 0, 3 * 36000)
 * const aImages = oWorksheet.GetAllImages()
 * const sClassType = aImages[0].GetClassType()
 * oWorksheet.GetRange("A10").SetValue("Class Type = " + sClassType)
 * builder.SaveFile("xlsx", "GetAllImages.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiWorksheet
 * @name GetAllOleObjects
 * @description Returns all OLE objects from the current sheet.
 * @returns {Array<ApiOleObject>}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.AddOleObject("https://i.ytimg.com/vi_webp/SKGz4pmnpgY/sddefault.webp", 130 * 36000, 90 * 36000, "https://youtu.be/SKGz4pmnpgY", "asc.{38E022EA-AD92-45FC-B22B-49DF39746DB4}", 0, 2 * 36000, 4, 3 * 36000)
 * const aOleObjects = oWorksheet.GetAllOleObjects()
 * const sAppId = aOleObjects[0].GetApplicationId()
 * oWorksheet.GetRange("A1").SetValue("The application ID for the current OLE object: " + sAppId)
 * builder.SaveFile("xlsx", "GetAllOleObjects.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiWorksheet
 * @name GetCells
 * @description Returns the ApiRange that represents all the cells on the worksheet (not just the cells that are currently in use).
 * @returns {ApiRange | null}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oCells = oWorksheet.GetCells()
 * oCells.SetFillColor(Api.CreateColorFromRGB(255, 213, 191))
 * builder.SaveFile("xlsx", "GetCells.xlsx")
 * builder.CloseFile()
 * @param {Number} row The row number or the cell number (if only row is defined).
 * @param {Number} col The column number.
 */

/**
 * @memberof ApiWorksheet
 * @name GetCols
 * @description Returns the ApiRange object that represents all the cells on the columns range.
 * @returns {ApiRange}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oCols = oWorksheet.GetCols("A1:C1")
 * oCols.SetFillColor(Api.CreateColorFromRGB(255, 213, 191))
 * builder.SaveFile("xlsx", "GetCols.xlsx")
 * builder.CloseFile()
 * @param {String} sRange Specifies the columns range in the string format.
 */

/**
 * @memberof ApiWorksheet
 * @name GetComments
 * @description Returns an array of ApiComment objects.
 * @returns {Array<ApiComment>}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * const oRange = oWorksheet.GetRange("A1")
 * oRange.AddComment("This is just a number.")
 * const aComments = oWorksheet.GetComments()
 * oWorksheet.GetRange("A4").SetValue("Comment: " + aComments[0].GetText())
 * builder.SaveFile("xlsx", "GetComments.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiWorksheet
 * @name GetAllShapes
 * @description Returns all shapes from the current sheet.
 * @returns {Array<ApiShape>}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateLinearGradientFill([
 *   oGs1,
 *   oGs2
 * ], 5400000)
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000)
 * const aShapes = oWorksheet.GetAllShapes()
 * const oDocContent = aShapes[0].GetContent()
 * oDocContent.RemoveAllElements()
 * aShapes[0].SetVerticalTextAlign("bottom")
 * const oParagraph = Api.CreateParagraph()
 * oParagraph.SetJc("left")
 * oParagraph.AddText("We removed all elements from the shape and added a new paragraph inside it ")
 * oParagraph.AddText("aligning it vertically by the bottom.")
 * oDocContent.Push(oParagraph)
 * builder.SaveFile("xlsx", "GetAllShapes.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiWorksheet
 * @name GetBottomMargin
 * @description Returns the bottom margin of the sheet.
 * @returns {Number}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const nBottomMargin = oWorksheet.GetBottomMargin()
 * oWorksheet.GetRange("A1").SetValue("Bottom margin: " + nBottomMargin + " mm")
 * builder.SaveFile("xlsx", "GetBottomMargin.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiWorksheet
 * @name GetDefNames
 * @description Returns an array of ApiName objects.
 * @returns {Array<ApiName>}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * oWorksheet.GetRange("B1").SetValue("2")
 * oWorksheet.GetRange("A2").SetValue("A")
 * oWorksheet.GetRange("B2").SetValue("B")
 * oWorksheet.AddDefName("numbers", "Sheet1!$A$1:$B$1")
 * oWorksheet.AddDefName("letters", "Sheet1!$A$2:$B$2")
 * const aDefNames = oWorksheet.GetDefNames()
 * oWorksheet.GetRange("A4").SetValue("DefNames: " + aDefNames[0].GetName() + ", " + aDefNames[1].GetName())
 * builder.SaveFile("xlsx", "GetDefNames.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiWorksheet
 * @name GetDefName
 * @description Returns the ApiName object by the worksheet name.
 * @returns {ApiName | null} returns null if definition name doesn't exist
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("1")
 * oWorksheet.GetRange("B1").SetValue("2")
 * oWorksheet.AddDefName("numbers", "Sheet1!$A$1:$B$1")
 * const oDefName = oWorksheet.GetDefName("numbers")
 * oWorksheet.GetRange("A3").SetValue("DefName: " + oDefName.GetName())
 * builder.SaveFile("xlsx", "GetDefName.xlsx")
 * builder.CloseFile()
 * @param {String} sName The worksheet name.
 */

/**
 * @memberof ApiWorksheet
 * @name GetFreezePanes
 * @description Returns a freezePanes for a current worsheet.
 * @returns {ApiFreezePanes}
 * @example
 * builder.CreateFile("xlsx")
 * Api.FreezePanes("column")
 * const oWorksheet = Api.GetActiveSheet()
 * const oFreezePanes = oWorksheet.GetFreezePanes()
 * const oRange = oFreezePanes.GetLocation()
 * oWorksheet.GetRange("A1").SetValue("Location: ")
 * oWorksheet.GetRange("B1").SetValue(oRange.GetAddress())
 * builder.SaveFile("xlsx", "GetFreezePanes.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiWorksheet
 * @name GetLeftMargin
 * @description Returns the left margin of the sheet.
 * @returns {Number}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const nLeftMargin = oWorksheet.GetLeftMargin()
 * oWorksheet.GetRange("A1").SetValue("Left margin: " + nLeftMargin + " mm")
 * builder.SaveFile("xlsx", "GetLeftMargin.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiWorksheet
 * @name GetName
 * @description Returns a sheet name.
 * @returns {String}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const sName = oWorksheet.GetName()
 * oWorksheet.GetRange("A1").SetValue("Name: ")
 * oWorksheet.GetRange("B1").SetValue(sName)
 * builder.SaveFile("xlsx", "GetName.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiWorksheet
 * @name GetPrintGridlines
 * @description Returns the page PrintGridlines property which specifies whether the current sheet gridlines must be printed or not.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.SetPrintGridlines(true)
 * oWorksheet.GetRange("A1").SetValue("Gridlines of cells will be printed on this page: " + oWorksheet.GetPrintGridlines())
 * builder.SaveFile("xlsx", "GetPrintGridlines.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiWorksheet
 * @name GetPageOrientation
 * @description Returns the page orientation.
 * @returns {PageOrientation}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const sPageOrientation = oWorksheet.GetPageOrientation()
 * oWorksheet.GetRange("A1").SetValue("Page orientation: ")
 * oWorksheet.GetRange("C1").SetValue(sPageOrientation)
 * builder.SaveFile("xlsx", "GetPageOrientation.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiWorksheet
 * @name GetRangeByNumber
 * @description Returns an object that represents the selected range of the current sheet using the row/column coordinates for the cell selection.
 * @returns {ApiRange}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRangeByNumber(1, 2).SetValue("42")
 * builder.SaveFile("xlsx", "GetRangeByNumber.xlsx")
 * builder.CloseFile()
 * @param {Number} nRow The row number.
 * @param {Number} nCol The column number.
 */

/**
 * @memberof ApiWorksheet
 * @name GetIndex
 * @description Returns a sheet index.
 * @returns {Number}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const nIndex = oWorksheet.GetIndex()
 * oWorksheet.GetRange("A1").SetValue("Index: ")
 * oWorksheet.GetRange("B1").SetValue(nIndex)
 * builder.SaveFile("xlsx", "GetIndex.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiWorksheet
 * @name GetPrintHeadings
 * @description Returns the page PrintHeadings property which specifies whether the current sheet row/column headings must be printed or not.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.SetPrintHeadings(true)
 * oWorksheet.GetRange("A1").SetValue("Row and column headings will be printed with this page: " + oWorksheet.GetPrintHeadings())
 * builder.SaveFile("xlsx", "GetPrintHeadings.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiWorksheet
 * @name GetRange
 * @description Returns an object that represents the selected range of the current sheet. Can be a single cell - A1, or cells from a single row - A1:E1, or cells from a single column - A1:A10, or cells from several rows and columns - A1:E10.
 * @returns {ApiRange | null} returns null if such a range does not exist
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A2").SetValue("2")
 * const oRange = oWorksheet.GetRange("A1:D5")
 * oRange.SetAlignHorizontal("center")
 * builder.SaveFile("xlsx", "GetRange.xlsx")
 * builder.CloseFile()
 * @param {String | ApiRange} Range1 The range of cells from the current sheet.
 * @param {String | ApiRange} Range2 The range of cells from the current sheet.
 */

/**
 * @memberof ApiWorksheet
 * @name GetRightMargin
 * @description Returns the right margin of the sheet.
 * @returns {Number}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const nRightMargin = oWorksheet.GetRightMargin()
 * oWorksheet.GetRange("A1").SetValue("Right margin: " + nRightMargin + " mm")
 * builder.SaveFile("xlsx", "GetRightMargin.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiWorksheet
 * @name GetRows
 * @description Returns the ApiRange object that represents all the cells on the rows range.
 * @returns {ApiRange | null}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRows("1:4").SetFillColor(Api.CreateColorFromRGB(255, 213, 191))
 * builder.SaveFile("xlsx", "GetRows.xlsx")
 * builder.CloseFile()
 * @param {String | Number} value Specifies the rows range in the string or number format.
 */

/**
 * @memberof ApiWorksheet
 * @name GetVisible
 * @description Returns the state of sheet visibility.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.SetVisible(true)
 * const bVisible = oWorksheet.GetVisible()
 * oWorksheet.GetRange("A1").SetValue("Visible: ")
 * oWorksheet.GetRange("B1").SetValue(bVisible)
 * builder.SaveFile("xlsx", "GetVisible.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiWorksheet
 * @name GetUsedRange
 * @description Returns the ApiRange object that represents the used range on the specified worksheet.
 * @returns {ApiRange}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oUsedRange = oWorksheet.GetUsedRange()
 * oUsedRange.SetFillColor(Api.CreateColorFromRGB(255, 213, 191))
 * builder.SaveFile("xlsx", "GetUsedRange.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiWorksheet
 * @name Move
 * @description Moves the current sheet to another location in the workbook.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oSheet1 = Api.GetActiveSheet()
 * Api.AddSheet("Sheet2")
 * const oSheet2 = Api.GetActiveSheet()
 * oSheet2.Move(oSheet1)
 * builder.SaveFile("xlsx", "Move.xlsx")
 * builder.CloseFile()
 * @param {ApiWorksheet} before The sheet before which the current sheet will be placed. You cannot specify "before" if you specify "after"
 * @param {ApiWorksheet} after The sheet after which the current sheet will be placed. You cannot specify "after" if you specify "before".
 */

/**
 * @memberof ApiWorksheet
 * @name GetSelection
 * @description Returns an object that represents the selected range.
 * @returns {ApiRange}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetSelection().SetValue("selected")
 * builder.SaveFile("xlsx", "GetSelection.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiWorksheet
 * @name ReplaceCurrentImage
 * @description Replaces the current image with a new one.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const oDrawing = oWorksheet.AddImage("https://api.onlyoffice.com/content/img/docbuilder/examples/coordinate_aspects.png", 60 * 36000, 35 * 36000, 0, 2 * 36000, 0, 3 * 36000)
 * // todo_example we don't have method ApiDrawing.Select() which is necessary for this example
 * oWorksheet.ReplaceCurrentImage("https://helpcenter.onlyoffice.com/images/Help/GettingStarted/Documents/big/EditDocument.png", 60 * 36000, 35 * 36000)
 * builder.SaveFile("xlsx", "ReplaceCurrentImage.xlsx")
 * builder.CloseFile()
 * @param {String} sImageUrl The image source where the image to be inserted should be taken from (currently only internet URL or Base64 encoded images are supported).
 * @param {EMU} nWidth The image width in English measure units.
 * @param {EMU} nHeight The image height in English measure units.
 */

/**
 * @memberof ApiWorksheet
 * @name SetActive
 * @description Makes the current sheet active.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * Api.AddSheet("New_sheet")
 * const oSheet = Api.GetSheet("New_sheet")
 * oSheet.SetActive()
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A1").SetValue("The current sheet is active.")
 * builder.SaveFile("xlsx", "SetActive.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiWorksheet
 * @name GetTopMargin
 * @description Returns the top margin of the sheet.
 * @returns {Number}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * const nTopMargin = oWorksheet.GetTopMargin()
 * oWorksheet.GetRange("A1").SetValue("Top margin: " + nTopMargin + " mm")
 * builder.SaveFile("xlsx", "GetTopMargin.xlsx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiWorksheet
 * @name SetBottomMargin
 * @description Sets the bottom margin of the sheet.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.SetBottomMargin(25.1)
 * const nBottomMargin = oWorksheet.GetBottomMargin()
 * oWorksheet.GetRange("A1").SetValue("Bottom margin: " + nBottomMargin + " mm")
 * builder.SaveFile("xlsx", "SetBottomMargin.xlsx")
 * builder.CloseFile()
 * @param {Number} nPoints The bottom margin size measured in points.
 */

/**
 * @memberof ApiWorksheet
 * @name SetDisplayGridlines
 * @description Specifies whether the current sheet gridlines must be displayed or not.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A2").SetValue("The sheet settings make it display no gridlines")
 * oWorksheet.SetDisplayGridlines(false)
 * builder.SaveFile("xlsx", "SetDisplayGridlines.xlsx")
 * builder.CloseFile()
 * @param {Boolean=} isDisplayed=true Specifies whether the current sheet gridlines must be displayed or not.
 */

/**
 * @memberof ApiWorksheet
 * @name SetColumnWidth
 * @description Sets the width of the specified column. One unit of column width is equal to the width of one character in the Normal style. For proportional fonts, the width of the character 0 (zero) is used.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.SetColumnWidth(0, 10)
 * oWorksheet.SetColumnWidth(1, 20)
 * builder.SaveFile("xlsx", "SetColumnWidth.xlsx")
 * builder.CloseFile()
 * @param {Number} nColumn The number of the column to set the width to.
 * @param {Number} nWidth The width of the column divided by 7 pixels.
 * @param {Boolean=} bWithotPaddings=false Specifies whether the nWidth will be set witout standart padding.
 */

/**
 * @memberof ApiWorksheet
 * @name SetLeftMargin
 * @description Sets the left margin of the sheet.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.SetLeftMargin(20.8)
 * const nLeftMargin = oWorksheet.GetLeftMargin()
 * oWorksheet.GetRange("A1").SetValue("Left margin: " + nLeftMargin + " mm")
 * builder.SaveFile("xlsx", "SetLeftMargin.xlsx")
 * builder.CloseFile()
 * @param {Number} nPoints The left margin size measured in points.
 */

/**
 * @memberof ApiWorksheet
 * @name SetHyperlink
 * @description Adds a hyperlink to the specified range.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.SetHyperlink("A1", "https://api.onlyoffice.com/docbuilder/basic", "Api ONLYOFFICE", "ONLYOFFICE for developers")
 * builder.SaveFile("xlsx", "SetHyperlink.xlsx")
 * builder.CloseFile()
 * @param {String} sRange The range where the hyperlink will be added to.
 * @param {String} sAddress The link address.
 * @param {String} subAddress The link subaddress to insert internal sheet hyperlinks.
 * @param {String} sScreenTip The screen tip text.
 * @param {String} sTextToDisplay The link text that will be displayed on the sheet.
 */

/**
 * @memberof ApiWorksheet
 * @name SetName
 * @description Sets a name to the current active sheet.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.SetName("sheet 1")
 * const sName = oWorksheet.GetName()
 * oWorksheet.GetRange("A1").SetValue("Worksheet name: ")
 * oWorksheet.GetRange("A1").AutoFit(false, true)
 * oWorksheet.GetRange("B1").SetValue(sName)
 * builder.SaveFile("xlsx", "SetName.xlsx")
 * builder.CloseFile()
 * @param {String} sName The name which will be displayed for the current sheet at the sheet tab.
 */

/**
 * @memberof ApiWorksheet
 * @name SetPrintHeadings
 * @description Specifies whether the current sheet row/column headers must be printed or not.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.SetPrintHeadings(true)
 * oWorksheet.GetRange("A1").SetValue("Row and column headings will be printed with this page: " + oWorksheet.GetPrintHeadings())
 * builder.SaveFile("xlsx", "SetPrintHeadings.xlsx")
 * builder.CloseFile()
 * @param {Boolean} bPrint Specifies whether the current sheet row/column headers must be printed or not.
 */

/**
 * @memberof ApiWorksheet
 * @name SetDisplayHeadings
 * @description Specifies whether the current sheet row/column headers must be displayed or not.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.GetRange("A2").SetValue("The sheet settings make it display no row/column headers")
 * oWorksheet.SetDisplayHeadings(false)
 * builder.SaveFile("xlsx", "SetDisplayHeadings.xlsx")
 * builder.CloseFile()
 * @param {Boolean=} isDisplayed=true Specifies whether the current sheet row/column headers must be displayed or not.
 */

/**
 * @memberof ApiWorksheet
 * @name SetPageOrientation
 * @description Sets the page orientation.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.SetPageOrientation("xlPortrait")
 * const sPageOrientation = oWorksheet.GetPageOrientation()
 * oWorksheet.GetRange("A1").SetValue("Page orientation: ")
 * oWorksheet.GetRange("C1").SetValue(sPageOrientation)
 * builder.SaveFile("xlsx", "SetPageOrientation.xlsx")
 * builder.CloseFile()
 * @param {PageOrientation} sPageOrientation The page orientation type
 */

/**
 * @memberof ApiWorksheet
 * @name SetPrintGridlines
 * @description Specifies whether the current sheet gridlines must be printed or not.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.SetPrintGridlines(true)
 * oWorksheet.GetRange("A1").SetValue("Gridlines of cells will be printed on this page: " + oWorksheet.GetPrintGridlines())
 * builder.SaveFile("xlsx", "SetPrintGridlines.xlsx")
 * builder.CloseFile()
 * @param {Boolean} bPrint Defines if cell gridlines are printed on this page or not.
 */

/**
 * @memberof ApiWorksheet
 * @name SetRightMargin
 * @description Sets the right margin of the sheet.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.SetRightMargin(20.8)
 * const nRightMargin = oWorksheet.GetRightMargin()
 * oWorksheet.GetRange("A1").SetValue("Right margin: " + nRightMargin + " mm")
 * builder.SaveFile("xlsx", "SetRightMargin.xlsx")
 * builder.CloseFile()
 * @param {Number} nPoints The right margin size measured in points.
 */

/**
 * @memberof ApiWorksheet
 * @name SetRowHeight
 * @description Sets the height of the specified row measured in points. A point is 1/72 inch.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.SetRowHeight(0, 30)
 * builder.SaveFile("xlsx", "SetRowHeight.xlsx")
 * builder.CloseFile()
 * @param {Number} nRow The number of the row to set the height to.
 * @param {Number} nHeight The height of the row measured in points.
 */

/**
 * @memberof ApiWorksheet
 * @name SetTopMargin
 * @description Sets the top margin of the sheet.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.SetTopMargin(25.1)
 * const nTopMargin = oWorksheet.GetTopMargin()
 * oWorksheet.GetRange("A1").SetValue("Top margin: " + nTopMargin + " mm")
 * builder.SaveFile("xlsx", "SetTopMargin.xlsx")
 * builder.CloseFile()
 * @param {Number} nPoints The top margin size measured in points.
 */

/**
 * @memberof ApiWorksheet
 * @name SetVisible
 * @description Sets the state of sheet visibility.
 * @returns {void}
 * @example
 * builder.CreateFile("xlsx")
 * const oWorksheet = Api.GetActiveSheet()
 * oWorksheet.SetVisible(true)
 * oWorksheet.GetRange("A1").SetValue("The current worksheet is visible.")
 * builder.SaveFile("xlsx", "SetVisible.xlsx")
 * builder.CloseFile()
 * @param {Boolean} isVisible Specifies if the sheet is visible or not.
 */

/**
 * @class
 * @name Api
 * @description Class representing a base class.
 * @prop {Readonly<Array<ApiComment>>} ApiComments Returns an array of ApiComment objects.
 * @prop {Readonly<ApiWorksheet>} ApiActiveSheet Returns an object that represents the active sheet.
 * @prop {Readonly<String>} ApiFullName Returns the full name of the currently opened file.
 * @prop {Readonly<Array<ApiWorksheet>>} ApiSheets Returns the Sheets collection that represents all the sheets in the active workbook.
 * @prop {FreezePaneType} ApiFreezePanes Returns or sets a freeze panes type.
 * @prop {Readonly<ApiRange>} ApiSelection Returns an object that represents the selected range.
 */

/**
 * @class
 * @name ApiAreas
 * @description Class representing the areas.
 * @prop {Readonly<Number>} ApiAreasCount Returns a value that represents the number of objects in the collection.
 * @prop {Readonly<ApiRange>} ApiAreasParent Returns the parent object for the specified collection.
 */

/**
 * @class
 * @name ApiComment
 * @description Class representing a comment.
 * @prop {String} ApiCommentAuthorName Returns or sets the comment author's name.
 * @prop {Readonly<Number>} ApiCommentRepliesCount Returns a number of the comment replies.
 * @prop {Readonly<String>} ApiCommentId Returns the current comment ID.
 * @prop {Readonly<String | null>} ApiCommentQuoteText Returns the quote text of the current comment. Returns null if comment is added for document.
 * @prop {Number} ApiCommentTime Returns or sets the timestamp of the comment creation in the current time zone format.
 * @prop {Boolean} ApiCommentSolved Checks if a comment is solved or not or marks a comment as solved.
 * @prop {String} ApiCommentText Returns or sets the comment text
 * @prop {Number} ApiCommentTimeUTC Returns or sets the timestamp of the comment creation in UTC format.
 * @prop {String} ApiCommentUserId Returns or sets the user ID of the comment author.
 */

/**
 * @class
 * @name ApiCharacters
 * @description Class representing characters in an object that contains text.
 * @prop {Readonly<ApiRange>} ApiCharactersParent The parent object of the specified characters.
 * @prop {String} ApiCharactersText The string value representing the text of the specified range of characters.
 * @prop {Readonly<ApiFont>} ApiCharactersFont The font of the specified characters.
 * @prop {String} ApiCharactersCaption The text of the specified range of characters.
 * @prop {Readonly<Number>} ApiCharactersCount The number of characters in the collection.
 */

/**
 * @class
 * @name ApiFont
 * @description Class that contains the font attributes (font name, font size, color, and so on).
 * @prop {String | null} ApiFontName The font name.
 * @prop {Boolean | null} ApiFontItalic The font italic property.
 * @prop {ApiColor | null} ApiFontColor The font color property.
 * @prop {Boolean | null} ApiFontBold The font bold property.
 * @prop {Readonly<ApiCharacters>} ApiFontParent The parent object of the specified font object.
 * @prop {Number | null} ApiFontSize The font size property.
 * @prop {XlUnderlineStyle | null} ApiFontUnderline The font type of underline.
 * @prop {Boolean | null} ApiFontStrikethrough The font strikethrough property.
 * @prop {Boolean | null} ApiFontSubscript The font subscript property.
 * @prop {Boolean | null} ApiFontSuperscript The font superscript property.
 */

/**
 * @class
 * @name ApiName
 * @description Class representing a name.
 * @prop {String | Boolean} ApiNameName Sets a name to the active sheet.
 * @prop {String} ApiNameRefersTo Returns or sets a formula that the name is defined to refer to.
 * @prop {Readonly<ApiRange>} ApiNameRefersToRange Returns the ApiRange object by reference.
 */

/**
 * @class
 * @name ApiCommentReply
 * @description Class representing a comment reply.
 * @prop {String} ApiCommentReplyAuthorName Returns or sets the comment reply author's name.
 * @prop {String} ApiCommentReplyText Returns or sets the comment reply text.
 * @prop {Number} ApiCommentReplyTime Returns or sets the timestamp of the comment reply creation in the current time zone format.
 * @prop {String} ApiCommentReplyUserId Returns or sets the user ID of the comment reply author.
 * @prop {Number} ApiCommentReplyTimeUTC Returns or sets the timestamp of the comment reply creation in UTC format.
 */

/**
 * @class
 * @name ApiRange
 * @description Class representing a range.
 * @prop {Setonly<ApiRangeAlignHorizontal>} ApiRangeAlignHorizontal Sets the text horizontal alignment to the current cell range.
 * @prop {Readonly<ApiRange>} ApiRangeCells Returns a Range object that represents all the cells in the specified range or a specified cell.
 * @prop {Readonly<ApiCharacters>} ApiRangeCharacters Returns the ApiCharacters object that represents a range of characters within the object text. Use the ApiCharacters object to format characters within a text string.
 * @prop {Readonly<String>} ApiRangeAddress Returns the range address.
 * @prop {Setonly<ApiRangeBold>} ApiRangeBold Sets the bold property to the text characters from the current cell or cell range.
 * @prop {Readonly<Number>} ApiRangeCol Returns the column number for the selected cell.
 * @prop {Setonly<ApiRangeAlignVertical>} ApiRangeAlignVertical Sets the text vertical alignment to the current cell range.
 * @prop {Number} ApiRangeColumnWidth Returns or sets the width of all the columns in the specified range measured in points.
 * @prop {Readonly<ApiAreas>} ApiRangeAreas Returns a collection of the areas.
 * @prop {Readonly<ApiRange>} ApiRangeCols Returns the ApiRange object that represents the columns of the specified range.
 * @prop {Readonly<ApiName>} ApiRangeDefName Returns the ApiName object.
 * @prop {Setonly<ApiRangeFontName>} ApiRangeFontName Sets the specified font family as the font name for the current cell range.
 * @prop {Setonly<ApiRangeFontColor>} ApiRangeFontColor Sets the text color to the current cell range with the previously created color object.
 * @prop {Readonly<ApiComment | null>} ApiRangeComments Returns the ApiComment collection that represents all the comments from the specified worksheet. Returns null if range does not consist of one cell.
 * @prop {Readonly<Number>} ApiRangeCount Returns the cells count in the currrent range.
 * @prop {Setonly<ApiRangeFontSize>} ApiRangeFontSize Sets the font size to the characters of the current cell range.
 * @prop {ApiColor | String} ApiRangeFillColor Returns or sets the background color of the current cell range. Return 'No Fill' when the color to the background in the cell / cell range is null.
 * @prop {String | Array<Array>} ApiRangeFormula Returns a formula from the first cell of the specified range or sets it to this cell.
 * @prop {Setonly<ApiRangeItalic>} ApiRangeItalic Sets the italic property to the text characters in the current cell or cell range.
 * @prop {XlNumberFormat | null} ApiRangeNumberFormat Sets a value that represents the format code for the object. Returns null if all cells in the specified range don't have the same number format.
 * @prop {Readonly<ApiRange>} ApiRangeMergeArea Returns the cell or cell range from the merge area.
 * @prop {Angle} ApiRangeOrientation Sets an angle to the current cell range.
 * @prop {Boolean} ApiRangeHidden Returns or sets the value hiding property. Returns true if the values in the range specified are hidden.
 * @prop {Readonly<Number>} ApiRangeHeight Returns a value that represents the range height measured in points.
 * @prop {Readonly<Number>} ApiRangeRow Returns the row number for the selected cell.
 * @prop {Setonly<ApiRangeStrikeout>} ApiRangeStrikeout Sets a value that indicates whether the contents of the current cell or cell range are displayed struck through.
 * @prop {String | Array<Array>} ApiRangeText Returns the text from the first cell of the specified range or sets it to this cell.
 * @prop {String | Array<Array>} ApiRangeValue Returns a value from the first cell of the specified range or sets it to this cell.
 * @prop {Readonly<ApiRange>} ApiRangeRows Returns the ApiRange object that represents the rows of the specified range.
 * @prop {Setonly<ApiRangeUnderline>} ApiRangeUnderline Sets the type of underline applied to the font.
 * @prop {pt} ApiRangeRowHeight Returns or sets the height of the first row in the specified range measured in points.
 * @prop {Readonly<Number>} ApiRangeWidth Returns a value that represents the range width measured in points.
 * @prop {Boolean} ApiRangeWrapText Returns the information about the wrapping cell style or specifies whether the words in the cell must be wrapped to fit the cell size or not.
 * @prop {String | Array<Array>} ApiRangeValue2 Returns the value2 (value without format) from the first cell of the specified range or sets it to this cell.
 * @prop {Readonly<ApiWorksheet>} ApiRangeWorksheet Returns the ApiWorksheet object that represents the worksheet containing the specified range.
 */

/**
 * @class
 * @name ApiUniColor
 * @description Returns a type of the ApiUniColor class.
 * @prop ApiUniColor
 */

/**
 * @class
 * @name ApiWorksheet
 * @description Class representing a sheet.
 * @prop {Readonly<ApiRange>} ApiWorksheetActiveCell Returns an object that represents an active cell.
 * @prop {Readonly<Array<ApiComment>>} ApiWorksheetComments Returns an array of the ApiComment objects.
 * @prop {Setonly<ApiWorksheetActive>} ApiWorksheetActive Makes the current sheet active.
 * @prop {Readonly<ApiRange>} ApiWorksheetCols Returns ApiRange that represents all the cells of the columns range.
 * @prop {Readonly<Array<ApiName>>} ApiWorksheetDefnames Returns an array of the ApiName objects.
 * @prop {Readonly<ApiFreezePanes>} ApiWorksheetFreezePanes Returns a freezePanes for a current worsheet.
 * @prop {Number} ApiWorksheetLeftMargin Returns or sets the size of the sheet left margin measured in points.
 * @prop {Readonly<Number>} ApiWorksheetIndex Returns a sheet index.
 * @prop {PageOrientation} ApiWorksheetPageOrientation Returns or sets the page orientation.
 * @prop {String} ApiWorksheetName Returns or sets a name of the active sheet.
 * @prop {Number} ApiWorksheetRightMargin Returns or sets the size of the sheet right margin measured in points.
 * @prop {Readonly<ApiRange>} ApiWorksheetRows Returns ApiRange that represents all the cells of the rows range.
 * @prop {Readonly<ApiRange>} ApiWorksheetSelection Returns an object that represents the selected range.
 * @prop {Number} ApiWorksheetTopMargin Returns or sets the size of the sheet top margin measured in points.
 * @prop {Readonly<ApiRange>} ApiWorksheetCells Returns ApiRange that represents all the cells on the worksheet (not just the cells that are currently in use).
 * @prop {Boolean} ApiWorksheetPrintGridlines Returns or sets the page PrintGridlines property.
 * @prop {Readonly<ApiRange>} ApiWorksheetUsedRange Returns ApiRange that represents the used range on the specified worksheet.
 * @prop {Boolean} ApiWorksheetPrintHeadings Returns or sets the page PrintHeadings property.
 * @prop {Boolean} ApiWorksheetVisible Returns or sets the state of sheet visibility.
 * @prop {Number} ApiWorksheetBottomMargin Returns or sets the size of the sheet bottom margin measured in points.
 */