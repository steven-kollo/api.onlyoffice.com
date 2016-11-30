<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">AddObject</span>
</h1>

<h4 class="header-gray" id="AddObject">AddObject(oDrawing)</h4>
<p class="dscr">Add an object (image, shape or chart) to the current presentation slide.</p>

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
                            <td><em>oDrawing</em></td>
                            <td><a href="<%= Url.Action("presentationapi/apidrawing") %>">ApiDrawing</a></td>
                            <td>The object which will be added to the current presentation slide.</td>
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
builder.SaveFile("pptx", "AddObject.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5007723&doc=SnZ2UnlZNS9WOEF6YzFYeURzdTNpSi9nWS9oTjcwSS9OQ3ZWQXJOUS9Cbz0_IjUwMDc3MjMi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>