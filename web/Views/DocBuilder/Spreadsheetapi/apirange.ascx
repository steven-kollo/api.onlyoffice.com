<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">ApiRange</span>
</h1>

<h4 class="header-gray" id="ApiRange">new ApiRange()</h4>
<p class="dscr">Class representing a range.</p>

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
            <td><a href="<%= Url.Action("spreadsheetapi/apirange/getcol") %>">GetCol</a></td>
            <td>Get the number of the column for the selected cell.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apirange/getrow") %>">GetRow</a></td>
            <td>Get the number of the row for the selected cell.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apirange/merge") %>">Merge</a></td>
            <td>Merge the selected cell range into a single cell or a cell row.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apirange/setalignhorizontal") %>">SetAlignHorizontal</a></td>
            <td>Set the horizontal alignment of the text in the current cell range.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apirange/setalignvertical") %>">SetAlignVertical</a></td>
            <td>Set the vertical alignment of the text in the current cell range.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apirange/setbold") %>">SetBold</a></td>
            <td>Set the bold property to the text characters in the current cell or cell range.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apirange/setborders") %>">SetBorders</a></td>
            <td>Set the border to the cell/cell range with the parameters specified.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apirange/setfillcolor") %>">SetFillColor</a></td>
            <td>Set the background color for the current cell range with the previously created color object.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apirange/setfontcolor") %>">SetFontColor</a></td>
            <td>Set the text color for the current cell range in the RGB format.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apirange/setfontname") %>">SetFontName</a></td>
            <td>Set the specified font family as the font name for the current cell range.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apirange/setfontsize") %>">SetFontSize</a></td>
            <td>Set the font size for the characters of the current cell range.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apirange/setitalic") %>">SetItalic</a></td>
            <td>Set the italic property to the text characters in the current cell or cell range.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apirange/setnumberformat") %>">SetNumberFormat</a></td>
            <td>Specifies whether the number in the cell should be treated like number, currency, date, time, etc. or just like text.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apirange/setstrikeout") %>">SetStrikeout</a></td>
            <td>Specify that the contents of the cell/cell range are displayed with a single horizontal line through the center of the line.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apirange/setunderline") %>">SetUnderline</a></td>
            <td>Specify that the contents of this cell/cell range are displayed along with a line appearing directly below the character.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apirange/setvalue") %>">SetValue</a></td>
            <td>Set the value for the current cell or a cell range.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apirange/setwrap") %>">SetWrap</a></td>
            <td>Specifies whether the words in the cell must be wrapped to fit the cell size or not.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apirange/unmerge") %>">UnMerge</a></td>
            <td>Split the selected merged cell range into single cells.</td>
        </tr>
    </tbody>
</table>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange('B1').SetValue('2');
oWorksheet.GetRange('B2').SetValue('2');
oWorksheet.GetRange('A3').SetValue('2x2=');
oWorksheet.GetRange('B3').SetValue('=B1*B2');
builder.SaveFile("xlsx", "ApiRange.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4882026&doc=M3ZjUVlCZE11Z09QVi9MV0tSeEVKbTRwRmVqTit4LzFWMGkxRFA4SkJnRT0_IjQ4ODIwMjYi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>