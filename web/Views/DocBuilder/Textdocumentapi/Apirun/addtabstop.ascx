<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">AddTabStop</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiRun/AddTabStop", "textdocumentapi");%>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oRun;
oParagraph = oDocument.GetElement(0);
oRun = Api.CreateRun();
oRun.AddText("This is just a sample text. After it three tab stops will be added.");
oRun.AddTabStop();
oRun.AddTabStop();
oRun.AddTabStop();
oRun.AddText("This is the text which starts after the tab stops.");
oParagraph.AddElement(oRun);
builder.SaveFile("docx", "AddTabStop.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4891437&doc=QmtPaGNWRk40TmFqbllPTE5oc1Fady9GQ3VXeEJibjVRZElSZm5FOUN4VT0_IjQ4OTE0Mzci0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>