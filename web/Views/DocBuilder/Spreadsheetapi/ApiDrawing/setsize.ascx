<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetSize</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiDrawing/SetSize", "spreadsheetapi");%>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oStroke, oFill;
oFill = Api.CreateSolidFill(Api.CreateRGBColor(104, 155, 104));
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oDrawing = oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000);
oDrawing.SetSize(120 * 36000, 70 * 36000);
oDrawing.SetPosition(4, 2 * 36000, 2, 3 * 36000);
builder.SaveFile("xlsx", "SetSize.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5004855&doc=bngrTmdIZGZRcGJxT2Z3ZFQxME1NRTh2WEFUNFV3Q0hyVGVJeHJxNTJxbz0_IjUwMDQ4NTUi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
