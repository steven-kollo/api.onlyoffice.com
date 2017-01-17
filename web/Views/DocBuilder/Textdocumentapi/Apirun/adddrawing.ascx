<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">AddDrawing</span>
</h1>

<h4 class="header-gray" id="AddDrawing">AddDrawing(oDrawing)</h4>
<p class="dscr">Add an object (image, shape or chart) to the current text run.</p>

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
                        <td>
                        <a href="<%= Url.Action("textdocumentapi/apidrawing") %>">ApiDrawing</a>
                        </td>
                        <td>The object which will be added to the current run.</td>
                    </tr>
                </tbody>
                </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oRun, oDrawing;
oParagraph = oDocument.GetElement(0);
oRun = Api.CreateRun();
oDrawing = Api.CreateChart("bar3D", [[200, 240, 280],[250, 260, 280]], ["Projected Revenue", "Estimated Costs"], [2014, 2015, 2016], 4051300, 2347595, 24);
oDrawing.SetVerAxisTitle("USD In Hundred Thousands", 10);
oDrawing.SetHorAxisTitle("Year", 11);
oDrawing.SetLegendPos("bottom");
oDrawing.SetShowDataLabels(false, false, true, false);
oDrawing.SetTitle("Financial Overview", 13);
oRun.AddDrawing(oDrawing);
oParagraph.AddElement(oRun);
builder.SaveFile("docx", "AddDrawing.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4891434&doc=SDVqeGZGTW9aTmJkSlpnK3k1OURPeCtIR2ZGVFlaeWdPTVFWZTQ3QXNYdz0_IjQ4OTE0MzQi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>