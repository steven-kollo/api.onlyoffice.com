<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetFillColor</span>
</h1>

<h4 class="header-gray" id="SetFillColor">SetFillColor(oColor)</h4>
<p class="dscr">
    Set the background color for the current cell range with the previously created color object.
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
            <td>The color object previously created to set the color to the background in the cell/cell range.</td>
        </tr>
    </tbody>
</table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.SetColumnWidth(0, 50);
oWorksheet.GetRange("A2").SetFillColor(Api.CreateColorFromRGB(255, 224, 204));
oWorksheet.GetRange("A2").SetValue("This is the cell with a color set to its background");
oWorksheet.GetRange("A4").SetValue("This is the cell with a default background color");
builder.SaveFile("xlsx", "SetFillColor.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5115564&doc=WUFVZ2JqVkRsWjRmbm90YmFKYmdUT2pjYitCcmJDc2dURTkxMkRpeHVLWT0_IjUxMTU1NjQi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
