<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetUnderline</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiTextPr/SetUnderline", "textdocumentapi");%>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTextPr;
oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetUnderline(true);
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("A sample text underlined with a single line.");
builder.SaveFile("docx", "SetUnderline.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4898203&doc=K0NHTVhqaURIQ3BZU3ZmMEV6bm1MbTVmdE5pR2ZlaEsxSHR2c21NYVNmQT0_IjQ4OTgyMDMi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>