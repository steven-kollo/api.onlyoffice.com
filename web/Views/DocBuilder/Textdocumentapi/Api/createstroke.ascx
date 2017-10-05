<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateStroke</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/Api/CreateStroke", "textdocumentapi");%>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oFill, oStroke, oDrawing, oParagraph, oRGBColor;
oParagraph = oDocument.GetElement(0);
oRGBColor = Api.CreateRGBColor(0, 255, 0);
oFill = Api.CreateSolidFill(oRGBColor);
oStroke = Api.CreateStroke(5 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(255, 224, 204)));
oDrawing = Api.CreateShape("roundRect", 5930900, 395605, oFill, oStroke);
oParagraph.AddDrawing(oDrawing);
builder.SaveFile("docx", "CreateStroke.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4883391&doc=NTNscHlpUFRZMzh3ZXZpVklPdEFnanN6dEJ3Z3JnZnJEMUh3OTlpclZraz0_IjQ4ODMzOTEi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
