<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">AddText</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiRun/AddText", "spreadsheetapi");%>

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
oRun.SetFontSize(30);
oRun.AddText("This is just a sample text. Nothing special.");
oParagraph.AddElement(oRun);
builder.SaveFile("xlsx", "AddText.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5006294&doc=cEx0T2NMeUNpaU9kUGJvQjNQMXFTbGozMUdxTjVmdXpGbUpDRzRkY1ZBbz0_IjUwMDYyOTQi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
