<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetTextPr</span>
</h1>

<h4 class="header-gray" id="GetTextPr">GetTextPr() &rarr; {<a href="<%= Url.Action("textdocumentapi/apitextpr") %>">ApiTextPr</a>}</h4>
<p class="dscr">
Get the text properties of the current run.
</p>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action("textdocumentapi/apitextpr") %>">ApiTextPr</a>
    </dd>
</dl>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oRun, oTextPr;
var MyNewRunStyle = oDocument.CreateStyle("My New Run Style", "run");
oTextPr = MyNewRunStyle.GetTextPr();
oTextPr.SetCaps(true);
oTextPr.SetFontFamily("Calibri Light");
oParagraph = oDocument.GetElement(0);
oRun = Api.CreateRun();
oRun.AddText("This is just a sample text. ");
oRun.AddText("The text properties are changed and the style is added to the paragraph. ");
oParagraph.AddElement(oRun);
oRun = Api.CreateRun();
oRun.SetStyle(MyNewRunStyle);
oRun.AddText("This is a text run with its own style.");
oParagraph.AddElement(oRun);
builder.SaveFile("docx", "GetTextPr.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4891497&doc=YWxqVHBPNUQyQ2tYUm53b2p2TzRnNW9EYk9sbkg2K2dFcWE4Q3ZCRFVkMD0_IjQ4OTE0OTci0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>