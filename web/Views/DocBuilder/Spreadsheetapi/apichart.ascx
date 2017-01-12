<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">ApiChart</span>
</h1>

<h4 class="header-gray" id="ApiChart">new ApiChart()</h4>
<p class="dscr">Class representing a chart.</p>
            
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
                        <td><a href="<%= Url.Action("spreadsheetapi/apichart/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apichart/sethoraxisorientation") %>">SetHorAxisOrientation</a></td>
                        <td>Specifies the direction of the data displayed on the horizontal axis.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apichart/sethoraxisticklabelposition") %>">SetHorAxisTickLabelPosition</a></td>
                        <td>Set the possible values for the position of the chart tick labels in relation to the main horizontal label or the values of the chart data.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apichart/sethoraxistitle") %>">SetHorAxisTitle</a></td>
                        <td>Specify the horizontal axis chart title.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apichart/setlegendpos") %>">SetLegendPos</a></td>
                        <td>Specify the chart legend position.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apichart/setshowdatalabels") %>">SetShowDataLabels</a></td>
                        <td>Specifies which chart data labels are shown for the chart.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apichart/settitle") %>">SetTitle</a></td>
                        <td>Specify a chart title.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apichart/setveraxisorientation") %>">SetVerAxisOrientation</a></td>
                        <td>Specifies the direction of the data displayed on the vertical axis.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apichart/setveraxistitle") %>">SetVerAxisTitle</a></td>
                        <td>Specify the vertical axis chart title.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apichart/setvertaxisticklabelposition") %>">SetVertAxisTickLabelPosition</a></td>
                        <td>Set the possible values for the position of the chart tick labels in relation to the main vertical label or the values of the chart data.</td>
                    </tr>
                </tbody>
            </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
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
oChart.SetShowDataLabels(false, false, true, false);
oChart.SetTitle("Main Chart Title", 13);
builder.SaveFile("xlsx", "ApiChart.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4942918&doc=REFPcmdVU1RzTU96Z2Y4ZEtCOGp2bURxS3FTU21NMUN4YWpDK2d3b0Z5TT0_IjQ5NDI5MTgi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>