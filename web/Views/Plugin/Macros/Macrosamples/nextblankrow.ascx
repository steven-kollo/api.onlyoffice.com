<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("macrosamples/") %>"></a>
    <span class="hdr">Next blank row</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Find the next available blank row in a worksheet. This macro allows you to get the blank at the very end of your data (not between it).</p>

<pre>(function () 
{
    // Getting the active sheet
    activeSheet = Api.ActiveSheet;
    // Minimum row index
    indexRowMin = 0;
    // Maximum row index
    indexRowMax = 1048576;
    // Column 'A'
    indexCol = 0;
    // Row index for empty cell search
    indexRow = indexRowMax;
    for (; indexRow >= indexRowMin; --indexRow) {
        // Getting the cell
        range = activeSheet.GetRangeByNumber(indexRow, indexCol);
        // Checking the value
        if (range.GetValue() && indexRow !== indexRowMax) {
            range = activeSheet.GetRangeByNumber(indexRow + 1, indexCol);
            range.Select();
            break;
        }
    }
})();</pre>

<p>Methods used: 
<a href="<%= Url.Action("spreadsheetapi/api/getactivesheet", "docbuilder") %>">GetActiveSheet</a>, 
<a href="<%= Url.Action("spreadsheetapi/apiworksheet/getrangebynumber", "docbuilder") %>">GetRangeByNumber</a>, 
<a href="<%= Url.Action("spreadsheetapi/apirange/select", "docbuilder") %>">Select</a>
</p>

<div class="header-gray">Reference Microsoft VBA macro code</div>

<p><a href="https://www.teachexcel.com/excel-tutorial/find-the-next-blank-row-with-vba-macros-in-excel_1261.html" target="_blank">This VBA macro</a> was used as a base.</p>
<pre>Sub example()
    Range("A" & Rows.Count).End(xlUp).Offset(1).Select
End Sub</pre>

<div class="header-gray">Result</div>
</br >
<img alt="Next blank row" src="<%= Url.Content("~/content/img/plugins/next-blank-row.png") %>" />
