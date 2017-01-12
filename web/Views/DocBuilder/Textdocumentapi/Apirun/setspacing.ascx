<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetSpacing</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiRun/SetSpacing", "textdocumentapi");%>

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
oRun.SetSpacing(80);
oRun.AddText("This is a text run with the text spacing set to 4 points (20 twentieths of a point).");
oParagraph.AddElement(oRun);
builder.SaveFile("docx", "SetSpacing.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4892218&doc=UTVOMjNSWjRBU3g1MXZOMTdBMEZSTlBDVVhod3N0OVN1TWVCeTFDbEhRND0_IjQ4OTIyMTgi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>