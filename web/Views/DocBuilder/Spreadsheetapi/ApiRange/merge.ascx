<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">Merge</span>
</h1>

<h4 class="header-gray" id="Merge">Merge(isMerge)</h4>
<p class="dscr">
    Merge the selected cell range into a single cell or a cell row.
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
            <td><em>isMerge</em></td>
            <td>
                <em>boolean</em>
            </td>
            <td>When set to <b>true</b>, the cells within the selected range will be merged along the rows, but remain split in the columns. When set to <b>false</b>, the whole selected range of cells will be merged into a single cell.</td>
        </tr>
    </tbody>
</table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange("A3:E8").Merge(true);
oWorksheet.GetRange("A9:E14").Merge(false);
builder.SaveFile("xlsx", "Merge.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5115544&doc=NmtncE94Y05oRzRLd1BrdWRINURRR2h0YW15UUZOQnorMnpzSWQ5R0hPZz0_IjUxMTU1NDQi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>