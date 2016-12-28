<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetColor</span>
</h1>

<h4 class="header-gray" id="SetColor">SetColor(r, g, b, isAuto<sub>opt</sub>)</h4>
                <dl class="details">
                <dt>Inherited From:</dt>
                <dd><ul><li>
                <a href="<%= Url.Action("textdocumentapi/apitextpr/setcolor") %>">ApiTextPr.SetColor</a>
                </li></ul></dd>
                </dl>

<p class="dscr">Set the text color for the current text run in the RGB format.</p>

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
                        <td><em>r</em></td>
                        <td>
                        <a href="<%= Url.Action("global") %>#byte">byte</a>
                        </td>
                        <td></td>
                        <td></td>
                        <td>Red color component value.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>g</em></td>
                        <td>
                        <a href="<%= Url.Action("global") %>#byte">byte</a>
                        </td>
                        <td></td>
                        <td></td>
                        <td>Green color component value.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>b</em></td>
                        <td>
                        <a href="<%= Url.Action("global") %>#byte">byte</a>
                        </td>
                        <td></td>
                        <td></td>
                        <td>Blue color component value.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>isAuto</em></td>
                        <td>
                        <em>boolean</em>
                        </td>
                        <td> &lt;optional></td>
                        <td>false</td>
                        <td>If this parameter is set to <em>"true"</em>, then r,g,b parameters will be ignored.</td>
                    </tr>
                </tbody>
                </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oRun;
oParagraph = oDocument.GetElement(0);
oRun = Api.CreateRun();
oRun.AddText("This is just a sample text. ");
oParagraph.AddElement(oRun);
oRun = Api.CreateRun();
oRun.SetColor(0, 0, 255);
oRun.AddText("This is a text run with the font color set to blue.");
oParagraph.AddElement(oRun);
builder.SaveFile("docx", "SetColor.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4892184&doc=MGI0UVc4Vmd4MytiNzIrTWI5Y28rL01KOVo5VDRJbCt2RWNSZ2VORjJWOD0_IjQ4OTIxODQi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>