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
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oDrawing;
oParagraph = oDocument.GetElement(0);
oDrawing = Api.CreateChart("bar3D", [[200, 240, 280],[250, 260, 280]], ["Projected Revenue", "Estimated Costs"], [2014, 2015, 2016], 4051300, 2347595, 24);
oDrawing.SetVerAxisTitle("USD In Hundred Thousands", 10);
oDrawing.SetHorAxisTitle("Year", 11);
oDrawing.SetLegendPos("bottom");
oDrawing.SetShowDataLabels(false, false, true);
oDrawing.SetTitle("Financial Overview", 13);
oParagraph.AddDrawing(oDrawing);
builder.SaveFile("docx", "ApiChart.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4883430&doc=RlN4YzVZZWd4RlBvbmR2OG9kZE1BMEs2eWpyRTdobkR0azl2aWxqODRRND0_IjQ4ODM0MzAi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>