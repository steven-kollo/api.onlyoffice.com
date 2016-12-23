<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">AddText</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiParagraph/AddText", "textdocumentapi");%>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is just a sample text. Nothing special.");
builder.SaveFile("docx", "AddText.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4888995&doc=WTExTGNydEtkdStsQVJMSy93bS9rT1FjSW1wMFpmL1lwa08wQWdnR1MwOD0_IjQ4ODg5OTUi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>