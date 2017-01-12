<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateBlipFill</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/Api/CreateBlipFill", "spreadsheetapi");%>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oFill, oStroke;
oFill = Api.CreateBlipFill("https://api.onlyoffice.com/content/img/docbuilder/examples/icon_DocumentEditors.png", "tile");
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 1, 3 * 36000);
builder.SaveFile("xlsx", "CreateBlipFill.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5004593&doc=WlBHczhKenU4OGRXNFQ5NTdyd0x1VGtlS1d2c0JETlhwNDYwM2htQzlDaz0_IjUwMDQ1OTMi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>