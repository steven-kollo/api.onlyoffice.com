<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetShowDataLabels</span>
</h1>
<h4 class="header-gray" id="SetShowDataLabels">SetShowDataLabels(bShowSerName, bShowCatName, bShowVal)</h4>
<p class="dscr">
Specifies which chart data labels are shown for the chart.
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
            <td><em>bShowSerName</em></td>
            <td>
                <em>boolean</em>
            </td>
            <td>Whether to show or hide the source table column names used for the data which the chart will be build from.</td>
        </tr>
        <tr class="tablerow">
            <td><em>bShowCatName</em></td>
            <td>
                <em>boolean</em>
            </td>
            <td>Whether to show or hide the source table row names used for the data which the chart will be build from.</td>
        </tr>
        <tr class="tablerow">
            <td><em>bShowVal</em></td>
            <td>
                <em>boolean</em>
            </td>
            <td>Whether to show or hide the chart data values.</td>
        </tr>
    </tbody>
</table>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oSlide.RemoveAllObjects();
oChart = Api.CreateChart("bar3D", [[200, 240, 280],[250, 260, 280]], ["Projected Revenue", "Estimated Costs"], [2014, 2015, 2016], 4051300, 2347595, 24);
oChart.SetVerAxisTitle("USD In Hundred Thousands", 10);
oChart.SetHorAxisTitle("Year", 11);
oChart.SetLegendPos("bottom");
oChart.SetShowDataLabels(false, false, true);
oChart.SetTitle("Financial Overview", 13);
oChart.SetSize(300 * 36000, 130 * 36000);
oChart.SetPosition(608400, 1267200);
oSlide.AddObject(oChart);
builder.SaveFile("pptx", "SetShowDataLabels.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5007723&doc=SnZ2UnlZNS9WOEF6YzFYeURzdTNpSi9nWS9oTjcwSS9OQ3ZWQXJOUS9Cbz0_IjUwMDc3MjMi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>