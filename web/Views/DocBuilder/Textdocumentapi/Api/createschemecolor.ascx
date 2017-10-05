<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateSchemeColor</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/Api/CreateSchemeColor", "textdocumentapi");%>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oFill, oStroke, oDrawing, oParagraph, oSchemeColor;
oParagraph = oDocument.GetElement(0);
oSchemeColor = Api.CreateSchemeColor("accent6");
oFill = Api.CreateSolidFill(oSchemeColor);
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
oDrawing = Api.CreateShape("curvedUpArrow", 5930900, 595605, oFill, oStroke);
oParagraph.AddDrawing(oDrawing);
builder.SaveFile("docx", "CreateSchemeColor.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4887176&doc=Q0poaHJoVTVkQ2JMZVkxNEVOOU81RmZwZDhoUDhCbU4xYnFQZG4xbVl5dz0_IjQ4ODcxNzYi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
