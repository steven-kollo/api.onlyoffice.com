<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">AddElement</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiParagraph/AddElement", "textdocumentapi");%>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oRun;
oParagraph = oDocument.GetElement(0);
oRun = Api.CreateRun();
oRun.AddText("This is the text for a text run. Nothing special.");
oParagraph.AddElement(oRun);
builder.SaveFile("docx", "AddElement.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4888988&doc=Y3BsZDRPbGJhNTZqVUJ0dFE0azIvWjYyU2ZEZ1FuUmpscnVUTlRrRW8xQT0_IjQ4ODg5ODgi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>