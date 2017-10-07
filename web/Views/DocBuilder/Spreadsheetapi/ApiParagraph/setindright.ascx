<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetIndRight</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiParagraph/SetIndRight", "spreadsheetapi");%>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oStroke, oFill, oParagraph;
oFill = Api.CreateSolidFill(Api.CreateRGBColor(104, 155, 104));
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oShape = oWorksheet.AddShape("flowChartOnlineStorage", 200 * 36000, 60 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000);
oDocContent = oShape.GetDocContent();
oParagraph = oDocContent.GetElement(0);
oParagraph.AddText("This is a paragraph with the right offset of 2 inches set to it. ");
oParagraph.AddText("We also aligned the text in it by the right side. ");
oParagraph.AddText("This sentence is used to add lines for demonstrative purposes.");
oParagraph.SetJc("right");
oParagraph.SetIndRight(2880);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is a paragraph without any offset set to it. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.");
oDocContent.Push(oParagraph);
builder.SaveFile("xlsx", "SetIndRight.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5006344&doc=NFZkaTJQQXVja2pIejljR2ZVSGhzSlRyRnVTak1Jd3l6OXNiaFU4R2lVOD0_IjUwMDYzNDQi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
