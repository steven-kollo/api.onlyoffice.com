<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetNumbering</span>
</h1>

<h4 class="header-gray" id="GetNumbering">GetNumbering() &rarr; (nullable) {<a href="<%= Url.Action("textdocumentapi/apinumberinglevel") %>">ApiNumberingLevel</a>}</h4>
<p class="dscr">Get a numbering definition and numbering level for the numbered list.</p>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action("textdocumentapi/apinumberinglevel") %>">ApiNumberingLevel</a>
    </dd>
</dl>
            
<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>
builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oNumLvl, oNumbering, oNumbering1;
oNumbering = oDocument.CreateNumbering("numbered");
oNumLvl = oNumbering.GetLevel(0);
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is the first element of a numbered list");
oParagraph.SetNumbering(oNumLvl);
oParagraph.SetContextualSpacing(true);
oNumbering1 = oParagraph.GetNumbering();
oNumLvl = oNumbering.GetLevel(0);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is the second element of a numbered list");
oParagraph.SetNumbering(oNumLvl);
oParagraph.SetContextualSpacing(true);
oDocument.Push(oParagraph);
builder.SaveFile("docx", "GetNumbering.docx");
builder.CloseFile();
</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4889027&doc=WnRDeE9JTTlLQ1E3ZG0rUnpiVWpoRGh1T3hqVG96NzdhcUo5dm9xektHcz0_IjQ4ODkwMjci0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>