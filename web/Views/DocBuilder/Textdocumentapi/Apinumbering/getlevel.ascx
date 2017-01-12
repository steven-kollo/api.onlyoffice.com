<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetLevel</span>
</h1>

<h4 class="header-gray" id="GetLevel">GetLevel(nLevel) &rarr; {<a href="<%= Url.Action("textdocumentapi/apinumberinglevel") %>">ApiNumberingLevel</a>}</h4>
<p class="dscr">Get the specified level of the current numbering.</p>

<h2>Parameters:</h2>
                <table class="table">
                    <thead>
                        <tr class="tablerow">
                            <td>Name</td>
                            <td>Type</td>
                            <td>Description</td>
                        </tr>
                    </thead>
                    <tbody>
                    <tr class="tablerow">
                        <td><em>nLevel</em></td>
                        <td>                
                        <em>number</em>
                        </td>
                        <td>The numbering level index. This value <b>MUST BE</b> from 0 to 8.</td>
                    </tr>
                </tbody>
                </table>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action("textdocumentapi/apinumberinglevel") %>">ApiNumberingLevel</a>
    </dd>
</dl>
            
<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
var oNumbering = oDocument.CreateNumbering("bullet");
var oNumLvl;
for (var nLvl = 0; nLvl < 8; ++nLvl)
{
oNumLvl = oNumbering.GetLevel(nLvl);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("Default bullet lvl " + (nLvl + 1));
oParagraph.SetNumbering(oNumLvl);
oParagraph.SetContextualSpacing(true);
oDocument.Push(oParagraph);
}
builder.SaveFile("docx", "GetLevel.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4888904&doc=UlNNeXNNaEpjcXdWS2tUNWpZZUxqOXZOdkEyTG84S2wrTTQyMTBzL2xKST0_IjQ4ODg5MDQi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>