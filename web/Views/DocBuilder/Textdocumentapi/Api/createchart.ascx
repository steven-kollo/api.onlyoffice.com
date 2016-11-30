<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateChart</span>
</h1>

<h4 class="header-gray" id="CreateChart">CreateChart(sType<sub>opt</sub>, aSeries, aSeriesNames, aCatNames, nWidth, nHeight, nStyleIndex) &rarr; {<a href="<%= Url.Action("textdocumentapi/apichart") %>">ApiChart</a>}</h4>
<p class="dscr">
Create a chart with the parameters specified.
</p>
    
<h2>Parameters:</h2>
<table class="table">
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Type</td>
            <td>Attributes</td>
            <td>Default</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><em>sType</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#ChartType">ChartType</a>
            </td>
            <td>&lt;optional><br>
            </td>
            <td>"bar"
                </td>
            <td>The chart type used for the chart display.</td>
        </tr>
        <tr class="tablerow">
            <td><em>aSeries</em></td>
            <td>
                <em>Array</em>
            </td>
            <td></td>
            <td></td>
            <td>The array of the data used to build the chart from.</td>
        </tr>
        <tr class="tablerow">
            <td><em>aSeriesNames</em></td>
            <td>
                <em>Array</em>
            </td>
            <td></td>
            <td></td>
            <td>The array of the names (the source table column names) used for the data which the chart will be build from.</td>
        </tr>
        <tr class="tablerow">
            <td><em>aCatNames</em></td>
            <td>
                <em>Array</em>
            </td>
            <td></td>
            <td></td>
            <td>The array of the names (the source table row names) used for the data which the chart will be build from.</td>
        </tr>
        <tr class="tablerow">
            <td><em>nWidth</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#EMU">EMU</a>
            </td>
            <td></td>
            <td></td>
            <td>The chart width in English measure units.</td>
        </tr>
        <tr class="tablerow">
            <td><em>nHeight</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#EMU">EMU</a>
            </td>
            <td></td>
            <td></td>
            <td>The chart height in English measure units.</td>
        </tr>
        <tr class="tablerow">
            <td><em>nStyleIndex</em></td>
            <td>
                <em>number</em>
            </td>
            <td></td>
            <td></td>
            <td>The chart color style index (can be <b>1</b> - <b>48</b>, as described in OOXML specification).</td>
        </tr>
    </tbody>
</table>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action("textdocumentapi/apichart") %>">ApiChart</a>
    </dd>
</dl>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>
builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oDrawing;
oParagraph = oDocument.GetElement(0);
oDrawing = Api.CreateChart("bar3D", [[200, 240, 280],[250, 260, 280]], ["Projected Revenue", "Estimated Costs"], [2014, 2015, 2016], 4051300, 2347595, 24);
oParagraph.AddDrawing(oDrawing);
builder.SaveFile("docx", "CreateChart.docx");
builder.CloseFile();
</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4882140&doc=QnRiU2QvUk9pVnA0QW9VY0RWclhteGlxS0NYa1AxVks1NnhGSmhsNHFDcz0_IjQ4ODIxNDAi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>