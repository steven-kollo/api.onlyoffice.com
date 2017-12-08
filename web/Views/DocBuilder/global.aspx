<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Global type definitions
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Global type definitions</span>
    </h1>
    <div class="global-type-definitions">
    <span class="anchor-position" id="BlipFillType">&nbsp;</span>
    <h4 class="header-gray">BlipFillType</h4>    
    <p>The type of a fill which uses an image as a background.</p>
        <ul>
            <li><b>"tile"</b> - if the image is smaller than the shaped which is filled, the image will be tiled all over the created shape surface.</li>
            <li><b>"stretch"</b> - if the image is smaller than the shape which is filled, the image will be stretched to fit the created shape surface.</li>
        </ul>
    <div class="global-list">
    <h5>Type:</h5>
    <ul>
        <li>
            <em>"tile"</em>
            |
            <em>"stretch"</em>
        </li>
    </ul>
    </div>
    <h5>Example</h5>
<pre>// Create a blip fill with an image which is tiled all over the created shape:
oFill = Api.CreateBlipFill("https://example.com/myimage.png", "tile");</pre>
    </div>

    <div class="global-type-definitions">
        <span class="anchor-position" id="BordersIndex">&nbsp;</span>
        <h4 class="header-gray">BordersIndex</h4>
        <p>Specifies the cell border position.</p>
        <div class="global-list">
            <h5>Type:</h5>
            <ul>
                <li>
                    <em>"DiagonalDown"</em>
                    |
            <em>"DiagonalUp"</em>
                    |
            <em>"Bottom"</em>
                    |
            <em>"Left"</em>
                    |
            <em>"Right"</em>
                    |
            <em>"Top"</em>
                    |
            <em>"InsideHorizontal"</em>
                    |
            <em>"InsideVertical"</em>
                </li>
            </ul>
        </div>
        <h5>Example</h5>
        <pre>// The cell will have a bottom black dotted border:
oWorksheet.GetRange("E2").SetBorders("Bottom", "Dotted", Api.CreateColorFromRGB(0, 0, 0));</pre>
    </div>

    <div class="global-type-definitions">
    <span class="anchor-position" id="BorderType">&nbsp;</span>
    <h4 class="header-gray">BorderType</h4>    
    <p>A border type which will be added to the document element.</p>
        <ul>
            <li><b>"none"</b> - no border will be added to the created element or the selected element side.</li>
            <li><b>"single"</b> - a single border will be added to the created element or the selected element side.</li>
        </ul>
    <div class="global-list">
    <h5>Type:</h5>
    <ul>
        <li>
            <em>"none"</em>
            |
            <em>"single"</em>
        </li>
    </ul>
    </div>
    <h5>Example</h5>
    <pre>// The paragraph will have a single 3 point wide green bottom border with a zero offset from the bottom paragraph edge:
oParaPr.SetBottomBorder("single", 24, 0, 0, 255, 0);</pre>
    </div>

    <div class="global-type-definitions">
    <span class="anchor-position" id="BulletType">&nbsp;</span>
    <h4 class="header-gray">BulletType</h4>    
    <p>A bullet type which will be added to the paragraph in spreadsheet or presentation.</p>
    <div class="global-list">
    <h5>Type:</h5>
    <ul>
        <li>
            <em>"ArabicPeriod"</em>
            |
            <em>"ArabicParenR"</em>
            |
            <em>"RomanUcPeriod"</em>
            |
            <em>"RomanLcPeriod"</em>
            |
            <em>"AlphaLcParenR"</em>
            |
            <em>"AlphaLcPeriod"</em>
            |
            <em>"AlphaUcParenR"</em>
            |
            <em>"AlphaUcPeriod"</em>
            |
            <em>"None"</em>
        </li>
    </ul>
    </div>
    <h5>Example</h5>
    <pre>// The paragraph will be starting with the Arabic numeral which has parenthesis:
oBullet = Api.CreateNumbering("ArabicParenR");</pre>
    </div>

    <div class="global-type-definitions">
    <span class="anchor-position" id="byte">&nbsp;</span>
    <h4 class="header-gray">byte</h4>    
    <p>A numeric value from 0 to 255.</p>
    <div class="global-list">
    <h5>Type:</h5>
    <ul>
        <li>
            <em>number</em>
        </li>
    </ul>
    </div>
    <h5>Example</h5>
    <pre>// The resulting color is green, the bytes are measured in decimal numbers:
oRGBColor = Api.CreateRGBColor(0, 255, 0);
// The resulting color is green, the bytes are measured in hexadecimal numbers:
oRGBColor = Api.CreateRGBColor(0, 0xff, 0);</pre>
    </div>

    <div class="global-type-definitions">
    <span class="anchor-position" id="ChartType">&nbsp;</span>
    <h4 class="header-gray">ChartType</h4>    
    <p>This type specifies the available chart types which can be used to create a new chart.</p>
    <div class="global-list">
    <h5>Type:</h5>
    <ul>
        <li>
            <em>"area"</em>
            |
            <em>"areaStacked"</em>
            |
            <em>"areaStackedPercent"</em>
            |
            <em>"bar"</em>
            |
            <em>"bar3D"</em>
            |
            <em>"barStacked"</em>
            |
            <em>"barStacked3D"</em>
            |
            <em>"barStackedPercent"</em>
            |
            <em>"barStackedPercent3D"</em>
            |
            <em>"barStackedPercent3DPerspective"</em>
            |
            <em>"doughnut"</em>
            |
            <em>"horizontalBar"</em>
            |
            <em>"horizontalBar3D"</em>
            |
            <em>"horizontalBarStacked"</em>
            |
            <em>"horizontalBarStacked3D"</em>
            |
            <em>"horizontalBarStackedPercent"</em>
            |
            <em>"horizontalBarStackedPercent3D"</em>
            |
            <em>"line3D"</em>
            |
            <em>"lineNormal"</em>
            |
            <em>"lineStacked"</em>
            |
            <em>"lineStackedPercent"</em>
            |
            <em>"pie"</em>
            |
            <em>"pie3D"</em>
            |
            <em>"scatter"</em>
            |
            <em>"stock"</em>
        </li>
    </ul>
    </div>
    <h5>Examples</h5>
    <p class="code-caption">ChartType used in text documents</p>
    <pre>// The resulting chart will have a 'bar3D' type:
oDrawing = Api.CreateChart("bar3D", [[200, 240, 280],[250, 260, 280]], ["Projected Revenue", "Estimated Costs"], [2014, 2015, 2016], 4051300, 2347595, 24);</pre>
    <p class="code-caption">ChartType used in spreadsheets</p>
    <pre>// The resulting chart will have a 'bar' type:
oWorksheet.AddChart("'sheet 1'!$A$1:$D$5", true, "bar", 2, 2, 10, 7, 20);</pre>
    </div>

    <div class="global-type-definitions">
    <span class="anchor-position" id="DocumentElement">&nbsp;</span>
    <h4 class="header-gray">DocumentElement</h4>    
    <p>Any valid element which can be added to the document structure.</p>
    <div class="global-list">
    <h5>Type:</h5>
    <ul>
        <li>
            <em><a href="<%= Url.Action("textdocumentapi/apiparagraph") %>">ApiParagraph</a></em>
            |
            <em><a href="<%= Url.Action("textdocumentapi/apitable") %>">ApiTable</a></em>
        </li>
    </ul>
    </div>
    <h5>Example</h5>
    <pre>// Add a document element called 'paragraph' to the document:
oDocument.AddElement(oParagraph);</pre>
    </div>

    <div class="global-type-definitions">
    <span class="anchor-position" id="EMU">&nbsp;</span>
    <h4 class="header-gray">EMU</h4>    
    <p>English measure unit. 1 mm = 36000 EMUs, 1 inch = 914400 EMUs</p>
    <div class="global-list">
    <h5>Type:</h5>
    <ul>
        <li>
            <em>number</em>
        </li>
    </ul>
    </div>
    <h5>Example</h5>
    <pre>// Set the size of the drawing to be created as 100 mm (10 cm) in width and 100 mm (10 cm) in height:
oDrawing.SetSize(100 * 36000, 100 * 36000);</pre>
    </div>

    <div class="global-type-definitions">
    <span class="anchor-position" id="HdrFtrType">&nbsp;</span>
    <h4 class="header-gray">HdrFtrType</h4>    
    <p>Header and footer types which can be applied to the document sections.</p>
        <ul>
            <li><b>"default"</b> - a header or footer which can be applied to any default page.</li>
            <li><b>"title"</b> - a header or footer which is applied to the title page.</li>
            <li><b>"even"</b> - a header or footer which can be applied to even pages to distinguish them from the odd ones (which will be considered default).</li>
        </ul>
    <div class="global-list">
    <h5>Type:</h5>
    <ul>
        <li>
            <em>"default"</em>
            |
            <em>"title"</em>
            |
            <em>"even"</em>
        </li>
    </ul>
    </div>
    <h5>Example</h5>
    <pre>// Remove the header of the 'title' type from the final document section:
var oDocContent = oFinalSection.RemoveHeader("title");</pre>
    </div>

    <div class="global-type-definitions">
    <span class="anchor-position" id="hps">&nbsp;</span>
    <h4 class="header-gray">hps</h4>    
    <p>Half-points (2 half-points = 1 point).</p>
    <div class="global-list">
    <h5>Type:</h5>
    <ul>
        <li>
            <em>number</em>
        </li>
    </ul>
    </div>
    <h5>Example</h5>
    <pre>// Set the text font size to 11 points:
oTextPr.SetFontSize(22);</pre>
    </div>

    <div class="global-type-definitions">
    <span class="anchor-position" id="line240">&nbsp;</span>
    <h4 class="header-gray">line240</h4>    
    <p>240ths of a line.</p>
    <div class="global-list">
    <h5>Type:</h5>
    <ul>
        <li>
            <em>number</em>
        </li>
    </ul>
    </div>
    <h5>Example</h5>
    <pre>// The paragraph line spacing is set to 1 line:
oParaPr.SetSpacingLine(240, "auto");</pre>
    </div>

    <div class="global-type-definitions">
        <span class="anchor-position" id="LineStyle">&nbsp;</span>
        <h4 class="header-gray">LineStyle</h4>
        <p>Specifies the line style used to form the cell border.</p>
        <div class="global-list">
            <h5>Type:</h5>
            <ul>
                <li>
                    <em>"None"</em>
                    |
            <em>"Double"</em>
                    |
            <em>"Hair"</em>
                    |
            <em>"DashDotDot"</em>
                    |
            <em>"DashDot"</em>
                    |
            <em>"Dotted"</em>
                    |
            <em>"Dashed"</em>
                    |
            <em>"Thin"</em>
                    |
            <em>"MediumDashDotDot"</em>
                    |
            <em>"SlantDashDot"</em>
                    |
            <em>"MediumDashDot"</em>
                    |
            <em>"MediumDashed"</em>
                    |
            <em>"Medium"</em>
                    |
            <em>"Thick"</em>
                </li>
            </ul>
        </div>
        <h5>Example</h5>
        <pre>// The cell will have a bottom black dotted border:
oWorksheet.GetRange("E2").SetBorders("Bottom", "Dotted", Api.CreateColorFromRGB(0, 0, 0));</pre>
    </div>

    <div class="global-type-definitions">
    <span class="anchor-position" id="ParagraphContent">&nbsp;</span>
    <h4 class="header-gray">ParagraphContent</h4>    
    <p>The types of elements that can be added to the paragraph structure.</p>
    <div class="global-list">
    <h5>Type:</h5>
    <ul>
        <li>
            <em><a href="<%= Url.Action("textdocumentapi/apiunsupported") %>">ApiUnsupported</a></em>
            |
            <em><a href="<%= Url.Action("textdocumentapi/apirun") %>">ApiRun</a></em>
        </li>
    </ul>
    </div>
    <h5>Example</h5>
    <pre>// Add an element called 'text run' to the paragraph:
oParagraph.AddElement(oRun,0);</pre>
    </div>

    <div class="global-type-definitions">
    <span class="anchor-position" id="PatternType">&nbsp;</span>
    <h4 class="header-gray">PatternType</h4>    
    <p>The available preset patterns which can be used for the fill.</p>
    <div class="global-list">
    <h5>Type:</h5>
    <ul>
        <li>
            <em>"cross"</em>
            |
            <em>"dashDnDiag"</em>
            |
            <em>"dashHorz"</em>
            |
            <em>"dashUpDiag"</em>
            |
            <em>"dashVert"</em>
            |
            <em>"diagBrick"</em>
            |
            <em>"diagCross"</em>
            |
            <em>"divot"</em>
            |
            <em>"dkDnDiag"</em>
            |
            <em>"dkHorz"</em>
            |
            <em>"dkUpDiag"</em>
            |
            <em>"dkVert"</em>
            |
            <em>"dnDiag"</em>
            |
            <em>"dotDmnd"</em>
            |
            <em>"dotGrid"</em>
            |
            <em>"horz"</em>
            |
            <em>"horzBrick"</em>
            |
            <em>"lgCheck"</em>
            |
            <em>"lgConfetti"</em>
            |
            <em>"lgGrid"</em>
            |
            <em>"ltDnDiag"</em>
            |
            <em>"ltHorz"</em>
            |
            <em>"ltUpDiag"</em>
            |
            <em>"ltVert"</em>
            |
            <em>"narHorz"</em>
            |
            <em>"narVert"</em>
            |
            <em>"openDmnd"</em>
            |
            <em>"pct10"</em>
            |
            <em>"pct20"</em>
            |
            <em>"pct25"</em>
            |
            <em>"pct30"</em>
            |
            <em>"pct40"</em>
            |
            <em>"pct5"</em>
            |
            <em>"pct50"</em>
            |
            <em>"pct60"</em>
            |
            <em>"pct70"</em>
            |
            <em>"pct75"</em>
            |
            <em>"pct80"</em>
            |
            <em>"pct90"</em>
            |
            <em>"plaid"</em>
            |
            <em>"shingle"</em>
            |
            <em>"smCheck"</em>
            |
            <em>"smConfetti"</em>
            |
            <em>"smGrid"</em>
            |
            <em>"solidDmnd"</em>
            |
            <em>"sphere"</em>
            |
            <em>"trellis"</em>
            |
            <em>"upDiag"</em>
            |
            <em>"vert"</em>
            |
            <em>"wave"</em>
            |
            <em>"wdDnDiag"</em>
            |
            <em>"wdUpDiag"</em>
            |
            <em>"weave"</em>
            |
            <em>"zigZag"</em>
        </li>
    </ul>
    </div>
    <h5>Example</h5>
    <pre>// Create a fill with a 'dashDnDiag' pattern which has two colors - green and red:
oFill = Api.CreatePatternFill("dashDnDiag", Api.CreateRGBColor(0, 225, 0), Api.CreateRGBColor(255, 0, 0));</pre>
    </div>

    <div class="global-type-definitions">
    <span class="anchor-position" id="PositiveFixedAngle">&nbsp;</span>
    <h4 class="header-gray">PositiveFixedAngle</h4>    
    <p>A 60000th of a degree (5400000 = 90 degrees).</p>
    <div class="global-list">
    <h5>Type:</h5>
    <ul>
        <li>
            <em>number</em>
        </li>
    </ul>
    </div>
    <h5>Example</h5>
    <pre>// The resulting gradient direction angle is 90 degrees:
oFill = Api.CreateLinearGradientFill([oGs1, oGs2], 5400000);</pre>
    </div>

    <div class="global-type-definitions">
    <span class="anchor-position" id="PositivePercentage">&nbsp;</span>
    <h4 class="header-gray">PositivePercentage</h4>    
    <p>The 1000th of a percent (100000 = 100%).</p>
    <div class="global-list">
    <h5>Type:</h5>
    <ul>
        <li>
            <em>number</em>
        </li>
    </ul>
    </div>
    <h5>Example</h5>
    <pre>// The resulting gradient stop position is 100%:
var oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 164, 101), 100000);</pre>
    </div>

    <div class="global-type-definitions">
    <span class="anchor-position" id="PresetColor">&nbsp;</span>
    <h4 class="header-gray">PresetColor</h4>    
    <p>The available preset color names.</p>
    <div class="global-list">
    <h5>Type:</h5>
    <ul>
        <li>
            <em>"aliceBlue"</em>
            |
            <em>"antiqueWhite"</em>
            |
            <em>"aqua"</em>
            |
            <em>"aquamarine"</em>
            |
            <em>"azure"</em>
            |
            <em>"beige"</em>
            |
            <em>"bisque"</em>
            |
            <em>"black"</em>
            |
            <em>"blanchedAlmond"</em>
            |
            <em>"blue"</em>
            |
            <em>"blueViolet"</em>
            |
            <em>"brown"</em>
            |
            <em>"burlyWood"</em>
            |
            <em>"cadetBlue"</em>
            |
            <em>"chartreuse"</em>
            |
            <em>"chocolate"</em>
            |
            <em>"coral"</em>
            |
            <em>"cornflowerBlue"</em>
            |
            <em>"cornsilk"</em>
            |
            <em>"crimson"</em>
            |
            <em>"cyan"</em>
            |
            <em>"darkBlue"</em>
            |
            <em>"darkCyan"</em>
            |
            <em>"darkGoldenrod"</em>
            |
            <em>"darkGray"</em>
            |
            <em>"darkGreen"</em>
            |
            <em>"darkGrey"</em>
            |
            <em>"darkKhaki"</em>
            |
            <em>"darkMagenta"</em>
            |
            <em>"darkOliveGreen"</em>
            |
            <em>"darkOrange"</em>
            |
            <em>"darkOrchid"</em>
            |
            <em>"darkRed"</em>
            |
            <em>"darkSalmon"</em>
            |
            <em>"darkSeaGreen"</em>
            |
            <em>"darkSlateBlue"</em>
            |
            <em>"darkSlateGray"</em>
            |
            <em>"darkSlateGrey"</em>
            |
            <em>"darkTurquoise"</em>
            |
            <em>"darkViolet"</em>
            |
            <em>"deepPink"</em>
            |
            <em>"deepSkyBlue"</em>
            |
            <em>"dimGray"</em>
            |
            <em>"dimGrey"</em>
            |
            <em>"dkBlue"</em>
            |
            <em>"dkCyan"</em>
            |
            <em>"dkGoldenrod"</em>
            |
            <em>"dkGray"</em>
            |
            <em>"dkGreen"</em>
            |
            <em>"dkGrey"</em>
            |
            <em>"dkKhaki"</em>
            |
            <em>"dkMagenta"</em>
            |
            <em>"dkOliveGreen"</em>
            |
            <em>"dkOrange"</em>
            |
            <em>"dkOrchid"</em>
            |
            <em>"dkRed"</em>
            |
            <em>"dkSalmon"</em>
            |
            <em>"dkSeaGreen"</em>
            |
            <em>"dkSlateBlue"</em>
            |
            <em>"dkSlateGray"</em>
            |
            <em>"dkSlateGrey"</em>
            |
            <em>"dkTurquoise"</em>
            |
            <em>"dkViolet"</em>
            |
            <em>"dodgerBlue"</em>
            |
            <em>"firebrick"</em>
            |
            <em>"floralWhite"</em>
            |
            <em>"forestGreen"</em>
            |
            <em>"fuchsia"</em>
            |
            <em>"gainsboro"</em>
            |
            <em>"ghostWhite"</em>
            |
            <em>"gold"</em>
            |
            <em>"goldenrod"</em>
            |
            <em>"gray"</em>
            |
            <em>"green"</em>
            |
            <em>"greenYellow"</em>
            |
            <em>"grey"</em>
            |
            <em>"honeydew"</em>
            |
            <em>"hotPink"</em>
            |
            <em>"indianRed"</em>
            |
            <em>"indigo"</em>
            |
            <em>"ivory"</em>
            |
            <em>"khaki"</em>
            |
            <em>"lavender"</em>
            |
            <em>"lavenderBlush"</em>
            |
            <em>"lawnGreen"</em>
            |
            <em>"lemonChiffon"</em>
            |
            <em>"lightBlue"</em>
            |
            <em>"lightCoral"</em>
            |
            <em>"lightCyan"</em>
            |
            <em>"lightGoldenrodYellow"</em>
            |
            <em>"lightGray"</em>
            |
            <em>"lightGreen"</em>
            |
            <em>"lightGrey"</em>
            |
            <em>"lightPink"</em>
            |
            <em>"lightSalmon"</em>
            |
            <em>"lightSeaGreen"</em>
            |
            <em>"lightSkyBlue"</em>
            |
            <em>"lightSlateGray"</em>
            |
            <em>"lightSlateGrey"</em>
            |
            <em>"lightSteelBlue"</em>
            |
            <em>"lightYellow"</em>
            |
            <em>"lime"</em>
            |
            <em>"limeGreen"</em>
            |
            <em>"linen"</em>
            |
            <em>"ltBlue"</em>
            |
            <em>"ltCoral"</em>
            |
            <em>"ltCyan"</em>
            |
            <em>"ltGoldenrodYellow"</em>
            |
            <em>"ltGray"</em>
            |
            <em>"ltGreen"</em>
            |
            <em>"ltGrey"</em>
            |
            <em>"ltPink"</em>
            |
            <em>"ltSalmon"</em>
            |
            <em>"ltSeaGreen"</em>
            |
            <em>"ltSkyBlue"</em>
            |
            <em>"ltSlateGray"</em>
            |
            <em>"ltSlateGrey"</em>
            |
            <em>"ltSteelBlue"</em>
            |
            <em>"ltYellow"</em>
            |
            <em>"magenta"</em>
            |
            <em>"maroon"</em>
            |
            <em>"medAquamarine"</em>
            |
            <em>"medBlue"</em>
            |
            <em>"mediumAquamarine"</em>
            |
            <em>"mediumBlue"</em>
            |
            <em>"mediumOrchid"</em>
            |
            <em>"mediumPurple"</em>
            |
            <em>"mediumSeaGreen"</em>
            |
            <em>"mediumSlateBlue"</em>
            |
            <em>"mediumSpringGreen"</em>
            |
            <em>"mediumTurquoise"</em>
            |
            <em>"mediumVioletRed"</em>
            |
            <em>"medOrchid"</em>
            |
            <em>"medPurple"</em>
            |
            <em>"medSeaGreen"</em>
            |
            <em>"medSlateBlue"</em>
            |
            <em>"medSpringGreen"</em>
            |
            <em>"medTurquoise"</em>
            |
            <em>"medVioletRed"</em>
            |
            <em>"midnightBlue"</em>
            |
            <em>"mintCream"</em>
            |
            <em>"mistyRose"</em>
            |
            <em>"moccasin"</em>
            |
            <em>"navajoWhite"</em>
            |
            <em>"navy"</em>
            |
            <em>"oldLace"</em>
            |
            <em>"olive"</em>
            |
            <em>"oliveDrab"</em>
            |
            <em>"orange"</em>
            |
            <em>"orangeRed"</em>
            |
            <em>"orchid"</em>
            |
            <em>"paleGoldenrod"</em>
            |
            <em>"paleGreen"</em>
            |
            <em>"paleTurquoise"</em>
            |
            <em>"paleVioletRed"</em>
            |
            <em>"papayaWhip"</em>
            |
            <em>"peachPuff"</em>
            |
            <em>"peru"</em>
            |
            <em>"pink"</em>
            |
            <em>"plum"</em>
            |
            <em>"powderBlue"</em>
            |
            <em>"purple"</em>
            |
            <em>"red"</em>
            |
            <em>"rosyBrown"</em>
            |
            <em>"royalBlue"</em>
            |
            <em>"saddleBrown"</em>
            |
            <em>"salmon"</em>
            |
            <em>"sandyBrown"</em>
            |
            <em>"seaGreen"</em>
            |
            <em>"seaShell"</em>
            |
            <em>"sienna"</em>
            |
            <em>"silver"</em>
            |
            <em>"skyBlue"</em>
            |
            <em>"slateBlue"</em>
            |
            <em>"slateGray"</em>
            |
            <em>"slateGrey"</em>
            |
            <em>"snow"</em>
            |
            <em>"springGreen"</em>
            |
            <em>"steelBlue"</em>
            |
            <em>"tan"</em>
            |
            <em>"teal"</em>
            |
            <em>"thistle"</em>
            |
            <em>"tomato"</em>
            |
            <em>"turquoise"</em>
            |
            <em>"violet"</em>
            |
            <em>"wheat"</em>
            |
            <em>"white"</em>
            |
            <em>"whiteSmoke"</em>
            |
            <em>"yellow"</em>
            |
            <em>"yellowGreen"</em>
        </li>
    </ul>
    </div>
    <h5>Example</h5>
    <pre>// Create a scheme color using the 'lightYellow' color preset:
oSchemeColor = Api.CreatePresetColor("lightYellow");</pre>
    </div>

    <div class="global-type-definitions">
    <span class="anchor-position" id="pt">&nbsp;</span>
    <h4 class="header-gray">pt</h4>    
    <p>A point.</p>
    <div class="global-list">
    <h5>Type:</h5>
    <ul>
        <li>
            <em>number</em>
        </li>
    </ul>
    </div>
    <h5>Example</h5>
    <pre>// The paragraph will have a single 3 point wide green bottom border with a 1 point offset from the bottom paragraph edge:
oParaPr.SetBottomBorder("single", 24, 1, 0, 255, 0);</pre>
    </div>

    <div class="global-type-definitions">
    <span class="anchor-position" id="pt_8">&nbsp;</span>
    <h4 class="header-gray">pt_8</h4>    
    <p>Eighths of a point (24 eighths of a point = 3 points).</p>
    <div class="global-list">
    <h5>Type:</h5>
    <ul>
        <li>
            <em>number</em>
        </li>
    </ul>
    </div>
    <h5>Example</h5>
    <pre>// The paragraph will have a single 6 point wide green bottom border with a zero offset from the bottom paragraph edge:
oParaPr.SetBottomBorder("single", 48, 0, 0, 255, 0);</pre>
    </div>

    <div class="global-type-definitions">
    <span class="anchor-position" id="RelFromH">&nbsp;</span>
    <h4 class="header-gray">RelFromH</h4>    
    <p>The possible values for the base which the relative horizontal positioning of an object will be calculated from.</p>
    <div class="global-list">
    <h5>Type:</h5>
    <ul>
        <li>
            <em>"character"</em>
            |
            <em>"column"</em>
            |
            <em>"leftMargin"</em>
            |
            <em>"rightMargin"</em>
            |
            <em>"margin"</em>
            |
            <em>"page"</em>
        </li>
    </ul>
    </div>
    <h5>Example</h5>
    <pre>// The created drawing will be centered horizontally relative to the page width:
oDrawing.SetHorAlign("page", "center");</pre>
    </div>

    <div class="global-type-definitions">
    <span class="anchor-position" id="RelFromV">&nbsp;</span>
    <h4 class="header-gray">RelFromV</h4>    
    <p>The possible values for the base which the relative vertical positioning of an object will be calculated from.</p>
    <div class="global-list">
    <h5>Type:</h5>
    <ul>
        <li>
            <em>"bottomMargin"</em>
            |
            <em>"topMargin"</em>
            |
            <em>"margin"</em>
            |
            <em>"page"</em>
            |
            <em>"line"</em>
            |
            <em>"paragraph"</em>
        </li>
    </ul>
    </div>
    <h5>Example</h5>
    <pre>// The created drawing will be centered vertically relative to the paragraph height:
oDrawing.SetHorAlign("paragraph", "center");</pre>
    </div>

    <div class="global-type-definitions">
    <span class="anchor-position" id="SchemeColorId">&nbsp;</span>
    <h4 class="header-gray">SchemeColorId</h4>    
    <p>The available color scheme identifiers.</p>
    <div class="global-list">
    <h5>Type:</h5>
    <ul>
        <li>
            <em>"accent1"</em>
            |
            <em>"accent2"</em>
            |
            <em>"accent3"</em>
            |
            <em>"accent4"</em>
            |
            <em>"accent5"</em>
            |
            <em>"accent6"</em>
            |
            <em>"bg1"</em>
            |
            <em>"bg2"</em>
            |
            <em>"dk1"</em>
            |
            <em>"dk2"</em>
            |
            <em>"lt1"</em>
            |
            <em>"lt2"</em>
            |
            <em>"tx1"</em>
            |
            <em>"tx2"</em>
        </li>
    </ul>
    </div>
    <h5>Example</h5>
    <pre>// Create a scheme color with the 'accent2' identifier:
oSchemeColor = Api.CreateSchemeColor("accent2");</pre>
    </div>

    <div class="global-type-definitions">
    <span class="anchor-position" id="ShapeType">&nbsp;</span>
    <h4 class="header-gray">ShapeType</h4>    
    <p>This type specifies the preset shape geometry that will be used for a shape.</p>
    <div class="global-list">
    <h5>Type:</h5>
    <ul>
        <li>
            <em>"accentBorderCallout1"</em>
            |
            <em>"accentBorderCallout2"</em>
            |
            <em>"accentBorderCallout3"</em>
            |
            <em>"accentCallout1"</em>
            |
            <em>"accentCallout2"</em>
            |
            <em>"accentCallout3"</em>
            |
            <em>"actionButtonBackPrevious"</em>
            |
            <em>"actionButtonBeginning"</em>
            |
            <em>"actionButtonBlank"</em>
            |
            <em>"actionButtonDocument"</em>
            |
            <em>"actionButtonEnd"</em>
            |
            <em>"actionButtonForwardNext"</em>
            |
            <em>"actionButtonHelp"</em>
            |
            <em>"actionButtonHome"</em>
            |
            <em>"actionButtonInformation"</em>
            |
            <em>"actionButtonMovie"</em>
            |
            <em>"actionButtonReturn"</em>
            |
            <em>"actionButtonSound"</em>
            |
            <em>"arc"</em>
            |
            <em>"bentArrow"</em>
            |
            <em>"bentConnector2"</em>
            |
            <em>"bentConnector3"</em>
            |
            <em>"bentConnector4"</em>
            |
            <em>"bentConnector5"</em>
            |
            <em>"bentUpArrow"</em>
            |
            <em>"bevel"</em>
            |
            <em>"blockArc"</em>
            |
            <em>"borderCallout1"</em>
            |
            <em>"borderCallout2"</em>
            |
            <em>"borderCallout3"</em>
            |
            <em>"bracePair"</em>
            |
            <em>"bracketPair"</em>
            |
            <em>"callout1"</em>
            |
            <em>"callout2"</em>
            |
            <em>"callout3"</em>
            |
            <em>"can"</em>
            |
            <em>"chartPlus"</em>
            |
            <em>"chartStar"</em>
            |
            <em>"chartX"</em>
            |
            <em>"chevron"</em>
            |
            <em>"chord"</em>
            |
            <em>"circularArrow"</em>
            |
            <em>"cloud"</em>
            |
            <em>"cloudCallout"</em>
            |
            <em>"corner"</em>
            |
            <em>"cornerTabs"</em>
            |
            <em>"cube"</em>
            |
            <em>"curvedConnector2"</em>
            |
            <em>"curvedConnector3"</em>
            |
            <em>"curvedConnector4"</em>
            |
            <em>"curvedConnector5"</em>
            |
            <em>"curvedDownArrow"</em>
            |
            <em>"curvedLeftArrow"</em>
            |
            <em>"curvedRightArrow"</em>
            |
            <em>"curvedUpArrow"</em>
            |
            <em>"decagon"</em>
            |
            <em>"diagStripe"</em>
            |
            <em>"diamond"</em>
            |
            <em>"dodecagon"</em>
            |
            <em>"donut"</em>
            |
            <em>"doubleWave"</em>
            |
            <em>"downArrow"</em>
            |
            <em>"downArrowCallout"</em>
            |
            <em>"ellipse"</em>
            |
            <em>"ellipseRibbon"</em>
            |
            <em>"ellipseRibbon2"</em>
            |
            <em>"flowChartAlternateProcess"</em>
            |
            <em>"flowChartCollate"</em>
            |
            <em>"flowChartConnector"</em>
            |
            <em>"flowChartDecision"</em>
            |
            <em>"flowChartDelay"</em>
            |
            <em>"flowChartDisplay"</em>
            |
            <em>"flowChartDocument"</em>
            |
            <em>"flowChartExtract"</em>
            |
            <em>"flowChartInputOutput"</em>
            |
            <em>"flowChartInternalStorage"</em>
            |
            <em>"flowChartMagneticDisk"</em>
            |
            <em>"flowChartMagneticDrum"</em>
            |
            <em>"flowChartMagneticTape"</em>
            |
            <em>"flowChartManualInput"</em>
            |
            <em>"flowChartManualOperation"</em>
            |
            <em>"flowChartMerge"</em>
            |
            <em>"flowChartMultidocument"</em>
            |
            <em>"flowChartOfflineStorage"</em>
            |
            <em>"flowChartOffpageConnector"</em>
            |
            <em>"flowChartOnlineStorage"</em>
            |
            <em>"flowChartOr"</em>
            |
            <em>"flowChartPredefinedProcess"</em>
            |
            <em>"flowChartPreparation"</em>
            |
            <em>"flowChartProcess"</em>
            |
            <em>"flowChartPunchedCard"</em>
            |
            <em>"flowChartPunchedTape"</em>
            |
            <em>"flowChartSort"</em>
            |
            <em>"flowChartSummingJunction"</em>
            |
            <em>"flowChartTerminator"</em>
            |
            <em>"foldedCorner"</em>
            |
            <em>"frame"</em>
            |
            <em>"funnel"</em>
            |
            <em>"gear6"</em>
            |
            <em>"gear9"</em>
            |
            <em>"halfFrame"</em>
            |
            <em>"heart"</em>
            |
            <em>"heptagon"</em>
            |
            <em>"hexagon"</em>
            |
            <em>"homePlate"</em>
            |
            <em>"horizontalScroll"</em>
            |
            <em>"irregularSeal1"</em>
            |
            <em>"irregularSeal2"</em>
            |
            <em>"leftArrow"</em>
            |
            <em>"leftArrowCallout"</em>
            |
            <em>"leftBrace"</em>
            |
            <em>"leftBracket"</em>
            |
            <em>"leftCircularArrow"</em>
            |
            <em>"leftRightArrow"</em>
            |
            <em>"leftRightArrowCallout"</em>
            |
            <em>"leftRightCircularArrow"</em>
            |
            <em>"leftRightRibbon"</em>
            |
            <em>"leftRightUpArrow"</em>
            |
            <em>"leftUpArrow"</em>
            |
            <em>"lightningBolt"</em>
            |
            <em>"line"</em>
            |
            <em>"lineInv"</em>
            |
            <em>"mathDivide"</em>
            |
            <em>"mathEqual"</em>
            |
            <em>"mathMinus"</em>
            |
            <em>"mathMultiply"</em>
            |
            <em>"mathNotEqual"</em>
            |
            <em>"mathPlus"</em>
            |
            <em>"moon"</em>
            |
            <em>"nonIsoscelesTrapezoid"</em>
            |
            <em>"noSmoking"</em>
            |
            <em>"notchedRightArrow"</em>
            |
            <em>"octagon"</em>
            |
            <em>"parallelogram"</em>
            |
            <em>"pentagon"</em>
            |
            <em>"pie"</em>
            |
            <em>"pieWedge"</em>
            |
            <em>"plaque"</em>
            |
            <em>"plaqueTabs"</em>
            |
            <em>"plus"</em>
            |
            <em>"quadArrow"</em>
            |
            <em>"quadArrowCallout"</em>
            |
            <em>"rect"</em>
            |
            <em>"ribbon"</em>
            |
            <em>"ribbon2"</em>
            |
            <em>"rightArrow"</em>
            |
            <em>"rightArrowCallout"</em>
            |
            <em>"rightBrace"</em>
            |
            <em>"rightBracket"</em>
            |
            <em>"round1Rect"</em>
            |
            <em>"round2DiagRect"</em>
            |
            <em>"round2SameRect"</em>
            |
            <em>"roundRect"</em>
            |
            <em>"rtTriangle"</em>
            |
            <em>"smileyFace"</em>
            |
            <em>"snip1Rect"</em>
            |
            <em>"snip2DiagRect"</em>
            |
            <em>"snip2SameRect"</em>
            |
            <em>"snipRoundRect"</em>
            |
            <em>"squareTabs"</em>
            |
            <em>"star10"</em>
            |
            <em>"star12"</em>
            |
            <em>"star16"</em>
            |
            <em>"star24"</em>
            |
            <em>"star32"</em>
            |
            <em>"star4"</em>
            |
            <em>"star5"</em>
            |
            <em>"star6"</em>
            |
            <em>"star7"</em>
            |
            <em>"star8"</em>
            |
            <em>"straightConnector1"</em>
            |
            <em>"stripedRightArrow"</em>
            |
            <em>"sun"</em>
            |
            <em>"swooshArrow"</em>
            |
            <em>"teardrop"</em>
            |
            <em>"trapezoid"</em>
            |
            <em>"triangle"</em>
            |
            <em>"upArrowCallout"</em>
            |
            <em>"upDownArrow"</em>
            |
            <em>"upDownArrow"</em>
            |
            <em>"upDownArrowCallout"</em>
            |
            <em>"uturnArrow"</em>
            |
            <em>"verticalScroll"</em>
            |
            <em>"wave"</em>
            |
            <em>"wedgeEllipseCallout"</em>
            |
            <em>"wedgeRectCallout"</em>
            |
            <em>"wedgeRoundRectCallout"</em>
        </li>
    </ul>
    </div>
    <h5>Example</h5>
    <pre>// Create a shape using the 'diamond' preset:
oDrawing = Api.CreateShape("diamond", 100 * 36000, 100 * 36000, oFill, oStroke);</pre>
    </div>

    <div class="global-type-definitions">
    <span class="anchor-position" id="ShdType">&nbsp;</span>
    <h4 class="header-gray">ShdType</h4>    
    <p>A shade type which can be added to the document element.</p>
    <div class="global-list">
    <h5>Type:</h5>
    <ul>
        <li>
            <em>"nil"</em>
            |
            <em>"clear"</em>
        </li>
    </ul>
    </div>
    <h5>Example</h5>
    <pre>// Add a green shadow to the table:
oTablePr.SetShd("clear", 0, 255, 0, false);</pre>
    </div>

    <div class="global-type-definitions">
    <span class="anchor-position" id="StyleType">&nbsp;</span>
    <h4 class="header-gray">StyleType</h4>    
    <p>The style type used for the document element.</p>
    <div class="global-list">
    <h5>Type:</h5>
    <ul>
        <li>
            <em>"paragraph"</em>
            |
            <em>"table"</em>
            |
            <em>"run"</em>
            |
            <em>"numbering"</em>
        </li>
    </ul>
    </div>
    <h5>Example</h5>
    <pre>// Assign the default document paragraph style to the 'oNormalStyle' variable:
var oNormalStyle = oDocument.GetDefaultStyle("paragraph");</pre>
    </div>

    <div class="global-type-definitions">
    <span class="anchor-position" id="TabJc">&nbsp;</span>
    <h4 class="header-gray">TabJc</h4>
    <p>Types of custom tab.</p>
    <div class="global-list">
    <h5>Type:</h5>
    <ul>
        <li>
            <em>"clear"</em>
            |
            <em>"left"</em>
            |
            <em>"right"</em>
            |
            <em>"center"</em>
        </li>
    </ul>
    </div>
    <h5>Example</h5>
    <pre>// Set tab positions at 50, 75 and 150 points with the text aligned center, left and right at each tab stop accordingly:
oParaPr.SetTabs([1000, 1500, 3000], ["center", "left", "right"]);</pre>
    </div>

    <div class="global-type-definitions">
    <span class="anchor-position" id="TableStyleOverrideType">&nbsp;</span>
    <h4 class="header-gray">TableStyleOverrideType</h4>
    <p>This simple type specifies possible values for the table sections to which the current conditional
formatting properties will be applied when this selected table style is used.</p>
        <ul>
            <li><b>"topLeftCell"</b> - specifies that the table formatting applies to the top left cell.</li>
            <li><b>"topRightCell"</b> - specifies that the table formatting applies to the top right cell.</li>
            <li><b>"bottomLeftCell"</b> - specifies that the table formatting applies to the bottom left cell.</li>
            <li><b>"bottomRightCell"</b> - specifies that the table formatting applies to the bottom right cell.</li>
            <li><b>"firstRow"</b> - specifies that the table formatting applies to the first row.</li>
            <li><b>"lastRow"</b> - specifies that the table formatting applies to the last row.</li>
            <li><b>"firstColumn"</b> - specifies that the table formatting applies to the first column. Any subsequent row which is in <i>table header</i> <em><a href="<%= Url.Action("textdocumentapi/apitablerowpr/settableheader") %>">ApiTableRowPr.SetTableHeader</a></em> will also use this conditional format.</li>
            <li><b>"lastColumn"</b> - specifies that the table formatting applies to the last column.</li>
            <li><b>"bandedColumn"</b> - specifies that the table formatting applies to odd numbered groupings of rows.</li>
            <li><b>"bandedColumnEven"</b> - specifies that the table formatting applies to even numbered groupings of rows.</li>
            <li><b>"bandedRow"</b> - specifies that the table formatting applies to odd numbered groupings of columns.</li>
            <li><b>"bandedRowEven"</b> - specifies that the table formatting applies to even numbered groupings of columns.</li>
            <li><b>"wholeTable"</b> - specifies that the conditional formatting applies to the whole table.</li>
        </ul>
    <div class="global-list">
    <h5>Type:</h5>
    <ul>
        <li>
            <em>"topLeftCell"</em>
            |
            <em>"topRightCell"</em>
            |
            <em>"bottomLeftCell"</em>
            |
            <em>"bottomRightCell"</em>
            |
            <em>"firstRow"</em>
            |
            <em>"lastRow"</em>
            |
            <em>"firstColumn"</em>
            |
            <em>"lastColumn"</em>
            |
            <em>"bandedColumn"</em>
            |
            <em>"bandedColumnEven"</em>
            |
            <em>"bandedRow"</em>
            |
            <em>"bandedRowEven"</em>
            |
            <em>"wholeTable"</em>
        </li>
    </ul>
    </div>
    <h5>Example</h5>
    <pre>// Apply the created style (set shadow) to the top left cell of the table:
oTableStyle.GetConditionalTableStyle("topLeftCell").GetTableCellPr().SetShd("clear", 255, 0, 0);</pre>
    </div>

    <div class="global-type-definitions">
    <span class="anchor-position" id="TableWidth">&nbsp;</span>
    <h4 class="header-gray">TableWidth</h4>    
    <p>The possible values for the units of the width property are defined by a specific table or table cell width property.</p>
        <ul>
            <li><b>"auto"</b> - set the table or table cell width to auto width.</li>
            <li><b>"twips"</b> - set the table or table cell width to be measured in twentieths of a point.</li>
            <li><b>"nul"</b> - set the table or table cell width to be of a zero value.</li>
            <li><b>"percent"</b> - set the table or table cell width to be measured in percent to the parent container.</li>
        </ul>
    <div class="global-list">
    <h5>Type:</h5>
    <ul>
        <li>
            <em>"auto"</em>
            |
            <em>"twips"</em>
            |
            <em>"nul"</em>
            |
            <em>"percent"</em>
        </li>
    </ul>
    </div>
    <h5>Example</h5>
    <pre>// Set the width of the table cell equal to 100 points (2000 twips):
oTableCell.SetWidth("twips", 2000);</pre>
    </div>

    <div class="global-type-definitions">
        <span class="anchor-position" id="TickLabelPosition">&nbsp;</span>
        <h4 class="header-gray">TickLabelPosition</h4>
        <p>Possible values for the position of chart tick labels (either horizontal or vertical).</p>
        <ul>
            <li><b>"none"</b> - not display the selected tick labels.</li>
            <li><b>"nextTo"</b> - set the position of the selected tick labels next to the main label.</li>
            <li><b>"low"</b> - set the position of the selected tick labels in the part of the chart with lower values.</li>
            <li><b>"high"</b> - set the position of the selected tick labels in the part of the chart with higher values.</li>
        </ul>
        <div class="global-list">
            <h5>Type:</h5>
            <ul>
                <li>
                    <em>"none"</em>
                    |
            <em>"nextTo"</em>
                    |
            <em>"low"</em>
                    |
            <em>"high"</em>
                </li>
            </ul>
        </div>
        <h5>Example</h5>
        <pre>// Set the position of the vertical tick labels next to the main vertical label:
oChart.SetVertAxisTickLabelPosition("nextTo");</pre>
    </div>

    <div class="global-type-definitions">
    <span class="anchor-position" id="twips">&nbsp;</span>
    <h4 class="header-gray">twips</h4>    
    <p>Twentieths of a point (equivalent to 1/1440th of an inch).</p>
    <div class="global-list">
    <h5>Type:</h5>
    <ul>
        <li>
            <em>number</em>
        </li>
    </ul>
    </div>
    <h5>Example</h5>
    <pre>// Set the distance between columns equal to 36 points:
oParagraph.SetEqualColumns(2, 720);</pre>
    </div>

    <div class="global-type-definitions">
    <span class="anchor-position" id="VerticalTextAlign">&nbsp;</span>
    <h4 class="header-gray">VerticalTextAlign</h4>    
    <p>The available text vertical alignment (used to align text in a shape with a placement for text inside it).</p>
    <div class="global-list">
    <h5>Type:</h5>
    <ul>
        <li>
            <em>"top"</em>
            |
            <em>"center"</em>
            |
            <em>"bottom"</em>
        </li>
    </ul>
    </div>
    <h5>Example</h5>
    <pre>// The inner text for the created shape will be added aligned vertically closer to the shape upper part:
oDrawing.SetVerticalTextAlign("top");</pre>
    </div>
</asp:Content>
