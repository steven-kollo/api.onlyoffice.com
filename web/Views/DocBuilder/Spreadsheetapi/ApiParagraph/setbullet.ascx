<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetBullet</span>
</h1>
<h4 class="header-gray" id="SetBullet">SetBullet(oBullet)</h4>
    <dl class="details">
        <dt>Inherited From:</dt>
        <dd>
            <ul>
                <li>
                    <a href="<%= Url.Action("spreadsheetapi/apiparapr/setbullet") %>">ApiParaPr.SetBullet</a>
                </li>
            </ul>
        </dd>
    </dl>
    
<p class="dscr">
Set the bullet or numbering to the current paragraph.
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
            <td><em>oBullet</em></td>
            <td>
                <a href="<%= Url.Action("spreadsheetapi/apibullet") %>">ApiBullet</a>
            </td>
            <td>The bullet object created using either the <a href="<%= Url.Action("spreadsheetapi/api/createbullet") %>">Api.CreateBullet</a> or <a href="<%= Url.Action("spreadsheetapi/api/createnumbering") %>">Api.CreateNumbering</a> method.</td>
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
oBullet = Api.CreateBullet("-");
oParagraph.SetBullet(oBullet);
oParagraph.AddText(" This is an example of the bulleted paragraph.");
builder.SaveFile("xlsx", "SetBullet.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5006437&doc=dHdhMDNhTnA0dHFmeEsxbVl3VDU3cG40cW9zdGd5UEY5c3FRMkJ0YVEzMD0_IjUwMDY0Mzci0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>