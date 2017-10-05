<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetIndLeft</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiParaPr/SetIndLeft", "textdocumentapi");%>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oParaPr;
var oMyStyle = oDocument.CreateStyle("My document style");
oParaPr = oMyStyle.GetParaPr();
oParaPr.SetIndLeft(2880);
oParagraph = oDocument.GetElement(0);
oParagraph.SetStyle(oMyStyle);
oParagraph.AddText("This is the first paragraph with the indent of 2 inches set to it. ");
oParagraph.AddText("This indent is set by the paragraph style. No paragraph inline style is applied. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.");
oParagraph = Api.CreateParagraph();
oParagraph.SetStyle(oMyStyle);
oParagraph.AddText("This is the second paragraph with the indent of 2 inches set to it. ");
oParagraph.AddText("This indent is set by the paragraph style. No paragraph inline style is applied. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "SetIndLeft.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4891342&doc=eHB1dXR5ZGRVd2J6SzFKc2w5dHVDNmE0QXE4b1AzVlJxZGdNMnJPYjVPRT0_IjQ4OTEzNDIi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
