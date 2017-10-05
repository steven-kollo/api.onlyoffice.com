<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetSpacing</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiRun/SetSpacing", "presentationapi");%>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oSlide.RemoveAllObjects();
oFill = Api.CreateSolidFill(Api.CreateRGBColor(61, 74, 107));
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke);
oShape.SetPosition(608400, 1267200);
oDocContent = oShape.GetDocContent();
oParagraph = oDocContent.GetElement(0);
oRun = Api.CreateRun();
oRun.AddText("This is just a sample text. ");
oParagraph.AddElement(oRun);
oRun = Api.CreateRun();
oRun.SetSpacing(80);
oRun.AddText("This is a text run with the text spacing set to 4 points (20 twentieths of a point).");
oParagraph.AddElement(oRun);
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "SetSpacing.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5011316&doc=aWJJZUZPR1F2dzR1M2E5ZkJ5WFpYZVdta1B6SUVWMUI3czZnZEp1NnVBcz0_IjUwMTEzMTYi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
