<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetClassType</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiRun/GetClassType", "spreadsheetapi");%>

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
var oClassType = oRun.GetClassType();
oRun.SetFontSize(30);
oRun.AddText("Class Type = " + oClassType);
oParagraph.AddElement(oRun);
builder.SaveFile("xlsx", "GetClassType.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5006292&doc=SEF3VDUrYUdOWkJURlZLZ3p1NTFWVHBDajdRZStQWUZpVXZVamYwNkdJdz0_IjUwMDYyOTIi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
