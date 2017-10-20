<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetItalic</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiRun/SetItalic", "textdocumentapi");%>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oRun;
oParagraph = oDocument.GetElement(0);
oRun = Api.CreateRun();
oRun.AddText("This is just a sample text. ");
oParagraph.AddElement(oRun);
oRun = Api.CreateRun();
oRun.SetItalic(true);
oRun.AddText("This is a text run with the font set to italicized letters.");
oParagraph.AddElement(oRun);
builder.SaveFile("docx", "SetItalic.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4892197&doc=OFJTWTUxemNEN2tTN2FjQmJuVlUvSWlOTThGNGlWVEJCWlpwRzZQZUhDRT0_IjQ4OTIxOTci0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
