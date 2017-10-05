<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetHighlight</span>
</h1>

<h4 class="header-gray" id="SetHighlight">SetHighlight(r, g, b, isNone<sub>opt</sub>)</h4>
                <dl class="details">
                <dt>Inherited From:</dt>
                <dd><ul><li>
                <a href="<%= Url.Action("textdocumentapi/apitextpr/sethighlight") %>">ApiTextPr.SetHighlight</a>
                </li></ul></dd>
                </dl>

<p class="dscr">Specify a highlighting color in the RGB format which is applied as a background for the contents of the current run.</p>

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
                        <td><em>isNone</em></td>
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
oRun.SetHighlight(255, 255, 0);
oRun.AddText("This is a text run with the text highlighted with yellow color.");
oParagraph.AddElement(oRun);
builder.SaveFile("docx", "SetHighlight.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4892194&doc=TkhSNUg5NGVWaTZYVmsxZlFMOU95UzBRT2ZvT3BqU1E4MmRuNk5ZTWNmYz0_IjQ4OTIxOTQi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
