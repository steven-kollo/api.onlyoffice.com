<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetJc</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiParagraph/SetJc", "textdocumentapi");%>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is a paragraph with the text in it aligned by the left side. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.");
oParagraph.SetJc("left");
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is a paragraph with the text in it aligned by the right side. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.");
oParagraph.SetJc("right");
oDocument.Push(oParagraph);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is a paragraph with the text in it aligned by the center. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.");
oParagraph.SetJc("center");
oDocument.Push(oParagraph);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is a paragraph with the text in it aligned by both sides (justified). ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.");
oParagraph.SetJc("both");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "SetJc.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4889108&doc=YzhrS1VPYU5qd09rS081S3BjV2Qvems3emhkOHkwSGVGN2pMM3hSSWlaTT0_IjQ4ODkxMDgi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>