<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetFontFamily</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiRun/SetFontFamily", "textdocumentapi");%>

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
oRun.SetFontFamily("Calibri Light");
oRun.AddText("This is a text run with the font family set to 'Calibri Light'.");
oParagraph.AddElement(oRun);
builder.SaveFile("docx", "SetFontFamily.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4892189&doc=R3FrQnVwQTNQKytxQnEzTnNPMEc4WXZmNHlyaEtNSzBVRXNPaStXYVFtMD0_IjQ4OTIxODki0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>