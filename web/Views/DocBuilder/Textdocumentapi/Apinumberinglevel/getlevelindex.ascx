<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetLevelIndex</span>
</h1>

<h4 class="header-gray" id="GetLevelIndex">GetLevelIndex() &rarr; {number}</h4>
<p class="dscr">Get the level index.</p>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <em>number</em>
    </dd>
</dl>
            
<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oNumbering, oNumLvl, oNumLvl1;
oNumbering = oDocument.CreateNumbering("numbered");
oNumLvl = oNumbering.GetLevel(0);
oNumLvl1 = oNumbering.GetLevel(1);
oNumLvl1.SetRestart(false);
oParagraph = oDocument.GetElement(0);
oParagraph.SetNumbering(oNumLvl);
oParagraph.AddText("This is the first element of a parent numbered list which starts with '1'");
oParagraph = Api.CreateParagraph();
oParagraph.SetNumbering(oNumLvl1);
oParagraph.AddText("This is the first element of a child numbered list which starts with 'a'");
oDocument.Push(oParagraph);
oParagraph = Api.CreateParagraph();
oParagraph.SetNumbering(oNumLvl1);
oParagraph.AddText("This is the second element of a child numbered list which starts with 'b'");
oDocument.Push(oParagraph);
oParagraph = Api.CreateParagraph();
var oLevelIndex = oNumLvl.GetLevelIndex();
oParagraph.AddText("Level index for the parent numbered list = " + oLevelIndex);
oDocument.Push(oParagraph);
oParagraph = Api.CreateParagraph();
var oLevelIndex = oNumLvl1.GetLevelIndex();
oParagraph.AddText("Level index for the element of a child numbered list  = " + oLevelIndex);
oDocument.Push(oParagraph);
builder.SaveFile("docx", "GetLevelIndex.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4912541&doc=ZWFmSTFkdi9xZVlsNXRWWEU1TFVlUjRMOU9UUmNkbUczbjZ0cEsyRkRqTT0_IjQ5MTI1NDEi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>