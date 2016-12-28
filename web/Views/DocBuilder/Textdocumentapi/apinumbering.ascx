<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">ApiNumbering</span>
</h1>

<h4 class="header-gray" id="ApiNumbering">new ApiNumbering()</h4>
<p class="dscr">Class representing numbering properties.</p>

<h2>Methods</h2>
<table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apinumbering/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apinumbering/getlevel") %>">GetLevel</a></td>
                        <td>Get the specified level of the current numbering.</td>
                    </tr>
                </tbody>
            </table>

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
builder.SaveFile("docx", "ApiNumbering.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4888904&doc=UlNNeXNNaEpjcXdWS2tUNWpZZUxqOXZOdkEyTG84S2wrTTQyMTBzL2xKST0_IjQ4ODg5MDQi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>