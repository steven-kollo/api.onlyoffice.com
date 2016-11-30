<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateStroke</span>
</h1>
<h4 class="header-gray" id="CreateStroke">CreateStroke(nWidth, oFill) &rarr; {<a href="<%= Url.Action("spreadsheetapi/apistroke") %>">ApiStroke</a>}</h4>
    <p class="dscr">
        Create a stroke adding shadows to the element.
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
            <td><em>nWidth</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#EMU">EMU</a>
            </td>
            <td>The width of the shadow measured in English measure units.</td>
        </tr>
        <tr class="tablerow">
            <td><em>oFill</em></td>
            <td>
                <a href="<%= Url.Action("spreadsheetapi/apifill") %>">ApiFill</a>
            </td>
            <td>The fill type used to create the shadow.</td>
        </tr>
    </tbody>
</table>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action("spreadsheetapi/apistroke") %>">ApiStroke</a>
    </dd>
</dl>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oGs1, oGs2, oFill, oFill1, oStroke;
oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 224, 204), 0);
oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 164, 101), 100000);
oFill = Api.CreateLinearGradientFill([oGs1, oGs2], 5400000);
oFill1 = Api.CreateSolidFill(Api.CreateRGBColor(255, 255, 0));
oStroke = Api.CreateStroke(3 * 36000, oFill1);
oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 1, 3 * 36000);
builder.SaveFile("xlsx", "CreateStroke.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5026742&doc=RkZSNVRPSUhyczRXRHpCVlhaR2Y5Q0dhTEQ2ampKUGJBSEdabWd6L3VvUT0_IjUwMjY3NDIi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>