<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetSpacingLine</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiParaPr/SetSpacingLine", "presentationapi");%>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
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
oParaPr = oParagraph.GetParaPr();
oParaPr.SetSpacingLine(3 * 240, "auto");
oParagraph.AddText("Paragraph 1. Spacing: 3 times of a common paragraph line spacing.");
oParagraph.AddLineBreak();
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "SetSpacingLine.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5010020&doc=Si9ra0hXOUFBWkZ2TnN6UFFNUktWcWtWck9tRWNITEZPVTVxSlYveFMzYz0_IjUwMTAwMjAi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>