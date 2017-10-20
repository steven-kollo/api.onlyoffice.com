<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">AddTabStop</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiParagraph/AddTabStop", "textdocumentapi");%>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is just a sample text. After it three tab stops will be added.");
oParagraph.AddTabStop();
oParagraph.AddTabStop();
oParagraph.AddTabStop();
oParagraph.AddText("This is the text which starts after the tab stops.");
builder.SaveFile("docx", "AddTabStop.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4888994&doc=SmpRdnJSWEFCRmhPOVZWQzRvRDVlRjI0VlFVYkFOV0ZobHRPTFJrckI4ND0_IjQ4ODg5OTQi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
