<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetIndFirstLine</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiParagraph/SetIndFirstLine", "textdocumentapi");%>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is a paragraph with the indent of 1 inch set to the first line. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.");
oParagraph.SetIndFirstLine(1440);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is a paragraph without any indent set to the first line. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "SetIndFirstLine.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4889081&doc=SFowTDRHN1E5MTBlV3I2VXF5SVJ3Z1JiWUU3YkRESlBtNGN3V0Z6bVlSbz0_IjQ4ODkwODEi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>