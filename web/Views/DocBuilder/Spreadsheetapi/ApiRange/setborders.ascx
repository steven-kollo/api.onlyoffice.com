<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetBorders</span>
</h1>

<h4 class="header-gray" id="SetBorders">SetBorders(sBordersIndex, sLineStyle, oColor)</h4>
<p class="dscr">
    Set the border to the cell/cell range with the parameters specified.
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
            <td><em>sBordersIndex</em></td>
            <td>
                <em><a href="<%= Url.Action("global") %>#BordersIndex">BordersIndex</a> | string</em>
            </td>
            <td>Specifies the cell border position.</td>
        </tr>
        <tr class="tablerow">
            <td><em>sLineStyle</em></td>
            <td>
                <em><a href="<%= Url.Action("global") %>#LineStyle">LineStyle</a> | string</em>
            </td>
            <td>Specifies the line style used to form the cell border.</td>
        </tr>
        <tr class="tablerow">
            <td><em>oColor</em></td>
            <td>
                <em><a href="<%= Url.Action("spreadsheetapi/apicolor") %>">ApiColor</a></em>
            </td>
            <td>The color object previously created to set the color to the cell border.</td>
        </tr>
    </tbody>
</table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.SetColumnWidth(0, 50);
oWorksheet.GetRange("A2").SetBorders("Bottom", "Thick", Api.CreateColorFromRGB(49, 133, 154));
oWorksheet.GetRange("A2").SetValue("This is a cell with a bottom border");
builder.SaveFile("xlsx", "SetBorders.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5115592&doc=UU9xYUs5d0VmUVU2WS96WWx1WWN5RVFabjd3YjRncytLL0dLR3VsL0pldz0_IjUxMTU1OTIi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
