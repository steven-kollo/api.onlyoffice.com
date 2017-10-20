<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetItalic</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiTextPr/SetItalic", "textdocumentapi");%>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTextPr;
oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetItalic(true);
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("A sample text with the font set to italicized letters using the text properties.");
builder.SaveFile("docx", "SetItalic.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4898123&doc=RjJiYlpnYTZMUUNXWlRteGg4UXBPekcyeVF0V09oTFhTR2VEdzkzYWEycz0_IjQ4OTgxMjMi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
