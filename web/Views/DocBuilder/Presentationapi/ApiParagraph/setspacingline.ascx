<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetSpacingLine</span>
</h1>
<h4 class="header-gray" id="SetSpacingLine">SetSpacingLine(nLine, sLineRule)</h4>
    <dl class="details">
        <dt>Inherited From:</dt>
        <dd>
            <ul>
                <li>
                    <a href="<%= Url.Action("presentationapi/apiparapr/setspacingline") %>">ApiParaPr.SetSpacingLine</a>
                </li>
            </ul>
        </dd>
    </dl>
<p class="dscr">
Set the paragraph line spacing. If the value of the <em>sLineRule</em> parameter is either <em>"atLeast"</em> or <em>"exact"</em>, then the value of <em>nLine</em> will be interpreted as twentieths of a point. If the value of the <em>sLineRule</em> parameter is <em>"auto"</em>, then the value of the <em>nLine</em> parameter will be interpreted as 240ths of a line.
</p>

<h2>Parameters:</h2>
<table class="table">
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Type</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><em>nLine</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#twips">twips</a>
                |
                <a href="<%= Url.Action("global") %>#line240">line240</a>
            </td>
            <td>The line spacing value measured either in twentieths of a point (1/1440 of an inch) or in 240ths of a line.</td>
        </tr>
        <tr class="tablerow">
            <td><em>sLineRule</em></td>
            <td>
                <em>"auto"</em>
                |
                <em>"atLeast"</em>
                |
                <em>"exact"</em>
            </td>
            <td>The rule that determines the measuring units of the <em>nLine</em> parameter.</td>
        </tr>
    </tbody>
</table>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oSlide.RemoveAllObjects();
oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(0, 0, 255), 0);
oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(61, 74, 107), 100000);
oFill = Api.CreateRadialGradientFill([oGs1, oGs2]);
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke);
oShape.SetPosition(608400, 1267200);
oDocContent = oShape.GetDocContent();
oParagraph = oDocContent.GetElement(0);
oParagraph.SetSpacingLine(2 * 240, "auto");
oParagraph.AddText("Paragraph 1. Spacing: 2 times of a common paragraph line spacing.");
oParagraph.AddLineBreak();
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph = Api.CreateParagraph();
oParagraph.SetSpacingLine(200, "exact");
oParagraph.AddText("Paragraph 2. Spacing: exact 10 points.");
oParagraph.AddLineBreak();
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oDocContent.Push(oParagraph);
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "SetSpacingLine.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5009970&doc=TFVBbXZtOG5uQ08rb29zWHdHVno2SGNVYXRmS3dnbkc5aDE5WWJEOVZGND0_IjUwMDk5NzAi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>