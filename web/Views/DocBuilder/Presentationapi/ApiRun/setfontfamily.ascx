<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetFontFamily</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiRun/SetFontFamily", "presentationapi");%>

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
oRun.SetFontFamily("Comic Sans MS");
oRun.AddText("This is a text run with the font family set to 'Comic Sans MS'.");
oParagraph.AddElement(oRun);
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "SetFontFamily.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5011309&doc=SjNLU3NQN0VUZE5WN0o4Rmp6dWxOOWp3dWdRU2oyWHhHTjVxb3ZLNlpyRT0_IjUwMTEzMDki0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>