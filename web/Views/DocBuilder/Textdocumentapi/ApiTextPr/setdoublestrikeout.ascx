<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetDoubleStrikeout</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiTextPr/SetDoubleStrikeout", "textdocumentapi");%>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTextPr;
oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetDoubleStrikeout(true);
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("A sample text struck out with two lines using the text properties.");
builder.SaveFile("docx", "SetDoubleStrikeout.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4898106&doc=dklUTklHb1JPOXRrL3ZKZUxDQWlEQzBpWnR3LzMvcHBzMXpldlVOdERsZz0_IjQ4OTgxMDYi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
