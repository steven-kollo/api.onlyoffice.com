<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateParagraph</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/Api/CreateParagraph", "presentationapi");%>

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
oDocContent.RemoveAllElements();
oParagraph = Api.CreateParagraph();
oParagraph.SetJc("left");
oParagraph.AddText("This is an example of a paragraph inside a shape. Nothing special.");
oDocContent.Push(oParagraph);
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "CreateParagraph.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5007707&doc=WW1DMWtVUlRkTFFlTFM4cWRjVEVKeW1pUlY0U1lyRG53Q25jYXRwb09mUT0_IjUwMDc3MDci0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
