<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetParaPr</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiParagraph/GetParaPr", "textdocumentapi");%>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oParaPr;
oParagraph = oDocument.GetElement(0);
var oParaStyle = oDocument.GetDefaultStyle("paragraph");
oParagraph = oDocument.GetElement(0);
oParagraph.SetStyle(oParaStyle);
oParaPr = oParagraph.GetParaPr();
oParaPr.SetSpacingLine(480, "auto");
oParaPr.SetJc("both");
oParaPr.SetIndFirstLine(720);
oParagraph.AddText("This is a paragraph with the line spacing, text justification and indent set using the paragraph style. ");
oParagraph.AddText("We do not change the style of the paragraph itself. ");
oParagraph.AddText("Only document-wide paragraph styles are applied.");
builder.SaveFile("docx", "GetParaPr.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4912815&doc=SDZYU2lzZi9UU0dKUWRiT0Q4cE96QlE5RS9aWG9FNWRtS0Q2RTdlU05OVT0_IjQ5MTI4MTUi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>