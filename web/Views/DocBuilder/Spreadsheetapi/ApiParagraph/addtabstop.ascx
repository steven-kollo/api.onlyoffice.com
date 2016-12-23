<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">AddTabStop</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiParagraph/AddTabStop", "spreadsheetapi");%>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oStroke, oFill, oParagraph, oRun;
oFill = Api.CreateSolidFill(Api.CreateRGBColor(104, 155, 104));
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oShape = oWorksheet.AddShape("flowChartOnlineStorage", 200 * 36000, 60 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000);
oDocContent = oShape.GetDocContent();
oParagraph = oDocContent.GetElement(0);
oParagraph.AddText("This is just a sample text. After it three tab stops will be added.");
oParagraph.AddTabStop();
oParagraph.AddTabStop();
oParagraph.AddTabStop();
oParagraph.AddText("This is the text which starts after the tab stops.");
builder.SaveFile("xlsx", "AddTabStop.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5006367&doc=V0VINUxZR1NDdGhXNnFmazZBN3BaQmpPWmdUSURFK1lTY1FCTnFwdHdmST0_IjUwMDYzNjci0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>