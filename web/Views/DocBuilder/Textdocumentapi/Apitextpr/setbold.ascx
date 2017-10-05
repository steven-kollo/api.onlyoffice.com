<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetBold</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiTextPr/SetBold", "textdocumentapi");%>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTextPr;
oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetBold(true);
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("A sample text with the font weight set to bold using the text properties.");
builder.SaveFile("docx", "SetBold.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4898099&doc=NDhyZ1FXcTN5OVZYSHVJYVdzaDVtQTlBT2NXd0Nnd240a1NneE9QM0Zscz0_IjQ4OTgwOTki0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
