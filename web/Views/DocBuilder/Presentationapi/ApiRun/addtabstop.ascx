<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">AddTabStop</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiRun/AddTabStop", "presentationapi");%>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
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
oRun.SetFontSize(30);
oRun.AddText("This is just a sample text. After it three tab stops will be added.");
oRun.AddTabStop();
oRun.AddTabStop();
oRun.AddTabStop();
oRun.AddText("This is the text which starts after the tab stops.");
oParagraph.AddElement(oRun);
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "AddTabStop.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5011295&doc=K0hWWEd2a3oxZDlXY25BZ3lVUHdNQjFsSSt6dWFxZE42dlJTQ3FoZ2NGND0_IjUwMTEyOTUi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>