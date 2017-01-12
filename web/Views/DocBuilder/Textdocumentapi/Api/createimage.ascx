<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateImage</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/Api/CreateImage", "textdocumentapi");%>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oDrawing;
oParagraph = oDocument.GetElement(0);
oDrawing = Api.CreateImage("https://api.onlyoffice.com/content/img/docbuilder/examples/coordinate_aspects.png", 60 * 36000, 35 * 36000);
oParagraph.AddDrawing(oDrawing);
builder.SaveFile("docx", "CreateImage.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4882168&doc=M2grR2tVeWRKV1F5a0hnbVVBdk43UTROUzlyZEc3VkpFVE5nV3Fnc0VYOD0_IjQ4ODIxNjgi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>