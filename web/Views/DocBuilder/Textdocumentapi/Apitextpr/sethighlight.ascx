<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetHighlight</span>
</h1>

<h4 class="header-gray" id="SetHighlight">SetHighlight(r, g, b, isNone<sub>opt</sub>)</h4>
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
var oParagraph, oTextPr;
oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetHighlight(255, 255, 0, false);
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("A sample text highlighted with yellow color using the text properties.");
builder.SaveFile("docx", "SetHighlight.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4898114&doc=WHhjeGx4RzFRYnUrdWphUDVVcjZvTHFETHQySklRMGdFMGUwZU9Kb3hGYz0_IjQ4OTgxMTQi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>