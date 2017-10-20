<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetTabs</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiParaPr/SetTabs", "textdocumentapi");%>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oParaPr;
var oMyStyle = oDocument.CreateStyle("My document style");
oParaPr = oMyStyle.GetParaPr();
oParaPr.SetTabs([1440, 4320, 7200], ["left", "center", "right"]);
oParagraph = oDocument.GetElement(0);
oParagraph.SetStyle(oMyStyle);
oParagraph.AddTabStop();
oParagraph.AddText("Custom tab - 1 inch left");
oParagraph.AddLineBreak();
oParagraph.AddTabStop();
oParagraph.AddTabStop();
oParagraph.AddText("Custom tab - 3 inches center");
oParagraph.AddLineBreak();
oParagraph.AddTabStop();
oParagraph.AddTabStop();
oParagraph.AddTabStop();
oParagraph.AddText("Custom tab - 5 inches right");
builder.SaveFile("docx", "SetTabs.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4891405&doc=eFprbWg0dGx1SWtnL2JpR0w1dU03QS9UVXg2K2xZazBCRG5HNHBUazJ3OD0_IjQ4OTE0MDUi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
