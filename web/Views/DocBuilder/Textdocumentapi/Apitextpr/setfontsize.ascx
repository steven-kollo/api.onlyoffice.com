<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetFontSize</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiTextPr/SetFontSize", "textdocumentapi");%>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTextPr;
oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetFontSize(30);
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("A sample text with the font size set to 15 points using the text properties.");
builder.SaveFile("docx", "SetFontSize.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4898091&doc=YmtJMFJNbHpqZjV2eEdiRjl1c09DeVFBdzJnUTBEUit5NFNSK1ZtMEFzdz0_IjQ4OTgwOTEi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>