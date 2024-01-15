

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
 * @name ApiFill
 * @description Class representing a base class for fill.
 */

/**
 * @class
 * @name ApiDrawing
 * @description Class representing a graphical object.
 */

/**
 * @class
 * @name ApiImage
 * @description Class representing an image.
 */

/**
 * @class
 * @name ApiGradientStop
 * @description Class representing gradient stop.
 */

/**
 * @class
 * @name ApiMaster
 * @description Class representing a slide master.
 */

/**
 * @class
 * @name ApiDocumentContent
 * @description Class representing a container for paragraphs and tables.
 */

/**
 * @class
 * @name ApiLayout
 * @description Class representing a slide layout.
 */

/**
 * @class
 * @name ApiOleObject
 * @description Class representing an OLE object.
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
 * @name ApiPlaceholder
 * @description Class representing a placeholder.
 */

/**
 * @class
 * @name ApiPresentation
 * @description Class representing a presentation.
 */

/**
 * @class
 * @name ApiRGBColor
 * @description Class representing a RGB color.
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
 * @name ApiTable
 * @description Class representing a table.
 */

/**
 * @class
 * @name ApiSlide
 * @description Class representing a slide.
 */

/**
 * @class
 * @name ApiTableRow
 * @description Class representing a table row.
 */

/**
 * @class
 * @name ApiTableCell
 * @description Class representing a table cell.
 */

/**
 * @class
 * @name ApiStroke
 * @description Class representing a stroke.
 */

/**
 * @class
 * @name ApiTheme
 * @description Class representing a theme.
 */

/**
 * @class
 * @name ApiThemeColorScheme
 * @description Class representing a theme color scheme.
 */

/**
 * @class
 * @name ApiTextPr
 * @description Class representing a text properties.
 */

/**
 * @class
 * @name ApiThemeFontScheme
 * @description Class representing a theme font scheme.
 */

/**
 * @class
 * @name ApiUniColor
 * @description Class representing a uni color types.
 */

/**
 * @class
 * @name ApiThemeFormatScheme
 * @description Class representing a theme format scheme.
 */

/**
 * @memberof ApiBullet
 * @name GetClassType
 * @description Returns a type of the ApiBullet class.
 * @returns {String}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * let oParagraph = oDocContent.GetElement(0)
 * const oBullet = Api.CreateBullet("-")
 * oParagraph.SetBullet(oBullet)
 * oParagraph.AddText(" This is an example of the bulleted paragraph.")
 * const sClassType = oBullet.GetClassType()
 * oParagraph = Api.CreateParagraph()
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Class Type = " + sClassType)
 * oDocContent.Push(oParagraph)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetClassType.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof Api
 * @name CreateChart
 * @description Creates a chart with the parameters specified.
 * @returns {ApiChart}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24, [
 *   "0",
 *   "0.00"
 * ])
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * oChart.SetShowPointDataLabel(1, 0, false, false, true, false)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "CreateChart.pptx")
 * builder.CloseFile()
 * @param {ChartType} sType=bar The chart type used for the chart display.
 * @param {Array} aSeries The array of the data used to build the chart from.
 * @param {Array} aSeriesNames The array of the names (the source table column names) used for the data which the chart will be build from.
 * @param {Array} aCatNames The array of the names (the source table row names) used for the data which the chart will be build from.
 * @param {EMU} nWidth The chart width in English measure units.
 * @param {EMU} nHeight The chart height in English measure units.
 * @param {Number} nStyleIndex The chart color style index (can be 1 - 48, as described in OOXML specification).
 * @param {Array<NumFormat> | Array} aNumFormats Numeric formats which will be applied to the series (can be custom formats). The default numeric format is "General".
 */

/**
 * @memberof Api
 * @name CreateBullet
 * @description Creates a bullet for a paragraph with the character or symbol specified with the sSymbol parameter.
 * @returns {ApiBullet}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oBullet = Api.CreateBullet("-")
 * oParagraph.SetBullet(oBullet)
 * oParagraph.AddText(" This is an example of the bulleted paragraph.")
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "CreateBullet.pptx")
 * builder.CloseFile()
 * @param {String=} sSymbol The character or symbol which will be used to create the bullet for the paragraph.
 */

/**
 * @event Api#onHyperlinkClick
 * @description Occurs when a some hyperlink is clicked.
 * @example
 * Api.attachEvent("asc_onHyperlinkClick", () => {
 *   console.log("HYPERLINK!!!")
 * })
 * @param {Function} callback Function to be called when the event fires.
 */

/**
 * @memberof Api
 * @name CreateGroup
 * @description Creates a group of drawings.
 * @returns {ApiGroup}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill1 = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oFill2 = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape1 = Api.CreateShape("rect", 300 * 36000, 130 * 36000, oFill1, oStroke)
 * const oShape2 = Api.CreateShape("rect", 150 * 36000, 80 * 36000, oFill2, oStroke)
 * const oGroup = Api.CreateGroup([
 *   oShape1,
 *   oShape2
 * ])
 * oShape1.SetPosition(608400, 1267200)
 * oShape2.SetPosition(3100000, 1867200)
 * oSlide.AddObject(oGroup)
 * builder.SaveFile("pptx", "CreateGroup.pptx")
 * builder.CloseFile()
 * @param {Array<ApiDrawing>} aDrawings The array of drawings.
 */

/**
 * @memberof Api
 * @name CreateGradientStop
 * @description Creates a gradient stop used for different types of gradients.
 * @returns {ApiGradientStop}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oDrawing = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oSlide.AddObject(oDrawing)
 * oDrawing.SetPosition(608400, 1267200)
 * builder.SaveFile("pptx", "CreateGradientStop.pptx")
 * builder.CloseFile()
 * @param {ApiUniColor} oUniColor The color used for the gradient stop.
 * @param {PositivePercentage} nPos The position of the gradient stop measured in 1000th of percent.
 */

/**
 * @memberof Api
 * @name CreateLayout
 * @description Creates a new slide layout and adds it to the slide master if it is specified.
 * @returns {ApiLayout}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide1 = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * const oLayout = Api.CreateLayout(oMaster)
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oPlaceholder = Api.CreatePlaceholder("picture")
 * oShape.SetPlaceholder(oPlaceholder)
 * oLayout.AddObject(oShape)
 * oSlide1.ApplyLayout(oLayout)
 * const oSlide2 = Api.CreateSlide()
 * oPresentation.AddSlide(oSlide2)
 * oSlide2.ApplyLayout(oLayout)
 * builder.SaveFile("pptx", "CreateLayout.pptx")
 * builder.CloseFile()
 * @param {ApiMaster=} oMaster=null Parent slide master.
 */

/**
 * @memberof Api
 * @name CreateLinearGradientFill
 * @description Creates a linear gradient fill to apply to the object using the selected linear gradient as the object background.
 * @returns {ApiFill}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateLinearGradientFill([
 *   oGs1,
 *   oGs2
 * ], 5400000)
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oDrawing = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oSlide.AddObject(oDrawing)
 * oDrawing.SetPosition(608400, 1267200)
 * builder.SaveFile("pptx", "CreateLinearGradientFill.pptx")
 * builder.CloseFile()
 * @param {Array<ApiGradientStop>} aGradientStop The array of gradient color stops measured in 1000th of percent.
 * @param {PositiveFixedAngle} Angle The angle measured in 60000th of a degree that will define the gradient direction.
 */

/**
 * @memberof Api
 * @name CreateBlipFill
 * @description Creates a blip fill to apply to the object using the selected image as the object background.
 * @returns {ApiFill}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateBlipFill("https://api.onlyoffice.com/content/img/docbuilder/examples/icon_DocumentEditors.png", "tile")
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oDrawing = Api.CreateShape("star10", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oDrawing.SetPosition(608400, 1267200)
 * oSlide.AddObject(oDrawing)
 * builder.SaveFile("pptx", "CreateBlipFill.pptx")
 * builder.CloseFile()
 * @param {String} sImageUrl The path to the image used for the blip fill (currently only internet URL or Base64 encoded images are supported).
 * @param {BlipFillType} name The type of the fill used for the blip fill. (tile or stretch).
 */

/**
 * @memberof Api
 * @name CreateImage
 * @description Creates an image with the parameters specified.
 * @returns {ApiImage}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oShape = Api.CreateImage("https://api.onlyoffice.com/content/img/docbuilder/examples/step2_1.png", 300 * 36000, 150 * 36000)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "CreateImage.pptx")
 * builder.CloseFile()
 * @param {String} sImageSrc The image source where the image to be inserted should be taken from (currently only internet URL or Base64 encoded images are supported).
 * @param {EMU} nWidth The image width in English measure units.
 * @param {EMU} nHeight The image height in English measure units.
 */

/**
 * @memberof Api
 * @name CreateMaster
 * @description Creates a new slide master.
 * @returns {ApiMaster | null} returns null if presentation theme doesn't exist
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = Api.CreateMaster()
 * const nCountBefore = oPresentation.GetMastersCount()
 * oPresentation.AddMaster(nCountBefore, oMaster)
 * const nCountAfter = oPresentation.GetMastersCount()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Number of masters before adding new master: " + nCountBefore)
 * oParagraph.AddLineBreak()
 * oParagraph.AddText("Number of masters after adding new master: " + nCountAfter)
 * oSlide.RemoveAllObjects()
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "CreateMaster.pptx")
 * builder.CloseFile()
 * @param {ApiTheme=} oTheme The presentation theme object. Default value is "ApiPresentation.GetMaster(0).GetTheme()"
 */

/**
 * @memberof Api
 * @name CreateNumbering
 * @description Creates a bullet for a paragraph with the numbering character or symbol specified with the sType parameter.
 * @returns {ApiBullet}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * let oParagraph = oDocContent.GetElement(0)
 * const oBullet = Api.CreateNumbering("ArabicParenR", 1)
 * oParagraph.SetBullet(oBullet)
 * oParagraph.AddText(" This is an example of the numbered paragraph.")
 * oParagraph = Api.CreateParagraph()
 * oParagraph.SetBullet(oBullet)
 * oParagraph.AddText(" This is an example of the numbered paragraph.")
 * oDocContent.Push(oParagraph)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "CreateNumbering.pptx")
 * builder.CloseFile()
 * @param {BulletType} sType The numbering type the paragraphs will be numbered with.
 * @param {Number=} nStartAt The number the first numbered paragraph will start with.
 */

/**
 * @memberof Api
 * @name CreateOleObject
 * @description Creates an OLE object with the parameters specified.
 * @returns {ApiOleObject}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oOleObject = Api.CreateOleObject("https://api.onlyoffice.com/content/img/docbuilder/examples/ole-object-image.png", 130 * 36000, 90 * 36000, "https://youtu.be/SKGz4pmnpgY", "asc.{38E022EA-AD92-45FC-B22B-49DF39746DB4}")
 * oOleObject.SetSize(200 * 36000, 130 * 36000)
 * oOleObject.SetPosition(70 * 36000, 30 * 36000)
 * oSlide.AddObject(oOleObject)
 * builder.SaveFile("pptx", "CreateOleObject.pptx")
 * builder.CloseFile()
 * @param {String} sImageSrc The image source where the image to be inserted should be taken from (currently, only internet URL or Base64 encoded images are supported).
 * @param {EMU} nWidth The OLE object width in English measure units.
 * @param {EMU} nHeight The OLE object height in English measure units.
 * @param {String} sData The OLE object string data.
 * @param {String} sAppId The application ID associated with the current OLE object.
 */

/**
 * @memberof Api
 * @name CreatePatternFill
 * @description Creates a pattern fill to apply to the object using the selected pattern as the object background.
 * @returns {ApiFill}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreatePatternFill("dashDnDiag", Api.CreateRGBColor(255, 111, 61), Api.CreateRGBColor(51, 51, 51))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oDrawing = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oSlide.AddObject(oDrawing)
 * oDrawing.SetPosition(608400, 1267200)
 * builder.SaveFile("pptx", "CreatePatternFill.pptx")
 * builder.CloseFile()
 * @param {PatternType} sPatternType
 * @param The pattern type used for the fill selected from one of the available pattern types.
 * @param {ApiUniColor} BgColor The background color used for the pattern creation.
 * @param {ApiUniColor} FgColor The foreground color used for the pattern creation.
 */

/**
 * @memberof Api
 * @name CreateNoFill
 * @description Creates no fill and removes the fill from the element.
 * @returns {ApiFill}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("The stroke of this shape is transparent.")
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "CreateNoFill.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof Api
 * @name CreateParagraph
 * @description Creates a new paragraph.
 * @returns {ApiParagraph}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * oDocContent.RemoveAllElements()
 * const oParagraph = Api.CreateParagraph()
 * oParagraph.SetJc("left")
 * oParagraph.AddText("This is an example of a paragraph inside a shape. Nothing special.")
 * oDocContent.Push(oParagraph)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "CreateParagraph.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof Api
 * @name CreatePlaceholder
 * @description Creates a new placeholder.
 * @returns {ApiPlaceholder}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oPlaceholder = Api.CreatePlaceholder("picture")
 * oShape.SetPlaceholder(oPlaceholder)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "CreatePlaceholder.pptx")
 * builder.CloseFile()
 * @param {PlaceholderTypes} sType The placeholder type
 */

/**
 * @memberof Api
 * @name CreatePresetColor
 * @description Creates a color selecting it from one of the available color presets.
 * @returns {ApiPresetColor}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreatePresetColor("peachPuff"), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oDrawing = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oSlide.AddObject(oDrawing)
 * oDrawing.SetPosition(608400, 1267200)
 * builder.SaveFile("pptx", "CreatePresetColor.pptx")
 * builder.CloseFile()
 * @param {PresetColor} sPresetColor A preset selected from the list of the available color preset names.
 */

/**
 * @memberof Api
 * @name CreateSchemeColor
 * @description Creates a complex color scheme selecting from one of the available schemes.
 * @returns {ApiSchemeColor}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oSchemeColor = Api.CreateSchemeColor("dk1")
 * const oFill = Api.CreateSolidFill(oSchemeColor)
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oDrawing = Api.CreateShape("curvedUpArrow", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oSlide.AddObject(oDrawing)
 * oDrawing.SetPosition(608400, 1267200)
 * builder.SaveFile("pptx", "CreateSchemeColor.pptx")
 * builder.CloseFile()
 * @param {SchemeColorId} sSchemeColorId The color scheme identifier.
 */

/**
 * @memberof Api
 * @name CreateShape
 * @description Creates a shape with the parameters specified.
 * @returns {ApiShape}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * let oRun = Api.CreateRun()
 * oRun.SetFontSize(60)
 * oRun.AddText("This is just a sample text. ")
 * oParagraph.AddElement(oRun)
 * oRun = Api.CreateRun()
 * oRun.SetFontSize(60)
 * oRun.SetFontFamily("Comic Sans MS")
 * oRun.AddText("This is a text run with the font family set to 'Comic Sans MS'.")
 * oParagraph.AddElement(oRun)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "CreateShape.pptx")
 * builder.CloseFile()
 * @param {ShapeType=} sType=rect The shape type which specifies the preset shape geometry.
 * @param {EMU=} nWidth=914400 The shape width in English measure units.
 * @param {EMU=} nHeight=914400 The shape height in English measure units.
 * @param {ApiFill=} oFill=Api.CreateNoFill() The color or pattern used to fill the shape.
 * @param {ApiStroke=} oStroke=Api.CreateStroke(0, Api.CreateNoFill()) The stroke used to create the element shadow.
 */

/**
 * @memberof Api
 * @name CreateRun
 * @description Creates a new smaller text block to be inserted to the current paragraph or table.
 * @returns {ApiRun}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * let oRun = Api.CreateRun()
 * oRun.SetFontSize(60)
 * oRun.AddText("This is just a sample text. ")
 * oParagraph.AddElement(oRun)
 * oRun = Api.CreateRun()
 * oRun.SetFontSize(60)
 * oRun.SetFontFamily("Comic Sans MS")
 * oRun.AddText("This is a text run with the font family set to 'Comic Sans MS'.")
 * oParagraph.AddElement(oRun)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "CreateRun.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof Api
 * @name CreateSolidFill
 * @description Creates a solid fill to apply to the object using a selected solid color as the object background.
 * @returns {ApiFill}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oRGBColor = Api.CreateRGBColor(255, 111, 61)
 * const oFill = Api.CreateSolidFill(oRGBColor)
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oDrawing = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oSlide.AddObject(oDrawing)
 * oDrawing.SetPosition(608400, 1267200)
 * builder.SaveFile("pptx", "CreateSolidFill.pptx")
 * builder.CloseFile()
 * @param {ApiUniColor} oUniColor The color used for the element fill.
 */

/**
 * @memberof Api
 * @name CreateStroke
 * @description Creates a stroke adding shadows to the element.
 * @returns {ApiStroke}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateLinearGradientFill([
 *   oGs1,
 *   oGs2
 * ], 5400000)
 * const oFill1 = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * const oStroke = Api.CreateStroke(3 * 36000, oFill1)
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oSlide.AddObject(oShape)
 * oShape.SetPosition(608400, 1267200)
 * builder.SaveFile("pptx", "CreateStroke.pptx")
 * builder.CloseFile()
 * @param {EMU} nWidth The width of the shadow measured in English measure units.
 * @param {ApiFill} oFill The fill type used to create the shadow.
 */

/**
 * @memberof Api
 * @name CreateRadialGradientFill
 * @description Creates a radial gradient fill to apply to the object using the selected radial gradient as the object background.
 * @returns {ApiFill}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreatePresetColor("peachPuff"), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oDrawing = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oSlide.AddObject(oDrawing)
 * oDrawing.SetPosition(608400, 1267200)
 * builder.SaveFile("pptx", "CreateRadialGradientFill.pptx")
 * builder.CloseFile()
 * @param {Array<ApiGradientStop>} aGradientStop The array of gradient color stops measured in 1000th of percent.
 */

/**
 * @memberof Api
 * @name CreateRGBColor
 * @description Creates a RGB color setting the appropriate values for the red, green and blue color components.
 * @returns {ApiRGBColor}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oRGBColor = Api.CreateRGBColor(255, 111, 61)
 * const oGs1 = Api.CreateGradientStop(Api.CreatePresetColor("peachPuff"), 0)
 * const oGs2 = Api.CreateGradientStop(oRGBColor, 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oDrawing = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oSlide.AddObject(oDrawing)
 * oDrawing.SetPosition(608400, 1267200)
 * builder.SaveFile("pptx", "CreateRGBColor.pptx")
 * builder.CloseFile()
 * @param {byte} r Red color component value.
 * @param {byte} g Green color component value.
 * @param {byte} b Blue color component value.
 */

/**
 * @memberof Api
 * @name CreateTable
 * @description Creates a new table with a specified number of rows and columns.
 * @returns {ApiTable | null}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oTable = Api.CreateTable(2, 4)
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * oSlide.AddObject(oTable)
 * builder.SaveFile("pptx", "CreateTable.pptx")
 * builder.CloseFile()
 * @param {Number} nCols Number of columns.
 * @param {Number} nCols Number of rows.
 */

/**
 * @memberof Api
 * @name CreateSlide
 * @description Creates a new slide.
 * @returns {ApiSlide}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = Api.CreateSlide()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * oSlide.SetBackground(oFill)
 * oPresentation.AddSlide(oSlide)
 * builder.SaveFile("pptx", "CreateSlide.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof Api
 * @name CreateTextPr
 * @description Creates the empty text properties.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * oDocContent.RemoveAllElements()
 * const oTextPr = Api.CreateTextPr()
 * oTextPr.SetFontSize(50)
 * oTextPr.SetBold(true)
 * const oParagraph = Api.CreateParagraph()
 * oParagraph.SetJc("left")
 * const oRun = Api.CreateRun()
 * oRun.AddText("This is a sample text with the font size set to 25 points and the font weight set to bold.")
 * oRun.SetTextPr(oTextPr)
 * oParagraph.AddElement(oRun)
 * oDocContent.Push(oParagraph)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "CreateTextPr.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof Api
 * @name CreateThemeFontScheme
 * @description Creates a new theme font scheme.
 * @returns {ApiThemeFontScheme}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * const oClrScheme = Api.CreateThemeColorScheme([
 *   Api.CreateRGBColor(255, 111, 61),
 *   Api.CreateRGBColor(51, 51, 51),
 *   Api.CreateRGBColor(230, 179, 117),
 *   Api.CreateRGBColor(235, 235, 235),
 *   Api.CreateRGBColor(163, 21, 21),
 *   Api.CreateRGBColor(128, 43, 43),
 *   Api.CreateRGBColor(0, 0, 0),
 *   Api.CreateRGBColor(128, 128, 128),
 *   Api.CreateRGBColor(176, 196, 222),
 *   Api.CreateRGBColor(65, 105, 225),
 *   Api.CreateRGBColor(255, 255, 255),
 *   Api.CreateRGBColor(255, 213, 191)
 * ], "New color scheme")
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill1 = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oBgFill1 = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke1 = Api.CreateStroke(1 * 36000, oFill1)
 * const oFill2 = Api.CreatePatternFill("dashDnDiag", Api.CreateRGBColor(255, 111, 61), Api.CreateRGBColor(51, 51, 51))
 * const oBgFill2 = Api.CreatePatternFill("dashDnDiag", Api.CreateRGBColor(255, 111, 61), Api.CreateRGBColor(51, 51, 51))
 * const oStroke2 = Api.CreateStroke(1 * 36000, oFill2)
 * const oFill3 = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oBgFill3 = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke3 = Api.CreateStroke(1 * 36000, oFill3)
 * const oFormatScheme = Api.CreateThemeFormatScheme([
 *   oFill1,
 *   oFill2,
 *   oFill3
 * ], [
 *   oBgFill1,
 *   oBgFill2,
 *   oBgFill3
 * ], [
 *   oStroke1,
 *   oStroke2,
 *   oStroke3
 * ], "New format scheme")
 * const oFontScheme = Api.CreateThemeFontScheme("Arial", "Noto Sans Simplified Chinese", "Arabic", "Times New Roman", "Noto Serif Simplified Chinese", "Arabic", "New font scheme")
 * const oTheme = Api.CreateTheme("New theme", oMaster, oClrScheme, oFormatScheme, oFontScheme)
 * oPresentation.ApplyTheme(oTheme)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("This text is written in the Times New Roman font.")
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "CreateThemeFontScheme.pptx")
 * builder.CloseFile()
 * @param {String} mjLatin The major theme font applied to the latin text.
 * @param {String} mjEa The major theme font applied to the east asian text.
 * @param {String} mjCs The major theme font applied to the complex script text.
 * @param {String} mnLatin The minor theme font applied to the latin text.
 * @param {String} mnEa The minor theme font applied to the east asian text.
 * @param {String} mnCs The minor theme font applied to the complex script text.
 * @param {String} sName Theme font scheme name.
 */

/**
 * @memberof Api
 * @name CreateThemeFormatScheme
 * @description Creates a new theme format scheme.
 * @returns {ApiThemeFormatScheme | null}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * const oClrScheme = Api.CreateThemeColorScheme([
 *   Api.CreateRGBColor(255, 111, 61),
 *   Api.CreateRGBColor(51, 51, 51),
 *   Api.CreateRGBColor(230, 179, 117),
 *   Api.CreateRGBColor(235, 235, 235),
 *   Api.CreateRGBColor(163, 21, 21),
 *   Api.CreateRGBColor(128, 43, 43),
 *   Api.CreateRGBColor(0, 0, 0),
 *   Api.CreateRGBColor(128, 128, 128),
 *   Api.CreateRGBColor(176, 196, 222),
 *   Api.CreateRGBColor(65, 105, 225),
 *   Api.CreateRGBColor(255, 255, 255),
 *   Api.CreateRGBColor(255, 213, 191)
 * ], "New color scheme")
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill1 = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oBgFill1 = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke1 = Api.CreateStroke(1 * 36000, oFill1)
 * const oFill2 = Api.CreatePatternFill("dashDnDiag", Api.CreateRGBColor(255, 111, 61), Api.CreateRGBColor(51, 51, 51))
 * const oBgFill2 = Api.CreatePatternFill("dashDnDiag", Api.CreateRGBColor(255, 111, 61), Api.CreateRGBColor(51, 51, 51))
 * const oStroke2 = Api.CreateStroke(1 * 36000, oFill2)
 * const oFill3 = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oBgFill3 = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke3 = Api.CreateStroke(1 * 36000, oFill3)
 * const oFormatScheme = Api.CreateThemeFormatScheme([
 *   oFill1,
 *   oFill2,
 *   oFill3
 * ], [
 *   oBgFill1,
 *   oBgFill2,
 *   oBgFill3
 * ], [
 *   oStroke1,
 *   oStroke2,
 *   oStroke3
 * ], "New format scheme")
 * const oFontScheme = Api.CreateThemeFontScheme("Arial", "Noto Sans Simplified Chinese", "Arabic", "Times New Roman", "Noto Serif Simplified Chinese", "Arabic", "New font scheme")
 * const oTheme = Api.CreateTheme("New theme", oMaster, oClrScheme, oFormatScheme, oFontScheme)
 * oPresentation.ApplyTheme(oTheme)
 * builder.SaveFile("pptx", "CreateThemeFormatScheme.pptx")
 * builder.CloseFile()
 * @param {Array<ApiFill>} arrFill This array contains the fill styles. It should be consist of subtle, moderate and intense fills.
 * @param {Array<ApiFill>} arrBgFill This array contains the background fill styles. It should be consist of subtle, moderate and intense fills.
 * @param {Array<ApiStroke>} arrLine This array contains the line styles. It should be consist of subtle, moderate and intense lines.
 * @param {String} sName Theme format scheme name.
 */

/**
 * @memberof Api
 * @name CreateWordArt
 * @description Creates a Text Art object with the parameters specified.
 * @returns {ApiDrawing}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oRun = Api.CreateRun()
 * const oTextPr = oRun.GetTextPr()
 * oTextPr.SetFontSize(72)
 * oTextPr.SetBold(true)
 * oTextPr.SetCaps(true)
 * oTextPr.SetColor(51, 51, 51, false)
 * oTextPr.SetFontFamily("Comic Sans MS")
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(1 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51)))
 * const oTextArt = Api.CreateWordArt(oTextPr, "onlyoffice", "textArchUp", oFill, oStroke, 0, 100 * 36000, 30 * 36000)
 * oSlide.AddObject(oTextArt)
 * builder.SaveFile("pptx", "CreateWordArt.pptx")
 * builder.CloseFile()
 * @param {ApiTextPr=} oTextPr=Api.CreateTextPr() The text properties.
 * @param {String=} sText=Your text here The text for the Text Art object.
 * @param {TextTransform=} sTransform=textNoShape Text transform type.
 * @param {ApiFill=} oFill=Api.CreateNoFill() The color or pattern used to fill the Text Art object.
 * @param {ApiStroke=} oStroke=Api.CreateStroke(0, Api.CreateNoFill()) The stroke used to create the Text Art object shadow.
 * @param {Number=} nRotAngle=0 Rotation angle.
 * @param {EMU=} nWidth=1828800 The Text Art width measured in English measure units.
 * @param {EMU=} nHeight=1828800 The Text Art heigth measured in English measure units.
 * @param {EMU=} nIndLeft=ApiPresentation.GetWidth() / 2 The Text Art left side indentation value measured in English measure units.
 * @param {EMU=} nIndTop=ApiPresentation.GetHeight() / 2 The Text Art top side indentation value measured in English measure units.
 */

/**
 * @memberof Api
 * @name FromJSON
 * @description Converts the specified JSON object into the Document Builder object of the corresponding type.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oMaster = oPresentation.GetMaster(0)
 * const oThemeMaster = oMaster.GetTheme()
 * const oFontScheme = oThemeMaster.GetFontScheme()
 * oFontScheme.SetFonts("Arial", "Noto Sans Simplified Chinese", "Arabic", "Times New Roman", "Noto Serif Simplified Chinese", "Arabic", "New font scheme")
 * oFontScheme.SetSchemeName("New font scheme name")
 * const json = oFontScheme.ToJSON()
 * const oFontSchemeFromJSON = Api.FromJSON(json)
 * const oTheme = oSlide.GetTheme()
 * oTheme.SetFontScheme(oFontSchemeFromJSON)
 * const sType = oFontSchemeFromJSON.GetClassType()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Class type = " + sType)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "FromJSON.pptx")
 * builder.CloseFile()
 * @param {JSON} sMessage The JSON object to convert.
 */

/**
 * @memberof Api
 * @name CreateThemeColorScheme
 * @description Creates a new theme color scheme.
 * @returns {ApiThemeColorScheme}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oClrScheme = Api.CreateThemeColorScheme([
 *   Api.CreateRGBColor(255, 111, 61),
 *   Api.CreateRGBColor(51, 51, 51),
 *   Api.CreateRGBColor(230, 179, 117),
 *   Api.CreateRGBColor(235, 235, 235),
 *   Api.CreateRGBColor(163, 21, 21),
 *   Api.CreateRGBColor(128, 43, 43),
 *   Api.CreateRGBColor(0, 0, 0),
 *   Api.CreateRGBColor(128, 128, 128),
 *   Api.CreateRGBColor(176, 196, 222),
 *   Api.CreateRGBColor(65, 105, 225),
 *   Api.CreateRGBColor(255, 255, 255),
 *   Api.CreateRGBColor(255, 213, 191)
 * ], "New color scheme")
 * const oTheme = oSlide.GetTheme()
 * oTheme.SetColorScheme(oClrScheme)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetVerAxisTitle("USD In Hundred Thousands", 10)
 * oChart.SetHorAxisTitle("Year", 11)
 * oChart.SetLegendPos("bottom")
 * oChart.SetShowDataLabels(false, false, true, false)
 * oChart.SetTitle("Financial Overview", 20)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "CreateThemeColorScheme.pptx")
 * builder.CloseFile()
 * @param {Array<ApiUniColor> | Array<ApiRGBColor>} arrColors Set of colors which are referred to as a color scheme. The color scheme is responsible for defining a list of twelve colors. The array should contain a sequence of colors: 2 dark, 2 light, 6 primary, a color for a hyperlink and a color for the followed hyperlink.
 * @param {string} sName Theme color scheme name.
 */

/**
 * @memberof Api
 * @name CreateTheme
 * @description Creates a new presentation theme.
 * @returns {ApiTheme | null}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * const oClrScheme = Api.CreateThemeColorScheme([
 *   Api.CreateRGBColor(255, 111, 61),
 *   Api.CreateRGBColor(51, 51, 51),
 *   Api.CreateRGBColor(230, 179, 117),
 *   Api.CreateRGBColor(235, 235, 235),
 *   Api.CreateRGBColor(163, 21, 21),
 *   Api.CreateRGBColor(128, 43, 43),
 *   Api.CreateRGBColor(0, 0, 0),
 *   Api.CreateRGBColor(128, 128, 128),
 *   Api.CreateRGBColor(176, 196, 222),
 *   Api.CreateRGBColor(65, 105, 225),
 *   Api.CreateRGBColor(255, 255, 255),
 *   Api.CreateRGBColor(255, 213, 191)
 * ], "New color scheme")
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill1 = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oBgFill1 = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke1 = Api.CreateStroke(1 * 36000, oFill1)
 * const oFill2 = Api.CreatePatternFill("dashDnDiag", Api.CreateRGBColor(255, 111, 61), Api.CreateRGBColor(51, 51, 51))
 * const oBgFill2 = Api.CreatePatternFill("dashDnDiag", Api.CreateRGBColor(255, 111, 61), Api.CreateRGBColor(51, 51, 51))
 * const oStroke2 = Api.CreateStroke(1 * 36000, oFill2)
 * const oFill3 = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oBgFill3 = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke3 = Api.CreateStroke(1 * 36000, oFill3)
 * const oFormatScheme = Api.CreateThemeFormatScheme([
 *   oFill1,
 *   oFill2,
 *   oFill3
 * ], [
 *   oBgFill1,
 *   oBgFill2,
 *   oBgFill3
 * ], [
 *   oStroke1,
 *   oStroke2,
 *   oStroke3
 * ], "New format scheme")
 * const oFontScheme = Api.CreateThemeFontScheme("Arial", "Noto Sans Simplified Chinese", "Arabic", "Times New Roman", "Noto Serif Simplified Chinese", "Arabic", "New font scheme")
 * const oTheme = Api.CreateTheme("New theme", oMaster, oClrScheme, oFormatScheme, oFontScheme)
 * oPresentation.ApplyTheme(oTheme)
 * builder.SaveFile("pptx", "CreateTheme.pptx")
 * builder.CloseFile()
 * @param {String} sName Theme name.
 * @param {ApiMaster} oMaster Slide master. Required parameter.
 * @param {ApiThemeColorScheme} oClrScheme Theme color scheme. Required parameter.
 * @param {ApiThemeFormatScheme} oFormatScheme Theme format scheme. Required parameter.
 * @param {ApiThemeFontScheme} oFontScheme Theme font scheme. Required parameter.
 */

/**
 * @memberof Api
 * @name GetFullName
 * @description Returns the full name of the currently opened file.
 * @returns {String}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const sName = Api.GetFullName()
 * oParagraph.AddText("File name: " + sName)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetFullName.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof Api
 * @name GetPresentation
 * @description Returns the main presentation.
 * @returns {ApiPresentation | null}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetVerAxisTitle("USD In Hundred Thousands", 10)
 * oChart.SetHorAxisTitle("Year", 11)
 * oChart.SetLegendPos("bottom")
 * oChart.SetShowDataLabels(false, false, true, false)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "GetPresentation.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiDocumentContent
 * @name AddElement
 * @description Adds a paragraph or a table or a blockLvl content control using its position in the document content.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * oDocContent.RemoveAllElements()
 * const oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("We removed all elements from the shape and added a new paragraph inside it.")
 * oDocContent.AddElement(oParagraph)
 * oDocContent.Push(oParagraph)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "AddElement.pptx")
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
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const sClassType = oDocContent.GetClassType()
 * oParagraph.AddText("Class Type: " + sClassType)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetClassType.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiDocumentContent
 * @name GetElement
 * @description Returns an element by its position in the document.
 * @returns {DocumentElement | null}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * let oParagraph = oDocContent.GetElement(0)
 * const oBullet = Api.CreateNumbering("ArabicParenR", 1)
 * oParagraph.SetBullet(oBullet)
 * oParagraph.AddText(" This is an example of the numbered paragraph.")
 * oParagraph = Api.CreateParagraph()
 * oParagraph.SetBullet(oBullet)
 * oParagraph.AddText(" This is an example of the numbered paragraph.")
 * oDocContent.Push(oParagraph)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetElement.pptx")
 * builder.CloseFile()
 * @param {Number} nPos The element position that will be taken from the document.
 */

/**
 * @memberof Api
 * @name attachEvent
 * @description Subscribes to the specified event and calls the callback function when the event fires.
 * @returns {void}
 * @example
 * Api.attachEvent("asc_onHyperlinkClick", () => {
 *   console.log("HYPERLINK!!!")
 * })
 * @param {String} eventName The event name.
 * @param {Function} callback Function to be called when the event fires.
 */

/**
 * @memberof Api
 * @name detachEvent
 * @description Unsubscribes from the specified event.
 * @returns {void}
 * @example
 * Api.detachEvent("asc_onHyperlinkClick")
 * @param {String} eventName The event name.
 */

/**
 * @memberof Api
 * @name Save
 * @description Saves changes to the specified document.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * oDocContent.RemoveAllElements()
 * const oParagraph = Api.CreateParagraph()
 * oParagraph.SetJc("left")
 * oParagraph.AddText("This shape with paragraph in it is saved to the document.")
 * oDocContent.Push(oParagraph)
 * oSlide.AddObject(oShape)
 * Api.Save()
 * builder.SaveFile("pptx", "Save.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiDocumentContent
 * @name GetElementsCount
 * @description Returns a number of elements in the current document.
 * @returns {Number}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("We got the first paragraph inside the shape.")
 * oParagraph.AddLineBreak()
 * oParagraph.AddText("Number of elements inside the shape: " + oDocContent.GetElementsCount())
 * oParagraph.AddLineBreak()
 * oParagraph.AddText("Line breaks are NOT counted into the number of elements.")
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetElementsCount.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof Api
 * @name ReplaceTextSmart
 * @description Replaces each paragraph (or text in cell) in the select with the corresponding text from an array of strings.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oFParagraph = oDocContent.GetElement(0)
 * oFParagraph.AddText("This is the text for the first line. The line break is added after it.")
 * oFParagraph.AddLineBreak()
 * const oSParagraph = Api.CreateParagraph()
 * oSParagraph.AddTabStop()
 * oSParagraph.AddText("This is just a sample text with a tab stop before it.")
 * oDocContent.AddElement(oSParagraph)
 * oSlide.AddObject(oShape)
 * // todo_example problem (how to make select in slide)
 * // var oRange1 = oFParagraph.GetRange();
 * // var oRange2 = oSParagraph.GetRange();
 * // var oRange3 = oRange1.ExpandTo(oRange2);
 * // oRange3.Select();
 * const arr = [
 *   "test_1",
 *   "test_2"
 * ]
 * Api.ReplaceTextSmart(arr, "", "")
 * builder.SaveFile("pptx", "ReplaceTextSmart.pptx")
 * builder.CloseFile()
 * @param {Array} arrString An array of replacement strings.
 * @param {String=} sParaTab A character which is used to specify the tab in the source text.
 * @param {String=} sParaNewLine A character which is used to specify the line break character in the source text.
 */

/**
 * @memberof ApiDocumentContent
 * @name Push
 * @description Pushes a paragraph or a table to actually add it to the document.
 * @returns {Boolean} returns "false" if oElement is unsupported
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * oDocContent.RemoveAllElements()
 * const oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("We removed all elements from the shape and added a new paragraph inside it.")
 * oDocContent.AddElement(oParagraph)
 * oDocContent.Push(oParagraph)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "Push.pptx")
 * builder.CloseFile()
 * @param {DocumentElement} oElement The element type which will be pushed to the document.
 */

/**
 * @memberof ApiDocumentContent
 * @name RemoveElement
 * @description Removes an element using the position specified.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * let oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("This is the first paragraph.")
 * oDocContent.RemoveElement(0)
 * oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("This is the second paragraph. The first paragraph was removed from the document content.")
 * oDocContent.Push(oParagraph)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "RemoveElement.pptx")
 * builder.CloseFile()
 * @param {Number} nPos The element number (position) in the document or inside other element.
 */

/**
 * @memberof ApiChart
 * @name GetClassType
 * @description Returns a type of the ApiChart class.
 * @returns {String}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * const sClassType = oChart.GetClassType()
 * oChart.SetVerAxisTitle("USD In Hundred Thousands", 10)
 * oChart.SetHorAxisTitle("Year", 11)
 * oChart.SetLegendPos("bottom")
 * oChart.SetShowDataLabels(false, false, true, false)
 * oChart.SetTitle("Financial Overview: Class Type = " + sClassType, 20)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "GetClassType.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiChart
 * @name ApplyChartStyle
 * @description Sets a style to the current chart by style ID.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * oChart.ApplyChartStyle(2)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * let oStroke = Api.CreateStroke(0.5 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51)))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oChart.SetSeriesOutLine(oStroke, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oStroke = Api.CreateStroke(0.5 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61)))
 * oChart.SetSeriesFill(oFill, 1, false)
 * oChart.SetSeriesOutLine(oStroke, 1, false)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "ApplyChartStyle.pptx")
 * builder.CloseFile()
 * @param {Number} nStyleId One of the styles available in the editor. This value must be a positive.
 */

/**
 * @memberof ApiChart
 * @name SetAxieNumFormat
 * @description Sets the specified numeric format to the axis values.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24, [
 *   "0",
 *   "0.00"
 * ])
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * oChart.SetAxieNumFormat("0.00", "left")
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "SetAxieNumFormat.pptx")
 * builder.CloseFile()
 * @param {NumFormat | String} sFormat Numeric format (can be custom format).
 * @param {AxisPos} sAxiePos Axis position.
 */

/**
 * @memberof ApiDocumentContent
 * @name RemoveAllElements
 * @description Removes all the elements from the current document or from the current document element. When all elements are removed, a new empty paragraph is automatically created. If you want to add content to this paragraph, use the ApiDocumentContent#Push method.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * let oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("This is just a sample paragraph.")
 * oDocContent.RemoveAllElements()
 * oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("We removed all elements from the shape and added a new paragraph inside it.")
 * oDocContent.Push(oParagraph)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "RemoveAllElements.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiChart
 * @name SetCategoryName
 * @description Sets a name to the specified chart category.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * oChart.SetCategoryName("2013", 0)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "SetCategoryName.pptx")
 * builder.CloseFile()
 * @param {String} sName The name which will be set to the specified chart category.
 * @param {Number} nCategory The index of the chart category.
 */

/**
 * @memberof ApiChart
 * @name SetDataPointFill
 * @description Sets the fill to the data point in the specified chart series.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(128, 128, 128))
 * oChart.SetDataPointFill(oFill, 0, 0, false)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "SetDataPointFill.pptx")
 * builder.CloseFile()
 * @param {ApiFill} oFill The fill type used to fill the data point.
 * @param {Number} nSeries The index of the chart series.
 * @param {Number} nDataPoint The index of the data point in the specified chart series.
 * @param {Boolean=} bAllSeries=false Specifies if the fill will be applied to the specified data point in all series.
 */

/**
 * @memberof ApiChart
 * @name SetDataPointOutLine
 * @description Sets the outline to the data point in the specified chart series.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * const oStroke = Api.CreateStroke(0.5 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61)))
 * oChart.SetDataPointOutLine(oStroke, 0, 0, false)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "SetDataPointOutLine.pptx")
 * builder.CloseFile()
 * @param {ApiStroke} oStroke The stroke used to create the data point outline.
 * @param {Number} nSeries The index of the chart series.
 * @param {Number} nDataPoint The index of the data point in the specified chart series.
 * @param {Boolean} bAllSeries Specifies if the outline will be applied to the specified data point in all series.
 */

/**
 * @memberof ApiChart
 * @name SetHorAxisLablesFontSize
 * @description Specifies font size for the labels of the horizontal axis.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetVerAxisTitle("USD In Hundred Thousands", 10)
 * oChart.SetHorAxisTitle("Year", 11)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetHorAxisLablesFontSize(10)
 * oChart.SetPosition(608400, 1267200)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "SetHorAxisLablesFontSize.pptx")
 * builder.CloseFile()
 * @param {pt} nFontSize The text size value measured in points.
 */

/**
 * @memberof ApiChart
 * @name SetHorAxisMajorTickMark
 * @description Specifies the major tick mark for the horizontal axis.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("scatter", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetVerAxisTitle("USD In Hundred Thousands", 10)
 * oChart.SetHorAxisTitle("Year", 11)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetHorAxisMajorTickMark("cross")
 * oChart.SetPosition(608400, 1267200)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * let oStroke = Api.CreateStroke(1 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51)))
 * oChart.SetMarkerFill(oFill, 0, 0, true)
 * oChart.SetMarkerOutLine(oStroke, 0, 0, true)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oStroke = Api.CreateStroke(1 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61)))
 * oChart.SetMarkerFill(oFill, 1, 0, true)
 * oChart.SetMarkerOutLine(oStroke, 1, 0, true)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "SetHorAxisMajorTickMark.pptx")
 * builder.CloseFile()
 * @param {TickMark} sTickMark The type of tick mark appearance.
 */

/**
 * @memberof ApiChart
 * @name SetHorAxisOrientation
 * @description Specifies the horizontal axis orientation.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetVerAxisTitle("USD In Hundred Thousands", 10)
 * oChart.SetHorAxisTitle("Year", 11)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetHorAxisOrientation(false)
 * oChart.SetPosition(608400, 1267200)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "SetHorAxisOrientation.pptx")
 * builder.CloseFile()
 * @param {Boolean} bIsMinMax The true value will set the normal data direction for the horizontal axis (from minimum to maximum). The false value will set the inverted data direction for the horizontal axis (from maximum to minimum).
 */

/**
 * @memberof ApiChart
 * @name SetDataPointNumFormat
 * @description Sets the specified numeric format to the chart data point.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24, [
 *   "0",
 *   "0.00"
 * ])
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * oChart.SetShowPointDataLabel(1, 0, false, false, true, false)
 * oChart.SetDataPointNumFormat("0.00", 0, 0, true)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "SetDataPointNumFormat.pptx")
 * builder.CloseFile()
 * @param {NumFormat | String} sFormat Numeric format (can be custom format).
 * @param {Number} nSeria Series index.
 * @param {Number} nDataPoint The index of the data point in the specified chart series.
 * @param {Boolean} bAllSeries Specifies if the numeric format will be applied to the specified data point in all series.
 */

/**
 * @memberof ApiChart
 * @name RemoveSeria
 * @description Removes the specified series from the current chart.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * oChart.RemoveSeria(1)
 * oChart.SetTitle("The Estimated Costs series was removed from the current chart.")
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "RemoveSeria.pptx")
 * builder.CloseFile()
 * @param {Number} nSeria The index of the chart series.
 */

/**
 * @memberof ApiChart
 * @name SetHorAxisTickLabelPosition
 * @description Spicifies tick label position for the horizontal axis.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetVerAxisTitle("USD In Hundred Thousands", 10)
 * oChart.SetHorAxisTitle("Year", 11)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetHorAxisTickLabelPosition("high")
 * oChart.SetPosition(608400, 1267200)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "SetHorAxisTickLabelPosition.pptx")
 * builder.CloseFile()
 * @param {TickLabelPosition} sTickLabelPosition The position type of the chart horizontal tick labels.
 */

/**
 * @memberof ApiChart
 * @name SetHorAxisTitle
 * @description Specifies the chart horizontal axis title.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetVerAxisTitle("USD In Hundred Thousands", 10)
 * oChart.SetHorAxisTitle("Year", 11)
 * oChart.SetLegendPos("bottom")
 * oChart.SetShowDataLabels(false, false, true, false)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "SetHorAxisTitle.pptx")
 * builder.CloseFile()
 * @param {String} sTitle The title which will be displayed for the horizontal axis of the current chart.
 * @param {pt} nFontSize The text size value measured in points.
 * @param {Boolean} bIsBold Specifies if the horizontal axis title is written in bold font or not.
 */

/**
 * @memberof ApiChart
 * @name SetHorAxisMinorTickMark
 * @description Specifies the minor tick mark for the horizontal axis.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("scatter", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetVerAxisTitle("USD In Hundred Thousands", 10)
 * oChart.SetHorAxisTitle("Year", 11)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetHorAxisMinorTickMark("in")
 * oChart.SetPosition(608400, 1267200)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * let oStroke = Api.CreateStroke(1 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51)))
 * oChart.SetMarkerFill(oFill, 0, 0, true)
 * oChart.SetMarkerOutLine(oStroke, 0, 0, true)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oStroke = Api.CreateStroke(1 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61)))
 * oChart.SetMarkerFill(oFill, 1, 0, true)
 * oChart.SetMarkerOutLine(oStroke, 1, 0, true)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "SetHorAxisMinorTickMark.pptx")
 * builder.CloseFile()
 * @param {TickMark} sTickMark The type of tick mark appearance
 */

/**
 * @memberof ApiChart
 * @name SetLegendFontSize
 * @description Specifies the chart legend font size.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetVerAxisTitle("USD In Hundred Thousands", 10)
 * oChart.SetHorAxisTitle("Year", 11)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetLegendFontSize(16)
 * oChart.SetPosition(608400, 1267200)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "SetLegendFontSize.pptx")
 * builder.CloseFile()
 * @param {pt} nFontSize The text size value measured in points.
 */

/**
 * @memberof ApiChart
 * @name SetLegendOutLine
 * @description Sets the outline to the chart legend.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * const oStroke = Api.CreateStroke(0.5 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51)))
 * oChart.SetLegendOutLine(oStroke)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "SetLegendOutLine.pptx")
 * builder.CloseFile()
 * @param {ApiStroke} oStroke The stroke used to create the legend outline.
 */

/**
 * @memberof ApiChart
 * @name SetMajorVerticalGridlines
 * @description Specifies the visual properties for the major vertical gridlines.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetVerAxisTitle("USD In Hundred Thousands", 10)
 * oChart.SetHorAxisTitle("Year", 11)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * const oStroke = Api.CreateStroke(1 * 15000, Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61)))
 * oChart.SetMajorVerticalGridlines(oStroke)
 * oChart.SetPosition(608400, 1267200)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "SetMajorVerticalGridlines.pptx")
 * builder.CloseFile()
 * @param {ApiStroke=} oStroke=null The stroke used to create the element shadow.
 */

/**
 * @memberof ApiChart
 * @name SetMajorHorizontalGridlines
 * @description Specifies the visual properties for the major horizontal gridlines.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetVerAxisTitle("USD In Hundred Thousands", 10)
 * oChart.SetHorAxisTitle("Year", 11)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * const oStroke = Api.CreateStroke(1 * 15000, Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61)))
 * oChart.SetMajorHorizontalGridlines(oStroke)
 * oChart.SetPosition(608400, 1267200)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "SetMajorHorizontalGridlines.pptx")
 * builder.CloseFile()
 * @param {ApiStroke=} oStroke=null The stroke used to create the element shadow.
 */

/**
 * @memberof ApiChart
 * @name SetMarkerOutLine
 * @description Sets the outline to the marker in the specified chart series.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("scatter", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * const oStroke = Api.CreateStroke(0.5 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51)))
 * oChart.SetMarkerFill(oFill, 0, 0, true)
 * oChart.SetMarkerOutLine(oStroke, 0, 0, true)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetMarkerFill(oFill, 1, 0, true)
 * oChart.SetMarkerOutLine(oStroke, 1, 0, true)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "SetMarkerOutLine.pptx")
 * builder.CloseFile()
 * @param {ApiStroke} oStroke The stroke used to create the marker outline.
 * @param {Number} nSeries The index of the chart series.
 * @param {Number} nMarker The index of the marker in the specified chart series.
 * @param {Boolean=} bAllMarkers=false Specifies if the outline will be applied to all markers in the specified chart series.
 */

/**
 * @memberof ApiChart
 * @name SetLegendFill
 * @description Sets the fill to the chart legend.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(128, 128, 128))
 * oChart.SetLegendFill(oFill)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "SetLegendFill.pptx")
 * builder.CloseFile()
 * @param {ApiFill} oFill The fill type used to fill the legend.
 */

/**
 * @memberof ApiChart
 * @name SetMarkerFill
 * @description Sets the fill to the marker in the specified chart series.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("scatter", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * let oStroke = Api.CreateStroke(0.5 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51)))
 * oChart.SetMarkerFill(oFill, 0, 0, true)
 * oChart.SetMarkerOutLine(oStroke, 0, 0, true)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oStroke = Api.CreateStroke(0.5 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61)))
 * oChart.SetMarkerFill(oFill, 1, 0, true)
 * oChart.SetMarkerOutLine(oStroke, 1, 0, true)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "SetMarkerFill.pptx")
 * builder.CloseFile()
 * @param {ApiFill} oFill The fill type used to fill the marker.
 * @param {Number} nSeries The index of the chart series.
 * @param {Number} nMarker The index of the marker in the specified chart series.
 * @param {Boolean=} bAllMarkers=false Specifies if the fill will be applied to all markers in the specified chart series.
 */

/**
 * @memberof ApiChart
 * @name SetMinorHorizontalGridlines
 * @description Specifies the visual properties for the minor horizontal gridlines.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetVerAxisTitle("USD In Hundred Thousands", 10)
 * oChart.SetHorAxisTitle("Year", 11)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * const oStroke = Api.CreateStroke(1 * 10000, Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61)))
 * oChart.SetMinorHorizontalGridlines(oStroke)
 * oChart.SetPosition(608400, 1267200)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "SetMinorHorizontalGridlines.pptx")
 * builder.CloseFile()
 * @param {ApiStroke=} oStroke=null The stroke used to create the element shadow.
 */

/**
 * @memberof ApiChart
 * @name SetPlotAreaFill
 * @description Sets the fill to the chart plot area.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(128, 128, 128))
 * oChart.SetPlotAreaFill(oFill)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "SetPlotAreaFill.pptx")
 * builder.CloseFile()
 * @param {ApiFill} oFill The fill type used to fill the plot area.
 */

/**
 * @memberof ApiChart
 * @name SetPlotAreaOutLine
 * @description Sets the outline to the chart plot area.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * const oStroke = Api.CreateStroke(0.5 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61)))
 * oChart.SetPlotAreaOutLine(oStroke)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "SetPlotAreaOutLine.pptx")
 * builder.CloseFile()
 * @param {ApiStroke} oStroke The stroke used to create the plot area outline.
 */

/**
 * @memberof ApiChart
 * @name SetLegendPos
 * @description Specifies the chart legend position.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetVerAxisTitle("USD In Hundred Thousands", 10)
 * oChart.SetHorAxisTitle("Year", 11)
 * oChart.SetLegendPos("bottom")
 * oChart.SetShowDataLabels(false, false, true, false)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "SetLegendPos.pptx")
 * builder.CloseFile()
 * @param {LegendPos} sLegendPos The position of the chart legend inside the chart window.
 */

/**
 * @memberof ApiChart
 * @name SetSeriaName
 * @description Sets a name to the specified chart series.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * oChart.SetSeriaName("Projected Sales", 0)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "SetSeriaName.pptx")
 * builder.CloseFile()
 * @param {String} sName The name which will be set to the specified chart series.
 * @param {Number} nSeria The index of the chart series.
 */

/**
 * @memberof ApiChart
 * @name SetSeriaNumFormat
 * @description Sets the specified numeric format to the chart series.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24, [
 *   "0",
 *   "0.00"
 * ])
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * oChart.SetSeriaNumFormat("0.00", 0)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "SetSeriaNumFormat.pptx")
 * builder.CloseFile()
 * @param {NumFormat | String} sFormat Numeric format (can be custom format).
 * @param {Number} nSeria Series index.
 */

/**
 * @memberof ApiChart
 * @name SetSeriesOutLine
 * @description Sets the outline to the specified chart series.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * const oStroke = Api.CreateStroke(0.5 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51)))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oChart.SetSeriesOutLine(oStroke, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * oChart.SetSeriesOutLine(oStroke, 1, false)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "SetSeriesOutLine.pptx")
 * builder.CloseFile()
 * @param {ApiStroke} oStroke The stroke used to create the series outline.
 * @param {Number} nSeries The index of the chart series.
 * @param {Boolean=} bAll=false Specifies if the outline will be applied to all series.
 */

/**
 * @memberof ApiChart
 * @name SetSeriesFill
 * @description Sets the fill to the specified chart series.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "SetSeriesFill.pptx")
 * builder.CloseFile()
 * @param {ApiFill} oFill The fill type used to fill the series.
 * @param {Number} nSeries The index of the chart series.
 * @param {Boolean=} bAll=false Specifies if the fill will be applied to all series.
 */

/**
 * @memberof ApiChart
 * @name SetMinorVerticalGridlines
 * @description Specifies the visual properties for the minor vertical gridlines.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetVerAxisTitle("USD In Hundred Thousands", 10)
 * oChart.SetHorAxisTitle("Year", 11)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * const oStroke = Api.CreateStroke(1 * 10000, Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61)))
 * oChart.SetMinorVerticalGridlines(oStroke)
 * oChart.SetPosition(608400, 1267200)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "SetMinorVerticalGridlines.pptx")
 * builder.CloseFile()
 * @param {ApiStroke=} oStroke=null The stroke used to create the element shadow.
 */

/**
 * @memberof ApiChart
 * @name SetShowPointDataLabel
 * @description Spicifies the show options for the chart data labels.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetVerAxisTitle("USD In Hundred Thousands", 10)
 * oChart.SetHorAxisTitle("Year", 11)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetShowPointDataLabel(1, 0, false, false, true, false)
 * oChart.SetPosition(608400, 1267200)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "SetShowPointDataLabel.pptx")
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
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetVerAxisTitle("USD In Hundred Thousands", 10)
 * oChart.SetHorAxisTitle("Year", 11)
 * oChart.SetLegendPos("bottom")
 * oChart.SetShowDataLabels(false, false, true, false)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "SetVerAxisTitle.pptx")
 * builder.CloseFile()
 * @param {String} sTitle The title which will be displayed for the vertical axis of the current chart.
 * @param {pt} nFontSize The text size value measured in points.
 * @param {Boolean} bIsBold Specifies if the vertical axis title is written in bold font or not
 */

/**
 * @memberof ApiChart
 * @name SetShowDataLabels
 * @description Specifies which chart data labels are shown for the chart.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetVerAxisTitle("USD In Hundred Thousands", 10)
 * oChart.SetHorAxisTitle("Year", 11)
 * oChart.SetLegendPos("bottom")
 * oChart.SetShowDataLabels(false, false, true, false)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "SetShowDataLabels.pptx")
 * builder.CloseFile()
 * @param {Boolean} bShowSerName Whether to show or hide the source table column names used for the data which the chart will be build from.
 * @param {Boolean} bShowCatName Whether to show or hide the source table row names used for the data which the chart will be build from.
 * @param {Boolean} bShowVal Whether to show or hide the chart data values.
 * @param {Boolean} bShowPercent Whether to show or hide the percent for the data values (works with stacked chart types).
 */

/**
 * @memberof ApiChart
 * @name SetTitle
 * @description Specifies the chart title.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetVerAxisTitle("USD In Hundred Thousands", 10)
 * oChart.SetHorAxisTitle("Year", 11)
 * oChart.SetLegendPos("bottom")
 * oChart.SetShowDataLabels(false, false, true, false)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "SetTitle.pptx")
 * builder.CloseFile()
 * @param {String} sTitle The title which will be displayed for the current chart.
 * @param {pt} nFontSize The text size value measured in points.
 * @param {Boolean} bIsBold Specifies if the chart title is written in bold font or not.
 */

/**
 * @memberof ApiChart
 * @name SetSeriaValues
 * @description Sets values to the specified chart series.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * oChart.SetSeriaValues([
 *   260,
 *   270,
 *   300
 * ], 1)
 * oChart.SetShowPointDataLabel(1, 0, false, false, true, false)
 * oChart.SetShowPointDataLabel(1, 1, false, false, true, false)
 * oChart.SetShowPointDataLabel(1, 2, false, false, true, false)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "SetSeriaValues.pptx")
 * builder.CloseFile()
 * @param {Array} aValues The array of the data which will be set to the specified chart series.
 * @param {Number} nSeria The index of the chart series.
 */

/**
 * @memberof ApiChart
 * @name SetVerAxisOrientation
 * @description Specifies the vertical axis orientation.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * oChart.SetTitle("Financial Overview", 13)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * const oStroke = Api.CreateStroke(0.5 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51)))
 * oChart.SetTitleOutLine(oStroke)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "SetTitleOutLine.pptx")
 * builder.CloseFile()
 * @param {Boolean} bIsMinMax The true value will set the normal data direction for the vertical axis (from minimum to maximum). The false value will set the inverted data direction for the vertical axis (from maximum to minimum).
 */

/**
 * @memberof ApiChart
 * @name SetTitleOutLine
 * @description Sets the outline to the chart title.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * oChart.SetTitle("Financial Overview", 13)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * const oStroke = Api.CreateStroke(0.5 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51)))
 * oChart.SetTitleOutLine(oStroke)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "SetTitleOutLine.pptx")
 * builder.CloseFile()
 * @param {ApiStroke} oStroke The stroke used to create the title outline.
 */

/**
 * @memberof ApiChart
 * @name SetTitleFill
 * @description Sets the fill to the chart title.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(128, 128, 128))
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.SetTitleFill(oFill)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "SetTitleFill.pptx")
 * builder.CloseFile()
 * @param {ApiFill} oFill The fill type used to fill the title.
 */

/**
 * @memberof ApiChart
 * @name SetVertAxisMajorTickMark
 * @description Specifies the major tick mark for the vertical axis.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("scatter", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetVerAxisTitle("USD In Hundred Thousands", 10)
 * oChart.SetHorAxisTitle("Year", 11)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetVertAxisMajorTickMark("cross")
 * oChart.SetPosition(608400, 1267200)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * let oStroke = Api.CreateStroke(1 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51)))
 * oChart.SetMarkerFill(oFill, 0, 0, true)
 * oChart.SetMarkerOutLine(oStroke, 0, 0, true)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oStroke = Api.CreateStroke(1 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61)))
 * oChart.SetMarkerFill(oFill, 1, 0, true)
 * oChart.SetMarkerOutLine(oStroke, 1, 0, true)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "SetVertAxisMajorTickMark.pptx")
 * builder.CloseFile()
 * @param {TickMark} sTickMark The type of tick mark appearance.
 */

/**
 * @memberof ApiChart
 * @name SetVertAxisLablesFontSize
 * @description Specifies font size for the labels of the vertical axis.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetVerAxisTitle("USD In Hundred Thousands", 10)
 * oChart.SetHorAxisTitle("Year", 11)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetVertAxisLablesFontSize(13)
 * oChart.SetPosition(608400, 1267200)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "SetVertAxisLablesFontSize.pptx")
 * builder.CloseFile()
 * @param {pt} nFontSize The text size value measured in points.
 */

/**
 * @memberof ApiChart
 * @name SetVertAxisMinorTickMark
 * @description Specifies the minor tick mark for the vertical axis.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("scatter", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetVerAxisTitle("USD In Hundred Thousands", 10)
 * oChart.SetHorAxisTitle("Year", 11)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetVertAxisMinorTickMark("out")
 * oChart.SetPosition(608400, 1267200)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * const oStroke = Api.CreateStroke(0.5 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51)))
 * oChart.SetMarkerFill(oFill, 0, 0, true)
 * oChart.SetMarkerOutLine(oStroke, 0, 0, true)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetMarkerFill(oFill, 1, 0, true)
 * oChart.SetMarkerOutLine(oStroke, 1, 0, true)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "SetVertAxisMinorTickMark.pptx")
 * builder.CloseFile()
 * @param {TickMark} sTickMark The type of tick mark appearance.
 */

/**
 * @memberof ApiChart
 * @name SetVertAxisTickLabelPosition
 * @description Spicifies tick label position for the vertical axis.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetVerAxisTitle("USD In Hundred Thousands", 10)
 * oChart.SetHorAxisTitle("Year", 11)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetVertAxisTickLabelPosition("high")
 * oChart.SetPosition(608400, 1267200)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "SetVertAxisTickLabelPosition.pptx")
 * builder.CloseFile()
 * @param {TickLabelPosition} sTickLabelPosition The position type of the chart vertical tick labels.
 */

/**
 * @memberof ApiDrawing
 * @name Delete
 * @description Deletes the specified drawing object from the parent.
 * @returns {Boolean} returns false if drawing doesn't exist or drawing hasn't a parent
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * let oFill = Api.CreateLinearGradientFill([
 *   oGs1,
 *   oGs2
 * ], 5400000)
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oDrawing1 = Api.CreateShape("rect", 3212465, 963295, oFill, oStroke)
 * oSlide.AddObject(oDrawing1)
 * const oDrawing2 = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oDrawing2.SetVerAxisTitle("USD In Hundred Thousands", 10)
 * oDrawing2.SetHorAxisTitle("Year", 11)
 * oDrawing2.SetLegendPos("bottom")
 * oDrawing2.SetShowDataLabels(false, false, true, false)
 * oDrawing2.SetTitle("Financial Overview", 13)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oDrawing2.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oDrawing2.SetSeriesFill(oFill, 1, false)
 * oSlide.AddObject(oDrawing2)
 * oDrawing2.Delete()
 * const oDocContent = oDrawing1.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("The chart was deleted from this slide.")
 * builder.SaveFile("pptx", "Delete.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiDrawing
 * @name GetClassType
 * @description Returns a type of the ApiDrawing class.
 * @returns {String}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oDrawing = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oDrawing.SetPosition(608400, 1267200)
 * oDrawing.SetSize(300 * 36000, 130 * 36000)
 * oSlide.AddObject(oDrawing)
 * const aDrawings = oSlide.GetAllDrawings()
 * const sType = aDrawings[0].GetClassType()
 * const oDocContent = oDrawing.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Class Type = " + sType)
 * builder.SaveFile("pptx", "GetClassType.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiChart
 * @name SetXValues
 * @description Sets the x-axis values to all chart series. It is used with the scatter charts only.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("scatter", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * oChart.SetXValues([
 *   "2020",
 *   "2021",
 *   "2022"
 * ])
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * let oStroke = Api.CreateStroke(1 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51)))
 * oChart.SetMarkerFill(oFill, 0, 0, true)
 * oChart.SetMarkerOutLine(oStroke, 0, 0, true)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oStroke = Api.CreateStroke(1 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61)))
 * oChart.SetMarkerFill(oFill, 1, 0, true)
 * oChart.SetMarkerOutLine(oStroke, 1, 0, true)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "SetXValues.pptx")
 * builder.CloseFile()
 * @param {Array} aValues The array of the data which will be set to the x-axis data points.
 */

/**
 * @memberof ApiDrawing
 * @name GetLockValue
 * @description Returns the lock value for the specified lock type of the current drawing.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetLockValue("noSelect", true)
 * const oDocContent = oShape.GetContent()
 * const bLockValue = oShape.GetLockValue("noSelect")
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("This drawing cannot be selected: " + bLockValue)
 * oDocContent.AddElement(0, oParagraph)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetLockValue.pptx")
 * builder.CloseFile()
 * @param {LockValue} sType Lock type in the string format.
 */

/**
 * @memberof ApiDrawing
 * @name GetHeight
 * @description Returns the height of the current drawing.
 * @returns {EMU}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const nHeight = oShape.GetHeight()
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("Drawing height: " + nHeight)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetHeight.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiDrawing
 * @name GetParentLayout
 * @description Returns the drawing parent slide layout.
 * @returns {ApiLayout | null} return null if parent ins't a slide layout
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * const oLayout = oMaster.GetLayout(0)
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * oLayout.AddObject(oShape)
 * const oParent = oShape.GetParentLayout()
 * const sType = oParent.GetClassType()
 * oSlide.RemoveAllObjects()
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Class type of the shape parent = " + sType)
 * builder.SaveFile("pptx", "GetParentLayout.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiDrawing
 * @name GetParentMaster
 * @description Returns the drawing parent slide master.
 * @returns {ApiMaster | null} return null if parent ins't a slide master
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * oMaster.AddObject(oShape)
 * const oParent = oShape.GetParentMaster()
 * const sType = oParent.GetClassType()
 * oSlide.RemoveAllObjects()
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Class type of the shape parent = " + sType)
 * builder.SaveFile("pptx", "GetParentMaster.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiDrawing
 * @name Copy
 * @description Creates a copy of the specified drawing object.
 * @returns {ApiDrawing | null} return null if drawing doesn't exist
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * let oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * oSlide.AddObject(oShape)
 * const oCopyShape = oShape.Copy()
 * oSlide = Api.CreateSlide()
 * oPresentation.AddSlide(oSlide)
 * oSlide.AddObject(oCopyShape)
 * builder.SaveFile("pptx", "Copy.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiDrawing
 * @name GetWidth
 * @description Returns the width of the current drawing.
 * @returns {EMU}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const nWidth = oShape.GetWidth()
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("Drawing width: " + nWidth)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetWidth.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiDrawing
 * @name GetPlaceholder
 * @description Returns a placeholder from the current drawing object.
 * @returns {ApiPlaceholder | null} returns null if placeholder doesn't exist
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * let oPlaceholder = Api.CreatePlaceholder("chart")
 * oShape.SetPlaceholder(oPlaceholder)
 * oSlide.AddObject(oShape)
 * oPlaceholder = oShape.GetPlaceholder()
 * const sType = oPlaceholder.GetClassType()
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Class type of the element from the shape = " + sType)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetPlaceholder.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiDrawing
 * @name GetParent
 * @description Returns the drawing parent object.
 * @returns {ApiSlide | ApiLayout | ApiMaster | null}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * oSlide.RemoveAllObjects()
 * oSlide.AddObject(oShape)
 * const oParent = oShape.GetParent()
 * const sType = oParent.GetClassType()
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Class type of the shape parent = " + sType)
 * builder.SaveFile("pptx", "GetParent.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiDrawing
 * @name SetPlaceholder
 * @description Sets the specified placeholder to the current drawing object.
 * @returns {Boolean} returns false if parameter isn't a placeholder
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oPlaceholder = Api.CreatePlaceholder("picture")
 * oShape.SetPlaceholder(oPlaceholder)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetPlaceholder.pptx")
 * builder.CloseFile()
 * @param {ApiPlaceholder} oPlaceholder Placeholder object.
 */

/**
 * @memberof ApiDrawing
 * @name SetLockValue
 * @description Sets the lock value to the specified lock type of the current drawing.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetLockValue("noSelect", true)
 * const oDocContent = oShape.GetContent()
 * const bLockValue = oShape.GetLockValue("noSelect")
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("This drawing cannot be selected: " + bLockValue)
 * oDocContent.AddElement(0, oParagraph)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetLockValue.pptx")
 * builder.CloseFile()
 * @param {LockValue} sType Lock type in the string format.
 * @param {Boolean} bValue Specifies if the specified lock is applied to the current drawing.
 */

/**
 * @memberof ApiDrawing
 * @name GetParentSlide
 * @description Returns the drawing parent slide.
 * @returns {ApiSlide | null} return null if parent ins't a slide
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * oSlide.RemoveAllObjects()
 * oSlide.AddObject(oShape)
 * const oParent = oShape.GetParentSlide()
 * const sType = oParent.GetClassType()
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Class type of the shape parent = " + sType)
 * builder.SaveFile("pptx", "GetParentSlide.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiDrawing
 * @name SetSize
 * @description Sets the size of the object (image, shape, chart) bounding box.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oDocContent = oShape.GetDocContent()
 * oDocContent.RemoveAllElements()
 * const oParagraph = Api.CreateParagraph()
 * oParagraph.SetJc("left")
 * oParagraph.AddText("This is an example of a paragraph inside a shape. Nothing special.")
 * oDocContent.Push(oParagraph)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetSize.pptx")
 * builder.CloseFile()
 * @param {EMU} nWidth The object width measured in English measure units.
 * @param {EMU} nHeight The object height measured in English measure units.
 */

/**
 * @memberof ApiDrawing
 * @name ToJSON
 * @description Converts the ApiDrawing object into the JSON object.
 * @returns {JSON}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oDrawing = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * const json = oDrawing.ToJSON()
 * const oDrawingFromJSON = Api.FromJSON(json)
 * oDrawingFromJSON.SetPosition(608400, 1267200)
 * oDrawingFromJSON.SetSize(300 * 36000, 130 * 36000)
 * oSlide.AddObject(oDrawingFromJSON)
 * builder.SaveFile("pptx", "ToJSON.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiGradientStop
 * @name GetClassType
 * @description Returns a type of the ApiGradientStop class.
 * @returns {String}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oDocContent = oShape.GetDocContent()
 * const sClassType = oGs1.GetClassType()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Class Type = " + sClassType)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetClassType.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiImage
 * @name GetClassType
 * @description Returns a type of the ApiImage class.
 * @returns {String}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oImage = Api.CreateImage("https://api.onlyoffice.com/content/img/docbuilder/examples/step2_1.png", 100 * 36000, 50 * 36000)
 * oSlide.AddObject(oImage)
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const sClassType = oImage.GetClassType()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Class Type = " + sClassType)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetClassType.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiDrawing
 * @name SetPosition
 * @description Sets the position of the drawing on the slide.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oDocContent = oShape.GetDocContent()
 * oDocContent.RemoveAllElements()
 * const oParagraph = Api.CreateParagraph()
 * oParagraph.SetJc("left")
 * oParagraph.AddText("This is an example of a paragraph inside a shape. Nothing special.")
 * oDocContent.Push(oParagraph)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetPosition.pptx")
 * builder.CloseFile()
 * @param {EMU} nPosX The distance from the left side of the slide to the left side of the drawing measured in English measure units.
 * @param {EMU} nPosY The distance from the top side of the slide to the upper side of the drawing measured in English measure units.
 */

/**
 * @memberof ApiLayout
 * @name Copy
 * @description Creates a copy of the specified slide layout object. Copies without master slide.
 * @returns {ApiLayout | null} returns new ApiLayout object that represents the copy of slide layout or null if slide layout doesn't exist
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * let oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * const oLayout = oMaster.GetLayout(0)
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * oLayout.AddObject(oShape)
 * oSlide = Api.CreateSlide()
 * oPresentation.AddSlide(oSlide)
 * const oCopyLayout = oLayout.Copy()
 * oMaster.AddLayout(1, oCopyLayout)
 * oSlide.ApplyLayout(oCopyLayout)
 * builder.SaveFile("pptx", "Copy.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiLayout
 * @name ClearBackground
 * @description Clears the slide layout background.
 * @returns {Boolean} return false if slide layout doesn't exist
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * let oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * const oLayout = oMaster.GetLayout(0)
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * oLayout.SetBackground(oFill)
 * oSlide.FollowLayoutBackground()
 * oSlide = Api.CreateSlide()
 * oPresentation.AddSlide(oSlide)
 * oLayout.ClearBackground()
 * oSlide.FollowLayoutBackground()
 * builder.SaveFile("pptx", "ClearBackground.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiLayout
 * @name AddObject
 * @description Adds an object (image, shape or chart) to the current slide layout.
 * @returns {Boolean} returns false if slide layout doesn't exist
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oMaster = oPresentation.GetMaster(0)
 * const oLayout = oMaster.GetLayout(0)
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * oLayout.AddObject(oShape)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("This shape was added to the current layout.")
 * builder.SaveFile("pptx", "AddObject.pptx")
 * builder.CloseFile()
 * @param {ApiDrawing} oDrawing The object which will be added to the current slide layout.
 */

/**
 * @memberof ApiFill
 * @name GetClassType
 * @description Returns a type of the ApiFill class.
 * @returns {String}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oDocContent = oShape.GetDocContent()
 * const sClassType = oFill.GetClassType()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Class Type = " + sClassType)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetClassType.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiLayout
 * @name GetAllCharts
 * @description Returns an array with all the chart objects from the slide layout.
 * @returns {Array<ApiChart>}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oMaster = oPresentation.GetMaster(0)
 * const oLayout = oMaster.GetLayout(0)
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetVerAxisTitle("USD In Hundred Thousands", 10)
 * oChart.SetHorAxisTitle("Year", 11)
 * oChart.SetLegendPos("bottom")
 * oChart.SetShowDataLabels(false, false, true, false)
 * oChart.SetTitle("Financial Overview", 20)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * oLayout.AddObject(oChart)
 * const aCharts = oLayout.GetAllCharts()
 * const oStroke = Api.CreateStroke(1 * 150, Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61)))
 * aCharts[0].SetMinorHorizontalGridlines(oStroke)
 * builder.SaveFile("pptx", "GetAllCharts.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiLayout
 * @name Duplicate
 * @description Creates a duplicate of the specified slide layout object, adds the new slide layout to the slide layout collection.
 * @returns {ApiLayout | null} returns new ApiLayout object that represents the copy of slide layout or null if slide layout doesn't exist or is not in the slide master
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * let oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * const oLayout = oMaster.GetLayout(0)
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * oLayout.AddObject(oShape)
 * oSlide = Api.CreateSlide()
 * oPresentation.AddSlide(oSlide)
 * const oDuplicateLayout = oLayout.Duplicate(1)
 * oSlide.ApplyLayout(oDuplicateLayout)
 * builder.SaveFile("pptx", "Duplicate.pptx")
 * builder.CloseFile()
 * @param {Number=} nPos=ApiMaster.GetLayoutsCount() Position where the new slide layout will be added.
 */

/**
 * @memberof ApiLayout
 * @name GetAllOleObjects
 * @description Returns an array with all the OLE objects from the slide layout.
 * @returns {Array<ApiOleObject>}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oMaster = oPresentation.GetMaster(0)
 * const oLayout = oMaster.GetLayout(0)
 * const oOleObject = Api.CreateOleObject("https://i.ytimg.com/vi_webp/SKGz4pmnpgY/sddefault.webp", 130 * 36000, 90 * 36000, "https://youtu.be/SKGz4pmnpgY", "asc.{38E022EA-AD92-45FC-B22B-49DF39746DB4}")
 * oOleObject.SetSize(200 * 36000, 130 * 36000)
 * oOleObject.SetPosition(70 * 36000, 30 * 36000)
 * oLayout.AddObject(oOleObject)
 * const aOleObjects = oLayout.GetAllOleObjects()
 * const sAppId = aOleObjects[0].GetApplicationId()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 224, 204), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 164, 101), 100000)
 * const oFill = Api.CreateLinearGradientFill([
 *   oGs1,
 *   oGs2
 * ], 5400000)
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oDrawing = Api.CreateShape("rect", 300 * 36000, 15 * 36000, oFill, oStroke)
 * oDrawing.SetPosition(20 * 36000, 170 * 36000)
 * const oDocContent = oDrawing.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("The application ID for the current OLE object: " + sAppId)
 * oLayout.AddObject(oDrawing)
 * builder.SaveFile("pptx", "GetAllOleObjects.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiLayout
 * @name GetAllDrawings
 * @description Returns an array with all the drawing objects from the slide layout.
 * @returns {Array<ApiDrawing>}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * const oLayout = oMaster.GetLayout(0)
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oDrawing = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oDrawing.SetPosition(608400, 1267200)
 * oDrawing.SetSize(300 * 36000, 130 * 36000)
 * oSlide.RemoveAllObjects()
 * oLayout.AddObject(oDrawing)
 * const aDrawings = oLayout.GetAllDrawings()
 * const oPlaceholder = Api.CreatePlaceholder("picture")
 * aDrawings[0].SetPlaceholder(oPlaceholder)
 * builder.SaveFile("pptx", "GetAllDrawings.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiLayout
 * @name FollowMasterBackground
 * @description Sets the master background as the background of the layout.
 * @returns {Boolean} returns false if master is null or master hasn't background
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oMaster.SetBackground(oFill)
 * const oLayout = oMaster.GetLayout(0)
 * oLayout.FollowMasterBackground()
 * oSlide.FollowLayoutBackground()
 * builder.SaveFile("pptx", "FollowMasterBackground.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiLayout
 * @name GetAllImages
 * @description Returns an array with all the image objects from the slide layout.
 * @returns {Array<ApiImage>}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * const oLayout = oMaster.GetLayout(0)
 * const oImage = Api.CreateImage("https://api.onlyoffice.com/content/img/docbuilder/examples/coordinate_aspects.png", 60 * 36000, 35 * 36000)
 * oLayout.AddObject(oImage)
 * const aImages = oLayout.GetAllImages()
 * const sType = aImages[0].GetClassType()
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(61, 74, 107))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Class type = " + sType)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetAllImages.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiLayout
 * @name Delete
 * @description Deletes the specified object from the parent slide master if it exists.
 * @returns {Boolean} return false if parent slide master doesn't exist
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * const nCountBefore = oMaster.GetLayoutsCount()
 * const oLayout = oMaster.GetLayout(0)
 * oLayout.Delete()
 * const nCountAfter = oMaster.GetLayoutsCount()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Number of layouts before deletion: " + nCountBefore)
 * oParagraph.AddLineBreak()
 * oParagraph.AddText("Number of layouts after deletion: " + nCountAfter)
 * oSlide.RemoveAllObjects()
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "Delete.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiLayout
 * @name GetAllShapes
 * @description Returns an array with all the shape objects from the slide layout.
 * @returns {Array<ApiShape>}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * const oLayout = oMaster.GetLayout(0)
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * oSlide.RemoveAllObjects()
 * oLayout.AddObject(oShape)
 * const aShapes = oLayout.GetAllShapes()
 * const oDocContent = aShapes[0].GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("This is a sample shape which was added to the current layout.")
 * builder.SaveFile("pptx", "GetAllShapes.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiLayout
 * @name GetClassType
 * @description Returns a type of the ApiLayout class.
 * @returns {String}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * const oLayout = oMaster.GetLayout(0)
 * const sType = oLayout.GetClassType()
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Class type = " + sType)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetClassType.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiLayout
 * @name GetMaster
 * @description Returns the parent slide master of the current layout.
 * @returns {ApiMaster | null} returns null if parent slide master doesn't exist
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oLayout = oSlide.GetLayout()
 * const oMaster = oLayout.GetMaster()
 * const sType = oMaster.GetClassType()
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Class type = " + sType)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetMaster.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiLayout
 * @name SetBackground
 * @description Sets the background to the current slide layout.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * const oLayout = oMaster.GetLayout(0)
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * oLayout.SetBackground(oFill)
 * oSlide.FollowLayoutBackground()
 * builder.SaveFile("pptx", "SetBackground.pptx")
 * builder.CloseFile()
 * @param {ApiFill} oApiFill The color or pattern used to fill the presentation slide layout background.
 */

/**
 * @memberof ApiLayout
 * @name SetName
 * @description Sets a name to the current layout.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * const oLayout = oMaster.GetLayout(0)
 * oLayout.SetName("New layout")
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("A new name was set to the current layout.")
 * oLayout.AddObject(oShape)
 * builder.SaveFile("pptx", "SetName.pptx")
 * builder.CloseFile()
 * @param {String} sName Layout name to be set.
 */

/**
 * @memberof ApiLayout
 * @name ToJSON
 * @description Converts the ApiLayout object into the JSON object.
 * @returns {JSON}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oMaster = oPresentation.GetMaster(0)
 * const oLayout = oMaster.GetLayout(0)
 * const json = oLayout.ToJSON(true, false)
 * const oLayoutFromJSON = Api.FromJSON(json)
 * oMaster.AddLayout(0, oLayoutFromJSON)
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const sType = oLayoutFromJSON.GetClassType()
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("Class type = " + sType)
 * oLayoutFromJSON.AddObject(oShape)
 * oSlide.ApplyLayout(oLayoutFromJSON)
 * builder.SaveFile("pptx", "ToJSON.pptx")
 * builder.CloseFile()
 * @param {Boolean=} bWriteMaster=false Specifies if the slide master will be written to the JSON object or not.
 * @param {Boolean=} bWriteTableStyles=false Specifies whether to write used table styles to the JSON object (true) or not (false).
 */

/**
 * @memberof ApiLayout
 * @name RemoveObject
 * @description Removes objects (image, shape or chart) from the current slide layout.
 * @returns {Boolean} returns false if layout doesn't exist or position is invalid or layout hasn't objects
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * const oLayout = oMaster.GetLayout(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oDrawing = Api.CreateShape("cube", 3212465, 963295, oFill, oStroke)
 * oDrawing.SetPosition(30 * 36000, 1267200)
 * oDrawing.SetSize(150 * 36000, 130 * 36000)
 * const oCopyDrawing = oDrawing.Copy()
 * oCopyDrawing.SetPosition(160 * 36000, 1267200)
 * oCopyDrawing.SetSize(150 * 36000, 130 * 36000)
 * oLayout.AddObject(oDrawing)
 * oLayout.AddObject(oCopyDrawing)
 * oLayout.RemoveObject(1, 1)
 * const oDocContent = oDrawing.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("The second cube was removed from this layout.")
 * builder.SaveFile("pptx", "RemoveObject.pptx")
 * builder.CloseFile()
 * @param {Number} nPos Position from which the object will be deleted.
 * @param {Number=} nCount=1 The number of elements to delete.
 */

/**
 * @memberof ApiOleObject
 * @name GetClassType
 * @description Returns a type of the ApiOleObject class.
 * @returns {String}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oOleObject = Api.CreateOleObject("https://api.onlyoffice.com/content/img/docbuilder/examples/ole-object-image.png", 130 * 36000, 90 * 36000, "https://youtu.be/SKGz4pmnpgY", "asc.{38E022EA-AD92-45FC-B22B-49DF39746DB4}")
 * oOleObject.SetSize(200 * 36000, 130 * 36000)
 * oOleObject.SetPosition(70 * 36000, 30 * 36000)
 * oSlide.AddObject(oOleObject)
 * const sType = oOleObject.GetClassType()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateLinearGradientFill([
 *   oGs1,
 *   oGs2
 * ], 5400000)
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oDrawing = Api.CreateShape("rect", 300 * 36000, 15 * 36000, oFill, oStroke)
 * oDrawing.SetPosition(20 * 36000, 170 * 36000)
 * const oDocContent = oDrawing.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("Class type: " + sType)
 * oSlide.AddObject(oDrawing)
 * builder.SaveFile("pptx", "GetClassType.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiOleObject
 * @name GetData
 * @description Returns the string data from the current OLE object.
 * @returns {String}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oOleObject = Api.CreateOleObject("https://api.onlyoffice.com/content/img/docbuilder/examples/ole-object-image.png", 130 * 36000, 90 * 36000, "https://youtu.be/SKGz4pmnpgY", "asc.{38E022EA-AD92-45FC-B22B-49DF39746DB4}")
 * oOleObject.SetSize(200 * 36000, 130 * 36000)
 * oOleObject.SetPosition(70 * 36000, 30 * 36000)
 * oSlide.AddObject(oOleObject)
 * const sData = oOleObject.GetData()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateLinearGradientFill([
 *   oGs1,
 *   oGs2
 * ], 5400000)
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oDrawing = Api.CreateShape("rect", 300 * 36000, 15 * 36000, oFill, oStroke)
 * oDrawing.SetPosition(20 * 36000, 170 * 36000)
 * const oDocContent = oDrawing.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("The OLE object data: " + sData)
 * oSlide.AddObject(oDrawing)
 * builder.SaveFile("pptx", "GetData.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiOleObject
 * @name GetApplicationId
 * @description Returns the application ID from the current OLE object.
 * @returns {String}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oOleObject = Api.CreateOleObject("https://api.onlyoffice.com/content/img/docbuilder/examples/ole-object-image.png", 130 * 36000, 90 * 36000, "https://youtu.be/SKGz4pmnpgY", "asc.{38E022EA-AD92-45FC-B22B-49DF39746DB4}")
 * oOleObject.SetSize(200 * 36000, 130 * 36000)
 * oOleObject.SetPosition(70 * 36000, 30 * 36000)
 * oSlide.AddObject(oOleObject)
 * const sAppId = oOleObject.GetApplicationId()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateLinearGradientFill([
 *   oGs1,
 *   oGs2
 * ], 5400000)
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oDrawing = Api.CreateShape("rect", 300 * 36000, 15 * 36000, oFill, oStroke)
 * oDrawing.SetPosition(20 * 36000, 170 * 36000)
 * const oDocContent = oDrawing.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("The application ID for the current OLE object: " + sAppId)
 * oSlide.AddObject(oDrawing)
 * builder.SaveFile("pptx", "GetApplicationId.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiLayout
 * @name MoveTo
 * @description Moves the specified layout to a specific location within the same collection.
 * @returns {Boolean} returns false if layout or parent slide master doesn't exist or position is invalid
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide1 = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * const oLayout1 = oMaster.GetLayout(3)
 * oSlide1.ApplyLayout(oLayout1)
 * oLayout1.MoveTo(7)
 * const oLayout2 = oMaster.GetLayout(7)
 * const oSlide2 = Api.CreateSlide()
 * oPresentation.AddSlide(oSlide2)
 * oSlide2.ApplyLayout(oLayout2)
 * const oSlide3 = Api.CreateSlide()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * oSlide3.AddObject(oShape)
 * const oDocContent = oShape.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("The third layout was moved to the seventh position within the same collection.")
 * oPresentation.AddSlide(oSlide3)
 * builder.SaveFile("pptx", "MoveTo.pptx")
 * builder.CloseFile()
 * @param {Number} nPos Position where the specified slide layout will be moved to.
 */

/**
 * @memberof ApiOleObject
 * @name SetData
 * @description Sets the data to the current OLE object.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oOleObject = Api.CreateOleObject("https://api.onlyoffice.com/content/img/docbuilder/examples/ole-object-image.png", 130 * 36000, 90 * 36000, "https://youtu.be/SKGz4pmnpgY", "asc.{38E022EA-AD92-45FC-B22B-49DF39746DB4}")
 * oOleObject.SetSize(200 * 36000, 130 * 36000)
 * oOleObject.SetPosition(70 * 36000, 30 * 36000)
 * oSlide.AddObject(oOleObject)
 * oOleObject.SetData("https://youtu.be/eJxpkjQG6Ew")
 * builder.SaveFile("pptx", "SetData.pptx")
 * builder.CloseFile()
 * @param {String} sData The OLE object string data.
 */

/**
 * @memberof ApiOleObject
 * @name SetApplicationId
 * @description Sets the application ID to the current OLE object.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oOleObject = Api.CreateOleObject("https://api.onlyoffice.com/content/img/docbuilder/examples/ole-object-image.png", 130 * 36000, 90 * 36000, "https://youtu.be/SKGz4pmnpgY", "asc.{38E022EA-AD92-45FC-B22B-49DF39746DB4}")
 * oOleObject.SetSize(200 * 36000, 130 * 36000)
 * oOleObject.SetPosition(70 * 36000, 30 * 36000)
 * oSlide.AddObject(oOleObject)
 * oOleObject.SetApplicationId("asc.{E5773A43-F9B3-4E81-81D9-CE0A132470E7}")
 * builder.SaveFile("pptx", "SetApplicationId.pptx")
 * builder.CloseFile()
 * @param {String} sAppId The application ID associated with the current OLE object.
 */

/**
 * @memberof ApiParaPr
 * @name GetIndRight
 * @description Returns the paragraph right side indentation.
 * @returns {twips | undefined}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oSlide.AddObject(oShape)
 * const oDocContent = oShape.GetDocContent()
 * let oParagraph = oDocContent.GetElement(0)
 * const oParaPr = oParagraph.GetParaPr()
 * oParaPr.SetIndRight(2880)
 * oParaPr.SetJc("right")
 * oParagraph.AddText("This is the first paragraph with the right offset of 2 inches set to it. ")
 * oParagraph.AddText("This indent is set by the paragraph style. No paragraph inline style is applied. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.")
 * const nIndRight = oParaPr.GetIndRight()
 * oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("Right indent: " + nIndRight)
 * oDocContent.Push(oParagraph)
 * builder.SaveFile("pptx", "GetIndRight.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParaPr
 * @name GetClassType
 * @description Returns a type of the ApiParaPr class.
 * @returns {String}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
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
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetClassType.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParaPr
 * @name GetIndFirstLine
 * @description Returns the paragraph first line indentation.
 * @returns {twips | undefined}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oSlide.AddObject(oShape)
 * const oDocContent = oShape.GetDocContent()
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
 * builder.SaveFile("pptx", "GetIndFirstLine.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParaPr
 * @name GetSpacingBefore
 * @description Returns the spacing before value of the current paragraph.
 * @returns {twips}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oSlide.AddObject(oShape)
 * const oDocContent = oShape.GetDocContent()
 * let oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("This is an example of setting a space before a paragraph. ")
 * oParagraph.AddText("The second paragraph will have an offset of one inch from the top. ")
 * oParagraph.AddText("This is due to the fact that the second paragraph has this offset enabled.")
 * const oParagraph2 = Api.CreateParagraph()
 * oParagraph2.AddText("This is the second paragraph and it is one inch away from the first paragraph.")
 * const oParaPr = oParagraph2.GetParaPr()
 * oParaPr.SetSpacingBefore(1440)
 * oDocContent.Push(oParagraph2)
 * const nSpacingBefore = oParaPr.GetSpacingBefore()
 * oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("Spacing before: " + nSpacingBefore)
 * oDocContent.Push(oParagraph)
 * builder.SaveFile("pptx", "GetSpacingBefore.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParaPr
 * @name GetSpacingAfter
 * @description Returns the spacing after value of the current paragraph.
 * @returns {twips}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oSlide.AddObject(oShape)
 * const oDocContent = oShape.GetDocContent()
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
 * builder.SaveFile("pptx", "GetSpacingAfter.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParaPr
 * @name GetSpacingLineRule
 * @description Returns the paragraph line spacing rule.
 * @returns {LineSpacingRule}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oSlide.AddObject(oShape)
 * const oDocContent = oShape.GetDocContent()
 * let oParagraph = oDocContent.GetElement(0)
 * const oParaPr = oParagraph.GetParaPr()
 * oParaPr.SetSpacingLine(3 * 240, "auto")
 * oParagraph.AddText("Paragraph 1. Spacing: 3 times of a common paragraph line spacing.")
 * oParagraph.AddLineBreak()
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * const sSpacingLineRule = oParaPr.GetSpacingLineRule()
 * oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("Spacing line rule : " + sSpacingLineRule)
 * oDocContent.Push(oParagraph)
 * builder.SaveFile("pptx", "GetSpacingLineRule.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParaPr
 * @name GetJc
 * @description Returns the paragraph contents justification.
 * @returns {ContenJustification}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oSlide.AddObject(oShape)
 * const oDocContent = oShape.GetDocContent()
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
 * builder.SaveFile("pptx", "GetJc.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParaPr
 * @name GetSpacingLineValue
 * @description Returns the paragraph line spacing value.
 * @returns {twips | line240 | undefined}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oSlide.AddObject(oShape)
 * const oDocContent = oShape.GetDocContent()
 * let oParagraph = oDocContent.GetElement(0)
 * const oParaPr = oParagraph.GetParaPr()
 * oParaPr.SetSpacingLine(3 * 240, "auto")
 * oParagraph.AddText("Paragraph 1. Spacing: 3 times of a common paragraph line spacing.")
 * oParagraph.AddLineBreak()
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * const nSpacingLineValue = oParaPr.GetSpacingLineValue()
 * oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("Spacing line value : " + nSpacingLineValue)
 * oDocContent.Push(oParagraph)
 * builder.SaveFile("pptx", "GetSpacingLineValue.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParaPr
 * @name SetBullet
 * @description Sets the bullet or numbering to the current paragraph.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oParaPr = oParagraph.GetParaPr()
 * const oBullet = Api.CreateBullet("-")
 * oParaPr.SetBullet(oBullet)
 * oParagraph.AddText(" This is an example of the bulleted paragraph.")
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetBullet.pptx")
 * builder.CloseFile()
 * @param {ApiBullet | null} oBullet The bullet object created with the Api#CreateBullet or Api#CreateNumbering method.
 */

/**
 * @memberof ApiParaPr
 * @name GetIndLeft
 * @description Returns the paragraph left side indentation.
 * @returns {twips | undefined}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oSlide.AddObject(oShape)
 * const oDocContent = oShape.GetDocContent()
 * let oParagraph = oDocContent.GetElement(0)
 * const oParaPr = oParagraph.GetParaPr()
 * oParaPr.SetIndLeft(2880)
 * oParagraph.AddText("This is the first paragraph with the indent of 2 inches set to it. ")
 * oParagraph.AddText("This indent is set by the paragraph style. No paragraph inline style is applied. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.")
 * const nIndLeft = oParaPr.GetIndLeft()
 * oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("Left indent: " + nIndLeft)
 * oDocContent.Push(oParagraph)
 * builder.SaveFile("pptx", "GetIndLeft.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParaPr
 * @name SetIndFirstLine
 * @description Sets the paragraph first line indentation.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oParaPr = oParagraph.GetParaPr()
 * oParaPr.SetIndFirstLine(1440)
 * oParagraph.AddText("This is the first paragraph with the indent of 1 inch set to the first line. ")
 * oParagraph.AddText("This indent is set by the paragraph style. No paragraph inline style is applied. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.")
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetIndFirstLine.pptx")
 * builder.CloseFile()
 * @param {twips} nValue The paragraph first line indentation value measured in twentieths of a point (1/1440 of an inch).
 */

/**
 * @memberof ApiParaPr
 * @name SetIndLeft
 * @description Sets the paragraph left side indentation.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oParaPr = oParagraph.GetParaPr()
 * oParaPr.SetIndLeft(2880)
 * oParagraph.AddText("This is the first paragraph with the indent of 2 inches set to it. ")
 * oParagraph.AddText("This indent is set by the paragraph style. No paragraph inline style is applied. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetIndLeft.pptx")
 * builder.CloseFile()
 * @param {twips} nValue The paragraph left side indentation value measured in twentieths of a point (1/1440 of an inch).
 */

/**
 * @memberof ApiParaPr
 * @name SetIndRight
 * @description Sets the paragraph right side indentation.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oParaPr = oParagraph.GetParaPr()
 * oParaPr.SetIndRight(2880)
 * oParagraph.AddText("This is the first paragraph with the right offset of 2 inches set to it. ")
 * oParagraph.AddText("This offset is set by the paragraph style. No paragraph inline style is applied. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetIndRight.pptx")
 * builder.CloseFile()
 * @param {twips} nValue The paragraph right side indentation value measured in twentieths of a point (1/1440 of an inch).
 */

/**
 * @memberof ApiParaPr
 * @name SetSpacingBefore
 * @description Sets the spacing before the current paragraph. If the value of the isBeforeAuto parameter is true, then any value of the nBefore is ignored. If isBeforeAuto parameter is not specified, then it will be interpreted as false.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * let oParagraph = oDocContent.GetElement(0)
 * let oParaPr = oParagraph.GetParaPr()
 * oParagraph.AddText("This is an example of setting a space before a paragraph. ")
 * oParagraph.AddText("The second paragraph will have an offset of one inch from the top. ")
 * oParagraph.AddText("This is due to the fact that the second paragraph has this offset enabled.")
 * oParagraph = Api.CreateParagraph()
 * oParaPr = oParagraph.GetParaPr()
 * oParaPr.SetSpacingBefore(1440)
 * oParagraph.AddText("This is the second paragraph and it is one inch away from the first paragraph.")
 * oDocContent.Push(oParagraph)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetSpacingBefore.pptx")
 * builder.CloseFile()
 * @param {twips} nBefore The value of the spacing before the current paragraph measured in twentieths of a point (1/1440 of an inch).
 * @param {Boolean=} isBeforeAuto=false The true value disables the spacing before the current paragraph.
 */

/**
 * @memberof ApiParaPr
 * @name SetSpacingAfter
 * @description Sets the spacing after the current paragraph. If the value of the isAfterAuto parameter is true, then any value of the nAfter is ignored. If isAfterAuto parameter is not specified, then it will be interpreted as false.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * let oParagraph = oDocContent.GetElement(0)
 * const oParaPr = oParagraph.GetParaPr()
 * oParaPr.SetSpacingAfter(1440)
 * oParagraph.AddText("This is an example of setting a space after a paragraph. ")
 * oParagraph.AddText("The second paragraph will have an offset of one inch from the top. ")
 * oParagraph.AddText("This is due to the fact that the first paragraph has this offset enabled.")
 * oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("This is the second paragraph and it is one inch away from the first paragraph.")
 * oDocContent.Push(oParagraph)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetSpacingAfter.pptx")
 * builder.CloseFile()
 * @param {twips} nAfter The value of the spacing after the current paragraph measured in twentieths of a point (1/1440 of an inch).
 * @param {Boolean=} isAfterAuto=false The true value disables the spacing after the current paragraph.
 */

/**
 * @memberof ApiParaPr
 * @name SetSpacingLine
 * @description Sets the paragraph line spacing. If the value of the sLineRule parameter is either "atLeast" or "exact", then the value of nLine will be interpreted as twentieths of a point. If the value of the sLineRule parameter is "auto", then the value of the nLine parameter will be interpreted as 240ths of a line.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oParaPr = oParagraph.GetParaPr()
 * oParaPr.SetSpacingLine(3 * 240, "auto")
 * oParagraph.AddText("Paragraph 1. Spacing: 3 times of a common paragraph line spacing.")
 * oParagraph.AddLineBreak()
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetSpacingLine.pptx")
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
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oParaPr = oParagraph.GetParaPr()
 * oParaPr.SetTabs([
 *   1440,
 *   4320,
 *   7200
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
 * oParagraph.AddText("Custom tab - 3 inches center")
 * oParagraph.AddLineBreak()
 * oParagraph.AddTabStop()
 * oParagraph.AddTabStop()
 * oParagraph.AddTabStop()
 * oParagraph.AddText("Custom tab - 5 inches right")
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetTabs.pptx")
 * builder.CloseFile()
 * @param {Array<twips>} aPos An array of the positions of custom tab stops with respect to the current page margins measured in twentieths of a point (1/1440 of an inch).
 * @param {Array<TabJc>} aVal An array of the styles of custom tab stops, which determines the behavior of the tab stop and the alignment which will be applied to text entered at the current custom tab stop.
 */

/**
 * @memberof ApiMaster
 * @name AddLayout
 * @description Adds a layout to the specified slide master.
 * @returns {Boolean} returns false if oLayout isn't a layout
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * const nCountBefore = oMaster.GetLayoutsCount()
 * const oLayout = Api.CreateLayout()
 * oMaster.AddLayout(0, oLayout)
 * const nCountAfter = oMaster.GetLayoutsCount()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Number of layouts before adding new layout: " + nCountBefore)
 * oParagraph.AddLineBreak()
 * oParagraph.AddText("Number of layouts after adding new layout: " + nCountAfter)
 * oSlide.RemoveAllObjects()
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "AddLayout.pptx")
 * builder.CloseFile()
 * @param {Number=} nPos=ApiMaster.GetLayoutsCount() Position where a layout will be added.
 * @param {ApiLayout} oLayout A layout to be added.
 */

/**
 * @memberof ApiMaster
 * @name AddObject
 * @description Adds an object (image, shape or chart) to the current slide master.
 * @returns {Boolean} returns false if slide master doesn't exist
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * oMaster.AddObject(oShape)
 * builder.SaveFile("pptx", "AddObject.pptx")
 * builder.CloseFile()
 * @param {ApiDrawing} oDrawing
 * @param The object which will be added to the current slide master.
 */

/**
 * @memberof ApiMaster
 * @name ClearBackground
 * @description Clears the slide master background.
 * @returns {Boolean} return false if slide master doesn't exist
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * oMaster.ClearBackground()
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * oMaster.AddObject(oShape)
 * builder.SaveFile("pptx", "AddObject.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParaPr
 * @name SetJc
 * @description Sets the paragraph contents justification.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oParaPr = oParagraph.GetParaPr()
 * oParaPr.SetJc("center")
 * oParagraph.AddText("This is a paragraph with the text in it aligned by the center. ")
 * oParagraph.AddText("The justification is specified in the paragraph style. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.")
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetJc.pptx")
 * builder.CloseFile()
 * @param {ContentJustification} sJc The justification type that will be applied to the paragraph contents.
 */

/**
 * @memberof ApiMaster
 * @name Copy
 * @description Creates a copy of the specified slide master object.
 * @returns {ApiMaster | null} returns new ApiMaster object that represents the copy of slide master or null if slide doesn't exist
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * const nCountBefore = oPresentation.GetMastersCount()
 * const oCopyMaster = oMaster.Copy()
 * oPresentation.AddMaster(1, oCopyMaster)
 * const nCountAfter = oPresentation.GetMastersCount()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Number of masters before adding the copied master: " + nCountBefore)
 * oParagraph.AddLineBreak()
 * oParagraph.AddText("Number of masters after adding the copied master: " + nCountAfter)
 * oSlide.RemoveAllObjects()
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "Copy.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiMaster
 * @name Delete
 * @description Deletes the specified object from the parent if it exists.
 * @returns {Boolean} return false if master doesn't exist or is not in the presentation
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * const nCountBefore = oPresentation.GetMastersCount()
 * oMaster.Delete()
 * const nCountAfter = oPresentation.GetMastersCount()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Number of masters before deletion: " + nCountBefore)
 * oParagraph.AddLineBreak()
 * oParagraph.AddText("Number of masters after deletion: " + nCountAfter)
 * oSlide.RemoveAllObjects()
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "Delete.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiMaster
 * @name Duplicate
 * @description Creates a duplicate of the specified slide master object, adds the new slide master to the slide masters collection.
 * @returns {ApiMaster | null} returns new ApiMaster object that represents the copy of slide master or null if slide master doesn't exist or is not in the presentation
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * const nCountBefore = oPresentation.GetMastersCount()
 * oMaster.Duplicate(1)
 * const nCountAfter = oPresentation.GetMastersCount()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Number of masters before duplicating: " + nCountBefore)
 * oParagraph.AddLineBreak()
 * oParagraph.AddText("Number of masters after duplicating: " + nCountAfter)
 * oSlide.RemoveAllObjects()
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "Duplicate.pptx")
 * builder.CloseFile()
 * @param {Number=} nPos=ApiPresentation.GetMastersCount() Position where the new slide master will be added.
 */

/**
 * @memberof ApiMaster
 * @name GetAllImages
 * @description Returns an array with all the image objects from the slide master.
 * @returns {Array<ApiImage>}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * const oImage = Api.CreateImage("https://api.onlyoffice.com/content/img/docbuilder/examples/coordinate_aspects.png", 60 * 36000, 35 * 36000)
 * oMaster.AddObject(oImage)
 * const aImages = oMaster.GetAllImages()
 * const sType = aImages[0].GetClassType()
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(61, 74, 107))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Class type = " + sType)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetAllImages.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiMaster
 * @name GetAllDrawings
 * @description Returns an array with all the drawing objects from the slide master.
 * @returns {Array<ApiDrawing>}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oDrawing = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oDrawing.SetPosition(608400, 1267200)
 * oDrawing.SetSize(300 * 36000, 130 * 36000)
 * oSlide.RemoveAllObjects()
 * oMaster.AddObject(oDrawing)
 * const aDrawings = oMaster.GetAllDrawings()
 * const oPlaceholder = Api.CreatePlaceholder("picture")
 * aDrawings[0].SetPlaceholder(oPlaceholder)
 * builder.SaveFile("pptx", "GetAllDrawings.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiMaster
 * @name GetAllOleObjects
 * @description Returns an array with all the OLE objects from the slide master.
 * @returns {Array<ApiOleObject>}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * const oOleObject = Api.CreateOleObject("https://i.ytimg.com/vi_webp/SKGz4pmnpgY/sddefault.webp", 130 * 36000, 90 * 36000, "https://youtu.be/SKGz4pmnpgY", "asc.{38E022EA-AD92-45FC-B22B-49DF39746DB4}")
 * oOleObject.SetSize(200 * 36000, 130 * 36000)
 * oOleObject.SetPosition(70 * 36000, 30 * 36000)
 * oMaster.AddObject(oOleObject)
 * const aOleObjects = oMaster.GetAllOleObjects()
 * const sAppId = aOleObjects[0].GetApplicationId()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 224, 204), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 164, 101), 100000)
 * const oFill = Api.CreateLinearGradientFill([
 *   oGs1,
 *   oGs2
 * ], 5400000)
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oDrawing = Api.CreateShape("rect", 300 * 36000, 15 * 36000, oFill, oStroke)
 * oDrawing.SetPosition(20 * 36000, 170 * 36000)
 * const oDocContent = oDrawing.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("The application ID for the current OLE object: " + sAppId)
 * oMaster.AddObject(oDrawing)
 * builder.SaveFile("pptx", "GetAllOleObjects.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiMaster
 * @name GetClassType
 * @description Returns a type of the ApiMaster class.
 * @returns {String}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * const sType = oMaster.GetClassType()
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Class type = " + sType)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetClassType.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiMaster
 * @name GetAllShapes
 * @description Returns an array with all the shape objects from the slide master.
 * @returns {Array<ApiShape>}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * oMaster.AddObject(oShape)
 * const aShapes = oMaster.GetAllShapes()
 * const sType = aShapes[0].GetClassType()
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Class type = " + sType)
 * oShape.SetVerticalTextAlign("center")
 * builder.SaveFile("pptx", "GetAllShapes.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiMaster
 * @name GetLayout
 * @description Returns a layout of the specified slide master by its position.
 * @returns {ApiLayout | null} returns null if position is invalid
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * const oLayout = Api.CreateLayout()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * oLayout.AddObject(oShape)
 * oMaster.AddLayout(0, oLayout)
 * oSlide.ApplyLayout(oMaster.GetLayout(0))
 * builder.SaveFile("pptx", "GetLayout.pptx")
 * builder.CloseFile()
 * @param {Number} nPos Layout position.
 */

/**
 * @memberof ApiMaster
 * @name GetAllCharts
 * @description Returns an array with all the chart objects from the slide master.
 * @returns {Array<ApiChart>}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetVerAxisTitle("USD In Hundred Thousands", 10)
 * oChart.SetHorAxisTitle("Year", 11)
 * oChart.SetLegendPos("bottom")
 * oChart.SetShowDataLabels(false, false, true, false)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * oMaster.AddObject(oChart)
 * oSlide.RemoveAllObjects()
 * const aCharts = oMaster.GetAllCharts()
 * const oStroke = Api.CreateStroke(1 * 150, Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61)))
 * aCharts[0].SetMinorHorizontalGridlines(oStroke)
 * builder.SaveFile("pptx", "GetAllCharts.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiMaster
 * @name RemoveLayout
 * @description Removes the layouts from the current slide master.
 * @returns {Boolean} return false if position is invalid
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * const nCountBefore = oMaster.GetLayoutsCount()
 * oMaster.RemoveLayout(0, 2)
 * const nCountAfter = oMaster.GetLayoutsCount()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Number of layouts before deletion: " + nCountBefore)
 * oParagraph.AddLineBreak()
 * oParagraph.AddText("Number of layouts after deletion: " + nCountAfter)
 * oSlide.RemoveAllObjects()
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "RemoveLayout.pptx")
 * builder.CloseFile()
 * @param {Number} nPos Position from which a layout will be deleted.
 * @param {Number=} nCount=1 Number of layouts to delete.
 */

/**
 * @memberof ApiMaster
 * @name GetLayoutsCount
 * @description Returns a number of layout objects.
 * @returns {Number}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * const nLayouts = oMaster.GetLayoutsCount()
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Number of layouts = " + nLayouts)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetLayoutsCount.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiMaster
 * @name GetTheme
 * @description Returns a theme of the slide master.
 * @returns {ApiTheme | null} returns null if theme doesn't exist
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * const oTheme = oMaster.GetTheme()
 * const oClrScheme = Api.CreateThemeColorScheme([
 *   Api.CreateRGBColor(255, 111, 61),
 *   Api.CreateRGBColor(51, 51, 51),
 *   Api.CreateRGBColor(230, 179, 117),
 *   Api.CreateRGBColor(235, 235, 235),
 *   Api.CreateRGBColor(163, 21, 21),
 *   Api.CreateRGBColor(128, 43, 43),
 *   Api.CreateRGBColor(0, 0, 0),
 *   Api.CreateRGBColor(128, 128, 128),
 *   Api.CreateRGBColor(176, 196, 222),
 *   Api.CreateRGBColor(65, 105, 225),
 *   Api.CreateRGBColor(255, 255, 255),
 *   Api.CreateRGBColor(255, 213, 191)
 * ], "New color scheme")
 * oTheme.SetColorScheme(oClrScheme)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetVerAxisTitle("USD In Hundred Thousands", 10)
 * oChart.SetHorAxisTitle("Year", 11)
 * oChart.SetLegendPos("bottom")
 * oChart.SetShowDataLabels(false, false, true, false)
 * oChart.SetTitle("Financial Overview", 20)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "GetTheme.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiMaster
 * @name ToJSON
 * @description Converts the ApiMaster object into the JSON object.
 * @returns {JSON}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * const json = oMaster.ToJSON(true)
 * const oMasterFromJSON = Api.FromJSON(json)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const sType = oMasterFromJSON.GetClassType()
 * oParagraph.AddText("Class type = " + sType)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "ToJSON.pptx")
 * builder.CloseFile()
 * @param {Boolean=} bWriteTableStyles=false Specifies whether to write used table styles to the JSON object (true) or not (false).
 */

/**
 * @memberof ApiMaster
 * @name SetBackground
 * @description Sets the background to the current slide master.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * oMaster.ClearBackground()
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * oMaster.AddObject(oShape)
 * oMaster.SetBackground(oFill)
 * builder.SaveFile("pptx", "AddObject.pptx")
 * builder.CloseFile()
 * @param {ApiFill} oApiFill The color or pattern used to fill the presentation slide master background.
 */

/**
 * @memberof ApiMaster
 * @name SetTheme
 * @description Sets a theme to the slide master. Sets a copy of the theme object.
 * @returns {Boolean} return false if oTheme isn't a theme or slide master doesn't exist
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * const oClrScheme = Api.CreateThemeColorScheme([
 *   Api.CreateRGBColor(255, 111, 61),
 *   Api.CreateRGBColor(51, 51, 51),
 *   Api.CreateRGBColor(230, 179, 117),
 *   Api.CreateRGBColor(235, 235, 235),
 *   Api.CreateRGBColor(163, 21, 21),
 *   Api.CreateRGBColor(128, 43, 43),
 *   Api.CreateRGBColor(0, 0, 0),
 *   Api.CreateRGBColor(128, 128, 128),
 *   Api.CreateRGBColor(176, 196, 222),
 *   Api.CreateRGBColor(65, 105, 225),
 *   Api.CreateRGBColor(255, 255, 255),
 *   Api.CreateRGBColor(255, 213, 191)
 * ], "New color scheme")
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill1 = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oBgFill1 = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke1 = Api.CreateStroke(0, oFill2)
 * var oFill2 = Api.CreatePatternFill("dashDnDiag", Api.CreateRGBColor(255, 111, 61), Api.CreateRGBColor(51, 51, 51))
 * const oBgFill2 = Api.CreatePatternFill("dashDnDiag", Api.CreateRGBColor(255, 111, 61), Api.CreateRGBColor(51, 51, 51))
 * const oStroke2 = Api.CreateStroke(0, Api.CreateRGBColor(51, 51, 51))
 * const oFill3 = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oBgFill3 = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke3 = Api.CreateStroke(0, oFill1)
 * const oFormatScheme = Api.CreateThemeFormatScheme([
 *   oFill1,
 *   oFill2,
 *   oFill3
 * ], [
 *   oBgFill1,
 *   oBgFill2,
 *   oBgFill3
 * ], [
 *   oStroke1,
 *   oStroke2,
 *   oStroke3
 * ], "New format scheme")
 * const oFontScheme = Api.CreateThemeFontScheme("Arial", "Noto Sans Simplified Chinese", "Arabic", "Times New Roman", "Noto Serif Simplified Chinese", "Arabic", "New font scheme")
 * const oTheme = Api.CreateTheme("New theme", oMaster, oClrScheme, oFormatScheme, oFontScheme)
 * oMaster.SetTheme(oTheme)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetVerAxisTitle("USD In Hundred Thousands", 10)
 * oChart.SetHorAxisTitle("Year", 11)
 * oChart.SetLegendPos("bottom")
 * oChart.SetShowDataLabels(false, false, true, false)
 * oChart.SetTitle("Financial Overview", 20)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "SetTheme.pptx")
 * builder.CloseFile()
 * @param {ApiTheme} oTheme Presentation theme.
 */

/**
 * @memberof ApiPlaceholder
 * @name GetClassType
 * @description Returns a type of the ApiPlaceholder class.
 * @returns {String}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oPlaceholder = Api.CreatePlaceholder("chart")
 * oShape.SetPlaceholder(oPlaceholder)
 * const sType = oPlaceholder.GetClassType()
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Class type = " + sType)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetClassType.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParagraph
 * @name AddElement
 * @description Adds an element to the current paragraph.
 * @returns {Boolean} returns "false" if the type of "oElement" is not supported by paragraph content
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * oRun.AddText("This is the text for a text run. Nothing special.")
 * oParagraph.AddElement(oRun)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "AddElement.pptx")
 * builder.CloseFile()
 * @param {ParagraphContent} oElement The document element which will be added at the current position. Returns false if the oElement type is not supported by a paragraph.
 * @param {Number} nPos The position where the current element will be added. If this value is not specified, then the element will be added at the end of the current paragraph.
 */

/**
 * @memberof ApiParagraph
 * @name AddText
 * @description Adds some text to the current paragraph.
 * @returns {ApiRun}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("This is a text inside the shape aligned left.")
 * oParagraph.AddLineBreak()
 * oParagraph.AddText("This is a text after the line break.")
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "AddText.pptx")
 * builder.CloseFile()
 * @param {String=} sText The text that we want to insert into the current document element.
 */

/**
 * @memberof ApiMaster
 * @name RemoveObject
 * @description Removes objects (image, shape or chart) from the current slide master.
 * @returns {Boolean} returns false if master doesn't exist or position is invalid or master hasn't objects
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oDrawing = Api.CreateShape("cube", 3212465, 963295, oFill, oStroke)
 * oDrawing.SetPosition(30 * 36000, 1267200)
 * oDrawing.SetSize(150 * 36000, 130 * 36000)
 * const oCopyDrawing = oDrawing.Copy()
 * oCopyDrawing.SetPosition(170 * 36000, 1267200)
 * oCopyDrawing.SetSize(150 * 36000, 130 * 36000)
 * oMaster.AddObject(oDrawing)
 * oMaster.AddObject(oCopyDrawing)
 * oMaster.RemoveObject(1, 1)
 * const oDocContent = oDrawing.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("The second cube was removed from this master.")
 * builder.SaveFile("pptx", "RemoveObject.pptx")
 * builder.CloseFile()
 * @param {Number} nPos Position from which a layout will be deleted.
 * @param {Number=} nCount=1 Number of layouts to delete.
 */

/**
 * @memberof ApiParagraph
 * @name AddTabStop
 * @description Adds a tab stop to the current paragraph.
 * @returns {ApiRun}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("This is just a sample text. After it three tab stops will be added.")
 * oParagraph.AddTabStop()
 * oParagraph.AddTabStop()
 * oParagraph.AddTabStop()
 * oParagraph.AddText("This is the text which starts after the tab stops.")
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "AddTabStop.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParagraph
 * @name AddLineBreak
 * @description Adds a line break to the current position and starts the next element from a new line.
 * @returns {ApiRun}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("This is a text inside the shape aligned left.")
 * oParagraph.AddLineBreak()
 * oParagraph.AddText("This is a text after the line break.")
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "AddLineBreak.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiPlaceholder
 * @name SetType
 * @description Sets the placeholder type.
 * @returns {Boolean} returns false if placeholder type doesn't exist
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oPlaceholder = Api.CreatePlaceholder("chart")
 * oShape.SetPlaceholder(oPlaceholder)
 * oPlaceholder.SetType("picture")
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetType.pptx")
 * builder.CloseFile()
 * @param {PlaceholderType} sType Placeholder type.
 */

/**
 * @memberof ApiParagraph
 * @name Delete
 * @description Deletes the current paragraph.
 * @returns {Boolean} returns false if paragraph haven't parent
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * oDocContent.RemoveAllElements()
 * let oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("This is just a sample text.")
 * oDocContent.Push(oParagraph)
 * oParagraph.Delete()
 * oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("This is the second paragraph. The first paragraph was removed from the shape content.")
 * oDocContent.Push(oParagraph)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "Delete.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParagraph
 * @name GetClassType
 * @description Returns a type of the ApiParagraph class.
 * @returns {String}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const sClassType = oParagraph.GetClassType()
 * oParagraph.AddText("Class Type = " + sClassType)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetClassType.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParagraph
 * @name GetIndFirstLine
 * @description Returns the paragraph first line indentation. Inherited From: ApiParaPr#GetIndFirstLine
 * @returns {twips | undefined}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oSlide.AddObject(oShape)
 * const oDocContent = oShape.GetDocContent()
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
 * builder.SaveFile("pptx", "GetIndFirstLine.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParagraph
 * @name GetIndLeft
 * @description Returns the paragraph left side indentation. Inherited From: ApiParaPr#GetIndLeft
 * @returns {twips | undefined}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oSlide.AddObject(oShape)
 * const oDocContent = oShape.GetDocContent()
 * let oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("This is a paragraph with the indent of 2 inches set to it. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.")
 * oParagraph.SetIndLeft(2880)
 * const nIndLeft = oParagraph.GetIndLeft()
 * oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("Left indent: " + nIndLeft)
 * oDocContent.Push(oParagraph)
 * builder.SaveFile("pptx", "GetIndLeft.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParagraph
 * @name GetElementsCount
 * @description Returns a number of elements in the current paragraph.
 * @returns {Number}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
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
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetElementsCount.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParagraph
 * @name Copy
 * @description Creates a paragraph copy. Ingnore comments, footnote references, complex fields.
 * @returns {ApiParagraph}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * oDocContent.RemoveAllElements()
 * const oParagraph = Api.CreateParagraph()
 * oParagraph.SetJc("left")
 * oParagraph.AddText("This is just a sample text that was copied.")
 * oDocContent.Push(oParagraph)
 * const oCopyParagraph = oParagraph.Copy()
 * oDocContent.Push(oCopyParagraph)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "Copy.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParagraph
 * @name GetNext
 * @description Returns the next paragraph.
 * @returns {ApiParagraph | null} returns "null" if paragraph is the last
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * oDocContent.RemoveAllElements()
 * const oParagraph1 = Api.CreateParagraph()
 * oParagraph1.AddText("This is the first paragraph.")
 * oDocContent.Push(oParagraph1)
 * const oParagraph2 = Api.CreateParagraph()
 * oParagraph2.AddText("This is the second paragraph.")
 * oDocContent.Push(oParagraph2)
 * oSlide.AddObject(oShape)
 * const oNextParagraph = oParagraph1.GetNext()
 * oNextParagraph.SetBold(true)
 * builder.SaveFile("pptx", "GetNext.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParagraph
 * @name GetJc
 * @description Returns the paragraph contents justification. Inherited From: ApiParaPr#GetJc
 * @returns {ContentJustification}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oSlide.AddObject(oShape)
 * const oDocContent = oShape.GetDocContent()
 * let oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("This is a paragraph with the text in it aligned by the center. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.")
 * oParagraph.SetJc("center")
 * const sJc = oParagraph.GetJc()
 * oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("Justification: " + sJc)
 * oDocContent.Push(oParagraph)
 * builder.SaveFile("pptx", "GetJc.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParagraph
 * @name GetElement
 * @description Returns a paragraph element using the position specified.
 * @returns {ParagraphContent | null}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
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
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetElement.pptx")
 * builder.CloseFile()
 * @param {number} nPos The position where the element which content we want to get must be located.
 */

/**
 * @memberof ApiParagraph
 * @name GetIndRight
 * @description Returns the paragraph right side indentation. Inherited From: ApiParaPr#GetIndRight
 * @returns {twips | undefined}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oSlide.AddObject(oShape)
 * const oDocContent = oShape.GetDocContent()
 * let oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("This is a paragraph with the right offset of 2 inches set to it. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.")
 * oParagraph.SetJc("right")
 * oParagraph.SetIndRight(2880)
 * const nIndRight = oParagraph.GetIndRight()
 * oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("Right indent: " + nIndRight)
 * oDocContent.Push(oParagraph)
 * builder.SaveFile("pptx", "GetIndRight.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParagraph
 * @name GetParaPr
 * @description Returns the paragraph properties.
 * @returns {ApiParaPr}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * let oParagraph = oDocContent.GetElement(0)
 * const oParaPr = oParagraph.GetParaPr()
 * oParaPr.SetSpacingAfter(1440)
 * oParagraph.AddText("This is an example of setting a space after a paragraph. ")
 * oParagraph.AddText("The second paragraph will have an offset of one inch from the top. ")
 * oParagraph.AddText("This is due to the fact that the first paragraph has this offset enabled.")
 * oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("This is the second paragraph and it is one inch away from the first paragraph.")
 * oDocContent.Push(oParagraph)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetParaPr.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParagraph
 * @name GetSpacingAfter
 * @description Returns the spacing after value of the current paragraph. Inherited From: ApiParaPr#GetSpacingAfter
 * @returns {twips}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oSlide.AddObject(oShape)
 * const oDocContent = oShape.GetDocContent()
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
 * builder.SaveFile("pptx", "GetSpacingAfter.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParagraph
 * @name GetPrevious
 * @description Returns the previous paragraph.
 * @returns {ApiParagraph | null} returns "null" if paragraph is the first
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * oDocContent.RemoveAllElements()
 * const oParagraph1 = Api.CreateParagraph()
 * oParagraph1.AddText("This is the first paragraph.")
 * oDocContent.Push(oParagraph1)
 * const oParagraph2 = Api.CreateParagraph()
 * oParagraph2.AddText("This is the second paragraph.")
 * oDocContent.Push(oParagraph2)
 * oSlide.AddObject(oShape)
 * const oPreviousParagraph = oParagraph2.GetPrevious()
 * oPreviousParagraph.SetBold(true)
 * builder.SaveFile("pptx", "GetPrevious.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParagraph
 * @name GetSpacingLineValue
 * @description Returns the paragraph line spacing value. Inherited From: ApiParaPr#GetSpacingLineValue
 * @returns {twips | line240 | undefined}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oSlide.AddObject(oShape)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetSpacingLine(3 * 240, "auto")
 * oParagraph.AddText("Paragraph 1. Spacing: 3 times of a common paragraph line spacing.")
 * oParagraph.AddLineBreak()
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddLineBreak()
 * const nSpacingLineValue = oParagraph.GetSpacingLineValue()
 * oParagraph.AddText("Spacing line value: " + nSpacingLineValue)
 * builder.SaveFile("pptx", "GetSpacingLineValue.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParagraph
 * @name GetSpacingLineRule
 * @description Returns the paragraph line spacing rule. Inherited From: ApiParaPr#GetSpacingLineRule
 * @returns {LineSpacingRule}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oSlide.AddObject(oShape)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetSpacingLine(3 * 240, "auto")
 * oParagraph.AddText("Paragraph 1. Spacing: 3 times of a common paragraph line spacing.")
 * oParagraph.AddLineBreak()
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddLineBreak()
 * const sSpacingLineRule = oParagraph.GetSpacingLineRule()
 * oParagraph.AddText("Spacing line rule: " + sSpacingLineRule)
 * builder.SaveFile("pptx", "GetSpacingLineRule.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParagraph
 * @name RemoveAllElements
 * @description Removes all the elements from the current paragraph. When all the elements are removed from the paragraph, a new empty run is automatically created. If you want to add content to this run, use the ApiParagraph#AddElement method.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("This is the first text run in the current paragraph.")
 * oParagraph.RemoveAllElements()
 * oParagraph.AddText("We removed all the paragraph elements and added a new text run inside it.")
 * oDocContent.Push(oParagraph)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "RemoveAllElements.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParagraph
 * @name RemoveElement
 * @description Removes an element using the position specified. If the element you remove is the last paragraph element (i.e. all the elements are removed from the paragraph), a new empty run is automatically created. If you want to add content to this run, use the ApiParagraph#AddElement method.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * let oParagraph = oDocContent.GetElement(0)
 * oParagraph = oDocContent.GetElement(0)
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
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "RemoveElement.pptx")
 * builder.CloseFile()
 * @param {umber} nPos The element position which we want to remove from the paragraph.
 */

/**
 * @memberof ApiParagraph
 * @name SetBullet
 * @description Sets the bullet or numbering to the current paragraph. Inherited From: ApiParaPr#SetBullet
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oBullet = Api.CreateBullet("-")
 * oParagraph.SetBullet(oBullet)
 * oParagraph.AddText(" This is an example of the bulleted paragraph.")
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetBullet.pptx")
 * builder.CloseFile()
 * @param {ApiBullet=} oBullet=null The bullet object created with the Api#CreateBullet or Api#CreateNumbering method.
 */

/**
 * @memberof ApiParagraph
 * @name SetHighlight
 * @description Specifies a highlighting color which is applied as a background to the contents of the current paragraph.
 * @returns {ApiParagraph}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("This is just a sample text. ")
 * oParagraph.SetHighlight("lightGray")
 * oDocContent.Push(oParagraph)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetHighlight.pptx")
 * builder.CloseFile()
 * @param {highlightColor} sColor Available highlight color.
 */

/**
 * @memberof ApiParagraph
 * @name GetSpacingBefore
 * @description Returns the spacing before value of the current paragraph. Inherited From: ApiParaPr#GetSpacingBefore
 * @returns {twips}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oSlide.AddObject(oShape)
 * const oDocContent = oShape.GetDocContent()
 * let oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("This is an example of setting a space before a paragraph. ")
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
 * builder.SaveFile("pptx", "GetSpacingBefore.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiParagraph
 * @name SetIndFirstLine
 * @description Sets the paragraph first line indentation. Inherited From: ApiParaPr#SetIndFirstLine
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
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
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetIndFirstLine.pptx")
 * builder.CloseFile()
 * @param {twips} nValue The paragraph first line indentation value measured in twentieths of a point (1/1440 of an inch).
 */

/**
 * @memberof ApiParagraph
 * @name SetSpacingAfter
 * @description Sets the spacing after the current paragraph. If the value of the isAfterAuto parameter is true, then any value of the nAfter is ignored. If isAfterAuto parameter is not specified, then it will be interpreted as false. Inherited From: ApiParaPr#SetSpacingAfter
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * let oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("This is an example of setting a space after a paragraph. ")
 * oParagraph.AddText("The second paragraph will have an offset of one inch from the top. ")
 * oParagraph.AddText("This is due to the fact that the first paragraph has this offset enabled.")
 * oParagraph.SetSpacingAfter(1440)
 * oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("This is the second paragraph and it is one inch away from the first paragraph.")
 * oDocContent.Push(oParagraph)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetSpacingAfter.pptx")
 * builder.CloseFile()
 * @param {twips} nAfter The value of the spacing after the current paragraph measured in twentieths of a point (1/1440 of an inch).
 * @param {Boolean=} isAfterAuto=false The true value disables the spacing after the current paragraph.
 */

/**
 * @memberof ApiParagraph
 * @name SetIndLeft
 * @description Sets the paragraph left side indentation. Inherited From: ApiParaPr#SetIndLeft
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * let oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("This is a paragraph with the indent of 2 inches set to it. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.SetIndLeft(2880)
 * oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("This is a paragraph without any indent set to it. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.")
 * oDocContent.Push(oParagraph)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetIndLeft.pptx")
 * builder.CloseFile()
 * @param {twips} nValue The paragraph left side indentation value measured in twentieths of a point (1/1440 of an inch).
 */

/**
 * @memberof ApiParagraph
 * @name SetIndRight
 * @description Sets the paragraph right side indentation. Inherited From: ApiParaPr#SetIndRight
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * let oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("This is a paragraph with the right offset of 2 inches set to it. ")
 * oParagraph.AddText("We also aligned the text in it by the right side. ")
 * oParagraph.AddText("This sentence is used to add lines for demonstrative purposes.")
 * oParagraph.SetJc("right")
 * oParagraph.SetIndRight(2880)
 * oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("This is a paragraph without any offset set to it. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ")
 * oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.")
 * oDocContent.Push(oParagraph)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetIndRight.pptx")
 * builder.CloseFile()
 * @param {twips} nValue The paragraph right side indentation value measured in twentieths of a point (1/1440 of an inch).
 */

/**
 * @memberof ApiParagraph
 * @name SetSpacingBefore
 * @description Sets the spacing before the current paragraph. If the value of the isBeforeAuto parameter is true, then any value of the nBefore is ignored. If isBeforeAuto parameter is not specified, then it will be interpreted as false. Inherited From: ApiParaPr#SetSpacingBefore
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * let oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("This is an example of setting a space before a paragraph. ")
 * oParagraph.AddText("The second paragraph will have an offset of one inch from the top. ")
 * oParagraph.AddText("This is due to the fact that the second paragraph has this offset enabled.")
 * oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("This is the second paragraph and it is one inch away from the first paragraph.")
 * oParagraph.SetSpacingBefore(1440)
 * oDocContent.Push(oParagraph)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetSpacingBefore.pptx")
 * builder.CloseFile()
 * @param {twips} nBefore The value of the spacing before the current paragraph measured in twentieths of a point (1/1440 of an inch).
 * @param {Boolean=} isBeforeAuto=false The true value disables the spacing before the current paragraph.
 */

/**
 * @memberof ApiParagraph
 * @name SetSpacingLine
 * @description Sets the paragraph line spacing. If the value of the sLineRule parameter is either "atLeast" or "exact", then the value of nLine will be interpreted as twentieths of a point. If the value of the sLineRule parameter is "auto", then the value of the nLine parameter will be interpreted as 240ths of a line. Inherited From: ApiParaPr#SetSpacingLine
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
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
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetSpacingLine.pptx")
 * builder.CloseFile()
 * @param {twips | line240} nLine The line spacing value measured either in twentieths of a point (1/1440 of an inch) or in 240ths of a line.
 * @param {LineRule} sLineRule The rule that determines the measuring units of the line spacing.
 */

/**
 * @memberof ApiPresentation
 * @name AddMaster
 * @description Adds the slide master to the presentation slide masters collection.
 * @returns {Boolean} return false if position is invalid or oApiMaster doesn't exist
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = Api.CreateMaster()
 * const nCountBefore = oPresentation.GetMastersCount()
 * oPresentation.AddMaster(nCountBefore, oMaster)
 * const nCountAfter = oPresentation.GetMastersCount()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Number of masters before adding new master: " + nCountBefore)
 * oParagraph.AddLineBreak()
 * oParagraph.AddText("Number of masters after adding new master: " + nCountAfter)
 * oSlide.RemoveAllObjects()
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "AddMaster.pptx")
 * builder.CloseFile()
 * @param {Number=} nPos=ApiPresentation.GetMastersCount() The position where the Master will be added.
 * @param {ApiMaster} oApiMaster The slide master to be added.
 */

/**
 * @memberof ApiParagraph
 * @name SetTabs
 * @description Specifies a sequence of custom tab stops which will be used for any tab characters in the current paragraph. : The lengths of aPos array and aVal array  BE equal to each other. Inherited From: ApiParaPr#SetTabs
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetTabs([
 *   1440,
 *   4320,
 *   7200
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
 * oParagraph.AddText("Custom tab - 3 inches center")
 * oParagraph.AddLineBreak()
 * oParagraph.AddTabStop()
 * oParagraph.AddTabStop()
 * oParagraph.AddTabStop()
 * oParagraph.AddText("Custom tab - 5 inches right")
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetTabs.pptx")
 * builder.CloseFile()
 * @param {Array<twips>} aPos An array of the positions of custom tab stops with respect to the current page margins measured in twentieths of a point (1/1440 of an inch).
 * @param {Array<TabJc>} aVal An array of the styles of custom tab stops, which determines the behavior of the tab stop and the alignment which will be applied to text entered at the current custom tab stop.
 */

/**
 * @memberof ApiPresentation
 * @name AddSlide
 * @description Appends a new slide to the end of the presentation.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = Api.CreateSlide()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * oSlide.SetBackground(oFill)
 * oPresentation.AddSlide(oSlide)
 * builder.SaveFile("pptx", "AddSlide.pptx")
 * builder.CloseFile()
 * @param {ApiSlide} oSlide The slide created using the Api#CreateSlide method.
 */

/**
 * @memberof ApiParagraph
 * @name SetJc
 * @description Sets the paragraph contents justification. Inherited From: ApiParaPr#SetJc
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
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
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetJc.pptx")
 * builder.CloseFile()
 * @param {ContentJustification} sJc The justification type that will be applied to the paragraph contents.
 */

/**
 * @memberof ApiPresentation
 * @name ApplyTheme
 * @description Applies a theme to all the slides in the presentation.
 * @returns {Boolean} returns false if param isn't theme or presentation doesn't exist
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * const oClrScheme = Api.CreateThemeColorScheme([
 *   Api.CreateRGBColor(255, 111, 61),
 *   Api.CreateRGBColor(51, 51, 51),
 *   Api.CreateRGBColor(230, 179, 117),
 *   Api.CreateRGBColor(235, 235, 235),
 *   Api.CreateRGBColor(163, 21, 21),
 *   Api.CreateRGBColor(128, 43, 43),
 *   Api.CreateRGBColor(0, 0, 0),
 *   Api.CreateRGBColor(128, 128, 128),
 *   Api.CreateRGBColor(176, 196, 222),
 *   Api.CreateRGBColor(65, 105, 225),
 *   Api.CreateRGBColor(255, 255, 255),
 *   Api.CreateRGBColor(255, 213, 191)
 * ], "New color scheme")
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill1 = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oBgFill1 = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke1 = Api.CreateStroke(1 * 36000, oFill1)
 * const oFill2 = Api.CreatePatternFill("dashDnDiag", Api.CreateRGBColor(255, 111, 61), Api.CreateRGBColor(51, 51, 51))
 * const oBgFill2 = Api.CreatePatternFill("dashDnDiag", Api.CreateRGBColor(255, 111, 61), Api.CreateRGBColor(51, 51, 51))
 * const oStroke2 = Api.CreateStroke(1 * 36000, oFill2)
 * const oFill3 = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oBgFill3 = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke3 = Api.CreateStroke(1 * 36000, oFill3)
 * const oFormatScheme = Api.CreateThemeFormatScheme([
 *   oFill1,
 *   oFill2,
 *   oFill3
 * ], [
 *   oBgFill1,
 *   oBgFill2,
 *   oBgFill3
 * ], [
 *   oStroke1,
 *   oStroke2,
 *   oStroke3
 * ], "New format scheme")
 * const oFontScheme = Api.CreateThemeFontScheme("Arial", "Noto Sans Simplified Chinese", "Arabic", "Times New Roman", "Noto Serif Simplified Chinese", "Arabic", "New font scheme")
 * const oTheme = Api.CreateTheme("New theme", oMaster, oClrScheme, oFormatScheme, oFontScheme)
 * oPresentation.ApplyTheme(oTheme)
 * builder.SaveFile("pptx", "ApplyTheme.pptx")
 * builder.CloseFile()
 * @param {ApiTheme} oApiTheme The presentation theme.
 */

/**
 * @memberof ApiRGBColor
 * @name GetClassType
 * @description Returns a type of the ApiRGBColor class.
 * @returns {String}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oRGBColor = Api.CreateRGBColor(255, 213, 191)
 * const oGs1 = Api.CreateGradientStop(oRGBColor, 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oDocContent = oShape.GetDocContent()
 * const sClassType = oRGBColor.GetClassType()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Class Type = " + sClassType)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetClassType.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiPresentation
 * @name CreateNewHistoryPoint
 * @description Creates a new history point.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * let oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("This is just a sample text.")
 * oPresentation.CreateNewHistoryPoint()
 * oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("New history point was just created.")
 * oDocContent.Push(oParagraph)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "CreateNewHistoryPoint.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiPresentation
 * @name GetClassType
 * @description Returns a type of the ApiPresentation class.
 * @returns {String}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const sClassType = oPresentation.GetClassType()
 * oParagraph.AddText("Class Type = " + sClassType)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetClassType.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiPresentation
 * @name GetCurrentSlide
 * @description Returns the current slide.
 * @returns {ApiSlide}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetCurrentSlide()
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetCurrentSlide.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiPresentation
 * @name GetHeight
 * @description Returns the presentation height in English measure units.
 * @returns {EMU}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const nHeight = oPresentation.GetHeight()
 * oParagraph.AddText("Height = " + nHeight)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetCurSlideIndex.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiPresentation
 * @name GetMaster
 * @description Returns a slide master by its position in the presentation.
 * @returns {ApiMaster | null} returns null if position is invalid
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * const sType = oMaster.GetClassType()
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Class type = " + sType)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetMaster.pptx")
 * builder.CloseFile()
 * @param {Number} nPos Slide master position in the presentation.
 */

/**
 * @memberof ApiPresentation
 * @name GetSlideByIndex
 * @description Returns a slide by its position in the presentation.
 * @returns {ApiSlide | null}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetSlideByIndex.pptx")
 * builder.CloseFile()
 * @param {Number} nIndex The slide number (position) in the presentation.
 */

/**
 * @memberof ApiPresentation
 * @name GetSlidesCount
 * @description Returns a number of slides.
 * @returns {Number}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide1 = oPresentation.GetSlideByIndex(0)
 * const oSlide2 = Api.CreateSlide()
 * oPresentation.AddSlide(oSlide2)
 * const nSlides = oPresentation.GetSlidesCount()
 * oSlide1.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Number of slides = " + nSlides)
 * oSlide1.AddObject(oShape)
 * builder.SaveFile("pptx", "GetSlidesCount.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiPresentation
 * @name GetMastersCount
 * @description Returns a number of slide masters.
 * @returns {Number}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const nMasters = oPresentation.GetMastersCount()
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Number of masters = " + nMasters)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetMastersCount.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiPresentation
 * @name GetCurSlideIndex
 * @description Returns the index for the current slide.
 * @returns {Number}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const nCurrentSlideIndex = oPresentation.GetCurSlideIndex()
 * oParagraph.AddText("Current Slide Index = " + nCurrentSlideIndex)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetCurSlideIndex.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiPresentation
 * @name SetLanguage
 * @description Specifies the languages which will be used to check spelling and grammar (if requested).
 * @returns {Boolean}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * oPresentation.SetLanguage("en-CA")
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("English (Canada) will be used to check spelling and grammar in this presentation (if requested).")
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetLanguage.pptx")
 * builder.CloseFile()
 * @param {String} sLangId The possible value for this parameter is a language identifier as defined by RFC 4646/BCP 47. Example: "en-CA".
 */

/**
 * @memberof ApiPresentation
 * @name SetSizes
 * @description Sets the size to the current presentation.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * oPresentation.SetSizes(254 * 36000, 190 * 36000)
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 200 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("The size of this presentation was changed: width - 254 mm, height - 190 mm.")
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetSizes.pptx")
 * builder.CloseFile()
 * @param {EMU} nWidth The presentation width in English measure units.
 * @param {EMU} nHeight The presentation height in English measure units.
 */

/**
 * @memberof ApiPresentation
 * @name SlidesToJSON
 * @description Converts the slides from the current ApiPresentation object into the JSON objects.
 * @returns {Array}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const json = oPresentation.SlidesToJSON(0, 0, true, true, true, true)
 * const aSlidesFromJSON = Api.FromJSON(json)
 * const oSlideFromJSON = aSlidesFromJSON[0]
 * oPresentation.AddSlide(oSlideFromJSON)
 * const sType = oSlideFromJSON.GetClassType()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oDrawing = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oDrawing.SetPosition(608400, 1267200)
 * oDrawing.SetSize(300 * 36000, 130 * 36000)
 * oSlide.AddObject(oDrawing)
 * const oDocContent = oDrawing.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("Class type = " + sType)
 * builder.SaveFile("pptx", "SlidesToJSON.pptx")
 * builder.CloseFile()
 * @param {Boolean=} nStart=0 The index to the start slide.
 * @param {Boolean=} nEnd=ApiPresentation.GetSlidesCount() - 1 The index to the end slide.
 * @param {Boolean=} bWriteLayout=false Specifies if the slide layout will be written to the JSON object or not.
 * @param {Boolean=} bWriteMaster=false Specifies if the slide master will be written to the JSON object or not (bWriteMaster is false if bWriteLayout === false).
 * @param {Boolean=} bWriteAllMasLayouts=false Specifies if all child layouts from the slide master will be written to the JSON object or not.
 * @param {Boolean=} bWriteTableStyles=false Specifies whether to write used table styles to the JSON object (true) or not (false).
 */

/**
 * @memberof ApiPresentation
 * @name GetWidth
 * @description Returns the presentation width in English measure units.
 * @returns {EMU}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const nHeight = oPresentation.GetWidth()
 * oParagraph.AddText("Height = " + nHeight)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetCurSlideIndex.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiPresentation
 * @name ToJSON
 * @description Converts the ApiPresentation object into the JSON object.
 * @returns {JSON}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const json = oPresentation.ToJSON(true)
 * const oPresentationFromJSON = Api.FromJSON(json)
 * const oSlide = oPresentationFromJSON.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const sType = oPresentationFromJSON.GetClassType()
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("Class type = " + sType)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "ToJSON.pptx")
 * builder.CloseFile()
 * @param {Boolean=} bWriteTableStyles Specifies whether to write used table styles to the JSON object (true) or not (false). Default values is "false".
 */

/**
 * @memberof ApiSchemeColor
 * @name GetClassType
 * @description Returns a type of the ApiSchemeColor class.
 * @returns {String}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oSchemeColor = Api.CreateSchemeColor("dk1")
 * const oFill = Api.CreateSolidFill(oSchemeColor)
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oDocContent = oShape.GetDocContent()
 * const sClassType = oSchemeColor.GetClassType()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Class Type = " + sClassType)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetClassType.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiShape
 * @name GetClassType
 * @description Returns a type of the ApiShape class.
 * @returns {String}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * oPresentation.SetSizes(254 * 36000, 190 * 36000)
 * const oSlide = oPresentation.GetCurrentSlide()
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartOnlineStorage", 200 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const sClassType = oShape.GetClassType()
 * oParagraph.AddText("Class Type = " + sClassType)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetClassType.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiPresentation
 * @name RemoveSlides
 * @description Removes a range of slides from the presentation. Deletes all the slides from the presentation if no parameters are specified.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = Api.CreateSlide()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * let oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * oSlide.SetBackground(oFill)
 * oPresentation.AddSlide(oSlide)
 * oPresentation.RemoveSlides(0, 1)
 * oSlide.RemoveAllObjects()
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const sClassType = oPresentation.GetClassType()
 * oParagraph.AddText("A slide with no background was removed from this presentation.")
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "RemoveSlides.pptx")
 * builder.CloseFile()
 * @param {Number=} nStart=0 The starting position for the deletion range.
 * @param {Number=} nCount=ApiPresentation.GetSlidesCount() The number of slides to delete.
 */

/**
 * @memberof ApiShape
 * @name GetContent
 * @description Returns the shape inner contents where a paragraph or text runs can be inserted.
 * @returns {ApiDocumentContent | null}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * oPresentation.SetSizes(254 * 36000, 190 * 36000)
 * const oSlide = oPresentation.GetCurrentSlide()
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartOnlineStorage", 200 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetContent()
 * oShape.SetVerticalTextAlign("bottom")
 * const oParagraph = Api.CreateParagraph()
 * oParagraph.SetJc("left")
 * oParagraph.AddText("We removed all elements from the shape and added a new paragraph inside it ")
 * oParagraph.AddText("aligning it vertically by the bottom.")
 * oDocContent.Push(oParagraph)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetDocContent.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiPresetColor
 * @name GetClassType
 * @description Returns a type of the ApiPresetColor class.
 * @returns {String}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oPresetColor = Api.CreatePresetColor("peachPuff")
 * const oGs1 = Api.CreateGradientStop(oPresetColor, 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oDocContent = oShape.GetDocContent()
 * const sClassType = oPresetColor.GetClassType()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Class Type = " + sClassType)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetClassType.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiPresentation
 * @name ReplaceCurrentImage
 * @description Replaces the current image with an image specified.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oDrawing = Api.CreateImage("https://api.onlyoffice.com/content/img/docbuilder/examples/coordinate_aspects.png", 300 * 36000, 150 * 36000)
 * oSlide.AddObject(oDrawing)
 * oDrawing.Select()
 * oPresentation.ReplaceCurrentImage("https://helpcenter.onlyoffice.com/images/Help/GettingStarted/Documents/big/EditDocument.png", 60 * 36000, 35 * 36000)
 * builder.SaveFile("pptx", "ReplaceCurrentImage.pptx")
 * builder.CloseFile()
 * @param {String} sImageUrl The image source where the image to be inserted should be taken from (currently, only internet URL or Base64 encoded images are supported).
 * @param {EMU} Width The image width in English measure units.
 * @param {EMU} Height The image height in English measure units.
 */

/**
 * @memberof ApiShape
 * @name SetVerticalTextAlign
 * @description Sets the vertical alignment to the shape content where a paragraph or text runs can be inserted.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * oPresentation.SetSizes(254 * 36000, 190 * 36000)
 * const oSlide = oPresentation.GetCurrentSlide()
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartOnlineStorage", 200 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * oShape.SetVerticalTextAlign("bottom")
 * const oParagraph = Api.CreateParagraph()
 * oParagraph.SetJc("left")
 * oParagraph.AddText("We removed all elements from the shape and added a new paragraph inside it ")
 * oParagraph.AddText("aligning it vertically by the bottom.")
 * oDocContent.Push(oParagraph)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetVerticalTextAlign.pptx")
 * builder.CloseFile()
 * @param {VerticalTextAlign} VerticalAlign The type of the vertical alignment for the shape inner contents.
 */

/**
 * @memberof ApiShape
 * @name GetDocContent
 * @description Deprecated in 6.2. Returns the shape inner contents where a paragraph or text runs can be inserted.
 * @returns {ApiDocumentContent | null}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * oPresentation.SetSizes(254 * 36000, 190 * 36000)
 * const oSlide = oPresentation.GetCurrentSlide()
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartOnlineStorage", 200 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * oShape.SetVerticalTextAlign("bottom")
 * const oParagraph = Api.CreateParagraph()
 * oParagraph.SetJc("left")
 * oParagraph.AddText("We removed all elements from the shape and added a new paragraph inside it ")
 * oParagraph.AddText("aligning it vertically by the bottom.")
 * oDocContent.Push(oParagraph)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetDocContent.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiRun
 * @name AddLineBreak
 * @description Adds a line break to the current run position and starts the next element from a new line.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * oRun.AddText("This is the text for the first line. Nothing special.")
 * oRun.AddLineBreak()
 * oRun.AddText("This is the text which starts from the beginning of the second line. ")
 * oRun.AddText("It is written in two text runs, you need a space at the end of the first run sentence to separate them.")
 * oParagraph.AddElement(oRun)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "AddLineBreak.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiRun
 * @name ClearContent
 * @description Clears the content from the current run.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
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
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "ClearContent.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiRun
 * @name AddTabStop
 * @description Adds a tab stop to the current run.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * oRun.SetFontSize(30)
 * oRun.AddText("This is just a sample text. After it three tab stops will be added.")
 * oRun.AddTabStop()
 * oRun.AddTabStop()
 * oRun.AddTabStop()
 * oRun.AddText("This is the text which starts after the tab stops.")
 * oParagraph.AddElement(oRun)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "AddTabStop.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiRun
 * @name Copy
 * @description Creates a copy of the current run.
 * @returns {ApiRun}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * oRun.AddText("This is just a sample text that was copied. ")
 * oParagraph.AddElement(oRun)
 * const oCopyRun = oRun.Copy()
 * oParagraph.AddElement(oCopyRun)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "Copy.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiRun
 * @name Delete
 * @description Deletes the current run.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * let oRun = Api.CreateRun()
 * oRun.AddText("This is just a sample text. ")
 * oParagraph.AddElement(oRun)
 * oRun.Delete()
 * oRun = Api.CreateRun()
 * oRun.AddText("This is the second run. The first run was removed from the paragraph.")
 * oParagraph.AddElement(oRun)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "Delete.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiRun
 * @name GetClassType
 * @description Returns a type of the ApiRun class.
 * @returns {String}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * const sClassType = oRun.GetClassType()
 * oRun.SetFontSize(30)
 * oRun.AddText("Class Type = " + sClassType)
 * oParagraph.AddElement(oRun)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetClassType.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiRun
 * @name GetTextPr
 * @description Returns the text properties of the current run.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * const oTextPr = oRun.GetTextPr()
 * oTextPr.SetFontSize(30)
 * oParagraph.SetJc("left")
 * oRun.AddText("This is a sample text inside the shape with the font size set to 15 points using the text properties.")
 * oParagraph.AddElement(oRun)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetTextPr.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiRun
 * @name GetFontNames
 * @description Returns all font names from all elements inside the current run.
 * @returns {Array}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
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
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetFontNames.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiRun
 * @name RemoveAllElements
 * @description Removes all the elements from the current run.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * oRun.AddText("This is just a sample text.")
 * oRun.RemoveAllElements()
 * oRun.AddText("All elements from this run were removed before adding this text.")
 * oParagraph.AddElement(oRun)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "RemoveAllElements.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiRun
 * @name AddText
 * @description Adds some text to the current run.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * oRun.SetFontSize(30)
 * oRun.AddText("This is just a sample text. Nothing special.")
 * oParagraph.AddElement(oRun)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "AddText.pptx")
 * builder.CloseFile()
 * @param {String} sText The text which will be added to the current run.
 */

/**
 * @memberof ApiRun
 * @name SetBold
 * @description Sets the bold property to the text character.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * let oRun = Api.CreateRun()
 * oRun.AddText("This is just a sample text. ")
 * oParagraph.AddElement(oRun)
 * oRun = Api.CreateRun()
 * oRun.SetBold(true)
 * oRun.AddText("This is a text run with the font set to bold.")
 * oParagraph.AddElement(oRun)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetBold.pptx")
 * builder.CloseFile()
 * @param {Boolean} isBold Specifies that the contents of the current run are displayed bold.
 */

/**
 * @memberof ApiRun
 * @name SetColor
 * @description Sets the text color for the current text run in the RGB format.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * oRun.AddText("This is a text run with the font color set to black.")
 * oParagraph.AddElement(oRun)
 * oRun.SetColor(51, 51, 51)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetColor.pptx")
 * builder.CloseFile()
 * @param {byte} r Red color component value.
 * @param {byte} g Green color component value.
 * @param {byte} b Blue color component value.
 * @param {Boolean=} isAuto If this parameter is set to "true", then r,g,b parameters will be ignored. Default values is "false".
 */

/**
 * @memberof ApiRun
 * @name SetFill
 * @description Sets the text color to the current text run.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * let oRun = Api.CreateRun()
 * oRun.AddText("This is just a sample text. ")
 * oParagraph.AddElement(oRun)
 * oRun = Api.CreateRun()
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oRun.SetFill(oFill)
 * oRun.AddText("This is a text run with the font color set to black.")
 * oParagraph.AddElement(oRun)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetFill.pptx")
 * builder.CloseFile()
 * @param {ApiFill} oApiFill The color or pattern used to fill the text color.
 */

/**
 * @memberof ApiRun
 * @name SetDoubleStrikeout
 * @description Specifies that the contents of the current run are displayed with two horizontal lines through each character displayed on the line.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * let oRun = Api.CreateRun()
 * oRun.AddText("This is just a sample text. ")
 * oParagraph.AddElement(oRun)
 * oRun = Api.CreateRun()
 * oRun.SetDoubleStrikeout(true)
 * oRun.AddText("This is a text run with the text struck out with two lines.")
 * oParagraph.AddElement(oRun)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetDoubleStrikeout.pptx")
 * builder.CloseFile()
 * @param {Boolean} isDoubleStrikeout Specifies that the contents of the current run are displayed double struck through.
 */

/**
 * @memberof ApiRun
 * @name SetFontSize
 * @description Sets the font size to the characters of the current text run.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * let oRun = Api.CreateRun()
 * oRun.AddText("This is just a sample text. ")
 * oParagraph.AddElement(oRun)
 * oRun = Api.CreateRun()
 * oRun.SetFontSize(50)
 * oRun.AddText("This is a text run with the font size set to 25 points (50 half-points).")
 * oParagraph.AddElement(oRun)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetFontSize.pptx")
 * builder.CloseFile()
 * @param {hps} nSize The text size value measured in half-points (1/144 of an inch).
 */

/**
 * @memberof ApiRun
 * @name SetHighlight
 * @description Specifies a highlighting color which is applied as a background to the contents of the current run.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * oRun.AddText("This is a text run with the text highlighted with light gray color.")
 * oParagraph.AddElement(oRun)
 * oRun.SetHighlight("lightGray")
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetHighlight.pptx")
 * builder.CloseFile()
 * @param {highlightColor} sColor Available highlight color.
 */

/**
 * @memberof ApiRun
 * @name SetItalic
 * @description Sets the italic property to the text character.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * let oRun = Api.CreateRun()
 * oRun.AddText("This is just a sample text. ")
 * oParagraph.AddElement(oRun)
 * oRun = Api.CreateRun()
 * oRun.SetItalic(true)
 * oRun.AddText("This is a text run with the font set to italicized letters.")
 * oParagraph.AddElement(oRun)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetItalic.pptx")
 * builder.CloseFile()
 * @param {Boolean} isItalic Specifies that the contents of the current run are displayed italicized.
 */

/**
 * @memberof ApiRun
 * @name SetLanguage
 * @description Specifies the languages which will be used to check spelling and grammar (if requested) when processing the contents of this text run.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * oRun.AddText("This is a text run with the text language set to English (Canada).")
 * oParagraph.AddElement(oRun)
 * oRun.SetLanguage("en-CA")
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetLanguage.pptx")
 * builder.CloseFile()
 * @param {String} sLangId The possible value for this parameter is a language identifier as defined by RFC 4646/BCP 47. Example: "en-CA".
 */

/**
 * @memberof ApiRun
 * @name SetShd
 * @description Specifies the shading applied to the contents of the current text run.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * oRun.AddText("This is a text run with the text shading set to black.")
 * oParagraph.AddElement(oRun)
 * oRun.SetShd("clear", 51, 51, 51)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetShd.pptx")
 * builder.CloseFile()
 * @param {ShdType} sType The shading type applied to the contents of the current text run.
 * @param {byte} r Red color component value.
 * @param {byte} g Green color component value.
 * @param {byte} b Blue color component value.
 */

/**
 * @memberof ApiRun
 * @name SetFontFamily
 * @description Sets all 4 font slots with the specified font family.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * let oRun = Api.CreateRun()
 * oRun.AddText("This is just a sample text. ")
 * oParagraph.AddElement(oRun)
 * oRun = Api.CreateRun()
 * oRun.SetFontFamily("Comic Sans MS")
 * oRun.AddText("This is a text run with the font family set to 'Comic Sans MS'.")
 * oParagraph.AddElement(oRun)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetFontFamily.pptx")
 * builder.CloseFile()
 * @param {String} sFontFamily The font family or families used for the current text run.
 */

/**
 * @memberof ApiRun
 * @name SetPosition
 * @description Specifies an amount by which text is raised or lowered for this run in relation to the default baseline of the surrounding non-positioned text.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("rect", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * let oRun = Api.CreateRun()
 * oRun.AddText("This is a text run with the text raised 10 half-points.")
 * oParagraph.AddElement(oRun)
 * oRun.SetPosition(10)
 * oRun = Api.CreateRun()
 * oRun.AddText("This is a text run with the text lowered 16 half-points.")
 * oParagraph.AddElement(oRun)
 * oRun.SetPosition(-16)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetPosition.pptx")
 * builder.CloseFile()
 * @param {hps} nPosition Specifies a positive (raised text) or negative (lowered text) measurement in half-points (1/144 of an inch).
 */

/**
 * @memberof ApiRun
 * @name SetSmallCaps
 * @description Specifies that all the small letter characters in this text run are formatted for display only as their capital letter character equivalents which are two points smaller than the actual font size specified for this text.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * let oRun = Api.CreateRun()
 * oRun.AddText("This is just a sample text. ")
 * oParagraph.AddElement(oRun)
 * oRun = Api.CreateRun()
 * oRun.SetSmallCaps(true)
 * oRun.AddText("This is a text run with the font set to small capitalized letters.")
 * oParagraph.AddElement(oRun)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetSmallCaps.pptx")
 * builder.CloseFile()
 * @param {Boolean} isSmallCaps Specifies if the contents of the current run are displayed capitalized two points smaller or not.
 */

/**
 * @memberof ApiRun
 * @name SetStyle
 * @description Sets a style to the current run.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oMyNewRunStyle = oDocument.CreateStyle("My New Run Style", "run")
 * const oTextPr = oMyNewRunStyle.GetTextPr()
 * oTextPr.SetFontSize(30)
 * oTextPr.SetBold(true)
 * oRun = Api.CreateRun()
 * oRun.SetStyle(oMyNewRunStyle)
 * oRun.AddText("This is a text run with its own style.")
 * oRun.SetTextPr(oTextPr)
 * oParagraph.AddElement(oRun)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetTextPr.pptx")
 * builder.CloseFile()
 * @param {ApiStyle} oStyle The style which must be applied to the text run.
 */

/**
 * @memberof ApiRun
 * @name SetTextFill
 * @description Sets the text fill to the current text run. Inherited From: ApiTextPr#SetTextFill
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * let oRun = Api.CreateRun()
 * oRun.AddText("This is just a sample text. ")
 * oParagraph.AddElement(oRun)
 * oRun = Api.CreateRun()
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oRun.SetTextFill(oFill)
 * oRun.AddText("This is a text run with the black text.")
 * oParagraph.AddElement(oRun)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetTextFill.pptx")
 * builder.CloseFile()
 * @param {ApiFill} oApiFill The color or pattern used to fill the text color.
 */

/**
 * @memberof ApiRun
 * @name SetStrikeout
 * @description Specifies that the contents of the current run are displayed with a single horizontal line through the center of the line.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * let oRun = Api.CreateRun()
 * oRun.AddText("This is just a sample text. ")
 * oParagraph.AddElement(oRun)
 * oRun = Api.CreateRun()
 * oRun.SetStrikeout(true)
 * oRun.AddText("This is a text run with the text struck out with a single line.")
 * oParagraph.AddElement(oRun)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetStrikeout.pptx")
 * builder.CloseFile()
 * @param {Boolean} isStrikeout Specifies that the contents of the current run are displayed struck through.
 */

/**
 * @memberof ApiRun
 * @name SetTextPr
 * @description Sets the text properties to the current run.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * oRun.AddText("This is a sample text with the font size set to 15 points and the font weight set to bold.")
 * const oTextPr = oRun.GetTextPr()
 * oTextPr.SetFontSize(30)
 * oTextPr.SetBold(true)
 * oRun.SetTextPr(oTextPr)
 * oParagraph.AddElement(oRun)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetTextPr.pptx")
 * builder.CloseFile()
 * @param {ApiTextPr} oTextPr The text properties that will be set to the current run.
 */

/**
 * @memberof ApiRun
 * @name SetOutLine
 * @description Sets the text outline to the current text run. Inherited From: ApiTextPr#SetOutLine
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * let oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * let oRun = Api.CreateRun()
 * oRun.AddText("This is just a sample text. ")
 * oParagraph.AddElement(oRun)
 * oRun = Api.CreateRun()
 * oStroke = Api.CreateStroke(0.2 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51)))
 * oRun.SetOutLine(oStroke)
 * oRun.AddText("This is a text run with the black text outline.")
 * oParagraph.AddElement(oRun)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetOutLine.pptx")
 * builder.CloseFile()
 * @param {ApiStroke} oStroke The stroke used to create the text outline.
 */

/**
 * @memberof ApiRun
 * @name SetSpacing
 * @description Sets the text spacing measured in twentieths of a point.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * let oRun = Api.CreateRun()
 * oRun.AddText("This is just a sample text. ")
 * oParagraph.AddElement(oRun)
 * oRun = Api.CreateRun()
 * oRun.SetSpacing(80)
 * oRun.AddText("This is a text run with the text spacing set to 4 points (20 twentieths of a point).")
 * oParagraph.AddElement(oRun)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetSpacing.pptx")
 * builder.CloseFile()
 * @param {twips} nSpacing The value of the text spacing measured in twentieths of a point (1/1440 of an inch).
 */

/**
 * @memberof ApiRun
 * @name SetVertAlign
 * @description Specifies the alignment which will be applied to the contents of the current run in relation to the default appearance of the text run.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
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
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetVertAlign.pptx")
 * builder.CloseFile()
 * @param {VertAlign} sType The vertical alignment type applied to the text contents.
 */

/**
 * @memberof ApiSlide
 * @name AddObject
 * @description Adds an object (image, shape or chart) to the current presentation slide.
 * @returns {Boolean} returns false if slide doesn't exist
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetVerAxisTitle("USD In Hundred Thousands", 10)
 * oChart.SetHorAxisTitle("Year", 11)
 * oChart.SetLegendPos("bottom")
 * oChart.SetShowDataLabels(false, false, true, false)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "AddObject.pptx")
 * builder.CloseFile()
 * @param {ApiDrawing} oDrawing The object which will be added to the current presentation slide.
 */

/**
 * @memberof ApiSlide
 * @name ApplyTheme
 * @description Applies the specified theme to the current slide.
 * @returns {Boolean} returns false if master is null or master hasn't background
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * const oClrScheme = Api.CreateThemeColorScheme([
 *   Api.CreateRGBColor(255, 111, 61),
 *   Api.CreateRGBColor(51, 51, 51),
 *   Api.CreateRGBColor(230, 179, 117),
 *   Api.CreateRGBColor(235, 235, 235),
 *   Api.CreateRGBColor(163, 21, 21),
 *   Api.CreateRGBColor(128, 43, 43),
 *   Api.CreateRGBColor(0, 0, 0),
 *   Api.CreateRGBColor(128, 128, 128),
 *   Api.CreateRGBColor(176, 196, 222),
 *   Api.CreateRGBColor(65, 105, 225),
 *   Api.CreateRGBColor(255, 255, 255),
 *   Api.CreateRGBColor(255, 213, 191)
 * ], "New color scheme")
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill1 = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oBgFill1 = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke1 = Api.CreateStroke(1 * 36000, oFill1)
 * const oFill2 = Api.CreatePatternFill("dashDnDiag", Api.CreateRGBColor(255, 111, 61), Api.CreateRGBColor(51, 51, 51))
 * const oBgFill2 = Api.CreatePatternFill("dashDnDiag", Api.CreateRGBColor(255, 111, 61), Api.CreateRGBColor(51, 51, 51))
 * const oStroke2 = Api.CreateStroke(1 * 36000, oFill2)
 * const oFill3 = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oBgFill3 = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke3 = Api.CreateStroke(1 * 36000, oFill3)
 * const oFormatScheme = Api.CreateThemeFormatScheme([
 *   oFill1,
 *   oFill2,
 *   oFill3
 * ], [
 *   oBgFill1,
 *   oBgFill2,
 *   oBgFill3
 * ], [
 *   oStroke1,
 *   oStroke2,
 *   oStroke3
 * ], "New format scheme")
 * const oFontScheme = Api.CreateThemeFontScheme("Arial", "Noto Sans Simplified Chinese", "Arabic", "Times New Roman", "Noto Serif Simplified Chinese", "Arabic", "New font scheme")
 * const oTheme = Api.CreateTheme("New theme", oMaster, oClrScheme, oFormatScheme, oFontScheme)
 * oSlide.ApplyTheme(oTheme)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetVerAxisTitle("USD In Hundred Thousands", 10)
 * oChart.SetHorAxisTitle("Year", 11)
 * oChart.SetLegendPos("bottom")
 * oChart.SetShowDataLabels(false, false, true, false)
 * oChart.SetTitle("Financial Overview", 20)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "ApplyTheme.pptx")
 * builder.CloseFile()
 * @param {ApiTheme} oApiTheme Presentation theme.
 */

/**
 * @memberof ApiSlide
 * @name ClearBackground
 * @description Clears the slide background.
 * @returns {Boolean} return false if slide doesn't exist
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * oSlide.SetBackground(oFill)
 * const oDuplicateSlide = oSlide.Duplicate(1)
 * oDuplicateSlide.ClearBackground()
 * builder.SaveFile("pptx", "ClearBackground.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiSlide
 * @name Copy
 * @description Creates a copy of the current slide object.
 * @returns {ApiSlide | null} returns new ApiSlide object that represents the duplicate slide or null if slide doesn't exist
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * oSlide.SetBackground(oFill)
 * const oCopySlide = oSlide.Copy()
 * oPresentation.AddSlide(oCopySlide)
 * builder.SaveFile("pptx", "Copy.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiSlide
 * @name Duplicate
 * @description Creates a duplicate of the specified slide object, adds the new slide to the slides collection.
 * @returns {ApiSlide | null} returns new ApiSlide object that represents the duplicate slide or null if slide doesn't exist or is not in the presentation
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * oSlide.SetBackground(oFill)
 * const oDuplicateSlide = oSlide.Duplicate(1)
 * builder.SaveFile("pptx", "Duplicate.pptx")
 * builder.CloseFile()
 * @param {Number=} nPos Position where the new slide will be added. Defalult value is "ApiPresentation.GetSlidesCount()".
 */

/**
 * @memberof ApiSlide
 * @name Delete
 * @description Deletes the current slide from the presentation.
 * @returns {Boolean} returns false if slide doesn't exist
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * let oSlide = Api.CreateSlide()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * oSlide.SetBackground(oFill)
 * oPresentation.AddSlide(oSlide)
 * oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.Delete()
 * builder.SaveFile("pptx", "Delete.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiRun
 * @name SetCaps
 * @description Specifies that any lowercase characters in the current text run are formatted for display only as their capital letter character equivalents.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * let oRun = Api.CreateRun()
 * oRun.AddText("This is just a sample text. ")
 * oParagraph.AddElement(oRun)
 * oRun = Api.CreateRun()
 * oRun.SetCaps(true)
 * oRun.AddText("This is a text run with the font set to capitalized letters.")
 * oParagraph.AddElement(oRun)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetCaps.pptx")
 * builder.CloseFile()
 * @param {Boolean} isCaps Specifies that the contents of the current run are displayed capitalized.
 */

/**
 * @memberof ApiSlide
 * @name FollowLayoutBackground
 * @description Sets the layout background as the background of the slide.
 * @returns {Boolean} returns false if layout is null or layout hasn't background or slide doesn't exist
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * const oLayout = oMaster.GetLayout(0)
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oLayout.SetBackground(oFill)
 * oSlide.FollowLayoutBackground()
 * builder.SaveFile("pptx", "FollowLayoutBackground.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiSlide
 * @name FollowMasterBackground
 * @description Sets the master background as the background of the slide.
 * @returns {Boolean} returns false if master is null or master hasn't background or slide doesn't exist
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * const oLayout = oMaster.GetLayout(0)
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oLayout.SetBackground(oFill)
 * oSlide.FollowMasterBackground()
 * builder.SaveFile("pptx", "FollowMasterBackground.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiSlide
 * @name ApplyLayout
 * @description Applies the specified layout to the current slide. The layout must be in slide master.
 * @returns {Boolean} returns false if slide doesn't exist
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * const oLayout = oMaster.GetLayout(4)
 * oSlide.ApplyLayout(oLayout)
 * builder.SaveFile("pptx", "ApplyLayout.pptx")
 * builder.CloseFile()
 * @param {ApiLayout} oLayout Layout to be applied.
 */

/**
 * @memberof ApiSlide
 * @name GetAllCharts
 * @description Returns an array with all the chart objects from the slide.
 * @returns {Array<ApiChart>}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetVerAxisTitle("USD In Hundred Thousands", 10)
 * oChart.SetHorAxisTitle("Year", 11)
 * oChart.SetLegendPos("bottom")
 * oChart.SetShowDataLabels(false, false, true, false)
 * oChart.SetTitle("Financial Overview", 13)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oChart.SetSeriesFill(oFill, 0, false)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oChart.SetSeriesFill(oFill, 1, false)
 * oSlide.AddObject(oChart)
 * const aCharts = oSlide.GetAllCharts()
 * const oStroke = Api.CreateStroke(1 * 150, Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61)))
 * aCharts[0].SetMinorHorizontalGridlines(oStroke)
 * builder.SaveFile("pptx", "GetAllCharts.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiSlide
 * @name GetAllDrawings
 * @description Returns an array with all the drawing objects from the slide.
 * @returns {Array<ApiDrawing>}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oDrawing = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oDrawing.SetPosition(608400, 1267200)
 * oDrawing.SetSize(300 * 36000, 130 * 36000)
 * oSlide.AddObject(oDrawing)
 * const aDrawings = oSlide.GetAllDrawings()
 * const oPlaceholder = Api.CreatePlaceholder("chart")
 * aDrawings[0].SetPlaceholder(oPlaceholder)
 * builder.SaveFile("pptx", "GetAllDrawings.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiSlide
 * @name GetAllImages
 * @description Returns an array with all the image objects from the slide.
 * @returns {Array<ApiImage>}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oImage = Api.CreateImage("https://api.onlyoffice.com/content/img/docbuilder/examples/coordinate_aspects.png", 60 * 36000, 35 * 36000)
 * oSlide.AddObject(oImage)
 * const aImages = oSlide.GetAllImages()
 * const sType = aImages[0].GetClassType()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Class type = " + sType)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetAllImages.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiSlide
 * @name GetClassType
 * @description Returns a type of the ApiSlide class.
 * @returns {String}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const sClassType = oSlide.GetClassType()
 * oParagraph.AddText("Class Type = " + sClassType)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetClassType.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiRun
 * @name SetUnderline
 * @description Specifies that the contents of the current run are displayed along with a line appearing directly below the character (less than all the spacing above and below the characters on the line).
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * let oRun = Api.CreateRun()
 * oRun.AddText("This is just a sample text. ")
 * oParagraph.AddElement(oRun)
 * oRun = Api.CreateRun()
 * oRun.SetUnderline(true)
 * oRun.AddText("This is a text run with the text underlined with a single line.")
 * oParagraph.AddElement(oRun)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetUnderline.pptx")
 * builder.CloseFile()
 * @param {Boolean} isUnderline Specifies that the contents of the current run are displayed underlined.
 */

/**
 * @memberof ApiSlide
 * @name GetAllShapes
 * @description Returns an array with all the shape objects from the slide.
 * @returns {Array<ApiShape>}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * oSlide.AddObject(oShape)
 * const aShapes = oSlide.GetAllShapes()
 * aShapes[0].SetSize(150 * 36000, 65 * 36000)
 * builder.SaveFile("pptx", "GetAllShapes.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiSlide
 * @name GetSlideIndex
 * @description Returns a position of the current slide in the presentation.
 * @returns {Number} returns -1 if slide doesn't exist or is not in the presentation
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const nIndex = oSlide.GetSlideIndex()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Slide index = " + nIndex)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetSlideIndex.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiSlide
 * @name GetHeight
 * @description Returns the slide height in English measure units.
 * @returns {EMU}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * oPresentation.SetSizes(254 * 36000, 190 * 36000)
 * const oSlide = oPresentation.GetCurrentSlide()
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("rect", 200 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const nSlideHeight = oSlide.GetHeight()
 * oParagraph.AddText("The slide height = " + nSlideHeight / 36000 + " mm")
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetHeight.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiSlide
 * @name GetLayout
 * @description Returns a layout of the current slide.
 * @returns {ApiLayout | null} returns null if slide or layout doesn't exist
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oLayout = oSlide.GetLayout()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oLayout.SetBackground(oFill)
 * oSlide.FollowLayoutBackground()
 * builder.SaveFile("pptx", "GetLayout.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiSlide
 * @name GetWidth
 * @description Returns the slide width in English measure units.
 * @returns {EMU}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * oPresentation.SetSizes(254 * 36000, 190 * 36000)
 * const oSlide = oPresentation.GetCurrentSlide()
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("rect", 200 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const nSlideWidth = oSlide.GetWidth()
 * oParagraph.AddText("The slide width = " + nSlideWidth / 36000 + " mm")
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetWidth.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiSlide
 * @name GetTheme
 * @description Returns a theme of the current slide.
 * @returns {ApiTheme | null} returns null if slide or layout or master or theme doesn't exist
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oTheme = oSlide.GetTheme()
 * const oClrScheme = Api.CreateThemeColorScheme([
 *   Api.CreateRGBColor(255, 111, 61),
 *   Api.CreateRGBColor(51, 51, 51),
 *   Api.CreateRGBColor(230, 179, 117),
 *   Api.CreateRGBColor(235, 235, 235),
 *   Api.CreateRGBColor(163, 21, 21),
 *   Api.CreateRGBColor(128, 43, 43),
 *   Api.CreateRGBColor(0, 0, 0),
 *   Api.CreateRGBColor(128, 128, 128),
 *   Api.CreateRGBColor(176, 196, 222),
 *   Api.CreateRGBColor(65, 105, 225),
 *   Api.CreateRGBColor(255, 255, 255),
 *   Api.CreateRGBColor(255, 213, 191)
 * ], "New color scheme")
 * oTheme.SetColorScheme(oClrScheme)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetVerAxisTitle("USD In Hundred Thousands", 10)
 * oChart.SetHorAxisTitle("Year", 11)
 * oChart.SetLegendPos("bottom")
 * oChart.SetShowDataLabels(false, false, true, false)
 * oChart.SetTitle("Financial Overview", 20)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "GetTheme.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiSlide
 * @name MoveTo
 * @description Moves the current slide to a specific location within the same collection.
 * @returns {Boolean} returns false if slide doesn't exist or position is invalid or slide is not in the presentation
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = Api.CreateSlide()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * oSlide.SetBackground(oFill)
 * oPresentation.AddSlide(oSlide)
 * oSlide.MoveTo(0)
 * builder.SaveFile("pptx", "MoveTo.pptx")
 * builder.CloseFile()
 * @param {Number} nPos Position where the current slide will be moved to.
 */

/**
 * @memberof ApiSlide
 * @name RemoveAllObjects
 * @description Removes all the objects from the current slide.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * oPresentation.SetSizes(254 * 36000, 190 * 36000)
 * const oSlide = oPresentation.GetCurrentSlide()
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * let oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * let oShape = Api.CreateShape("rect", 200 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * oShape = Api.CreateShape("flowChartMagneticTape", 200 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("All objects were removed from this slide before adding this shape.")
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "RemoveAllObjects.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiSlide
 * @name GetAllOleObjects
 * @description Returns an array with all the OLE objects from the slide.
 * @returns {Array<ApiOleObject>}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oOleObject = Api.CreateOleObject("https://i.ytimg.com/vi_webp/SKGz4pmnpgY/sddefault.webp", 130 * 36000, 90 * 36000, "https://youtu.be/SKGz4pmnpgY", "asc.{38E022EA-AD92-45FC-B22B-49DF39746DB4}")
 * oOleObject.SetSize(200 * 36000, 130 * 36000)
 * oOleObject.SetPosition(70 * 36000, 30 * 36000)
 * oSlide.AddObject(oOleObject)
 * const aOleObjects = oSlide.GetAllOleObjects()
 * const sAppId = aOleObjects[0].GetApplicationId()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateLinearGradientFill([
 *   oGs1,
 *   oGs2
 * ], 5400000)
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oDrawing = Api.CreateShape("rect", 300 * 36000, 15 * 36000, oFill, oStroke)
 * oDrawing.SetPosition(20 * 36000, 170 * 36000)
 * const oDocContent = oDrawing.GetContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("The application ID for the current OLE object: " + sAppId)
 * oSlide.AddObject(oDrawing)
 * builder.SaveFile("pptx", "GetAllOleObjects.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiSlide
 * @name RemoveObject
 * @description Removes objects (image, shape or chart) from the current slide.
 * @returns {Boolean} returns false if slide doesn't exist
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oDrawing = Api.CreateShape("cube", 3212465, 963295, oFill, oStroke)
 * oDrawing.SetPosition(30 * 36000, 1267200)
 * oDrawing.SetSize(150 * 36000, 130 * 36000)
 * const oCopyDrawing = oDrawing.Copy()
 * oCopyDrawing.SetPosition(170 * 36000, 1267200)
 * oCopyDrawing.SetSize(150 * 36000, 130 * 36000)
 * oSlide.AddObject(oDrawing)
 * oSlide.AddObject(oCopyDrawing)
 * oSlide.RemoveObject(1, 1)
 * builder.SaveFile("pptx", "RemoveObject.pptx")
 * builder.CloseFile()
 * @param {Number} nPos Position from which the object will be deleted.
 * @param {Number=} nCount The number of elements to delete. Default label is "1".
 */

/**
 * @memberof ApiSlide
 * @name SetSetVisible
 * @description Sets the visibility to the current presentation slide.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = Api.CreateSlide()
 * oSlide.SetSetVisible(false)
 * oPresentation.AddSlide(oSlide)
 * builder.SaveFile("pptx", "SetSetVisible.pptx")
 * builder.CloseFile()
 * @param {Boolean} value Value of visibility of slide
 */

/**
 * @memberof ApiStroke
 * @name GetClassType
 * @description Returns a type of the ApiStroke class.
 * @returns {String}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateLinearGradientFill([
 *   oGs1,
 *   oGs2
 * ], 5400000)
 * const oFill1 = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * const oStroke = Api.CreateStroke(3 * 36000, oFill1)
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * const oDocContent = oShape.GetDocContent()
 * const sClassType = oStroke.GetClassType()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Class Type = " + sClassType)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetClassType.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiTable
 * @name AddColumn
 * @description Adds a new column to the end of the current table.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * oPresentation.SetSizes(300 * 36000, 190 * 36000)
 * const oTable = Api.CreateTable(2, 4)
 * oTable.SetPosition(0 * 36000, 60 * 36000)
 * oTable.AddColumn(1, true)
 * const oRow = oTable.GetRow(0)
 * const oCell = oRow.GetCell(1)
 * const oContent = oCell.GetContent()
 * const oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("New column was added here.")
 * oContent.Push(oParagraph)
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * oSlide.AddObject(oTable)
 * builder.SaveFile("pptx", "AddColumn.pptx")
 * builder.CloseFile()
 * @param {ApiTableCell=} oCell=null If not specified, a new column will be added to the end of the table.
 * @param {Boolean=} isBefore=false Add a new column before or after the specified cell. If no cell is specified, then this parameter will be ignored.
 */

/**
 * @memberof ApiSlide
 * @name SetBackground
 * @description Sets the background to the current presentation slide.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = Api.CreateSlide()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * oSlide.SetBackground(oFill)
 * oPresentation.AddSlide(oSlide)
 * builder.SaveFile("pptx", "SetBackground.pptx")
 * builder.CloseFile()
 * @param {ApiFill} oApiFill The color or pattern used to fill the presentation slide background.
 */

/**
 * @memberof ApiTable
 * @name AddRow
 * @description Adds a new row to the current table.
 * @returns {ApiTableRow}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oTable = Api.CreateTable(2, 4)
 * oTable.AddRow(1, true)
 * const oRow = oTable.GetRow(1)
 * const oCell = oRow.GetCell(0)
 * const oContent = oCell.GetContent()
 * const oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("New row was added here.")
 * oContent.Push(oParagraph)
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * oSlide.AddObject(oTable)
 * builder.SaveFile("pptx", "AddRow.pptx")
 * builder.CloseFile()
 * @param {ApiTableCell=} oCell=null If not specified, a new row will be added to the end of the table.
 * @param {Boolean=} isBefore=false Adds a new row before or after the specified cell. If no cell is specified, then this parameter will be ignored.
 */

/**
 * @memberof ApiTable
 * @name Copy
 * @description Creates a copy of the current table.
 * @returns {ApiTable}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oTable = Api.CreateTable(2, 4)
 * oTable.AddRow(1, true)
 * const oRow = oTable.GetRow(1)
 * const oCell = oRow.GetCell(0)
 * const oContent = oCell.GetContent()
 * const oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("New row was added here.")
 * oContent.Push(oParagraph)
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * oSlide.AddObject(oTable)
 * const oCopyTable = oTable.Copy()
 * const newSlide = Api.CreateSlide()
 * oPresentation.AddSlide(newSlide)
 * newSlide.AddObject(oCopyTable)
 * builder.SaveFile("pptx", "Copy.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiTable
 * @name MergeCells
 * @description Merges an array of cells. If merge is successful, it will return merged cell, otherwise "null". : The number of cells in any row and the number of rows in the current table may be changed.
 * @returns {ApiTableCell | null}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oTable = Api.CreateTable(2, 4)
 * const oRow = oTable.GetRow(0)
 * const oCell1 = oRow.GetCell(0)
 * const oCell2 = oRow.GetCell(1)
 * oTable.MergeCells([
 *   oCell1,
 *   oCell2
 * ])
 * const oCell = oRow.GetCell(0)
 * const oContent = oCell.GetContent()
 * const oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("This cell was formed by merging two cells.")
 * oContent.Push(oParagraph)
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * oSlide.AddObject(oTable)
 * builder.SaveFile("pptx", "MergeCells.pptx")
 * builder.CloseFile()
 * @param {Array<ApiTableCell>} aCells The array of cells.
 */

/**
 * @memberof ApiSlide
 * @name ToJSON
 * @description Converts the ApiSlide object into the JSON object.
 * @returns {JSON}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const json = oSlide.ToJSON(true, true, true, true)
 * const oSlideFromJSON = Api.FromJSON(json)
 * oPresentation.AddSlide(oSlideFromJSON)
 * const sType = oSlideFromJSON.GetClassType()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oDrawing = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oDrawing.SetPosition(608400, 1267200)
 * oDrawing.SetSize(300 * 36000, 130 * 36000)
 * oSlide.AddObject(oDrawing)
 * const oDocContent = oDrawing.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.AddText("Class type = " + sType)
 * builder.SaveFile("pptx", "ToJSON.pptx")
 * builder.CloseFile()
 * @param {Boolean=} bWriteLayout=false Specifies if the slide layout will be written to the JSON object or not.
 * @param {Boolean=} bWriteMaster=false Specifies if the slide master will be written to the JSON object or not (bWriteMaster is false if bWriteLayout === false).
 * @param {Boolean=} bWriteAllMasLayouts=false Specifies if all child layouts from the slide master will be written to the JSON object or not.
 * @param {Boolean=} bWriteTableStyles=false Specifies whether to write used table styles to the JSON object (true) or not (false).
 */

/**
 * @memberof ApiTable
 * @name RemoveColumn
 * @description Removes a table column with the specified cell.
 * @returns {Boolean} defines if the table is empty after removing or not
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oTable = Api.CreateTable(2, 4)
 * const oRow = oTable.GetRow(0)
 * let oCell = oRow.GetCell(1)
 * oTable.RemoveColumn(oCell)
 * oCell = oRow.GetCell(0)
 * const oContent = oCell.GetContent()
 * const oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("The second column was removed.")
 * oContent.Push(oParagraph)
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * oSlide.AddObject(oTable)
 * builder.SaveFile("pptx", "RemoveColumn.pptx")
 * builder.CloseFile()
 * @param {ApiTableCell} oCell The table cell from the column which will be removed.
 */

/**
 * @memberof ApiTable
 * @name RemoveRow
 * @description Removes a table row with the specified cell.
 * @returns {Boolean} defines if the table is empty after removing or not
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oTable = Api.CreateTable(2, 4)
 * let oRow = oTable.GetRow(0)
 * let oCell = oRow.GetCell(0)
 * oTable.RemoveRow(oCell)
 * oRow = oTable.GetRow(0)
 * oCell = oRow.GetCell(0)
 * const oContent = oCell.GetContent()
 * const oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("The first row was removed.")
 * oContent.Push(oParagraph)
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * oSlide.AddObject(oTable)
 * builder.SaveFile("pptx", "RemoveRow.pptx")
 * builder.CloseFile()
 * @param {ApiTableCell} oCell The table cell from the row which will be removed.
 */

/**
 * @memberof ApiTable
 * @name GetRow
 * @description Returns a row by its index.
 * @returns {ApiTableRow | null} returns null if param is invalid
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oTable = Api.CreateTable(2, 4)
 * oTable.AddRow(1, true)
 * const oRow = oTable.GetRow(0)
 * const oCell = oRow.GetCell(0)
 * const oContent = oCell.GetContent()
 * const oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("This is a sample text in the first row.")
 * oContent.Push(oParagraph)
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * oSlide.AddObject(oTable)
 * builder.SaveFile("pptx", "GetRow.pptx")
 * builder.CloseFile()
 * @param {Number} nIndex The row index (position) in the table.
 */

/**
 * @memberof ApiTable
 * @name GetClassType
 * @description Returns a type of the ApiTable class.
 * @returns {String}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oTable = Api.CreateTable(2, 4)
 * const oRow = oTable.GetRow(0)
 * const oCell = oRow.GetCell(0)
 * const oContent = oCell.GetContent()
 * const oParagraph = Api.CreateParagraph()
 * const sClassType = oTable.GetClassType()
 * oParagraph.AddText("Class type: " + sClassType)
 * oContent.Push(oParagraph)
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * oSlide.AddObject(oTable)
 * builder.SaveFile("pptx", "GetClassType.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiTable
 * @name SetTableLook
 * @description Specifies the components of the conditional formatting of the referenced table style (if one exists) which shall be applied to the set of table rows with the current table-level property exceptions. A table style can specify up to six different optional conditional formats [Example: Different formatting for first column], which then can be applied or omitted from individual table rows in the parent table.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oTable = Api.CreateTable(2, 4)
 * oTable.SetTableLook(true, false, false, false, false, true)
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * oSlide.AddObject(oTable)
 * builder.SaveFile("pptx", "SetTableLook.pptx")
 * builder.CloseFile()
 * @param {Boolean} isFirstColumn Specifies that the first column conditional formatting shall be applied to the table.
 * @param {Boolean} isFirstRow Specifies that the first row conditional formatting shall be applied to the table.
 * @param {Boolean} isLastColumn Specifies that the last column conditional formatting shall be applied to the table.
 * @param {Boolean} isLastRow Specifies that the last row conditional formatting shall be applied to the table.
 * @param {Boolean} isHorBand Specifies that the horizontal banding conditional formatting shall not be applied to the table.
 * @param {Boolean} isVerBand Specifies that the vertical banding conditional formatting shall not be applied to the table.
 */

/**
 * @memberof ApiTableCell
 * @name GetContent
 * @description Returns the current cell content.
 * @returns {ApiDocumentContent}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oTable = Api.CreateTable(2, 4)
 * const oRow = oTable.GetRow(0)
 * const oCell = oRow.GetCell(0)
 * const oContent = oCell.GetContent()
 * const oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("This is a sample text in the cell.")
 * oContent.Push(oParagraph)
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * oSlide.AddObject(oTable)
 * builder.SaveFile("pptx", "GetContent.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiTableCell
 * @name SetCellBorderBottom
 * @description Sets the border which shall be displayed at the bottom of the current table cell.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oTable = Api.CreateTable(2, 4)
 * const oRow = oTable.GetRow(0)
 * const oCell = oRow.GetCell(0)
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oCell.SetCellBorderBottom(2, oFill)
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * oSlide.AddObject(oTable)
 * builder.SaveFile("pptx", "SetCellBorderBottom.pptx")
 * builder.CloseFile()
 * @param {mm} fSize The width of the current border.
 * @param {ApiFill} oApiFill The color or pattern used to fill the current border.
 */

/**
 * @memberof ApiTable
 * @name ToJSON
 * @description Converts the ApiTable object into the JSON object.
 * @returns {JSON}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oTable = Api.CreateTable(2, 4)
 * const json = oTable.ToJSON(true)
 * const oTableFromJSON = Api.FromJSON(json)
 * const sType = oTableFromJSON.GetClassType()
 * const oRow = oTableFromJSON.GetRow(0)
 * const oCell = oRow.GetCell(0)
 * const oContent = oCell.GetContent()
 * const oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("Class type = " + sType)
 * oContent.Push(oParagraph)
 * oSlide.AddObject(oTableFromJSON)
 * builder.SaveFile("pptx", "ToJSON.pptx")
 * builder.CloseFile()
 * @param {Boolean=} bWriteTableStyles=false Specifies whether to write used table styles to the JSON object (true) or not (false).
 */

/**
 * @memberof ApiTable
 * @name SetShd
 * @description Specifies the shading which shall be applied to the extents of the current table.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oTable = Api.CreateTable(2, 4)
 * oTable.SetShd("clear", 255, 111, 61)
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * oSlide.AddObject(oTable)
 * builder.SaveFile("pptx", "SetShd.pptx")
 * builder.CloseFile()
 * @param {ShdType | ApiFill} sType The shading type applied to the contents of the current table. Can be ShdType or ApiFill.
 * @param {byte} r Red color component value.
 * @param {byte} g Green color component value.
 * @param {byte} b Blue color component value.
 */

/**
 * @memberof ApiTableCell
 * @name SetCellBorderRight
 * @description Sets the border which shall be displayed at the right of the current table cell.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oTable = Api.CreateTable(2, 4)
 * const oRow = oTable.GetRow(0)
 * const oCell = oRow.GetCell(0)
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oCell.SetCellBorderRight(2, oFill)
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * oSlide.AddObject(oTable)
 * builder.SaveFile("pptx", "SetCellBorderRight.pptx")
 * builder.CloseFile()
 * @param {mm} fSize The width of the current border.
 * @param {ApiFill} oApiFill The color or pattern used to fill the current border.
 */

/**
 * @memberof ApiTableCell
 * @name GetClassType
 * @description Returns a type of the ApiTableCell class.
 * @returns {String}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oTable = Api.CreateTable(2, 4)
 * const oRow = oTable.GetRow(0)
 * const oCell = oRow.GetCell(0)
 * const oContent = oCell.GetContent()
 * const oParagraph = Api.CreateParagraph()
 * const sClassType = oCell.GetClassType()
 * oParagraph.AddText("Class type: " + sClassType)
 * oContent.Push(oParagraph)
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * oSlide.AddObject(oTable)
 * builder.SaveFile("pptx", "GetClassType.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiTableCell
 * @name SetCellMarginBottom
 * @description Specifies an amount of space which shall be left between the bottom extent of the cell contents and the border of a specific individual table cell within a table.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oTable = Api.CreateTable(2, 4)
 * const oRow = oTable.GetRow(0)
 * const oCell = oRow.GetCell(0)
 * const oContent = oCell.GetContent()
 * const oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("This is just a sample text.")
 * oContent.Push(oParagraph)
 * oCell.SetCellMarginBottom(600)
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * oSlide.AddObject(oTable)
 * builder.SaveFile("pptx", "SetCellMarginBottom.pptx")
 * builder.CloseFile()
 * @param {twips | null} nValue If this value is null, then default table cell bottom margin shall be used, otherwise override the table cell bottom margin with specified value for the current cell.
 */

/**
 * @memberof ApiTableCell
 * @name SetCellBorderTop
 * @description Sets the border which shall be displayed at the top of the current table cell.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oTable = Api.CreateTable(2, 4)
 * const oRow = oTable.GetRow(0)
 * const oCell = oRow.GetCell(0)
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oCell.SetCellBorderTop(2, oFill)
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * oSlide.AddObject(oTable)
 * builder.SaveFile("pptx", "SetCellBorderTop.pptx")
 * builder.CloseFile()
 * @param {mm} fSize The width of the current border.
 * @param {ApiFill} oApiFill The color or pattern used to fill the current border.
 */

/**
 * @memberof ApiTableCell
 * @name SetCellBorderLeft
 * @description Sets the border which shall be displayed at the left of the current table cell.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oTable = Api.CreateTable(2, 4)
 * const oRow = oTable.GetRow(0)
 * const oCell = oRow.GetCell(0)
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oCell.SetCellBorderLeft(2, oFill)
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * oSlide.AddObject(oTable)
 * builder.SaveFile("pptx", "SetCellBorderLeft.pptx")
 * builder.CloseFile()
 * @param {mm} fSize The width of the current border.
 * @param {ApiFill} oApiFill The color or pattern used to fill the current border.
 */

/**
 * @memberof ApiTableCell
 * @name SetCellMarginRight
 * @description Specifies an amount of space which shall be left between the right extent of the current cell contents and the right edge border of a specific individual table cell within a table.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oTable = Api.CreateTable(2, 4)
 * const oRow = oTable.GetRow(0)
 * const oCell = oRow.GetCell(0)
 * const oContent = oCell.GetContent()
 * const oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("This is just a sample text.")
 * oContent.Push(oParagraph)
 * oCell.SetCellMarginRight(600)
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * oSlide.AddObject(oTable)
 * builder.SaveFile("pptx", "SetCellMarginRight.pptx")
 * builder.CloseFile()
 * @param {twips | null} nValue If this value is null, then default table cell right margin shall be used, otherwise override the table cell right margin with specified value for the current cell.
 */

/**
 * @memberof ApiTableCell
 * @name SetCellMarginTop
 * @description Specifies an amount of space which shall be left between the top extent of the current cell contents and the top edge border of a specific individual table cell within a table.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oTable = Api.CreateTable(2, 4)
 * const oRow = oTable.GetRow(0)
 * const oCell = oRow.GetCell(0)
 * const oContent = oCell.GetContent()
 * const oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("This is just a sample text.")
 * oContent.Push(oParagraph)
 * oCell.SetCellMarginTop(720)
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * oSlide.AddObject(oTable)
 * builder.SaveFile("pptx", "SetCellMarginTop.pptx")
 * builder.CloseFile()
 * @param {twips | null} nValue If this value is null, then default table cell top margin shall be used, otherwise override the table cell top margin with specified value for the current cell.
 */

/**
 * @memberof ApiTableCell
 * @name SetVerticalAlign
 * @description Specifies the vertical alignment for text within the current table cell.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oTable = Api.CreateTable(2, 4)
 * const oRow = oTable.GetRow(1)
 * oRow.SetHeight(30 * 36000)
 * const oCell = oRow.GetCell(0)
 * const oContent = oCell.GetContent()
 * const oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("This is just a sample text.")
 * oContent.Push(oParagraph)
 * oCell.SetVerticalAlign("bottom")
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * oSlide.AddObject(oTable)
 * builder.SaveFile("pptx", "SetVerticalAlign.pptx")
 * builder.CloseFile()
 * @param {VertAlign} sType The type of the vertical alignment.
 */

/**
 * @memberof ApiTableRow
 * @name GetCellsCount
 * @description Returns a number of cells in the current row.
 * @returns {Number}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oTable = Api.CreateTable(2, 4)
 * const oRow = oTable.GetRow(0)
 * const nCellsCount = oRow.GetCellsCount()
 * const oCell = oRow.GetCell(0)
 * const oContent = oCell.GetContent()
 * const oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("The number of cells in the row: " + nCellsCount)
 * oContent.Push(oParagraph)
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * oSlide.AddObject(oTable)
 * builder.SaveFile("pptx", "GetCellsCount.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiTableRow
 * @name GetCell
 * @description Returns a cell by its position in the current row.
 * @returns {ApiTableCell}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oTable = Api.CreateTable(2, 4)
 * const oRow = oTable.GetRow(0)
 * const oCell = oRow.GetCell(0)
 * const oContent = oCell.GetContent()
 * const oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("This is a sample text in the cell of the first row.")
 * oContent.Push(oParagraph)
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * oSlide.AddObject(oTable)
 * builder.SaveFile("pptx", "GetCell.pptx")
 * builder.CloseFile()
 * @param {Number} nPos The cell position in the table row.
 */

/**
 * @memberof ApiTableCell
 * @name SetShd
 * @description Specifies the shading which shall be applied to the extents of the current table cell.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oTable = Api.CreateTable(2, 4)
 * const oRow = oTable.GetRow(0)
 * const oCell = oRow.GetCell(0)
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oCell.SetShd(oFill)
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * oSlide.AddObject(oTable)
 * builder.SaveFile("pptx", "SetShd.pptx")
 * builder.CloseFile()
 * @param {ShdType | ApiFill} sType The shading type applied to the contents of the current table. Can be ShdType or ApiFill.
 * @param {byte} r Red color component value.
 * @param {byte} g Green color component value.
 * @param {byte} b Blue color component value.
 */

/**
 * @memberof ApiTableRow
 * @name SetHeight
 * @description Sets the height to the current table row.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oTable = Api.CreateTable(2, 4)
 * const oRow = oTable.GetRow(0)
 * oRow.SetHeight(30 * 36000)
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * oSlide.AddObject(oTable)
 * builder.SaveFile("pptx", "SetHeight.pptx")
 * builder.CloseFile()
 * @param {EMU} nValue The row height in English measure units.
 */

/**
 * @memberof ApiTheme
 * @name GetClassType
 * @description Returns a type of the ApiTheme class.
 * @returns {String}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * const oTheme = oMaster.GetTheme()
 * const sType = oTheme.GetClassType()
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Class type = " + sType)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetClassType.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiTheme
 * @name GetFormatScheme
 * @description Returns the format scheme of the current theme.
 * @returns {ApiThemeFormatScheme | null}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oMaster = oPresentation.GetMaster(0)
 * const oTheme = oMaster.GetTheme()
 * const oFormatScheme = oTheme.GetFormatScheme()
 * const sType = oFormatScheme.GetClassType()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Class type = " + sType)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetFormatScheme.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiTheme
 * @name GetFontScheme
 * @description Returns the font scheme of the current theme.
 * @returns {ApiThemeFontScheme | null}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oMaster = oPresentation.GetMaster(0)
 * const oTheme = oMaster.GetTheme()
 * const oFontScheme = oTheme.GetFontScheme()
 * const sType = oFontScheme.GetClassType()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Class type = " + sType)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetFontScheme.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiTableCell
 * @name SetCellMarginLeft
 * @description Specifies an amount of space which shall be left between the left extent of the current cell contents and the left edge border of a specific individual table cell within a table.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oTable = Api.CreateTable(2, 4)
 * const oRow = oTable.GetRow(0)
 * const oCell = oRow.GetCell(0)
 * const oContent = oCell.GetContent()
 * const oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("This is just a sample text.")
 * oContent.Push(oParagraph)
 * oCell.SetCellMarginLeft(720)
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * oSlide.AddObject(oTable)
 * builder.SaveFile("pptx", "SetCellMarginLeft.pptx")
 * builder.CloseFile()
 * @param {twips | null} nValue If this value is null, then default table cell left margin shall be used, otherwise override the table cell left margin with specified value for the current cell.
 */

/**
 * @memberof ApiTableCell
 * @name SetTextDirection
 * @description Specifies the direction of the text flow for the current table cell.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oTable = Api.CreateTable(2, 4)
 * const oRow = oTable.GetRow(0)
 * oRow.SetHeight(30 * 36000)
 * const oCell = oRow.GetCell(0)
 * oCell.SetTextDirection("tbrl")
 * const oContent = oCell.GetContent()
 * const oParagraph = Api.CreateParagraph()
 * oParagraph.AddText("This is just a sample text.")
 * oContent.Push(oParagraph)
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * oSlide.AddObject(oTable)
 * builder.SaveFile("pptx", "SetTextDirection.pptx")
 * builder.CloseFile()
 * @param {TextDirection} sType The type of the text flow direction.
 */

/**
 * @memberof ApiTableRow
 * @name GetClassType
 * @description Returns a type of the ApiTableRow class.
 * @returns {String}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oTable = Api.CreateTable(2, 4)
 * const oRow = oTable.GetRow(0)
 * const oCell = oRow.GetCell(0)
 * const oContent = oCell.GetContent()
 * const oParagraph = Api.CreateParagraph()
 * const sClassType = oRow.GetClassType()
 * oParagraph.AddText("Class type: " + sClassType)
 * oContent.Push(oParagraph)
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * oSlide.AddObject(oTable)
 * builder.SaveFile("pptx", "GetClassType.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiTheme
 * @name GetMaster
 * @description Returns the slide master of the current theme.
 * @returns {ApiMaster | null} returns null if slide master doesn't exist
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oTheme = oSlide.GetTheme()
 * const oMaster = oTheme.GetMaster()
 * const sType = oMaster.GetClassType()
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Class type = " + sType)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetMaster.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiTheme
 * @name SetColorScheme
 * @description Sets the color scheme to the current presentation theme.
 * @returns {Boolean} return false if color scheme doesn't exist
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oClrScheme = Api.CreateThemeColorScheme([
 *   Api.CreateRGBColor(255, 111, 61),
 *   Api.CreateRGBColor(51, 51, 51),
 *   Api.CreateRGBColor(230, 179, 117),
 *   Api.CreateRGBColor(235, 235, 235),
 *   Api.CreateRGBColor(163, 21, 21),
 *   Api.CreateRGBColor(128, 43, 43),
 *   Api.CreateRGBColor(0, 0, 0),
 *   Api.CreateRGBColor(128, 128, 128),
 *   Api.CreateRGBColor(176, 196, 222),
 *   Api.CreateRGBColor(65, 105, 225),
 *   Api.CreateRGBColor(255, 255, 255),
 *   Api.CreateRGBColor(255, 213, 191)
 * ], "New color scheme")
 * const oTheme = oSlide.GetTheme()
 * oTheme.SetColorScheme(oClrScheme)
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetVerAxisTitle("USD In Hundred Thousands", 10)
 * oChart.SetHorAxisTitle("Year", 11)
 * oChart.SetLegendPos("bottom")
 * oChart.SetShowDataLabels(false, false, true, false)
 * oChart.SetTitle("Financial Overview", 20)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "SetColorScheme.pptx")
 * builder.CloseFile()
 * @param {ApiThemeColorScheme} oApiColorScheme Theme color scheme.
 */

/**
 * @memberof ApiTheme
 * @name GetColorScheme
 * @description Returns the color scheme of the current theme.
 * @returns {ApiThemeColorScheme | null}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * const oTheme = oMaster.GetTheme()
 * const oClrScheme = oTheme.GetColorScheme()
 * oClrScheme.ChangeColor(0, Api.CreateRGBColor(255, 111, 61))
 * oClrScheme.ChangeColor(1, Api.CreateRGBColor(51, 51, 51))
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetVerAxisTitle("USD In Hundred Thousands", 10)
 * oChart.SetHorAxisTitle("Year", 11)
 * oChart.SetLegendPos("bottom")
 * oChart.SetShowDataLabels(false, false, true, false)
 * oChart.SetTitle("Financial Overview", 20)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "GetColorScheme.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiTheme
 * @name SetFormatScheme
 * @description Sets the format scheme to the current presentation theme.
 * @returns {Boolean} return false if format scheme doesn't exist
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill1 = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oBgFill1 = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke1 = Api.CreateStroke(1 * 36000, oFill1)
 * const oFill2 = Api.CreatePatternFill("dashDnDiag", Api.CreateRGBColor(255, 111, 61), Api.CreateRGBColor(51, 51, 51))
 * const oBgFill2 = Api.CreatePatternFill("dashDnDiag", Api.CreateRGBColor(255, 111, 61), Api.CreateRGBColor(51, 51, 51))
 * const oStroke2 = Api.CreateStroke(1 * 36000, oFill2)
 * const oFill3 = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oBgFill3 = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke3 = Api.CreateStroke(1 * 36000, oFill3)
 * const oFormatScheme = Api.CreateThemeFormatScheme([
 *   oFill1,
 *   oFill2,
 *   oFill3
 * ], [
 *   oBgFill1,
 *   oBgFill2,
 *   oBgFill3
 * ], [
 *   oStroke1,
 *   oStroke2,
 *   oStroke3
 * ], "New format scheme")
 * const oTheme = oSlide.GetTheme()
 * oTheme.SetFormatScheme(oFormatScheme)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetVerAxisTitle("USD In Hundred Thousands", 10)
 * oChart.SetHorAxisTitle("Year", 11)
 * oChart.SetLegendPos("bottom")
 * oChart.SetShowDataLabels(false, false, true, false)
 * oChart.SetTitle("Financial Overview", 20)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "SetFormatScheme.pptx")
 * builder.CloseFile()
 * @param {ApiThemeFormatScheme} oApiFormatScheme Theme format scheme.
 */

/**
 * @memberof ApiThemeColorScheme
 * @name ChangeColor
 * @description Changes a color in the theme color scheme.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * const oTheme = oMaster.GetTheme()
 * const oClrScheme = oTheme.GetColorScheme()
 * oClrScheme.ChangeColor(0, Api.CreateRGBColor(255, 111, 61))
 * oClrScheme.ChangeColor(1, Api.CreateRGBColor(51, 51, 51))
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetVerAxisTitle("USD In Hundred Thousands", 10)
 * oChart.SetHorAxisTitle("Year", 11)
 * oChart.SetLegendPos("bottom")
 * oChart.SetShowDataLabels(false, false, true, false)
 * oChart.SetTitle("Financial Overview", 20)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "ChangeColor.pptx")
 * builder.CloseFile()
 * @param {Number} nPos Color position in the color scheme which will be changed.
 * @param {ApiUniColor | ApiRGBColor} oColor New color of the theme color scheme.
 */

/**
 * @memberof ApiThemeColorScheme
 * @name SetSchemeName
 * @description Sets a name to the current theme color scheme.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oMaster = oPresentation.GetMaster(0)
 * const oTheme = oMaster.GetTheme()
 * const oClrScheme = Api.CreateThemeColorScheme([
 *   Api.CreateRGBColor(255, 111, 61),
 *   Api.CreateRGBColor(51, 51, 51),
 *   Api.CreateRGBColor(230, 179, 117),
 *   Api.CreateRGBColor(235, 235, 235),
 *   Api.CreateRGBColor(163, 21, 21),
 *   Api.CreateRGBColor(128, 43, 43),
 *   Api.CreateRGBColor(0, 0, 0),
 *   Api.CreateRGBColor(128, 128, 128),
 *   Api.CreateRGBColor(176, 196, 222),
 *   Api.CreateRGBColor(65, 105, 225),
 *   Api.CreateRGBColor(255, 255, 255),
 *   Api.CreateRGBColor(255, 213, 191)
 * ], "New color scheme")
 * oTheme.SetColorScheme(oClrScheme)
 * oClrScheme.SetSchemeName("New color scheme name")
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("New name was set to the theme color scheme.")
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetSchemeName.pptx")
 * builder.CloseFile()
 * @param {String} sName Theme color scheme name.
 */

/**
 * @memberof ApiThemeColorScheme
 * @name GetClassType
 * @description Returns a type of the ApiThemeColorScheme class.
 * @returns {String}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oMaster = oPresentation.GetMaster(0)
 * const oTheme = oMaster.GetTheme()
 * const oClrScheme = Api.CreateThemeColorScheme([
 *   Api.CreateRGBColor(255, 111, 61),
 *   Api.CreateRGBColor(51, 51, 51),
 *   Api.CreateRGBColor(230, 179, 117),
 *   Api.CreateRGBColor(235, 235, 235),
 *   Api.CreateRGBColor(163, 21, 21),
 *   Api.CreateRGBColor(128, 43, 43),
 *   Api.CreateRGBColor(0, 0, 0),
 *   Api.CreateRGBColor(128, 128, 128),
 *   Api.CreateRGBColor(176, 196, 222),
 *   Api.CreateRGBColor(65, 105, 225),
 *   Api.CreateRGBColor(255, 255, 255),
 *   Api.CreateRGBColor(255, 213, 191)
 * ], "New color scheme")
 * oTheme.SetColorScheme(oClrScheme)
 * const sType = oClrScheme.GetClassType()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Class type = " + sType)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetClassType.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiTheme
 * @name SetFontScheme
 * @description Sets the font scheme to the current presentation theme.
 * @returns {Boolean} return false if font scheme doesn't exist
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oFontScheme = Api.CreateThemeFontScheme("Arial", "Noto Sans Simplified Chinese", "Arabic", "Times New Roman", "Noto Serif Simplified Chinese", "Arabic", "New font scheme")
 * const oTheme = oSlide.GetTheme()
 * oTheme.SetFontScheme(oFontScheme)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * oDocContent.RemoveAllElements()
 * const oParagraph = Api.CreateParagraph()
 * oParagraph.SetJc("left")
 * oParagraph.AddText("This is an example of a paragraph with a new font scheme set.")
 * oDocContent.Push(oParagraph)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetFontScheme.pptx")
 * builder.CloseFile()
 * @param {ApiThemeFontScheme} oApiFontScheme Theme font scheme.
 */

/**
 * @memberof ApiThemeColorScheme
 * @name Copy
 * @description Creates a copy of the current theme color scheme.
 * @returns {ApiThemeColorScheme}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide1 = oPresentation.GetSlideByIndex(0)
 * oSlide1.RemoveAllObjects()
 * const oMaster = oPresentation.GetMaster(0)
 * const oTheme1 = oMaster.GetTheme()
 * const oClrScheme = Api.CreateThemeColorScheme([
 *   Api.CreateRGBColor(255, 111, 61),
 *   Api.CreateRGBColor(51, 51, 51),
 *   Api.CreateRGBColor(230, 179, 117),
 *   Api.CreateRGBColor(235, 235, 235),
 *   Api.CreateRGBColor(163, 21, 21),
 *   Api.CreateRGBColor(128, 43, 43),
 *   Api.CreateRGBColor(0, 0, 0),
 *   Api.CreateRGBColor(128, 128, 128),
 *   Api.CreateRGBColor(176, 196, 222),
 *   Api.CreateRGBColor(65, 105, 225),
 *   Api.CreateRGBColor(255, 255, 255),
 *   Api.CreateRGBColor(255, 213, 191)
 * ], "New color scheme")
 * oTheme1.SetColorScheme(oClrScheme)
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetVerAxisTitle("USD In Hundred Thousands", 10)
 * oChart.SetHorAxisTitle("Year", 11)
 * oChart.SetLegendPos("bottom")
 * oChart.SetShowDataLabels(false, false, true, false)
 * oChart.SetTitle("Financial Overview", 20)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * oSlide1.AddObject(oChart)
 * const oCopyClrScheme = oClrScheme.Copy()
 * oSlide1.ApplyTheme(oTheme1)
 * const oSlide2 = Api.CreateSlide()
 * oSlide2.RemoveAllObjects()
 * oPresentation.AddSlide(oSlide2)
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill1 = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oBgFill1 = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke1 = Api.CreateStroke(1 * 36000, oFill1)
 * const oFill2 = Api.CreatePatternFill("dashDnDiag", Api.CreateRGBColor(255, 111, 61), Api.CreateRGBColor(51, 51, 51))
 * const oBgFill2 = Api.CreatePatternFill("dashDnDiag", Api.CreateRGBColor(255, 111, 61), Api.CreateRGBColor(51, 51, 51))
 * const oStroke2 = Api.CreateStroke(1 * 36000, oFill2)
 * const oFill3 = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oBgFill3 = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke3 = Api.CreateStroke(1 * 36000, oFill3)
 * const oFormatScheme = Api.CreateThemeFormatScheme([
 *   oFill1,
 *   oFill2,
 *   oFill3
 * ], [
 *   oBgFill1,
 *   oBgFill2,
 *   oBgFill3
 * ], [
 *   oStroke1,
 *   oStroke2,
 *   oStroke3
 * ], "New format scheme")
 * const oFontScheme = Api.CreateThemeFontScheme("Arial", "Noto Sans Simplified Chinese", "Arabic", "Times New Roman", "Noto Serif Simplified Chinese", "Arabic", "New font scheme")
 * const oTheme2 = Api.CreateTheme("New theme", oMaster, oCopyClrScheme, oFormatScheme, oFontScheme)
 * oSlide2.ApplyTheme(oTheme2)
 * oSlide2.AddObject(oChart)
 * builder.SaveFile("pptx", "Copy.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiTextPr
 * @name SetBold
 * @description Sets the bold property to the text character.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * const oTextPr = oRun.GetTextPr()
 * oTextPr.SetFontSize(50)
 * oTextPr.SetBold(true)
 * oParagraph.SetJc("left")
 * oRun.AddText("This is a sample text inside the shape with the font weight set to bold using the text properties.")
 * oParagraph.AddElement(oRun)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetBold.pptx")
 * builder.CloseFile()
 * @param {Boolean} isBold Specifies that the contents of the run are displayed bold.
 */

/**
 * @memberof ApiTextPr
 * @name SetFill
 * @description Sets the text color to the current text run.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * const oTextPr = oRun.GetTextPr()
 * oTextPr.SetFontSize(50)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oTextPr.SetFill(oFill)
 * oRun.AddText("This is a text run with the font color set to black using the text properties.")
 * oParagraph.AddElement(oRun)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetFill.pptx")
 * builder.CloseFile()
 * @param {ApiFill} oApiFill The color or pattern used to fill the text color.
 */

/**
 * @memberof ApiTextPr
 * @name SetDoubleStrikeout
 * @description Specifies that the contents of the run are displayed with two horizontal lines through each character displayed on the line.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * const oTextPr = oRun.GetTextPr()
 * oTextPr.SetFontSize(50)
 * oTextPr.SetDoubleStrikeout(true)
 * oParagraph.SetJc("left")
 * oRun.AddText("This is a sample text inside the shape struck out with two lines using the text properties.")
 * oParagraph.AddElement(oRun)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetDoubleStrikeout.pptx")
 * builder.CloseFile()
 * @param {Boolean} isDoubleStrikeout Specifies that the contents of the current run are displayed double struck through.
 */

/**
 * @memberof ApiTextPr
 * @name SetFontFamily
 * @description Sets all 4 font slots with the specified font family.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * const oTextPr = oRun.GetTextPr()
 * oTextPr.SetFontSize(50)
 * oTextPr.SetFontFamily("Comic Sans MS")
 * oParagraph.SetJc("left")
 * oRun.AddText("This is a sample text inside the shape with the font family set to 'Comic Sans MS' using the text properties.")
 * oParagraph.AddElement(oRun)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetFontFamily.pptx")
 * builder.CloseFile()
 * @param {String} sFontFamily The font family or families used for the current text run.
 */

/**
 * @memberof ApiTextPr
 * @name SetFontSize
 * @description Sets the font size to the characters of the current text run.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * const oTextPr = oRun.GetTextPr()
 * oTextPr.SetFontSize(30)
 * oParagraph.SetJc("left")
 * oRun.AddText("This is a sample text inside the shape with the font size set to 15 points using the text properties.")
 * oParagraph.AddElement(oRun)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetFontSize.pptx")
 * builder.CloseFile()
 * @param {hps} nSize The text size value measured in half-points (1/144 of an inch).
 */

/**
 * @memberof ApiTextPr
 * @name GetClassType
 * @description Returns a type of the ApiTextPr class.
 * @returns {String}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * const oTextPr = oRun.GetTextPr()
 * oTextPr.SetFontSize(50)
 * oParagraph.SetJc("left")
 * const sClassType = oTextPr.GetClassType()
 * oRun.AddText("Class Type = " + sClassType)
 * oParagraph.AddElement(oRun)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetClassType.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiTextPr
 * @name SetCaps
 * @description Specifies that any lowercase characters in the text run are formatted for display only as their capital letter character equivalents.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * const oTextPr = oRun.GetTextPr()
 * oTextPr.SetFontSize(50)
 * oTextPr.SetCaps(true)
 * oParagraph.SetJc("left")
 * oRun.AddText("This is a sample text inside the shape set to capital letters using the text properties.")
 * oParagraph.AddElement(oRun)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetCaps.pptx")
 * builder.CloseFile()
 * @param {Boolean} isCaps Specifies that the contents of the current run are displayed capitalized.
 */

/**
 * @memberof ApiThemeColorScheme
 * @name ToJSON
 * @description Converts the ApiThemeColorScheme object into the JSON object.
 * @returns {JSON}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oMaster = oPresentation.GetMaster(0)
 * const oClrScheme = Api.CreateThemeColorScheme([
 *   Api.CreateRGBColor(255, 111, 61),
 *   Api.CreateRGBColor(51, 51, 51),
 *   Api.CreateRGBColor(230, 179, 117),
 *   Api.CreateRGBColor(235, 235, 235),
 *   Api.CreateRGBColor(163, 21, 21),
 *   Api.CreateRGBColor(128, 43, 43),
 *   Api.CreateRGBColor(0, 0, 0),
 *   Api.CreateRGBColor(128, 128, 128),
 *   Api.CreateRGBColor(176, 196, 222),
 *   Api.CreateRGBColor(65, 105, 225),
 *   Api.CreateRGBColor(255, 255, 255),
 *   Api.CreateRGBColor(255, 213, 191)
 * ], "New color scheme")
 * const json = oClrScheme.ToJSON()
 * const oClrSchemeFromJSON = Api.FromJSON(json)
 * const oTheme = oSlide.GetTheme()
 * oTheme.SetColorScheme(oClrSchemeFromJSON)
 * const sType = oClrSchemeFromJSON.GetClassType()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetVerAxisTitle("USD In Hundred Thousands", 10)
 * oChart.SetHorAxisTitle("Year", 11)
 * oChart.SetLegendPos("bottom")
 * oChart.SetShowDataLabels(false, false, true, false)
 * oChart.SetTitle("Class type = " + sType, 20)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "ToJSON.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiTextPr
 * @name SetItalic
 * @description Sets the italic property to the text character.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * const oTextPr = oRun.GetTextPr()
 * oTextPr.SetFontSize(50)
 * oTextPr.SetItalic(true)
 * oParagraph.SetJc("left")
 * oRun.AddText("This is a sample text inside the shape with the font set to italicized letters using the text properties.")
 * oParagraph.AddElement(oRun)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetItalic.pptx")
 * builder.CloseFile()
 * @param {Boolean} isItalic Specifies that the contents of the current run are displayed italicized.
 */

/**
 * @memberof ApiTextPr
 * @name SetHighlight
 * @description Specifies a highlighting color which is added to the text properties and applied as a background to the contents of the current run/range/paragraph.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * const oTextPr = oRun.GetTextPr()
 * oTextPr.SetFontSize(50)
 * oTextPr.SetHighlight("lightGray")
 * oParagraph.SetJc("left")
 * oRun.AddText("This is a sample text inside the shape with the text highlighted with light gray color using the text properties.")
 * oParagraph.AddElement(oRun)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetHighlight.pptx")
 * builder.CloseFile()
 * @param {highlightColor} sColor Available highlight color.
 */

/**
 * @memberof ApiTextPr
 * @name SetStrikeout
 * @description Specifies that the contents of the run are displayed with a single horizontal line through the center of the line.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * const oTextPr = oRun.GetTextPr()
 * oTextPr.SetFontSize(50)
 * oTextPr.SetStrikeout(true)
 * oParagraph.SetJc("left")
 * oRun.AddText("This is a struck out text inside the shape.")
 * oParagraph.AddElement(oRun)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetStrikeout.pptx")
 * builder.CloseFile()
 * @param {Boolean} isStrikeout Specifies that the contents of the current run are displayed struck through.
 */

/**
 * @memberof ApiTextPr
 * @name SetSpacing
 * @description Sets the text spacing measured in twentieths of a point.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * const oTextPr = oRun.GetTextPr()
 * oTextPr.SetFontSize(50)
 * oTextPr.SetSpacing(80)
 * oParagraph.SetJc("left")
 * oRun.AddText("This is a sample text inside the shape with the spacing set to 4 points (80 twentieths of a point) using the text properties.")
 * oParagraph.AddElement(oRun)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetSpacing.pptx")
 * builder.CloseFile()
 * @param {twips} nSpacing The value of the text spacing measured in twentieths of a point (1/1440 of an inch).
 */

/**
 * @memberof ApiTextPr
 * @name SetOutLine
 * @description Sets the text outline to the current text run.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * let oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * const oTextPr = oRun.GetTextPr()
 * oTextPr.SetFontSize(50)
 * oStroke = Api.CreateStroke(0.2 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51)))
 * oTextPr.SetOutLine(oStroke)
 * oParagraph.SetJc("left")
 * oRun.AddText("This is a text run with the black text outline set using the text properties.")
 * oParagraph.AddElement(oRun)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetOutLine.pptx")
 * builder.CloseFile()
 * @param {ApiStroke} oStroke The stroke used to create the text outline.
 */

/**
 * @memberof ApiTextPr
 * @name SetUnderline
 * @description Specifies that the contents of the run are displayed along with a line appearing directly below the character (less than all the spacing above and below the characters on the line).
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * const oTextPr = oRun.GetTextPr()
 * oTextPr.SetFontSize(50)
 * oTextPr.SetUnderline(true)
 * oParagraph.SetJc("left")
 * oRun.AddText("This is an underlined text inside the shape.")
 * oParagraph.AddElement(oRun)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetUnderline.pptx")
 * builder.CloseFile()
 * @param {Boolean} isUnderline Specifies that the contents of the current run are displayed underlined.
 */

/**
 * @memberof ApiTextPr
 * @name SetVertAlign
 * @description Specifies the alignment which will be applied to the contents of the run in relation to the default appearance of the run text.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * const oTextPr = oRun.GetTextPr()
 * oTextPr.SetFontSize(50)
 * oTextPr.SetVertAlign("superscript")
 * oParagraph.SetJc("left")
 * oRun.AddText("This is a text inside the shape with vertical alignment set to 'superscript'.")
 * oParagraph.AddElement(oRun)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetVertAlign.pptx")
 * builder.CloseFile()
 * @param {VertAlign} sType The vertical alignment type applied to the text contents.
 */

/**
 * @memberof ApiThemeFormatScheme
 * @name ChangeEffectStyles
 * @description Need to do Sets the effect styles to the current theme format scheme.
 * @returns {Boolean}
 * @example
 * @param {Array=} arrEffect The array of effect styles must contain 3 elements - subtle, moderate and intense fills. If an array is empty or NoFill elements are in the array, it will be filled with the Api.CreateStroke(0, Api.CreateNoFill()) elements.
 */

/**
 * @memberof ApiTextPr
 * @name SetTextFill
 * @description Sets the text fill to the current text run.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * const oTextPr = oRun.GetTextPr()
 * oTextPr.SetFontSize(50)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oTextPr.SetTextFill(oFill)
 * oParagraph.SetJc("left")
 * oRun.AddText("This is a sample text inside the shape with the black text fill set using the text properties.")
 * oParagraph.AddElement(oRun)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetTextFill.pptx")
 * builder.CloseFile()
 * @param {ApiFill} oApiFill The color or pattern used to fill the text color.
 */

/**
 * @memberof ApiTextPr
 * @name SetSmallCaps
 * @description Specifies that all the small letter characters in the text run are formatted for display only as their capital letter character equivalents which are two points smaller than the actual font size specified for this text.
 * @returns {ApiTextPr}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * const oRun = Api.CreateRun()
 * const oTextPr = oRun.GetTextPr()
 * oTextPr.SetFontSize(50)
 * oTextPr.SetSmallCaps(true)
 * oParagraph.SetJc("left")
 * oRun.AddText("This is a sample text inside the shape with the font set to small capitalized letters using the text properties.")
 * oParagraph.AddElement(oRun)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetSmallCaps.pptx")
 * builder.CloseFile()
 * @param {Boolean} isSmallCaps Specifies if the contents of the current run are displayed capitalized two points smaller or not.
 */

/**
 * @memberof ApiThemeFormatScheme
 * @name ChangeLineStyles
 * @description Sets the line styles to the current theme format scheme.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * let oTheme = oSlide.GetTheme()
 * const oFormatScheme = oTheme.GetFormatScheme()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill1 = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke1 = Api.CreateStroke(3 * 36000, oFill1)
 * const oFill2 = Api.CreatePatternFill("dashDnDiag", Api.CreateRGBColor(255, 111, 61), Api.CreateRGBColor(51, 51, 51))
 * const oStroke2 = Api.CreateStroke(3 * 36000, oFill2)
 * const oFill3 = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke3 = Api.CreateStroke(3 * 36000, oFill3)
 * oFormatScheme.ChangeLineStyles([
 *   oStroke1,
 *   oStroke2,
 *   oFill3
 * ])
 * const oClrScheme = Api.CreateThemeColorScheme([
 *   Api.CreateRGBColor(255, 111, 61),
 *   Api.CreateRGBColor(51, 51, 51),
 *   Api.CreateRGBColor(230, 179, 117),
 *   Api.CreateRGBColor(235, 235, 235),
 *   Api.CreateRGBColor(163, 21, 21),
 *   Api.CreateRGBColor(128, 43, 43),
 *   Api.CreateRGBColor(0, 0, 0),
 *   Api.CreateRGBColor(128, 128, 128),
 *   Api.CreateRGBColor(176, 196, 222),
 *   Api.CreateRGBColor(65, 105, 225),
 *   Api.CreateRGBColor(255, 255, 255),
 *   Api.CreateRGBColor(255, 213, 191)
 * ], "New color scheme")
 * const oFontScheme = Api.CreateThemeFontScheme("Arial", "Noto Sans Simplified Chinese", "Arabic", "Times New Roman", "Noto Serif Simplified Chinese", "Arabic", "New font scheme")
 * oTheme = Api.CreateTheme("Theme 1", oMaster, oClrScheme, oFormatScheme, oFontScheme)
 * oPresentation.ApplyTheme(oTheme)
 * oSlide.RemoveAllObjects()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Create a shape by yourself to see the stroke style set to this presentation.")
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "ChangeLineStyles.pptx")
 * builder.CloseFile()
 * @param {Array<ApiStroke>} arrLine The array of line styles must contain 3 elements - subtle, moderate and intense fills. If an array is empty or ApiStroke elements are with no fill, it will be filled with the Api.CreateStroke(0, Api.CreateNoFill()) elements.
 */

/**
 * @memberof ApiThemeFormatScheme
 * @name ChangeFillStyles
 * @description Sets the fill styles to the current theme format scheme.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * let oTheme = oSlide.GetTheme()
 * const oFormatScheme = oTheme.GetFormatScheme()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill1 = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oFill2 = Api.CreatePatternFill("dashDnDiag", Api.CreateRGBColor(255, 111, 61), Api.CreateRGBColor(51, 51, 51))
 * const oFill3 = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oFormatScheme.ChangeFillStyles([
 *   oFill1,
 *   oFill2,
 *   oFill3
 * ])
 * const oClrScheme = Api.CreateThemeColorScheme([
 *   Api.CreateRGBColor(255, 111, 61),
 *   Api.CreateRGBColor(51, 51, 51),
 *   Api.CreateRGBColor(230, 179, 117),
 *   Api.CreateRGBColor(235, 235, 235),
 *   Api.CreateRGBColor(163, 21, 21),
 *   Api.CreateRGBColor(128, 43, 43),
 *   Api.CreateRGBColor(0, 0, 0),
 *   Api.CreateRGBColor(128, 128, 128),
 *   Api.CreateRGBColor(176, 196, 222),
 *   Api.CreateRGBColor(65, 105, 225),
 *   Api.CreateRGBColor(255, 255, 255),
 *   Api.CreateRGBColor(255, 213, 191)
 * ], "New color scheme")
 * const oFontScheme = Api.CreateThemeFontScheme("Arial", "Noto Sans Simplified Chinese", "Arabic", "Times New Roman", "Noto Serif Simplified Chinese", "Arabic", "New font scheme")
 * oTheme = Api.CreateTheme("Theme 1", oMaster, oClrScheme, oFormatScheme, oFontScheme)
 * oPresentation.ApplyTheme(oTheme)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetVerAxisTitle("USD In Hundred Thousands", 10)
 * oChart.SetHorAxisTitle("Year", 11)
 * oChart.SetLegendPos("bottom")
 * oChart.SetShowDataLabels(false, false, true, false)
 * oChart.SetTitle("Financial Overview", 20)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "ChangeFillStyles.pptx")
 * builder.CloseFile()
 * @param {Array<ApiFill>} arrFill The array of fill styles must contain 3 elements - subtle, moderate and intense fills. If an array is empty or NoFill elements are in the array, it will be filled with the Api.CreateNoFill() elements.
 */

/**
 * @memberof ApiThemeFormatScheme
 * @name ChangeBgFillStyles
 * @description Sets the background fill styles to the current theme format scheme.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * let oTheme = oSlide.GetTheme()
 * const oFormatScheme = oTheme.GetFormatScheme()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oBgFill1 = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oBgFill2 = Api.CreatePatternFill("dashDnDiag", Api.CreateRGBColor(255, 111, 61), Api.CreateRGBColor(51, 51, 51))
 * const oBgFill3 = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * oFormatScheme.ChangeBgFillStyles([
 *   oBgFill1,
 *   oBgFill2,
 *   oBgFill3
 * ])
 * const oClrScheme = Api.CreateThemeColorScheme([
 *   Api.CreateRGBColor(255, 111, 61),
 *   Api.CreateRGBColor(51, 51, 51),
 *   Api.CreateRGBColor(230, 179, 117),
 *   Api.CreateRGBColor(235, 235, 235),
 *   Api.CreateRGBColor(163, 21, 21),
 *   Api.CreateRGBColor(128, 43, 43),
 *   Api.CreateRGBColor(0, 0, 0),
 *   Api.CreateRGBColor(128, 128, 128),
 *   Api.CreateRGBColor(176, 196, 222),
 *   Api.CreateRGBColor(65, 105, 225),
 *   Api.CreateRGBColor(255, 255, 255),
 *   Api.CreateRGBColor(255, 213, 191)
 * ], "New color scheme")
 * const oFontScheme = Api.CreateThemeFontScheme("Arial", "Noto Sans Simplified Chinese", "Arabic", "Times New Roman", "Noto Serif Simplified Chinese", "Arabic", "New font scheme")
 * oTheme = Api.CreateTheme("Theme 1", oMaster, oClrScheme, oFormatScheme, oFontScheme)
 * oPresentation.ApplyTheme(oTheme)
 * oSlide.RemoveAllObjects()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetVerAxisTitle("USD In Hundred Thousands", 10)
 * oChart.SetHorAxisTitle("Year", 11)
 * oChart.SetLegendPos("bottom")
 * oChart.SetShowDataLabels(false, false, true, false)
 * oChart.SetTitle("Financial Overview", 20)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "ChangeBgFillStyles.pptx")
 * builder.CloseFile()
 * @param {Array<ApiFill>} arrBgFill The array of background fill styles must contains 3 elements - subtle, moderate and intense fills. If an array is empty or NoFill elements are in the array, it will be filled with the Api.CreateNoFill() elements.
 */

/**
 * @memberof ApiThemeFormatScheme
 * @name SetSchemeName
 * @description Sets a name to the current theme format scheme.
 * @returns {Boolean}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oMaster = oPresentation.GetMaster(0)
 * const oTheme = oMaster.GetTheme()
 * const oFormatScheme = oTheme.GetFormatScheme()
 * oFormatScheme.SetSchemeName("New format scheme name")
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("New name was set to the theme format scheme.")
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetSchemeName.pptx")
 * builder.CloseFile()
 * @param {String} sName Theme format scheme name.
 */

/**
 * @memberof ApiThemeFormatScheme
 * @name GetClassType
 * @description Returns a type of the ApiThemeFormatScheme class.
 * @returns {String}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * const oTheme = oMaster.GetTheme()
 * const oFormatScheme = oTheme.GetFormatScheme()
 * const sType = oFormatScheme.GetClassType()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Class type = " + sType)
 * oSlide.RemoveAllObjects()
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetClassType.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiThemeFormatScheme
 * @name ToJSON
 * @description Converts the ApiThemeFormatScheme object into the JSON object.
 * @returns {JSON}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oTheme = oSlide.GetTheme()
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill1 = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oBgFill1 = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke1 = Api.CreateStroke(1 * 36000, oFill1)
 * const oFill2 = Api.CreatePatternFill("dashDnDiag", Api.CreateRGBColor(255, 111, 61), Api.CreateRGBColor(51, 51, 51))
 * const oBgFill2 = Api.CreatePatternFill("dashDnDiag", Api.CreateRGBColor(255, 111, 61), Api.CreateRGBColor(51, 51, 51))
 * const oStroke2 = Api.CreateStroke(1 * 36000, oFill2)
 * const oFill3 = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oBgFill3 = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke3 = Api.CreateStroke(1 * 36000, oFill3)
 * const oFormatScheme = Api.CreateThemeFormatScheme([
 *   oFill1,
 *   oFill2,
 *   oFill3
 * ], [
 *   oBgFill1,
 *   oBgFill2,
 *   oBgFill3
 * ], [
 *   oStroke1,
 *   oStroke2,
 *   oStroke3
 * ], "New format scheme")
 * const json = oFormatScheme.ToJSON()
 * const oFormatSchemeFromJSON = Api.FromJSON(json)
 * oTheme.SetFormatScheme(oFormatSchemeFromJSON)
 * const sType = oFormatSchemeFromJSON.GetClassType()
 * const oChart = Api.CreateChart("bar3D", [
 *   [
 *     200,
 *     240,
 *     280
 *   ],
 *   [
 *     250,
 *     260,
 *     280
 *   ]
 * ], [
 *   "Projected Revenue",
 *   "Estimated Costs"
 * ], [
 *   2014,
 *   2015,
 *   2016
 * ], 4051300, 2347595, 24)
 * oChart.SetVerAxisTitle("USD In Hundred Thousands", 10)
 * oChart.SetHorAxisTitle("Year", 11)
 * oChart.SetLegendPos("bottom")
 * oChart.SetShowDataLabels(false, false, true, false)
 * oChart.SetTitle("Class type = " + sType, 20)
 * oChart.SetSize(300 * 36000, 130 * 36000)
 * oChart.SetPosition(608400, 1267200)
 * oSlide.AddObject(oChart)
 * builder.SaveFile("pptx", "ToJSON.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiThemeFontScheme
 * @name GetClassType
 * @description Returns a type of the ApiThemeFontScheme class.
 * @returns {String}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oMaster = oPresentation.GetMaster()
 * const oFontScheme = Api.CreateThemeFontScheme("Arial", "Noto Sans Simplified Chinese", "Arabic", "Times New Roman", "Noto Serif Simplified Chinese", "Arabic", "New font scheme")
 * const sType = oFontScheme.GetClassType()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Class type = " + sType)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetClassType.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiThemeFontScheme
 * @name Copy
 * @description Creates a copy of the current theme font scheme.
 * @returns {ApiThemeFontScheme}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide1 = oPresentation.GetSlideByIndex(0)
 * oSlide1.RemoveAllObjects()
 * const oMaster = oPresentation.GetMaster(0)
 * const oTheme1 = oMaster.GetTheme()
 * const oFontScheme = Api.CreateThemeFontScheme("Arial", "Noto Sans Simplified Chinese", "Arabic", "Times New Roman", "Noto Serif Simplified Chinese", "Arabic", "New font scheme")
 * oTheme1.SetFontScheme(oFontScheme)
 * let oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * let oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * let oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * let oDocContent = oShape.GetDocContent()
 * let oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("New font scheme was set to this slide.")
 * oSlide1.AddObject(oShape)
 * const oCopyFontScheme = oFontScheme.Copy()
 * oSlide1.ApplyTheme(oTheme1)
 * const oSlide2 = Api.CreateSlide()
 * oSlide2.RemoveAllObjects()
 * oPresentation.AddSlide(oSlide2)
 * const oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill1 = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oBgFill1 = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke1 = Api.CreateStroke(1 * 36000, oFill1)
 * const oFill2 = Api.CreatePatternFill("dashDnDiag", Api.CreateRGBColor(255, 111, 61), Api.CreateRGBColor(51, 51, 51))
 * const oBgFill2 = Api.CreatePatternFill("dashDnDiag", Api.CreateRGBColor(255, 111, 61), Api.CreateRGBColor(51, 51, 51))
 * const oStroke2 = Api.CreateStroke(1 * 36000, oFill2)
 * const oFill3 = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oBgFill3 = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke3 = Api.CreateStroke(1 * 36000, oFill3)
 * oFormatScheme = Api.CreateThemeFormatScheme([
 *   oFill1,
 *   oFill2,
 *   oFill3
 * ], [
 *   oBgFill1,
 *   oBgFill2,
 *   oBgFill3
 * ], [
 *   oStroke1,
 *   oStroke2,
 *   oStroke3
 * ], "New format scheme")
 * const oClrScheme = Api.CreateThemeColorScheme([
 *   Api.CreateRGBColor(255, 111, 61),
 *   Api.CreateRGBColor(51, 51, 51),
 *   Api.CreateRGBColor(230, 179, 117),
 *   Api.CreateRGBColor(235, 235, 235),
 *   Api.CreateRGBColor(163, 21, 21),
 *   Api.CreateRGBColor(128, 43, 43),
 *   Api.CreateRGBColor(0, 0, 0),
 *   Api.CreateRGBColor(128, 128, 128),
 *   Api.CreateRGBColor(176, 196, 222),
 *   Api.CreateRGBColor(65, 105, 225),
 *   Api.CreateRGBColor(255, 255, 255),
 *   Api.CreateRGBColor(255, 213, 191)
 * ], "New color scheme")
 * const oTheme2 = Api.CreateTheme("New theme", oMaster, oClrScheme, oFormatScheme, oCopyFontScheme)
 * oSlide2.ApplyTheme(oTheme2)
 * oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51))
 * oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * oDocContent = oShape.GetDocContent()
 * oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("New font scheme was set to this slide.")
 * oSlide2.AddObject(oShape)
 * builder.SaveFile("pptx", "Copy.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiThemeFontScheme
 * @name SetFonts
 * @description Sets the fonts to the current theme font scheme.
 * @returns {void}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * const oTheme = oMaster.GetTheme()
 * const oFontScheme = oTheme.GetFontScheme()
 * oFontScheme.SetFonts("Arial", "Noto Sans Simplified Chinese", "Arabic", "Times New Roman", "Noto Serif Simplified Chinese", "Arabic", "New font scheme")
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("New font scheme was set to this slide.")
 * oSlide.RemoveAllObjects()
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetFonts.pptx")
 * builder.CloseFile()
 * @param {String} mjLatin The major theme font applied to the latin text.
 * @param {String} mjEa The major theme font applied to the east asian text.
 * @param {String} mjCs The major theme font applied to the complex script text.
 * @param {String} mnLatin The minor theme font applied to the latin text.
 * @param {String} mnEa The minor theme font applied to the east asian text.
 * @param {String} mnCs The minor theme font applied to the complex script text.
 */

/**
 * @memberof ApiThemeFontScheme
 * @name ToJSON
 * @description Converts the ApiThemeFontScheme object into the JSON object.
 * @returns {JSON}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oMaster = oPresentation.GetMaster(0)
 * const oThemeMaster = oMaster.GetTheme()
 * const oFontScheme = oThemeMaster.GetFontScheme()
 * oFontScheme.SetFonts("Arial", "Noto Sans Simplified Chinese", "Arabic", "Times New Roman", "Noto Serif Simplified Chinese", "Arabic", "New font scheme")
 * oFontScheme.SetSchemeName("New font scheme name")
 * const json = oFontScheme.ToJSON()
 * const oFontSchemeFromJSON = Api.FromJSON(json)
 * const oTheme = oSlide.GetTheme()
 * oTheme.SetFontScheme(oFontSchemeFromJSON)
 * const sType = oFontSchemeFromJSON.GetClassType()
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Class type = " + sType)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "ToJSON.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiThemeFormatScheme
 * @name Copy
 * @description Creates a copy of the current theme format scheme.
 * @returns {ApiThemeFormatScheme}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oMaster = oPresentation.GetMaster(0)
 * const oSlide1 = oPresentation.GetSlideByIndex(0)
 * let oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0)
 * let oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill1 = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oBgFill1 = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke1 = Api.CreateStroke(1 * 36000, oFill1)
 * const oFill2 = Api.CreatePatternFill("dashDnDiag", Api.CreateRGBColor(255, 111, 61), Api.CreateRGBColor(51, 51, 51))
 * const oBgFill2 = Api.CreatePatternFill("dashDnDiag", Api.CreateRGBColor(255, 111, 61), Api.CreateRGBColor(51, 51, 51))
 * const oStroke2 = Api.CreateStroke(1 * 36000, oFill2)
 * const oFill3 = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oBgFill3 = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke3 = Api.CreateStroke(1 * 36000, oFill3)
 * const oFormatScheme = Api.CreateThemeFormatScheme([
 *   oFill1,
 *   oFill2,
 *   oFill3
 * ], [
 *   oBgFill1,
 *   oBgFill2,
 *   oBgFill3
 * ], [
 *   oStroke1,
 *   oStroke2,
 *   oStroke3
 * ], "New format scheme")
 * const oClrScheme = Api.CreateThemeColorScheme([
 *   Api.CreateRGBColor(255, 111, 61),
 *   Api.CreateRGBColor(51, 51, 51),
 *   Api.CreateRGBColor(230, 179, 117),
 *   Api.CreateRGBColor(235, 235, 235),
 *   Api.CreateRGBColor(163, 21, 21),
 *   Api.CreateRGBColor(128, 43, 43),
 *   Api.CreateRGBColor(0, 0, 0),
 *   Api.CreateRGBColor(128, 128, 128),
 *   Api.CreateRGBColor(176, 196, 222),
 *   Api.CreateRGBColor(65, 105, 225),
 *   Api.CreateRGBColor(255, 255, 255),
 *   Api.CreateRGBColor(255, 213, 191)
 * ], "New color scheme")
 * const oFontScheme = Api.CreateThemeFontScheme("Arial", "Noto Sans Simplified Chinese", "Arabic", "Times New Roman", "Noto Serif Simplified Chinese", "Arabic", "New font scheme")
 * const oTheme1 = Api.CreateTheme("Theme 1", oMaster, oClrScheme, oFormatScheme, oFontScheme)
 * oPresentation.ApplyTheme(oTheme1)
 * const oSlide2 = Api.CreateSlide()
 * oPresentation.AddSlide(oSlide2)
 * oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 218, 185), 0)
 * oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(238, 203, 173), 100000)
 * const oNewBgFill1 = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oNewBgFill2 = Api.CreatePatternFill("dashDnDiag", Api.CreateRGBColor(238, 203, 173), Api.CreateRGBColor(51, 51, 51))
 * const oNewBgFill3 = Api.CreateSolidFill(Api.CreateRGBColor(238, 203, 173))
 * const oCopyFormatScheme = oFormatScheme.Copy()
 * oCopyFormatScheme.ChangeBgFillStyles([
 *   oNewBgFill1,
 *   oNewBgFill2,
 *   oNewBgFill3
 * ])
 * const oTheme2 = Api.CreateTheme("Theme 2", oMaster, oClrScheme, oCopyFormatScheme, oFontScheme)
 * oSlide2.ApplyTheme(oTheme2)
 * builder.SaveFile("pptx", "Copy.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiUniColor
 * @name GetClassType
 * @description Returns a type of the ApiUniColor class.
 * @returns {String}
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * oSlide.RemoveAllObjects()
 * const oPresetColor = Api.CreatePresetColor("lightYellow")
 * const oGs1 = Api.CreateGradientStop(oPresetColor, 0)
 * const oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000)
 * const oFill = Api.CreateRadialGradientFill([
 *   oGs1,
 *   oGs2
 * ])
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oDocContent = oShape.GetDocContent()
 * const sClassType = oPresetColor.GetClassType()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("Class Type = " + sClassType)
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "GetClassType.pptx")
 * builder.CloseFile()
 */

/**
 * @memberof ApiThemeFontScheme
 * @name SetSchemeName
 * @description Sets a name to the current theme font scheme.
 * @returns {Boolean} returns false if font scheme doesn't exist
 * @example
 * builder.CreateFile("pptx")
 * const oPresentation = Api.GetPresentation()
 * const oSlide = oPresentation.GetSlideByIndex(0)
 * const oMaster = oPresentation.GetMaster(0)
 * const oTheme = oMaster.GetTheme()
 * const oFontScheme = oTheme.GetFontScheme()
 * oFontScheme.SetFonts("Arial", "Noto Sans Simplified Chinese", "Arabic", "Times New Roman", "Noto Serif Simplified Chinese", "Arabic", "New font scheme")
 * oFontScheme.SetSchemeName("New font scheme name")
 * const oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61))
 * const oStroke = Api.CreateStroke(0, Api.CreateNoFill())
 * const oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke)
 * oShape.SetPosition(608400, 1267200)
 * oShape.SetSize(300 * 36000, 130 * 36000)
 * const oDocContent = oShape.GetDocContent()
 * const oParagraph = oDocContent.GetElement(0)
 * oParagraph.SetJc("left")
 * oParagraph.AddText("New name was set to the theme font scheme.")
 * oSlide.RemoveAllObjects()
 * oSlide.AddObject(oShape)
 * builder.SaveFile("pptx", "SetSchemeName.pptx")
 * builder.CloseFile()
 * @param {String} sName Theme font scheme name.
 */

/**
 * @class
 * @name Api
 * @description Class representing a base class.
 * @prop {Readonly<String>} ApiFullName Returns the full name of the currently opened file.
 */