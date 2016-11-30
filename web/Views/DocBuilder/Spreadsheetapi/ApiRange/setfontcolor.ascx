<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetFontColor</span>
</h1>

<h4 class="header-gray" id="SetFontColor">SetFontColor(r, g, b)</h4>
<p class="dscr">Set the text color for the current cell range in the RGB format.</p>

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
                        <td><em>r</em></td>
                        <td>                
                        <a href="<%= Url.Action("global") %>#byte">byte</a>
                        </td>
                        <td>Red color component value.</td>
                    </tr>
                        <tr class="tablerow">
                        <td><em>g</em></td>
                        <td>                
                        <a href="<%= Url.Action("global") %>#byte">byte</a>
                        </td>
                        <td>Green color component value.</td>
                    </tr>
                        <tr class="tablerow">
                        <td><em>b</em></td>
                        <td>                
                        <a href="<%= Url.Action("global") %>#byte">byte</a>
                        </td>
                        <td>Blue color component value.</td>
                    </tr>
                </tbody>
            </table>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange('A2').SetValue('2'); 
var sRange = oWorksheet.GetRange("A1:D5");
sRange.SetFontColor(0, 255, 0);
builder.SaveFile("xlsx", "SetFontColor.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4882019&doc=cU5VOGMwUDhiV2Y4QWNKYzEwdzE1UXVvOUZmd0I2YmdScTVjNDJQSWh2Zz0_IjQ4ODIwMTki0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>