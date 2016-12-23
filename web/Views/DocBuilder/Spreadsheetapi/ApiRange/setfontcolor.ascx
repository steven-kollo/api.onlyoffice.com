<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetFontColor</span>
</h1>

<h4 class="header-gray" id="SetFontColor">SetFontColor(oColor)</h4>
<p class="dscr">
    Set the text color for the current cell range with the previously created color object.
</p>

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
            <td><em>oColor</em></td>
            <td>
                <em><a href="<%= Url.Action("spreadsheetapi/apicolor") %>">ApiColor</a></em>
            </td>
            <td>The color object previously created to set the color to the text in the cell/cell range.</td>
        </tr>
    </tbody>
</table>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange("A2").SetFontColor(Api.CreateColorFromRGB(49, 133, 154));
oWorksheet.GetRange("A2").SetValue("This is the text with a color set to it");
oWorksheet.GetRange("A4").SetValue("This is the text with a default color");
builder.SaveFile("xlsx", "SetFontColor.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4882019&doc=cU5VOGMwUDhiV2Y4QWNKYzEwdzE1UXVvOUZmd0I2YmdScTVjNDJQSWh2Zz0_IjQ4ODIwMTki0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>