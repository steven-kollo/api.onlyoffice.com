<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetTemplateType</span>
</h1>

<h4 class="header-gray" id="SetTemplateType">SetTemplateType(sType, sSymbol<sub>opt</sub>)</h4>
<p class="dscr">Set one of the existing predefined numbering templates.</p>

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
                        <td><em>sType</em></td>
                        <td>
                
<em>"none"</em>
|
<em>"bullet"</em>
|
<em>"1)"</em>
|
<em>"1."</em>
|
<em>"I."</em>
|
<em>"A."</em>
|
<em>"a)"</em>
|
<em>"a."</em>
|
<em>"i."</em>
                        </td>
                        <td><br>
                        </td>
                        <td>
                        </td>
                        <td>The numbering type used for the current numbering definition.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>sSymbol</em></td>
                        <td>
                            <em>string</em>
                        </td>
                        <td> &lt;optional><br>
                        </td>
                        <td>""
                        </td>
                        <td>The symbol used for the list numbering. This parameter have a meaning only if the <em>sType="bullet"</em> property is selected.</td>
                    </tr>
                </tbody>
            </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oNumLvl, oNumbering;
oNumbering = oDocument.CreateNumbering("numbered");
oNumLvl = oNumbering.GetLevel(0);
oNumLvl.SetTemplateType("A.");
oParagraph = oDocument.GetElement(0);
oParagraph.SetNumbering(oNumLvl);
oParagraph.AddText("This is the first element of an A.-B.-C. numbered list");
oParagraph = Api.CreateParagraph();
oParagraph.SetNumbering(oNumLvl);
oParagraph.AddText("This is the second element of an A.-B.-C. numbered list");
oDocument.Push(oParagraph);
oParagraph = Api.CreateParagraph();
oParagraph.SetNumbering(oNumLvl);
oParagraph.AddText("This is the third element of an A.-B.-C. numbered list");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "SetTemplateType.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4888922&doc=U3hRdlNJY3lWb01xWkl5YXkvNW5UbG44U1E5MytRRitlYWo3WVFENms3Zz0_IjQ4ODg5MjIi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
