<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">RemoveAllElements</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiParagraph/RemoveAllElements", "presentationapi");%>

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
oParagraph.RemoveAllElements();
oRun = Api.CreateRun();
oRun.AddText("This is the first document paragraph. We removed all the elements to get the number of paragraph elements at this point: ");
oRun.AddText("" + oParagraph.GetElementsCount() + ". If we had not done that the number before this sentence would be '1'.");
oParagraph.AddElement(oRun);
oParagraph = Api.CreateParagraph();
oRun = Api.CreateRun();
oRun.AddText("This is the second paragraph. It is created without any elements, so there is no need to remove them. The number of paragraph elements at this point: ");
oRun.AddText("" + oParagraph.GetElementsCount() + ". It is '0' and should be that way.");
oParagraph.AddElement(oRun);
oDocContent.Push(oParagraph);
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "RemoveAllElements.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5009942&doc=L1U2cVEwLy9sVzRJVDVqT2ZHMFhEbXFHZXdaM1NyVjJCSlpLQ011YkdOTT0_IjUwMDk5NDIi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>