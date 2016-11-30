<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">ApiDrawing</span>
</h1>
<h4 class="header-gray" id="ApiDrawing">new ApiDrawing()</h4>
<p class="dscr">Class representing a graphical object.</p>

<h2>Methods</h2>
<table class="table table-classlist">
    <thead>
        <tr class="tablerow">
            <td class="table-classlist-name">Name</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apidrawing/getclasstype") %>">GetClassType</a></td>
            <td>Get the type of the class based on this base class.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apidrawing/setposition") %>">SetPosition</a></td>
            <td>Change the position for the drawing object.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apidrawing/setsize") %>">SetSize</a></td>
            <td>Set the size of the object (image, shape, chart) bounding box.</td>
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
var oDrawing = oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000);
oDrawing.SetSize(120 * 36000, 70 * 36000);
oDrawing.SetPosition(4, 2 * 36000, 2, 3 * 36000);
builder.SaveFile("xlsx", "ApiDrawing.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5004855&doc=SzFxTDYveVpMRUlPR2ZZREh1UXBpYjFwZFovOTByR3hHS1BaM2NlN1FxVT0_IjUwMDQ4NTUi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>