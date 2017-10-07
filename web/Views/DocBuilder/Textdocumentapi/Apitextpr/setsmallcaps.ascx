<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetSmallCaps</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiTextPr/SetSmallCaps", "textdocumentapi");%>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTextPr;
oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetSmallCaps(true);
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("A sample text with the font set to small capitalized letters.");
builder.SaveFile("docx", "SetSmallCaps.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4898158&doc=N2VuczFLcmxCNTlNS3g4aktDT3ZSOElObTRFdXl3Zmc1aFJWZlV1dHU1UT0_IjQ4OTgxNTgi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
