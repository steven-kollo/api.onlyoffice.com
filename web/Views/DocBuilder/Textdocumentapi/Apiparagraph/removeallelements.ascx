<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">RemoveAllElements</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiParagraph/RemoveAllElements", "textdocumentapi");%>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oRun;
oParagraph = oDocument.GetElement(0);
oParagraph.RemoveAllElements();
oRun = Api.CreateRun();
oRun.AddText("This is the first document paragraph. We removed all the elements to get the number of paragraph elements at this point: ");
oRun.AddText("" + oParagraph.GetElementsCount() + ". If we had not done that the number before this sentence would be '1'.");
oParagraph.AddElement(oRun);
oParagraph = Api.CreateParagraph();
oRun = Api.CreateRun();
oRun.AddText("This is the second paragraph. It is created without any elements, so there is no need to remove them. The number of paragraph elements at this point: ");
oRun.AddText("" + oParagraph.GetElementsCount() + ". It is '0' and should be that way.");
oParagraph.AddElement(oRun);
oDocument.Push(oParagraph);
builder.SaveFile("docx", "RemoveAllElements.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4889044&doc=R0ttQVJzcmYxZ2dndm91bHl5bW4wZGNhcE1XOG9vcEx0R3R4ci96TThlOD0_IjQ4ODkwNDQi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
