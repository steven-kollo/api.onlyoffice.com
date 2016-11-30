<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetNumPr</span>
</h1>

<h4 class="header-gray" id="SetNumPr">SetNumPr(oNumPr, nLvl<sub>opt</sub>)</h4>
                <dl class="details">
                <dt>Inherited From:</dt>
                <dd><ul><li>
                    <a href="<%= Url.Action("textdocumentapi/apiparapr/setnumpr") %>">ApiParaPr.SetNumPr</a>
                </li></ul></dd>
                </dl>
<p class="dscr">Specify that the current paragraph references a numbering definition instance in the current document.</p>

<h2>Parameters:</h2>
                <table class="table">
                <thead>
                    <tr class="tablerow">
                        <td>Name</td>
                        <td>Type</td>
                        <td>Attributes</td>
                        <td>Default</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><em>oNumPr</em></td>
                        <td>
                        <a href="<%= Url.Action("textdocumentapi/apinumbering") %>">ApiNumbering</a>
                        </td>
                        <td></td>
                        <td></td>
                        <td>Specifies a numbering definition.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>nLvl</em></td>
                        <td>
                        <em>number</em>
                        </td>
                        <td> &lt;optional></td>
                        <td>0</td>
                        <td>Specifies a numbering level reference. If the current instance of the <em>ApiParaPr</em> class is direct formatting of a paragraph, then this parameter <b>MUST BE</b> specified. Otherwise if the current instance of the <em>ApiParaPr</em> class is the part of <em>ApiStyle</em> properties, this parameter will be ignored.</td>
                    </tr>
                </tbody>
                </table>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oParaPr, oNumbering;
var oMyStyle = oDocument.CreateStyle("My document style");
oParaPr = oMyStyle.GetParaPr();
oNumbering = oDocument.CreateNumbering("bullet");
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
oParagraph = Api.CreateParagraph();
oParagraph.SetStyle(oMyStyle);
oParagraph.SetNumPr(oNumbering, 3);
oParagraph.AddText("This is a paragraph styled as level 4 of a bulleted list.");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "SetNumPr.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4891385&doc=QiszWDNyVzUrNDkrNjZZYURGVDR1dTBXaTZqNDR5TGNDaDZjQ2dqRXRjTT0_IjQ4OTEzODUi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>