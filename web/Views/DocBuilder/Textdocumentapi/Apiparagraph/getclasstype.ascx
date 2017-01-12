<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetClassType</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiParagraph/GetClassType", "textdocumentapi");%>


<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
oParagraph = oDocument.GetElement(0);
var oClassType = oParagraph.GetClassType();
oParagraph.AddText("Class Type = " + oClassType);
builder.SaveFile("docx", "GetClassType.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4896240&doc=N0xyUjdxdE9UMXpzYVUwZ0tWTmNnaEdENTVJcjlYM0tPRFd5bThjZ2lqdz0_IjQ4OTYyNDAi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>