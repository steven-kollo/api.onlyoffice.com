<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetNumbering</span>
</h1>

<h4 class="header-gray" id="GetNumbering">GetNumbering() &rarr; {<a href="<%= Url.Action("textdocumentapi/apinumbering") %>">ApiNumbering</a>}</h4>
<p class="dscr">Get the numbering definition.</p>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action("textdocumentapi/apinumbering") %>">ApiNumbering</a>
    </dd>
</dl>
            
<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oNumbering, oNumLvl, oNumLvl1, oNumLvl2;
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
oParagraph.AddText("This is a paragraph without a numbering. ");
oParagraph.AddText("It can be inserted between the numbered elements.");
oDocument.Push(oParagraph);
oNumbering = oNumLvl.GetNumbering();
oNumLvl2 = oNumbering.GetLevel(oNumLvl.GetLevelIndex());
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is the second element of a parent numbered list which starts with '2'");
oParagraph.SetNumbering(oNumLvl2);
oParagraph.SetContextualSpacing(true);
oDocument.Push(oParagraph);
builder.SaveFile("docx", "GetNumbering.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4912719&doc=SWZyL240bkZ4SmNhYjZHN1RidVZ2VVBvMjl2MmJSb0duNmt5WStTWExCWT0_IjQ5MTI3MTki0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>