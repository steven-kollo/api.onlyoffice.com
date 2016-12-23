<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetJc</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiParaPr/SetJc", "textdocumentapi");%>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oParaPr;
var oMyStyleLeft = oDocument.CreateStyle("My style with left text alignment");
oParaPr = oMyStyleLeft.GetParaPr();
oParaPr.SetJc("left");
var oMyStyleRight = oDocument.CreateStyle("My style with right text alignment");
oParaPr = oMyStyleRight.GetParaPr();
oParaPr.SetJc("right");
var oMyStyleCenter = oDocument.CreateStyle("My style with center text alignment");
oParaPr = oMyStyleCenter.GetParaPr();
oParaPr.SetJc("center");
var oMyStyleBoth = oDocument.CreateStyle("My style with justify text alignment");
oParaPr = oMyStyleBoth.GetParaPr();
oParaPr.SetJc("both");
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is a paragraph with the text in it aligned by the left side. ");
oParagraph.AddText("The justification is specified in the paragraph style. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.");
oParagraph.SetStyle(oMyStyleLeft);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is a paragraph with the text in it aligned by the right side. ");
oParagraph.AddText("The justification is specified in the paragraph style. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.");
oParagraph.SetStyle(oMyStyleRight);
oDocument.Push(oParagraph);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is a paragraph with the text in it aligned by the center. ");
oParagraph.AddText("The justification is specified in the paragraph style. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.");
oParagraph.SetStyle(oMyStyleCenter);
oDocument.Push(oParagraph);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is a paragraph with the text in it aligned by both sides (justified). ");
oParagraph.AddText("The justification is specified in the paragraph style. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.");
oParagraph.SetStyle(oMyStyleBoth);
oDocument.Push(oParagraph);
builder.SaveFile("docx", "SetJc.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4891347&doc=SVV0aDYraDNsZjYwU0gyTzdBbmRxVDRwMXVNYWlNT3pEK3FQbkhpVFpzND0_IjQ4OTEzNDci0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>