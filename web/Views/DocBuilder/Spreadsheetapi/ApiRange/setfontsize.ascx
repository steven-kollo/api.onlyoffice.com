<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetFontSize</span>
</h1>

<h4 class="header-gray" id="SetFontSize">SetFontSize(size)</h4>
<p class="dscr">Set the font size for the characters of the current cell range.</p>

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
                        <td><em>size</em></td>
                        <td>
                            <em>number</em>
                        </td>
                        <td>The font size value measured in points.</td>
                    </tr>
                </tbody>
            </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange('A2').SetValue('2'); 
var sRange = oWorksheet.GetRange("A1:D5");
sRange.SetFontSize(20);
builder.SaveFile("xlsx", "SetFontSize.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4882024&doc=clBQaDBYcUtGczFkQURSaGFlWkV0QUVNSnQwVHVkQld2OUVacS9mNjlxYz0_IjQ4ODIwMjQi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
