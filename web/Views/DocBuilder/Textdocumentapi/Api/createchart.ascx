<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateChart</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/Api/CreateChart", "textdocumentapi");%>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>
builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oDrawing;
oParagraph = oDocument.GetElement(0);
oDrawing = Api.CreateChart("bar3D", [[200, 240, 280],[250, 260, 280]], ["Projected Revenue", "Estimated Costs"], [2014, 2015, 2016], 4051300, 2347595, 24);
oParagraph.AddDrawing(oDrawing);
builder.SaveFile("docx", "CreateChart.docx");
builder.CloseFile();
</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4882140&doc=QnRiU2QvUk9pVnA0QW9VY0RWclhteGlxS0NYa1AxVks1NnhGSmhsNHFDcz0_IjQ4ODIxNDAi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>