<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">AddElement</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiDocumentContent/AddElement", "textdocumentapi");%>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oStroke, oFill, oDocContent;
oParagraph = oDocument.GetElement(0);
oFill = Api.CreateSolidFill(Api.CreateRGBColor(104, 155, 104));
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
oDrawing = Api.CreateShape("rect", 3212465, 963295, oFill, oStroke);
oParagraph.AddDrawing(oDrawing);
oDocContent = oDrawing.GetDocContent();
oDocContent.RemoveAllElements();
oParagraph = Api.CreateParagraph();
oParagraph.AddText("We removed all elements from the shape and added a new paragraph inside it.");
oDocContent.AddElement(oParagraph);
oDocContent.Push(oParagraph);
builder.SaveFile("docx", "AddElement.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4910946&doc=c3FDd0QyQmdTZHU3UWcvOG9KZFpWN3RidHRpdzg3SkpVMkJRWjZodUo2TT0_IjQ5MTA5NDYi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>