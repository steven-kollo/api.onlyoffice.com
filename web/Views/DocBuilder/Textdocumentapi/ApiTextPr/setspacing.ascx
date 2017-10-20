<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetSpacing</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiTextPr/SetSpacing", "textdocumentapi");%>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTextPr;
oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetSpacing(80);
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("A sample text with the spacing set to 4 points (80 twentieths of a point).");
builder.SaveFile("docx", "SetSpacing.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4898162&doc=L3BQWVowc3VYVitZa0ZHb0NoWHdEM2I5ZjJjWndQYVBNNnBvTWRBT21FMD0_IjQ4OTgxNjIi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
