<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetElement</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiDocumentContent/GetElement", "textdocumentapi");%>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
var oSection = oDocument.GetFinalSection();
var oDocContent = oSection.GetHeader("default", true);
oParagraph = oDocContent.GetElement(0);
oParagraph.AddText("This is the text in the default header");
builder.SaveFile("docx", "GetElement.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4910950&doc=MzJoZWdWWjVoZ3ZOK1Fnb3R4eEVjV2pDZHdiUzVRTUd0cVhzU1R6cmVCaz0_IjQ5MTA5NTAi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>