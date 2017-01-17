<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetCustomType</span>
</h1>

<h4 class="header-gray" id="SetCustomType">SetCustomType(sType, sTextFormatString, sAlign)</h4>
<p class="dscr">Set your own customized numbering type.</p>

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
                        <td><em>sType</em></td>
                        <td>
                
<em>"none"</em>
|
<em>"bullet"</em>
|
<em>"decimal"</em>
|
<em>"lowerRoman"</em>
|
<em>"upperRoman"</em>
|
<em>"lowerLetter"</em>
|
<em>"upperLetter"</em>
|
<em>"decimalZero"</em>
                        </td>
                        <td>The custom numbering type used for the current numbering definition.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>sTextFormatString</em></td>
                        <td>                
                        <em>string</em>
                        </td>
                        <td>Any text in this parameter will be taken as literal text to be repeated in each instance of this numbering level, except for any use of the percent symbol (%) followed by a number, which will be used to indicate the one-based index of the number to be used at this level. Any number of a level higher than this level will be ignored.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>sAlign</em></td>
                        <td>
                
<em>"left"</em>
|
<em>"right"</em>
|
<em>"center"</em>
            </td>
                        <td>Type of justification applied to the text run in the current numbering level.</td>
                    </tr>
                </tbody>
                </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
oNumbering = oDocument.CreateNumbering("numbered");
for (var nLvl = 0; nLvl < 8; ++nLvl)
{
	oNumLvl = oNumbering.GetLevel(nLvl);

	var sFormatString = "";
	for (var nTempLvl = 0; nTempLvl <= nLvl; ++nTempLvl)
		sFormatString += "%" + nTempLvl + ".";

	oNumLvl.SetCustomType("lowerRoman", sFormatString, "left");
	oNumLvl.SetStart(nLvl + 1);
	oNumLvl.SetSuff("space");

	oParagraph = Api.CreateParagraph();
	oParagraph.AddText("Custom numbered lvl " + (nLvl + 1));
	oParagraph.SetNumbering(oNumLvl);
	oParagraph.SetContextualSpacing(true);
	oDocument.Push(oParagraph);

	oParagraph = Api.CreateParagraph();
	oParagraph.AddText("Custom numbered lvl " + (nLvl + 1));
	oParagraph.SetNumbering(oNumLvl);
	oParagraph.SetContextualSpacing(true);
	oDocument.Push(oParagraph);
}
builder.SaveFile("docx", "SetCustomType.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4888909&doc=NnNpRnFoR1draGhob2dPT2dIb0pnSlEwQWs0c0ZXN0pVT2I4dUl0NHhIQT0_IjQ4ODg5MDki0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>