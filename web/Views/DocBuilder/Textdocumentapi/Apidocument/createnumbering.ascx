<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateNumbering</span>
</h1>

<h4 class="header-gray" id="CreateNumbering">CreateNumbering(sType<sub>opt</sub>) &rarr; {<a href="<%= Url.Action("textdocumentapi/apinumbering") %>">ApiNumbering</a>}</h4>
<p class="dscr">Create an abstract multilevel numbering with a specified type.</p>

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
                
<em>"bullet"</em>
|
<em>"numbered"</em>
                        </td>
                        <td>&lt;optional><br>
                        </td>
                        <td>"bullet"</td>
                        <td>The type of the numbering which will be created.</td>
                    </tr>
                </tbody>
                </table>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action("textdocumentapi/apinumbering") %>">ApiNumbering</a>
    </dd>
</dl>
            
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
    oParagraph.AddText("Default numbered lvl " + (nLvl + 1));
    oParagraph.SetNumbering(oNumLvl);
    oParagraph.SetContextualSpacing(true);
    oDocument.Push(oParagraph);
}
builder.SaveFile("docx", "CreateNumbering.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4887088&doc=dnRZcGdoVGErbE9MNjFJb1F2U3dhVHJTVVM1WmR3c252RVl1NHh2L3U1WT0_IjQ4ODcwODgi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>