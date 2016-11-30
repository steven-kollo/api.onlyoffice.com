<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetNumbering</span>
</h1>

<h4 class="header-gray" id="SetNumbering">SetNumbering(oNumberingLevel)</h4>
             
<dl class="details">
                <dt>See:</dt>
                <dd>
                <ul>
                    <li>Same as <a href="<%= Url.Action("textdocumentapi/apiparagraph/setnumpr") %>">ApiParagraph.SetNumPr</a></li>
                </ul>
                </dd>
                </dl>

<p class="dscr">Specify that the current paragraph references a numbering definition instance in the current document.</p>

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
                        <td><em>oNumberingLevel</em></td>
                        <td>                
                        <a href="<%= Url.Action("textdocumentapi/apinumberinglevel") %>">ApiNumberingLevel</a>
                        </td>
                        <td>The numbering level which will be used for assigning the numbers to the paragraph.</td>
                    </tr>
                </tbody>
                </table>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
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
builder.SaveFile("docx", "SetNumbering.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4888904&doc=UlNNeXNNaEpjcXdWS2tUNWpZZUxqOXZOdkEyTG84S2wrTTQyMTBzL2xKST0_IjQ4ODg5MDQi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>