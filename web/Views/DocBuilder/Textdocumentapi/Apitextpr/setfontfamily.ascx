<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetFontFamily</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiTextPr/SetFontFamily", "textdocumentapi");%>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTextPr;
oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetFontFamily("Comic Sans MS");
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("A sample text with the font family set to 'Comic Sans MS' using the text properties.");
builder.SaveFile("docx", "SetFontFamily.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4898098&doc=amxNQi9iY1h2RnlvdzllQUZ0K0NSQkpjeWI2amROTjh0Sk9vKzNFNnR3Zz0_IjQ4OTgwOTgi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>