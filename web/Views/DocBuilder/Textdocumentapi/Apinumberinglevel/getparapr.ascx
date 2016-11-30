<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetParaPr</span>
</h1>


<h4 class="header-gray" id="GetParaPr">GetParaPr() &rarr; {<a href="<%= Url.Action("textdocumentapi/apiparapr") %>">ApiParaPr</a>}</h4>
<p class="dscr">The paragraph properties which are applied to any numbered paragraph that references the given numbering definition and numbering level.</p>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action("textdocumentapi/apiparapr") %>">ApiParaPr</a>
    </dd>
</dl>
            
<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oNumbering, oNumLvl, oParaPr;
oNumbering = oDocument.CreateNumbering("numbered");
oNumLvl = oNumbering.GetLevel(0);
oParaPr = oNumLvl.GetParaPr();
oParaPr.SetSpacingLine(480, "auto");
oParaPr.SetJc("both");
oParaPr.SetIndFirstLine(720);
oParagraph = oDocument.GetElement(0);
oParagraph.SetNumbering(oNumLvl);
oParagraph.AddText("This is the first element of a parent numbered list which starts with '1'");
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is the second element of a parent numbered list which starts with '2'");
oParagraph.SetNumbering(oNumLvl);
oDocument.Push(oParagraph);
builder.SaveFile("docx", "GetParaPr.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4912731&doc=U1VqKy9iNlpUU3JQbWp4b2owU2hOblVFY0NXcjJNSXhMTGJQbTBrM1U2RT0_IjQ5MTI3MzEi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>