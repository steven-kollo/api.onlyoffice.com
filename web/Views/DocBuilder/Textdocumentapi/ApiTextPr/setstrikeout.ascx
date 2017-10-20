<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetStrikeout</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiTextPr/SetStrikeout", "textdocumentapi");%>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTextPr;
oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetStrikeout(true);
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("A sample text struck out with a single line.");
builder.SaveFile("docx", "SetStrikeout.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4898176&doc=V3gxTDNMVzFrU1lUYVhDdERtY01OT0lYTjJFZjRsbU4rK1o0VlA5Q25DZz0_IjQ4OTgxNzYi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
