<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetIndLeft</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiParagraph/SetIndLeft", "textdocumentapi");%>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is a paragraph with the indent of 2 inches set to it. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.SetIndLeft(2880);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is a paragraph without any indent set to it. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "SetIndLeft.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4889083&doc=akpoOTJWd1pNcHpDeUpLUE9EbzFWRk05S2RlUkovUkpYM0Z2eldENnM5ST0_IjQ4ODkwODMi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>