<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetClassType</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiFill/GetClassType", "spreadsheetapi");%>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oGs1, oGs2, oFill, oStroke;
oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 224, 204), 0);
oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 164, 101), 100000);
oFill = Api.CreateLinearGradientFill([oGs1, oGs2], 5400000);
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 1, 3 * 36000);
var oClassType = oFill.GetClassType();
oWorksheet.SetColumnWidth(0, 15);
oWorksheet.SetColumnWidth(1, 10);
oWorksheet.GetRange('A1').SetValue('Class Type = ');
oWorksheet.GetRange('B1').SetValue(oClassType);
builder.SaveFile("xlsx", "GetClassType.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5004572&doc=aGNrS1NCVXRuT25XNGR1ZkJwSDcwb0pDb1RoRThmbUJROXpNMDN6eStmST0_IjUwMDQ1NzIi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>