<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateParagraph</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/Api/CreateParagraph", "textdocumentapi");%>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oGs1, oGs2, oFill, oStroke, oDrawing, oParagraph;
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is a new paragraph");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "CreateParagraph.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4882310&doc=NUdkSjVKQkU0TXhOb2JIM08vejhuOG8rR1Q4WW9QcUZkdUthMDZNcjFGUT0_IjQ4ODIzMTAi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
