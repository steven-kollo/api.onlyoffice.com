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

    <p class="dscr"></p>

        <h4 class="name" id="BlipFillType">BlipFillType</h4>
    <dl class="details">
    </dl>
    <div class="builder_description">
        The type of a fill which uses an image as a background.
        <ul>
            <li><b>"tile"</b> - if the image is smaller than the shaped which is filled, the image will be tiled all over the created shape surface.</li>
            <li><b>"stretch"</b> - if the image is smaller than the shape which is filled, the image will be stretched to fit the created shape surface.</li>
        </ul>
    </div>
    <h5>Type:</h5>
    <ul>
        <li>
            <span class="param-type">"tile"</span>
            |
            <span class="param-type">"stretch"</span>
        </li>
    </ul>
    <h5>Example</h5>
    <pre class="prettyprint source linenums"><code>// Create a blip fill with an image which is tiled all over the created shape:oFill = Api.CreateBlipFill("http://mywebsite.com/myimage.png", "tile");</code></pre>
    <h4 class="name" id="BorderType">BorderType</h4>
    <dl class="details">
    </dl>
    <div class="builder_description">
        A border type which will be added to the document element.
        <ul>
            <li><b>"none"</b> - no border will be added to the created element or the selected element side.</li>
            <li><b>"single"</b> - a single border will be added to the created element or the selected element side.</li>
        </ul>
    </div>
    <h5>Type:</h5>
    <ul>
        <li>
            <span class="param-type">"none"</span>
            |
            <span class="param-type">"single"</span>
        </li>
    </ul>
    <h5>Example</h5>
    <pre class="prettyprint source linenums"><code>// The paragraph will have a single 3 point wide green bottom border with a zero offset from the bottom paragraph edge:
oParaPr.SetBottomBorder("single", 24, 0, 0, 255, 0);</code></pre>

    <h4 class="name" id="BulletType">BulletType</h4>
    <dl class="details">
    </dl>
    <div class="builder_description">
        A bullet type which will be added to the paragraph in spreadsheet or presentation.
    </div>
    <h5>Type:</h5>
    <ul>
        <li>
            <span class="param-type">"ArabicPeriod"</span>
            |
            <span class="param-type">"ArabicParenR"</span>
            |
            <span class="param-type">"RomanUcPeriod"</span>
            |
            <span class="param-type">"RomanLcPeriod"</span>
            |
            <span class="param-type">"AlphaLcParenR"</span>
            |
            <span class="param-type">"AlphaLcPeriod"</span>
            |
            <span class="param-type">"AlphaUcParenR"</span>
            |
            <span class="param-type">"AlphaUcPeriod"</span>
            |
            <span class="param-type">"None"</span>
        </li>
    </ul>
    <h5>Example</h5>
    <pre class="prettyprint source linenums"><code>// The paragraph will be starting with the Arabic numeral which has parenthesis:
oBullet = Api.CreateNumbering("ArabicParenR");</code></pre>

    <h4 class="name" id="byte">byte</h4>
    <dl class="details">
    </dl>
    <div class="builder_description">
        A numeric value from 0 to 255.
    </div>
    <h5>Type:</h5>
    <ul>
        <li>
            <span class="param-type">number</span>
        </li>
    </ul>
    <h5>Example</h5>
    <pre class="prettyprint source linenums"><code>// The resulting color is green, the bytes are measured in decimal numbers:oRGBColor = Api.CreateRGBColor(0, 255, 0);// The resulting color is green, the bytes are measured in hexadecimal numbers:oRGBColor = Api.CreateRGBColor(0, 0xff, 0);</code></pre>
    <h4 class="name" id="ChartType">ChartType</h4>
    <dl class="details">
    </dl>
    <div class="builder_description">
        This type specifies the available chart types which can be used to create a new chart.
    </div>
    <h5>Type:</h5>
    <ul>
        <li>
            <span class="param-type">"area"</span>
            |
            <span class="param-type">"areaStacked"</span>
            |
            <span class="param-type">"areaStackedPercent"</span>
            |
            <span class="param-type">"bar"</span>
            |
            <span class="param-type">"bar3D"</span>
            |
            <span class="param-type">"barStacked"</span>
            |
            <span class="param-type">"barStacked3D"</span>
            |
            <span class="param-type">"barStackedPercent"</span>
            |
            <span class="param-type">"barStackedPercent3D"</span>
            |
            <span class="param-type">"barStackedPercent3DPerspective"</span>
            |
            <span class="param-type">"doughnut"</span>
            |
            <span class="param-type">"horizontalBar"</span>
            |
            <span class="param-type">"horizontalBar3D"</span>
            |
            <span class="param-type">"horizontalBarStacked"</span>
            |
            <span class="param-type">"horizontalBarStacked3D"</span>
            |
            <span class="param-type">"horizontalBarStackedPercent"</span>
            |
            <span class="param-type">"horizontalBarStackedPercent3D"</span>
            |
            <span class="param-type">"line3D"</span>
            |
            <span class="param-type">"lineNormal"</span>
            |
            <span class="param-type">"lineStacked"</span>
            |
            <span class="param-type">"lineStackedPercent"</span>
            |
            <span class="param-type">"pie"</span>
            |
            <span class="param-type">"pie3D"</span>
            |
            <span class="param-type">"scatter"</span>
            |
            <span class="param-type">"stock"</span>
        </li>
    </ul>
    <h5>Examples</h5>
    <p class="code-caption">ChartType used in text documents</p>
    <pre class="prettyprint source linenums"><code>// The resulting chart will have a 'bar3D' type:oDrawing = Api.CreateChart("bar3D", [[200, 240, 280],[250, 260, 280]], ["Projected Revenue", "Estimated Costs"], [2014, 2015, 2016], 4051300, 2347595, 24);</code></pre>
    <p class="code-caption">ChartType used in spreadsheets</p>
    <pre class="prettyprint source linenums"><code>// The resulting chart will have a 'bar' type:oWorksheet.AddChart("'sheet 1'!$A$1:$D$5", true, "bar", 2, 2, 10, 7, 20);</code></pre>
    <h4 class="name" id="DocumentElement">DocumentElement</h4>
    <dl class="details">
    </dl>
    <div class="builder_description">
        Any valid element which can be added to the document structure.
    </div>
    <h5>Type:</h5>
    <ul>
        <li>
            <span class="param-type"><a href="<%=VirtualPathUtility.ToAbsolute("~/developers/document-builder/ApiParagraph.aspx")%>">ApiParagraph</a></span>
            |
            <span class="param-type"><a href="<%=VirtualPathUtility.ToAbsolute("~/developers/document-builder/ApiTable.aspx")%>">ApiTable</a></span>
        </li>
    </ul>
    <h5>Example</h5>
    <pre class="prettyprint source linenums"><code>// Add a document element called 'paragraph' to the document:oDocument.AddElement(oParagraph);</code></pre>
    <h4 class="name" id="EMU">EMU</h4>
    <dl class="details">
    </dl>
    <div class="builder_description">
        English measure unit. 1 mm = 36000 EMUs, 1 inch = 914400 EMUs
    </div>
    <h5>Type:</h5>
    <ul>
        <li>
            <span class="param-type">number</span>
        </li>
    </ul>
    <h5>Example</h5>
    <pre class="prettyprint source linenums"><code>// Set the size of the drawing to be created as 100 mm (10 cm) in width and 100 mm (10 cm) in height:oDrawing.SetSize(100 * 36000, 100 * 36000);</code></pre>
    <h4 class="name" id="HdrFtrType">HdrFtrType</h4>
    <dl class="details">
    </dl>
    <div class="builder_description">
        Header and footer types which can be applied to the document sections.
        <ul>
            <li><b>"default"</b> - a header or footer which can be applied to any default page.</li>
            <li><b>"title"</b> - a header or footer which is applied to the title page.</li>
            <li><b>"even"</b> - a header or footer which can be applied to even pages to distinguish them from the odd ones (which will be considered default).</li>
        </ul>
    </div>
    <h5>Type:</h5>
    <ul>
        <li>
            <span class="param-type">"default"</span>
            |
            <span class="param-type">"title"</span>
            |
            <span class="param-type">"even"</span>
        </li>
    </ul>
    <h5>Example</h5>
    <pre class="prettyprint source linenums"><code>// Remove the header of the 'title' type from the final document section:var oDocContent = oFinalSection.RemoveHeader("title");</code></pre>
    <h4 class="name" id="hps">hps</h4>
    <dl class="details">
    </dl>
    <div class="builder_description">
        Half-points (2 half-points = 1 point).
    </div>
    <h5>Type:</h5>
    <ul>
        <li>
            <span class="param-type">number</span>
        </li>
    </ul>
    <h5>Example</h5>
    <pre class="prettyprint source linenums"><code>// Set the text font size to 11 points:oTextPr.SetFontSize(22);</code></pre>
    <h4 class="name" id="line240">line240</h4>
    <dl class="details">
    </dl>
    <div class="builder_description">
        240ths of a line.
    </div>
    <h5>Type:</h5>
    <ul>
        <li>
            <span class="param-type">number</span>
        </li>
    </ul>
    <h5>Example</h5>
    <pre class="prettyprint source linenums"><code>// The paragraph line spacing is set to 1 line:oParaPr.SetSpacingLine(240, "auto");</code></pre>
    <h4 class="name" id="ParagraphContent">ParagraphContent</h4>
    <dl class="details">
    </dl>
    <div class="builder_description">
        The types of elements that can be added to the paragraph structure.
    </div>
    <h5>Type:</h5>
    <ul>
        <li>
            <span class="param-type"><a href="<%=VirtualPathUtility.ToAbsolute("~/developers/document-builder/ApiUnsupported.aspx")%>">ApiUnsupported</a></span>
            |
            <span class="param-type"><a href="<%=VirtualPathUtility.ToAbsolute("~/developers/document-builder/ApiRun.aspx")%>">ApiRun</a></span>
        </li>
    </ul>
    <h5>Example</h5>
    <pre class="prettyprint source linenums"><code>// Add an element called 'text run' to the paragraph:oParagraph.AddElement(oRun,0);</code></pre>
    <h4 class="name" id="PatternType">PatternType</h4>
    <dl class="details">
    </dl>
    <div class="builder_description">
        The available preset patterns which can be used for the fill.
    </div>
    <h5>Type:</h5>
    <ul>
        <li>
            <span class="param-type">"cross"</span>
            |
            <span class="param-type">"dashDnDiag"</span>
            |
            <span class="param-type">"dashHorz"</span>
            |
            <span class="param-type">"dashUpDiag"</span>
            |
            <span class="param-type">"dashVert"</span>
            |
            <span class="param-type">"diagBrick"</span>
            |
            <span class="param-type">"diagCross"</span>
            |
            <span class="param-type">"divot"</span>
            |
            <span class="param-type">"dkDnDiag"</span>
            |
            <span class="param-type">"dkHorz"</span>
            |
            <span class="param-type">"dkUpDiag"</span>
            |
            <span class="param-type">"dkVert"</span>
            |
            <span class="param-type">"dnDiag"</span>
            |
            <span class="param-type">"dotDmnd"</span>
            |
            <span class="param-type">"dotGrid"</span>
            |
            <span class="param-type">"horz"</span>
            |
            <span class="param-type">"horzBrick"</span>
            |
            <span class="param-type">"lgCheck"</span>
            |
            <span class="param-type">"lgConfetti"</span>
            |
            <span class="param-type">"lgGrid"</span>
            |
            <span class="param-type">"ltDnDiag"</span>
            |
            <span class="param-type">"ltHorz"</span>
            |
            <span class="param-type">"ltUpDiag"</span>
            |
            <span class="param-type">"ltVert"</span>
            |
            <span class="param-type">"narHorz"</span>
            |
            <span class="param-type">"narVert"</span>
            |
            <span class="param-type">"openDmnd"</span>
            |
            <span class="param-type">"pct10"</span>
            |
            <span class="param-type">"pct20"</span>
            |
            <span class="param-type">"pct25"</span>
            |
            <span class="param-type">"pct30"</span>
            |
            <span class="param-type">"pct40"</span>
            |
            <span class="param-type">"pct5"</span>
            |
            <span class="param-type">"pct50"</span>
            |
            <span class="param-type">"pct60"</span>
            |
            <span class="param-type">"pct70"</span>
            |
            <span class="param-type">"pct75"</span>
            |
            <span class="param-type">"pct80"</span>
            |
            <span class="param-type">"pct90"</span>
            |
            <span class="param-type">"plaid"</span>
            |
            <span class="param-type">"shingle"</span>
            |
            <span class="param-type">"smCheck"</span>
            |
            <span class="param-type">"smConfetti"</span>
            |
            <span class="param-type">"smGrid"</span>
            |
            <span class="param-type">"solidDmnd"</span>
            |
            <span class="param-type">"sphere"</span>
            |
            <span class="param-type">"trellis"</span>
            |
            <span class="param-type">"upDiag"</span>
            |
            <span class="param-type">"vert"</span>
            |
            <span class="param-type">"wave"</span>
            |
            <span class="param-type">"wdDnDiag"</span>
            |
            <span class="param-type">"wdUpDiag"</span>
            |
            <span class="param-type">"weave"</span>
            |
            <span class="param-type">"zigZag"</span>
        </li>
    </ul>
    <h5>Example</h5>
    <pre class="prettyprint source linenums"><code>// Create a fill with a 'dashDnDiag' pattern which has two colors - green and red:oFill = Api.CreatePatternFill("dashDnDiag", Api.CreateRGBColor(0, 225, 0), Api.CreateRGBColor(255, 0, 0));</code></pre>
    <h4 class="name" id="PositiveFixedAngle">PositiveFixedAngle</h4>
    <dl class="details">
    </dl>
    <div class="builder_description">
        A 60000th of a degree (5400000 = 90 degrees).
    </div>
    <h5>Type:</h5>
    <ul>
        <li>
            <span class="param-type">number</span>
        </li>
    </ul>
    <h5>Example</h5>
    <pre class="prettyprint source linenums"><code>// The resulting gradient direction angle is 90 degrees:oFill = Api.CreateLinearGradientFill([oGs1, oGs2], 5400000);</code></pre>
    <h4 class="name" id="PositivePercentage">PositivePercentage</h4>
    <dl class="details">
    </dl>
    <div class="builder_description">
        The 1000th of a percent (100000 = 100%).
    </div>
    <h5>Type:</h5>
    <ul>
        <li>
            <span class="param-type">number</span>
        </li>
    </ul>
    <h5>Example</h5>
    <pre class="prettyprint source linenums"><code>// The resulting gradient stop position is 100%:var oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 164, 101), 100000);</code></pre>
    <h4 class="name" id="PresetColor">PresetColor</h4>
    <dl class="details">
    </dl>
    <div class="builder_description">
        The available preset color names.
    </div>
    <h5>Type:</h5>
    <ul>
        <li>
            <span class="param-type">"aliceBlue"</span>
            |
            <span class="param-type">"antiqueWhite"</span>
            |
            <span class="param-type">"aqua"</span>
            |
            <span class="param-type">"aquamarine"</span>
            |
            <span class="param-type">"azure"</span>
            |
            <span class="param-type">"beige"</span>
            |
            <span class="param-type">"bisque"</span>
            |
            <span class="param-type">"black"</span>
            |
            <span class="param-type">"blanchedAlmond"</span>
            |
            <span class="param-type">"blue"</span>
            |
            <span class="param-type">"blueViolet"</span>
            |
            <span class="param-type">"brown"</span>
            |
            <span class="param-type">"burlyWood"</span>
            |
            <span class="param-type">"cadetBlue"</span>
            |
            <span class="param-type">"chartreuse"</span>
            |
            <span class="param-type">"chocolate"</span>
            |
            <span class="param-type">"coral"</span>
            |
            <span class="param-type">"cornflowerBlue"</span>
            |
            <span class="param-type">"cornsilk"</span>
            |
            <span class="param-type">"crimson"</span>
            |
            <span class="param-type">"cyan"</span>
            |
            <span class="param-type">"darkBlue"</span>
            |
            <span class="param-type">"darkCyan"</span>
            |
            <span class="param-type">"darkGoldenrod"</span>
            |
            <span class="param-type">"darkGray"</span>
            |
            <span class="param-type">"darkGreen"</span>
            |
            <span class="param-type">"darkGrey"</span>
            |
            <span class="param-type">"darkKhaki"</span>
            |
            <span class="param-type">"darkMagenta"</span>
            |
            <span class="param-type">"darkOliveGreen"</span>
            |
            <span class="param-type">"darkOrange"</span>
            |
            <span class="param-type">"darkOrchid"</span>
            |
            <span class="param-type">"darkRed"</span>
            |
            <span class="param-type">"darkSalmon"</span>
            |
            <span class="param-type">"darkSeaGreen"</span>
            |
            <span class="param-type">"darkSlateBlue"</span>
            |
            <span class="param-type">"darkSlateGray"</span>
            |
            <span class="param-type">"darkSlateGrey"</span>
            |
            <span class="param-type">"darkTurquoise"</span>
            |
            <span class="param-type">"darkViolet"</span>
            |
            <span class="param-type">"deepPink"</span>
            |
            <span class="param-type">"deepSkyBlue"</span>
            |
            <span class="param-type">"dimGray"</span>
            |
            <span class="param-type">"dimGrey"</span>
            |
            <span class="param-type">"dkBlue"</span>
            |
            <span class="param-type">"dkCyan"</span>
            |
            <span class="param-type">"dkGoldenrod"</span>
            |
            <span class="param-type">"dkGray"</span>
            |
            <span class="param-type">"dkGreen"</span>
            |
            <span class="param-type">"dkGrey"</span>
            |
            <span class="param-type">"dkKhaki"</span>
            |
            <span class="param-type">"dkMagenta"</span>
            |
            <span class="param-type">"dkOliveGreen"</span>
            |
            <span class="param-type">"dkOrange"</span>
            |
            <span class="param-type">"dkOrchid"</span>
            |
            <span class="param-type">"dkRed"</span>
            |
            <span class="param-type">"dkSalmon"</span>
            |
            <span class="param-type">"dkSeaGreen"</span>
            |
            <span class="param-type">"dkSlateBlue"</span>
            |
            <span class="param-type">"dkSlateGray"</span>
            |
            <span class="param-type">"dkSlateGrey"</span>
            |
            <span class="param-type">"dkTurquoise"</span>
            |
            <span class="param-type">"dkViolet"</span>
            |
            <span class="param-type">"dodgerBlue"</span>
            |
            <span class="param-type">"firebrick"</span>
            |
            <span class="param-type">"floralWhite"</span>
            |
            <span class="param-type">"forestGreen"</span>
            |
            <span class="param-type">"fuchsia"</span>
            |
            <span class="param-type">"gainsboro"</span>
            |
            <span class="param-type">"ghostWhite"</span>
            |
            <span class="param-type">"gold"</span>
            |
            <span class="param-type">"goldenrod"</span>
            |
            <span class="param-type">"gray"</span>
            |
            <span class="param-type">"green"</span>
            |
            <span class="param-type">"greenYellow"</span>
            |
            <span class="param-type">"grey"</span>
            |
            <span class="param-type">"honeydew"</span>
            |
            <span class="param-type">"hotPink"</span>
            |
            <span class="param-type">"indianRed"</span>
            |
            <span class="param-type">"indigo"</span>
            |
            <span class="param-type">"ivory"</span>
            |
            <span class="param-type">"khaki"</span>
            |
            <span class="param-type">"lavender"</span>
            |
            <span class="param-type">"lavenderBlush"</span>
            |
            <span class="param-type">"lawnGreen"</span>
            |
            <span class="param-type">"lemonChiffon"</span>
            |
            <span class="param-type">"lightBlue"</span>
            |
            <span class="param-type">"lightCoral"</span>
            |
            <span class="param-type">"lightCyan"</span>
            |
            <span class="param-type">"lightGoldenrodYellow"</span>
            |
            <span class="param-type">"lightGray"</span>
            |
            <span class="param-type">"lightGreen"</span>
            |
            <span class="param-type">"lightGrey"</span>
            |
            <span class="param-type">"lightPink"</span>
            |
            <span class="param-type">"lightSalmon"</span>
            |
            <span class="param-type">"lightSeaGreen"</span>
            |
            <span class="param-type">"lightSkyBlue"</span>
            |
            <span class="param-type">"lightSlateGray"</span>
            |
            <span class="param-type">"lightSlateGrey"</span>
            |
            <span class="param-type">"lightSteelBlue"</span>
            |
            <span class="param-type">"lightYellow"</span>
            |
            <span class="param-type">"lime"</span>
            |
            <span class="param-type">"limeGreen"</span>
            |
            <span class="param-type">"linen"</span>
            |
            <span class="param-type">"ltBlue"</span>
            |
            <span class="param-type">"ltCoral"</span>
            |
            <span class="param-type">"ltCyan"</span>
            |
            <span class="param-type">"ltGoldenrodYellow"</span>
            |
            <span class="param-type">"ltGray"</span>
            |
            <span class="param-type">"ltGreen"</span>
            |
            <span class="param-type">"ltGrey"</span>
            |
            <span class="param-type">"ltPink"</span>
            |
            <span class="param-type">"ltSalmon"</span>
            |
            <span class="param-type">"ltSeaGreen"</span>
            |
            <span class="param-type">"ltSkyBlue"</span>
            |
            <span class="param-type">"ltSlateGray"</span>
            |
            <span class="param-type">"ltSlateGrey"</span>
            |
            <span class="param-type">"ltSteelBlue"</span>
            |
            <span class="param-type">"ltYellow"</span>
            |
            <span class="param-type">"magenta"</span>
            |
            <span class="param-type">"maroon"</span>
            |
            <span class="param-type">"medAquamarine"</span>
            |
            <span class="param-type">"medBlue"</span>
            |
            <span class="param-type">"mediumAquamarine"</span>
            |
            <span class="param-type">"mediumBlue"</span>
            |
            <span class="param-type">"mediumOrchid"</span>
            |
            <span class="param-type">"mediumPurple"</span>
            |
            <span class="param-type">"mediumSeaGreen"</span>
            |
            <span class="param-type">"mediumSlateBlue"</span>
            |
            <span class="param-type">"mediumSpringGreen"</span>
            |
            <span class="param-type">"mediumTurquoise"</span>
            |
            <span class="param-type">"mediumVioletRed"</span>
            |
            <span class="param-type">"medOrchid"</span>
            |
            <span class="param-type">"medPurple"</span>
            |
            <span class="param-type">"medSeaGreen"</span>
            |
            <span class="param-type">"medSlateBlue"</span>
            |
            <span class="param-type">"medSpringGreen"</span>
            |
            <span class="param-type">"medTurquoise"</span>
            |
            <span class="param-type">"medVioletRed"</span>
            |
            <span class="param-type">"midnightBlue"</span>
            |
            <span class="param-type">"mintCream"</span>
            |
            <span class="param-type">"mistyRose"</span>
            |
            <span class="param-type">"moccasin"</span>
            |
            <span class="param-type">"navajoWhite"</span>
            |
            <span class="param-type">"navy"</span>
            |
            <span class="param-type">"oldLace"</span>
            |
            <span class="param-type">"olive"</span>
            |
            <span class="param-type">"oliveDrab"</span>
            |
            <span class="param-type">"orange"</span>
            |
            <span class="param-type">"orangeRed"</span>
            |
            <span class="param-type">"orchid"</span>
            |
            <span class="param-type">"paleGoldenrod"</span>
            |
            <span class="param-type">"paleGreen"</span>
            |
            <span class="param-type">"paleTurquoise"</span>
            |
            <span class="param-type">"paleVioletRed"</span>
            |
            <span class="param-type">"papayaWhip"</span>
            |
            <span class="param-type">"peachPuff"</span>
            |
            <span class="param-type">"peru"</span>
            |
            <span class="param-type">"pink"</span>
            |
            <span class="param-type">"plum"</span>
            |
            <span class="param-type">"powderBlue"</span>
            |
            <span class="param-type">"purple"</span>
            |
            <span class="param-type">"red"</span>
            |
            <span class="param-type">"rosyBrown"</span>
            |
            <span class="param-type">"royalBlue"</span>
            |
            <span class="param-type">"saddleBrown"</span>
            |
            <span class="param-type">"salmon"</span>
            |
            <span class="param-type">"sandyBrown"</span>
            |
            <span class="param-type">"seaGreen"</span>
            |
            <span class="param-type">"seaShell"</span>
            |
            <span class="param-type">"sienna"</span>
            |
            <span class="param-type">"silver"</span>
            |
            <span class="param-type">"skyBlue"</span>
            |
            <span class="param-type">"slateBlue"</span>
            |
            <span class="param-type">"slateGray"</span>
            |
            <span class="param-type">"slateGrey"</span>
            |
            <span class="param-type">"snow"</span>
            |
            <span class="param-type">"springGreen"</span>
            |
            <span class="param-type">"steelBlue"</span>
            |
            <span class="param-type">"tan"</span>
            |
            <span class="param-type">"teal"</span>
            |
            <span class="param-type">"thistle"</span>
            |
            <span class="param-type">"tomato"</span>
            |
            <span class="param-type">"turquoise"</span>
            |
            <span class="param-type">"violet"</span>
            |
            <span class="param-type">"wheat"</span>
            |
            <span class="param-type">"white"</span>
            |
            <span class="param-type">"whiteSmoke"</span>
            |
            <span class="param-type">"yellow"</span>
            |
            <span class="param-type">"yellowGreen"</span>
        </li>
    </ul>
    <h5>Example</h5>
    <pre class="prettyprint source linenums"><code>// Create a scheme color using the 'lightYellow' color preset:oSchemeColor = Api.CreatePresetColor("lightYellow");</code></pre>
    <h4 class="name" id="pt">pt</h4>
    <dl class="details">
    </dl>
    <div class="builder_description">
        A point.
    </div>
    <h5>Type:</h5>
    <ul>
        <li>
            <span class="param-type">number</span>
        </li>
    </ul>
    <h5>Example</h5>
    <pre class="prettyprint source linenums"><code>// The paragraph will have a single 3 point wide green bottom border with a 1 point offset from the bottom paragraph edge:oParaPr.SetBottomBorder("single", 24, 1, 0, 255, 0);</code></pre>
    <h4 class="name" id="pt_8">pt_8</h4>
    <dl class="details">
    </dl>
    <div class="builder_description">
        Eighths of a point (24 eighths of a point = 3 points).
    </div>
    <h5>Type:</h5>
    <ul>
        <li>
            <span class="param-type">number</span>
        </li>
    </ul>
    <h5>Example</h5>
    <pre class="prettyprint source linenums"><code>// The paragraph will have a single 6 point wide green bottom border with a zero offset from the bottom paragraph edge:oParaPr.SetBottomBorder("single", 48, 0, 0, 255, 0);</code></pre>
    <h4 class="name" id="RelFromH">RelFromH</h4>
    <dl class="details">
    </dl>
    <div class="builder_description">
        The possible values for the base which the relative horizontal positioning of an object will be calculated from.
    </div>
    <h5>Type:</h5>
    <ul>
        <li>
            <span class="param-type">"character"</span>
            |
            <span class="param-type">"column"</span>
            |
            <span class="param-type">"leftMargin"</span>
            |
            <span class="param-type">"rightMargin"</span>
            |
            <span class="param-type">"margin"</span>
            |
            <span class="param-type">"page"</span>
        </li>
    </ul>
    <h5>Example</h5>
    <pre class="prettyprint source linenums"><code>// The created drawing will be centered horizontally relative to the page width:oDrawing.SetHorAlign("page", "center");</code></pre>
    <h4 class="name" id="RelFromV">RelFromV</h4>
    <dl class="details">
    </dl>
    <div class="builder_description">
        The possible values for the base which the relative vertical positioning of an object will be calculated from.
    </div>
    <h5>Type:</h5>
    <ul>
        <li>
            <span class="param-type">"bottomMargin"</span>
            |
            <span class="param-type">"topMargin"</span>
            |
            <span class="param-type">"margin"</span>
            |
            <span class="param-type">"page"</span>
            |
            <span class="param-type">"line"</span>
            |
            <span class="param-type">"paragraph"</span>
        </li>
    </ul>
    <h5>Example</h5>
    <pre class="prettyprint source linenums"><code>// The created drawing will be centered vertically relative to the paragraph height:oDrawing.SetHorAlign("paragraph", "center");</code></pre>
    <h4 class="name" id="SchemeColorId">SchemeColorId</h4>
    <dl class="details">
    </dl>
    <div class="builder_description">
        The available color scheme identifiers.
    </div>
    <h5>Type:</h5>
    <ul>
        <li>
            <span class="param-type">"accent1"</span>
            |
            <span class="param-type">"accent2"</span>
            |
            <span class="param-type">"accent3"</span>
            |
            <span class="param-type">"accent4"</span>
            |
            <span class="param-type">"accent5"</span>
            |
            <span class="param-type">"accent6"</span>
            |
            <span class="param-type">"bg1"</span>
            |
            <span class="param-type">"bg2"</span>
            |
            <span class="param-type">"dk1"</span>
            |
            <span class="param-type">"dk2"</span>
            |
            <span class="param-type">"lt1"</span>
            |
            <span class="param-type">"lt2"</span>
            |
            <span class="param-type">"tx1"</span>
            |
            <span class="param-type">"tx2"</span>
        </li>
    </ul>
    <h5>Example</h5>
    <pre class="prettyprint source linenums"><code>// Create a scheme color with the 'accent2' identifier:oSchemeColor = Api.CreateSchemeColor("accent2");</code></pre>
    <h4 class="name" id="ShapeType">ShapeType</h4>
    <dl class="details">
    </dl>
    <div class="builder_description">
        This type specifies the preset shape geometry that will be used for a shape.
    </div>
    <h5>Type:</h5>
    <ul>
        <li>
            <span class="param-type">"accentBorderCallout1"</span>
            |
            <span class="param-type">"accentBorderCallout2"</span>
            |
            <span class="param-type">"accentBorderCallout3"</span>
            |
            <span class="param-type">"accentCallout1"</span>
            |
            <span class="param-type">"accentCallout2"</span>
            |
            <span class="param-type">"accentCallout3"</span>
            |
            <span class="param-type">"actionButtonBackPrevious"</span>
            |
            <span class="param-type">"actionButtonBeginning"</span>
            |
            <span class="param-type">"actionButtonBlank"</span>
            |
            <span class="param-type">"actionButtonDocument"</span>
            |
            <span class="param-type">"actionButtonEnd"</span>
            |
            <span class="param-type">"actionButtonForwardNext"</span>
            |
            <span class="param-type">"actionButtonHelp"</span>
            |
            <span class="param-type">"actionButtonHome"</span>
            |
            <span class="param-type">"actionButtonInformation"</span>
            |
            <span class="param-type">"actionButtonMovie"</span>
            |
            <span class="param-type">"actionButtonReturn"</span>
            |
            <span class="param-type">"actionButtonSound"</span>
            |
            <span class="param-type">"arc"</span>
            |
            <span class="param-type">"bentArrow"</span>
            |
            <span class="param-type">"bentConnector2"</span>
            |
            <span class="param-type">"bentConnector3"</span>
            |
            <span class="param-type">"bentConnector4"</span>
            |
            <span class="param-type">"bentConnector5"</span>
            |
            <span class="param-type">"bentUpArrow"</span>
            |
            <span class="param-type">"bevel"</span>
            |
            <span class="param-type">"blockArc"</span>
            |
            <span class="param-type">"borderCallout1"</span>
            |
            <span class="param-type">"borderCallout2"</span>
            |
            <span class="param-type">"borderCallout3"</span>
            |
            <span class="param-type">"bracePair"</span>
            |
            <span class="param-type">"bracketPair"</span>
            |
            <span class="param-type">"callout1"</span>
            |
            <span class="param-type">"callout2"</span>
            |
            <span class="param-type">"callout3"</span>
            |
            <span class="param-type">"can"</span>
            |
            <span class="param-type">"chartPlus"</span>
            |
            <span class="param-type">"chartStar"</span>
            |
            <span class="param-type">"chartX"</span>
            |
            <span class="param-type">"chevron"</span>
            |
            <span class="param-type">"chord"</span>
            |
            <span class="param-type">"circularArrow"</span>
            |
            <span class="param-type">"cloud"</span>
            |
            <span class="param-type">"cloudCallout"</span>
            |
            <span class="param-type">"corner"</span>
            |
            <span class="param-type">"cornerTabs"</span>
            |
            <span class="param-type">"cube"</span>
            |
            <span class="param-type">"curvedConnector2"</span>
            |
            <span class="param-type">"curvedConnector3"</span>
            |
            <span class="param-type">"curvedConnector4"</span>
            |
            <span class="param-type">"curvedConnector5"</span>
            |
            <span class="param-type">"curvedDownArrow"</span>
            |
            <span class="param-type">"curvedLeftArrow"</span>
            |
            <span class="param-type">"curvedRightArrow"</span>
            |
            <span class="param-type">"curvedUpArrow"</span>
            |
            <span class="param-type">"decagon"</span>
            |
            <span class="param-type">"diagStripe"</span>
            |
            <span class="param-type">"diamond"</span>
            |
            <span class="param-type">"dodecagon"</span>
            |
            <span class="param-type">"donut"</span>
            |
            <span class="param-type">"doubleWave"</span>
            |
            <span class="param-type">"downArrow"</span>
            |
            <span class="param-type">"downArrowCallout"</span>
            |
            <span class="param-type">"ellipse"</span>
            |
            <span class="param-type">"ellipseRibbon"</span>
            |
            <span class="param-type">"ellipseRibbon2"</span>
            |
            <span class="param-type">"flowChartAlternateProcess"</span>
            |
            <span class="param-type">"flowChartCollate"</span>
            |
            <span class="param-type">"flowChartConnector"</span>
            |
            <span class="param-type">"flowChartDecision"</span>
            |
            <span class="param-type">"flowChartDelay"</span>
            |
            <span class="param-type">"flowChartDisplay"</span>
            |
            <span class="param-type">"flowChartDocument"</span>
            |
            <span class="param-type">"flowChartExtract"</span>
            |
            <span class="param-type">"flowChartInputOutput"</span>
            |
            <span class="param-type">"flowChartInternalStorage"</span>
            |
            <span class="param-type">"flowChartMagneticDisk"</span>
            |
            <span class="param-type">"flowChartMagneticDrum"</span>
            |
            <span class="param-type">"flowChartMagneticTape"</span>
            |
            <span class="param-type">"flowChartManualInput"</span>
            |
            <span class="param-type">"flowChartManualOperation"</span>
            |
            <span class="param-type">"flowChartMerge"</span>
            |
            <span class="param-type">"flowChartMultidocument"</span>
            |
            <span class="param-type">"flowChartOfflineStorage"</span>
            |
            <span class="param-type">"flowChartOffpageConnector"</span>
            |
            <span class="param-type">"flowChartOnlineStorage"</span>
            |
            <span class="param-type">"flowChartOr"</span>
            |
            <span class="param-type">"flowChartPredefinedProcess"</span>
            |
            <span class="param-type">"flowChartPreparation"</span>
            |
            <span class="param-type">"flowChartProcess"</span>
            |
            <span class="param-type">"flowChartPunchedCard"</span>
            |
            <span class="param-type">"flowChartPunchedTape"</span>
            |
            <span class="param-type">"flowChartSort"</span>
            |
            <span class="param-type">"flowChartSummingJunction"</span>
            |
            <span class="param-type">"flowChartTerminator"</span>
            |
            <span class="param-type">"foldedCorner"</span>
            |
            <span class="param-type">"frame"</span>
            |
            <span class="param-type">"funnel"</span>
            |
            <span class="param-type">"gear6"</span>
            |
            <span class="param-type">"gear9"</span>
            |
            <span class="param-type">"halfFrame"</span>
            |
            <span class="param-type">"heart"</span>
            |
            <span class="param-type">"heptagon"</span>
            |
            <span class="param-type">"hexagon"</span>
            |
            <span class="param-type">"homePlate"</span>
            |
            <span class="param-type">"horizontalScroll"</span>
            |
            <span class="param-type">"irregularSeal1"</span>
            |
            <span class="param-type">"irregularSeal2"</span>
            |
            <span class="param-type">"leftArrow"</span>
            |
            <span class="param-type">"leftArrowCallout"</span>
            |
            <span class="param-type">"leftBrace"</span>
            |
            <span class="param-type">"leftBracket"</span>
            |
            <span class="param-type">"leftCircularArrow"</span>
            |
            <span class="param-type">"leftRightArrow"</span>
            |
            <span class="param-type">"leftRightArrowCallout"</span>
            |
            <span class="param-type">"leftRightCircularArrow"</span>
            |
            <span class="param-type">"leftRightRibbon"</span>
            |
            <span class="param-type">"leftRightUpArrow"</span>
            |
            <span class="param-type">"leftUpArrow"</span>
            |
            <span class="param-type">"lightningBolt"</span>
            |
            <span class="param-type">"line"</span>
            |
            <span class="param-type">"lineInv"</span>
            |
            <span class="param-type">"mathDivide"</span>
            |
            <span class="param-type">"mathEqual"</span>
            |
            <span class="param-type">"mathMinus"</span>
            |
            <span class="param-type">"mathMultiply"</span>
            |
            <span class="param-type">"mathNotEqual"</span>
            |
            <span class="param-type">"mathPlus"</span>
            |
            <span class="param-type">"moon"</span>
            |
            <span class="param-type">"nonIsoscelesTrapezoid"</span>
            |
            <span class="param-type">"noSmoking"</span>
            |
            <span class="param-type">"notchedRightArrow"</span>
            |
            <span class="param-type">"octagon"</span>
            |
            <span class="param-type">"parallelogram"</span>
            |
            <span class="param-type">"pentagon"</span>
            |
            <span class="param-type">"pie"</span>
            |
            <span class="param-type">"pieWedge"</span>
            |
            <span class="param-type">"plaque"</span>
            |
            <span class="param-type">"plaqueTabs"</span>
            |
            <span class="param-type">"plus"</span>
            |
            <span class="param-type">"quadArrow"</span>
            |
            <span class="param-type">"quadArrowCallout"</span>
            |
            <span class="param-type">"rect"</span>
            |
            <span class="param-type">"ribbon"</span>
            |
            <span class="param-type">"ribbon2"</span>
            |
            <span class="param-type">"rightArrow"</span>
            |
            <span class="param-type">"rightArrowCallout"</span>
            |
            <span class="param-type">"rightBrace"</span>
            |
            <span class="param-type">"rightBracket"</span>
            |
            <span class="param-type">"round1Rect"</span>
            |
            <span class="param-type">"round2DiagRect"</span>
            |
            <span class="param-type">"round2SameRect"</span>
            |
            <span class="param-type">"roundRect"</span>
            |
            <span class="param-type">"rtTriangle"</span>
            |
            <span class="param-type">"smileyFace"</span>
            |
            <span class="param-type">"snip1Rect"</span>
            |
            <span class="param-type">"snip2DiagRect"</span>
            |
            <span class="param-type">"snip2SameRect"</span>
            |
            <span class="param-type">"snipRoundRect"</span>
            |
            <span class="param-type">"squareTabs"</span>
            |
            <span class="param-type">"star10"</span>
            |
            <span class="param-type">"star12"</span>
            |
            <span class="param-type">"star16"</span>
            |
            <span class="param-type">"star24"</span>
            |
            <span class="param-type">"star32"</span>
            |
            <span class="param-type">"star4"</span>
            |
            <span class="param-type">"star5"</span>
            |
            <span class="param-type">"star6"</span>
            |
            <span class="param-type">"star7"</span>
            |
            <span class="param-type">"star8"</span>
            |
            <span class="param-type">"straightConnector1"</span>
            |
            <span class="param-type">"stripedRightArrow"</span>
            |
            <span class="param-type">"sun"</span>
            |
            <span class="param-type">"swooshArrow"</span>
            |
            <span class="param-type">"teardrop"</span>
            |
            <span class="param-type">"trapezoid"</span>
            |
            <span class="param-type">"triangle"</span>
            |
            <span class="param-type">"upArrowCallout"</span>
            |
            <span class="param-type">"upDownArrow"</span>
            |
            <span class="param-type">"upDownArrow"</span>
            |
            <span class="param-type">"upDownArrowCallout"</span>
            |
            <span class="param-type">"uturnArrow"</span>
            |
            <span class="param-type">"verticalScroll"</span>
            |
            <span class="param-type">"wave"</span>
            |
            <span class="param-type">"wedgeEllipseCallout"</span>
            |
            <span class="param-type">"wedgeRectCallout"</span>
            |
            <span class="param-type">"wedgeRoundRectCallout"</span>
        </li>
    </ul>
    <h5>Example</h5>
    <pre class="prettyprint source linenums"><code>// Create a shape using the 'diamond' preset:oDrawing = Api.CreateShape("diamond", 100 * 36000, 100 * 36000, oFill, oStroke);</code></pre>
    <h4 class="name" id="ShdType">ShdType</h4>
    <dl class="details">
    </dl>
    <div class="builder_description">
        A shade type which can be added to the document element.
    </div>
    <h5>Type:</h5>
    <ul>
        <li>
            <span class="param-type">"nil"</span>
            |
            <span class="param-type">"clear"</span>
        </li>
    </ul>
    <h5>Example</h5>
    <pre class="prettyprint source linenums"><code>// Add a green shadow to the table:oTablePr.SetShd("clear", 0, 255, 0, false);</code></pre>
    <h4 class="name" id="StyleType">StyleType</h4>
    <dl class="details">
    </dl>
    <div class="builder_description">
        The style type used for the document element.
    </div>
    <h5>Type:</h5>
    <ul>
        <li>
            <span class="param-type">"paragraph"</span>
            |
            <span class="param-type">"table"</span>
            |
            <span class="param-type">"run"</span>
            |
            <span class="param-type">"numbering"</span>
        </li>
    </ul>
    <h5>Example</h5>
    <pre class="prettyprint source linenums"><code>// Assign the default document paragraph style to the 'oNormalStyle' variable:var oNormalStyle = oDocument.GetDefaultStyle("paragraph");</code></pre>
    <h4 class="name" id="TabJc">TabJc</h4>
    <dl class="details">
    </dl>
    <div class="builder_description">
        Types of custom tab.
    </div>
    <h5>Type:</h5>
    <ul>
        <li>
            <span class="param-type">"clear"</span>
            |
            <span class="param-type">"left"</span>
            |
            <span class="param-type">"right"</span>
            |
            <span class="param-type">"center"</span>
        </li>
    </ul>
    <h5>Example</h5>
    <pre class="prettyprint source linenums"><code>// Set tab positions at 50, 75 and 150 points with the text aligned center, left and right at each tab stop accordingly:oParaPr.SetTabs([1000, 1500, 3000], ["center", "left", "right"]);</code></pre>
    <h4 class="name" id="TableStyleOverrideType">TableStyleOverrideType</h4>
    <dl class="details">
    </dl>
    <div class="builder_description">
        This simple type specifies possible values for the table sections to which the current conditionalformatting properties will be applied when this selected table style is used.
        <ul>
            <li><b>"topLeftCell"</b> - specifies that the table formatting applies to the top left cell.</li>
            <li><b>"topRightCell"</b> - specifies that the table formatting applies to the top right cell.</li>
            <li><b>"bottomLeftCell"</b> - specifies that the table formatting applies to the bottom left cell.</li>
            <li><b>"bottomRightCell"</b> - specifies that the table formatting applies to the bottom right cell.</li>
            <li><b>"firstRow"</b> - specifies that the table formatting applies to the first row.</li>
            <li><b>"lastRow"</b> - specifies that the table formatting applies to the last row.</li>
            <li><b>"firstColumn"</b> - specifies that the table formatting applies to the first column. Any subsequent row which is in <i>table header</i> <span class="param-type"><a href="<%=VirtualPathUtility.ToAbsolute("~/developers/document-builder/ApiTableRowPr/SetTableHeader.aspx")%>">ApiTableRowPr.SetTableHeader</a></span> will also use this conditional format.</li>
            <li><b>"lastColumn"</b> - specifies that the table formatting applies to the last column.</li>
            <li><b>"bandedColumn"</b> - specifies that the table formatting applies to odd numbered groupings of rows.</li>
            <li><b>"bandedColumnEven"</b> - specifies that the table formatting applies to even numbered groupings of rows.</li>
            <li><b>"bandedRow"</b> - specifies that the table formatting applies to odd numbered groupings of columns.</li>
            <li><b>"bandedRowEven"</b> - specifies that the table formatting applies to even numbered groupings of columns.</li>
            <li><b>"wholeTable"</b> - specifies that the conditional formatting applies to the whole table.</li>
        </ul>
    </div>
    <h5>Type:</h5>
    <ul>
        <li>
            <span class="param-type">"topLeftCell"</span>
            |
            <span class="param-type">"topRightCell"</span>
            |
            <span class="param-type">"bottomLeftCell"</span>
            |
            <span class="param-type">"bottomRightCell"</span>
            |
            <span class="param-type">"firstRow"</span>
            |
            <span class="param-type">"lastRow"</span>
            |
            <span class="param-type">"firstColumn"</span>
            |
            <span class="param-type">"lastColumn"</span>
            |
            <span class="param-type">"bandedColumn"</span>
            |
            <span class="param-type">"bandedColumnEven"</span>
            |
            <span class="param-type">"bandedRow"</span>
            |
            <span class="param-type">"bandedRowEven"</span>
            |
            <span class="param-type">"wholeTable"</span>
        </li>
    </ul>
    <h5>Example</h5>
    <pre class="prettyprint source linenums"><code>// Apply the created style (set shadow) to the top left cell of the table:oTableStyle.GetConditionalTableStyle("topLeftCell").GetTableCellPr().SetShd("clear", 255, 0, 0);</code></pre>
    <h4 class="name" id="TableWidth">TableWidth</h4>
    <dl class="details">
    </dl>
    <div class="builder_description">
        The possible values for the units of the width property are defined by a specific table or table cell width property.
        <ul>
            <li><b>"auto"</b> - set the table or table cell width to auto width.</li>
            <li><b>"twips"</b> - set the table or table cell width to be measured in twentieths of a point.</li>
            <li><b>"nul"</b> - set the table or table cell width to be of a zero value.</li>
            <li><b>"percent"</b> - set the table or table cell width to be measured in percent to the parent container.</li>
        </ul>
    </div>
    <h5>Type:</h5>
    <ul>
        <li>
            <span class="param-type">"auto"</span>
            |
            <span class="param-type">"twips"</span>
            |
            <span class="param-type">"nul"</span>
            |
            <span class="param-type">"percent"</span>
        </li>
    </ul>
    <h5>Example</h5>
    <pre class="prettyprint source linenums"><code>// Set the width of the table cell equal to 100 points (2000 twips):oTableCell.SetWidth("twips", 2000);</code></pre>
    <h4 class="name" id="twips">twips</h4>
    <dl class="details">
    </dl>
    <div class="builder_description">
        Twentieths of a point (equivalent to 1/1440th of an inch).
    </div>
    <h5>Type:</h5>
    <ul>
        <li>
            <span class="param-type">number</span>
        </li>
    </ul>
    <h5>Example</h5>
    <pre class="prettyprint source linenums"><code>// Set the distance between columns equal to 36 points:oParagraph.SetEqualColumns(2, 720);</code></pre>
    <h4 class="name" id="VerticalTextAlign">VerticalTextAlign</h4>
    <dl class="details">
    </dl>
    <div class="builder_description">
        The available text vertical alignment (used to align text in a shape with a placement for text inside it).
    </div>
    <h5>Type:</h5>
    <ul>
        <li>
            <span class="param-type">"top"</span>
            |
            <span class="param-type">"center"</span>
            |
            <span class="param-type">"bottom"</span>
        </li>
    </ul>
    <h5>Example</h5>
    <pre class="prettyprint source linenums"><code>// The inner text for the created shape will be added aligned vertically closer to the shape upper part:oDrawing.SetVerticalTextAlign("top");</code></pre>
</div>
</asp:Content>
