<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">AddLineBreak</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiRun/AddLineBreak", "spreadsheetapi");%>

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
oRun.AddText("This is the text for the first line. Nothing special.");
oRun.AddLineBreak();
oRun.AddText("This is the text which starts from the beginning of the second line. ");
oRun.AddText("It is written in two text runs, you need a space at the end of the first run sentence to separate them.");
oParagraph.AddElement(oRun);
builder.SaveFile("xlsx", "AddLineBreak.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5006298&doc=K3lqUys0ekJZY09CTDZFSnJyblBzenQvRGE2TGVFc1JmSnJFaVh1dk1aUT0_IjUwMDYyOTgi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
