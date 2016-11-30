<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">AddChart</span>
</h1>

<h4 class="header-gray" id="AddChart">AddChart(sDataRange, bInRows, sType, nStyleIndex, nExtX, nExtY, nFromCol, nColOffset,  nFromRow, nRowOffset) &rarr; {<a href="<%= Url.Action("spreadsheetapi/apichart") %>">ApiChart</a>}</h4>
<p class="dscr">Create a chart of the set type from the selected data range of the current sheet.</p>

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
                        <td><em>sDataRange</em></td>
                        <td>
                            <em>string</em>
                        </td>
                        <td>The selected cell range which will be used to get the data for the chart, formed specifically and including the sheet name.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>bInRows</em></td>
                        <td>
                            <em>bool</em>
                        </td>
                        <td>Specifies whether to take the data from the rows or from the columns. If <em>true</em> the data from the rows will be used.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>sType</em></td>
                        <td>
                            <a href="<%= Url.Action("global") %>#ChartType">ChartType</a>
                        </td>
                        <td>The chart type used for the chart display.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>nStyleIndex</em></td>
                        <td>
                            <em>number</em>
                        </td>
                        <td>The chart color style index (can be <b>1</b> - <b>48</b>, as described in OOXML specification).</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>nExtX</em></td>
                        <td>
                            <a href="<%= Url.Action("global") %>#EMU">EMU</a>
                        </td>
                        <td>The chart width in English measure units</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>nExtY</em></td>
                        <td>
                            <a href="<%= Url.Action("global") %>#EMU">EMU</a>
                        </td>
                        <td>The chart height in English measure units.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>nFromCol</em></td>
                        <td>
                            <em>number</em>
                        </td>
                        <td>The number of the column where the beginning of the chart will be placed.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>nColOffset</em></td>
                        <td>
                            <a href="<%= Url.Action("global") %>#EMU">EMU</a>
                        </td>
                        <td>The offset from the <em>nFromCol</em> column to the left part of the chart measured in English measure units.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>nFromRow</em></td>
                        <td>
                            <em>number</em>
                        </td>
                        <td>The number of the row where the beginning of the chart will be placed.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>nRowOffset</em></td>
                        <td>
                            <a href="<%= Url.Action("global") %>#EMU">EMU</a>
                        </td>
                        <td>The offset from the <em>nFromRow</em> row to the upper part of the chart measured in English measure units.</td>
                    </tr>
                </tbody>
            </table>
            <div class="note">Please note, that the horizontal <em>nColOffset</em> and vertical <em>nRowOffset</em> offsets are calculated within the limits of the specified <em>nFromCol</em> column and <em>nFromRow</em> row cell only. If this value exceeds the cell width or height, another vertical/horizontal position will be set.</div>
            
            <h2>Returns:</h2>
            <dl class="param-type">
                <dt>Type</dt>
                <dd>
                    <a href="<%= Url.Action("spreadsheetapi/apichart") %>">ApiChart</a>
                </dd>
            </dl>

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
var oChart = oWorksheet.AddChart("'sheet 1'!$A$1:$D$5", true, "bar", 2, 100 * 36000, 70 * 36000, 5, 2 * 36000, 1, 3 * 36000);
oChart.SetVerAxisTitle("Vertical Title", 10);
oChart.SetHorAxisTitle("Horizontal Title", 11);
oChart.SetLegendPos("right");
oChart.SetShowDataLabels(false, false, true);
oChart.SetTitle("Main Chart Title", 13);
builder.SaveFile("xlsx", "AddChart.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4942918&doc=REFPcmdVU1RzTU96Z2Y4ZEtCOGp2bURxS3FTU21NMUN4YWpDK2d3b0Z5TT0_IjQ5NDI5MTgi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>