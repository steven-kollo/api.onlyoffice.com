<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetFill</span>
</h1>
<h4 class="header-gray" id="SetFill">SetFill(oFill)</h4>
    
<p class="dscr">
Set the text color for the current text run.
</p>

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
            <td><em>oFill</em></td>
            <td>
                <a href="<%= Url.Action("spreadsheetapi/apifill") %>">ApiFill</a>
            </td>
            <td>The color or pattern used to fill the text color.</td>
        </tr>
    </tbody>
</table>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oStroke, oFill;
oFill = Api.CreateSolidFill(Api.CreateRGBColor(104, 155, 104));
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000);
oDocContent = oShape.GetDocContent();
oParagraph = oDocContent.GetElement(0);
oRun = Api.CreateRun();
oTextPr = oRun.GetTextPr();
oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 255, 0));
oTextPr.SetFill(oFill);
oRun.AddText("This is a text run with the font color set to yellow.");
oParagraph.AddElement(oRun);
builder.SaveFile("xlsx", "SetFill.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5006466&doc=RFJZZ0JRYnVDUFZkN090dXBvK3dwaGZZSXJkVWRJS0d2ejNyeHdVNWNPaz0_IjUwMDY0NjYi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>