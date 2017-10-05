<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">ApiNumberingLevel</span>
</h1>

<h4 class="header-gray" id="ApiNumberingLevel">new ApiNumberingLevel()</h4>
<p class="dscr">Class representing a reference to a specified numbering level.</p>

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
                        <td><a href="<%= Url.Action("textdocumentapi/apinumberinglevel/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apinumberinglevel/getlevelindex") %>">GetLevelIndex</a></td>
                        <td>Get the level index.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apinumberinglevel/getnumbering") %>">GetNumbering</a></td>
                        <td>Get the numbering definition.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apinumberinglevel/getparapr") %>">GetParaPr</a></td>
                        <td>The paragraph properties which are applied to any numbered paragraph that references the given numbering definition and numbering level.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apinumberinglevel/gettextpr") %>">GetTextPr</a></td>
                        <td>Specify the text properties which will be applied to the text in the current numbering level itself, not to the text in the subsequent paragraph.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apinumberinglevel/setcustomtype") %>">SetCustomType</a></td>
                        <td>Set your own customized numbering type.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apinumberinglevel/setrestart") %>">SetRestart</a></td>
                        <td>Specify a one-based index which determines when a numbering level should restart to its starting value. A numbering level restarts when an instance of the specified numbering level, which will be higher (earlier than the this level) is used in the given document contents. By default this value is true.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apinumberinglevel/setstart") %>">SetStart</a></td>
                        <td>Specify the starting value for the numbering used by the parent numbering level within a given numbering level definition. By default this value is 1.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apinumberinglevel/setsuff") %>">SetSuff</a></td>
                        <td>Specify the content which will be added between a given numbering level text and the text of every numbered paragraph which references that numbering level. By default this value is <em>"tab"</em>.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apinumberinglevel/settemplatetype") %>">SetTemplateType</a></td>
                        <td>Set one of the existing predefined numbering templates.</td>
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

builder.SaveFile("docx", "ApiNumberingLevel.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4888909&doc=TFJjR3pqa2cvMDY5ZWxjVVprN1p2MEE1YWxJVFVxMTl1RGJpRUlJUGRMZz0_IjQ4ODg5MDki0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
