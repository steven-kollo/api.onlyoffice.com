<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">ApiWorksheet</span>
</h1>

<h4 class="header-gray" id="ApiWorksheet">new ApiWorksheet()</h4>
<p class="dscr">Class representing a sheet.</p>

<h2>Methods</h2>
<table class="table table-classlist">
    <thead>
    <tr class="tablerow">
        <td class="table-classlist-name">Name</td>
        <td>Description</td>
    </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apiworksheet/addchart") %>">AddChart</a></td>
            <td>Create a chart of the set type from the selected data range of the current sheet.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apiworksheet/addimage") %>">AddImage</a></td>
            <td>Adds the image to the current sheet with the parameters specified.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apiworksheet/addshape") %>">AddShape</a></td>
            <td>Adds the shape to the current sheet with the parameters specified.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apiworksheet/formatastable") %>">FormatAsTable</a></td>
            <td>Format the selected range of cells from the current sheet as a table (with the first row formatted as a header).</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apiworksheet/getrange") %>">GetRange</a></td>
            <td>Returns an object that represents the selected range of the current sheet. Can be a single cell - <b>A1</b>, or cells from a single row - <b>A1:E1</b>, or cells from a single column - <b>A1:A10</b>, or cells from several rows and columns - <b>A1:E10</b>.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apiworksheet/getrangebynumber") %>">GetRangeByNumber</a></td>
            <td>Returns an object that represents the selected range of the current sheet using the <b>row/column</b> coordinates for the cell selection.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apiworksheet/setcolumnwidth") %>">SetColumnWidth</a></td>
            <td>Set the width to the selected column of the current active sheet. The width is equal to the set number multiplied by 7 pixels - so if you set the width to 10 it will be equal to 70 pixels.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apiworksheet/setname") %>">SetName</a></td>
            <td>Set a name to the current active sheet.</td>
        </tr>
    </tbody>
</table>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.SetName("sheet 1");
oWorksheet.GetRange("B1").SetValue("Row 1");
oWorksheet.GetRange("C1").SetValue("Row 2");
oWorksheet.GetRange("D1").SetValue("Row 3");
oWorksheet.GetRange("A2").SetValue("Category 1");
oWorksheet.GetRange("A3").SetValue("Category 2");
oWorksheet.GetRange("A4").SetValue("Category 3");
oWorksheet.GetRange("A5").SetValue("Category 4");
oWorksheet.GetRange("B2").SetValue("4.3");
oWorksheet.GetRange("B3").SetValue("2.5");
oWorksheet.GetRange("B4").SetValue("3.5");
oWorksheet.GetRange("B5").SetValue("4.5");
oWorksheet.GetRange("C2").SetValue("2.4");
oWorksheet.GetRange("C3").SetValue("4.4");
oWorksheet.GetRange("C4").SetValue("1.8");
oWorksheet.GetRange("C5").SetValue("2.8");
oWorksheet.GetRange("D2").SetValue("2");
oWorksheet.GetRange("D3").SetValue("2");
oWorksheet.GetRange("D4").SetValue("3");
oWorksheet.GetRange("D5").SetValue("5");
var oChart = oWorksheet.AddChart("'sheet 1'!$A$1:$D$5", true, "bar", 2, 5, 0, 12, 12);
oChart.SetVerAxisTitle("Vertical Title", 10);
oChart.SetHorAxisTitle("Horizontal Title", 11);
oChart.SetLegendPos("right");
oChart.SetShowDataLabels(false, false, true);
oChart.SetTitle("Main Chart Title", 13);
builder.SaveFile("xlsx", "AddChart.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4882043&doc=YTdLNmNUTkdxUjhySzVrYzVvM0Z5WWthZjV5RmJPRC90djl2RmVtYjlJcz0_IjQ4ODIwNDMi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>