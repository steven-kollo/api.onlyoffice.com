<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetStrikeout</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiRun/SetStrikeout", "textdocumentapi");%>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oRun;
oParagraph = oDocument.GetElement(0);
oRun = Api.CreateRun();
oRun.AddText("This is just a sample text. ");
oParagraph.AddElement(oRun);
oRun = Api.CreateRun();
oRun.SetStrikeout(true);
oRun.AddText("This is a text run with the text struck out with a single line.");
oParagraph.AddElement(oRun);
builder.SaveFile("docx", "SetStrikeout.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4892224&doc=REM1MmJaeSs0UTZPSDQ1Z0w0aVp0L1c2SXhZNEo2c2xuVlAzOTZOdytwcz0_IjQ4OTIyMjQi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>