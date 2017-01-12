<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetSpacing</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiTextPr/SetSpacing", "presentationapi");%>

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
oTextPr = oRun.GetTextPr();
oTextPr.SetFontSize(50);
oTextPr.SetSpacing(80);
oParagraph.SetJc("left");
oRun.AddText("This is a sample text inside the shape with the spacing set to 4 points (80 twentieths of a point) using the text properties.");
oParagraph.AddElement(oRun);
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "SetSpacing.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5011379&doc=NmlrWFh2dVV0a01FaVZTVExTTzg1QTdscWJ0WWh1enVya1ZHTDF6aWVudz0_IjUwMTEzNzki0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>