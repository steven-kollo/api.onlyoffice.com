<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetFontSize</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiRun/SetFontSize", "spreadsheetapi");%>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oStroke, oFill, oParagraph, oRun;
oFill = Api.CreateSolidFill(Api.CreateRGBColor(104, 155, 104));
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000);
oDocContent = oShape.GetDocContent();
oParagraph = oDocContent.GetElement(0);
oRun = Api.CreateRun();
oRun.AddText("This is just a sample text. ");
oParagraph.AddElement(oRun);
oRun = Api.CreateRun();
oRun.SetFontSize(30);
oRun.AddText("This is a text run with the font size set to 15 points (30 half-points).");
oParagraph.AddElement(oRun);
builder.SaveFile("xlsx", "SetFontSize.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5006285&doc=R2pSZnpkN3dGcDlkSDBsYU54R0ozcXBKQkFNRHN0TnJFNmxxM0ZWSk51RT0_IjUwMDYyODUi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
