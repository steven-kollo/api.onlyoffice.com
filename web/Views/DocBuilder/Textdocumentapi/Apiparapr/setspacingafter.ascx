<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetSpacingAfter</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiParaPr/SetSpacingAfter", "textdocumentapi");%>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oParaPr;
var oMyStyle = oDocument.CreateStyle("My document style");
oParaPr = oMyStyle.GetParaPr();
oParaPr.SetSpacingAfter(1440);
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is an example of setting a space after a paragraph. ");
oParagraph.AddText("The second paragraph will have an offset of one inch from the top. ");
oParagraph.AddText("This is due to the fact that the first paragraph has this offset enabled.");
oParagraph.SetStyle(oMyStyle);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is the second paragraph and it is one inch away from the first paragraph.");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "SetSpacingAfter.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4891391&doc=VjFJUlM3UmdhU0F1VUtWOHZ0U01ITTlnc0xKbmpTcWZFWHVib0swZjFVUT0_IjQ4OTEzOTEi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>