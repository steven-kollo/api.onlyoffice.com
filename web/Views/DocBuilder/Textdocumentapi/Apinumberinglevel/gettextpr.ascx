<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetTextPr</span>
</h1>

<h4 class="header-gray" id="GetTextPr">GetTextPr() &rarr; {<a href="<%= Url.Action("textdocumentapi/apitextpr") %>">ApiTextPr</a>}</h4>
<p class="dscr">Specify the text properties which will be applied to the text in the current numbering level itself, not to the text in the subsequent paragraph.</p>
<div class="note">To change the text style for the paragraph, a style must be applied to it using the <a href="<%= Url.Action("textdocumentapi/apirun/setstyle") %>">ApiRun.SetStyle</a> method.</div>

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
var oParagraph, oNumbering, oNumLvl, oTextPr;
oNumbering = oDocument.CreateNumbering("numbered");
oNumLvl = oNumbering.GetLevel(0);
oTextPr = oNumLvl.GetTextPr();
oTextPr.SetBold(true);
oTextPr.SetFontFamily("Calibri");
oTextPr.SetFontSize(28);
oParagraph = oDocument.GetElement(0);
oParagraph.SetNumbering(oNumLvl);
oParagraph.AddText("This is the first element of a numbered list which starts with '1'");
oParagraph = Api.CreateParagraph();
oParagraph.SetNumbering(oNumLvl);
oParagraph.AddText("This is the second element of a numbered list which starts with '2'");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "GetTextPr.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4912735&doc=WEE4QXhGT1pCVFZLNE8xWUdxQWtJWHRpMWRXKzQrUDhIVDVwZHIrUDJQND0_IjQ5MTI3MzUi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>