<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetUnderline</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiRun/SetUnderline", "textdocumentapi");%>

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
oRun.SetUnderline(true);
oRun.AddText("This is a text run with the text underlined with a single line.");
oParagraph.AddElement(oRun);
builder.SaveFile("docx", "SetUnderline.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4892235&doc=L3d4Sm5zaTdKb2JZSDJ0WmlmQVBJM08yYWJKM2k3MFJNZGNwYW93eU53Yz0_IjQ4OTIyMzUi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
