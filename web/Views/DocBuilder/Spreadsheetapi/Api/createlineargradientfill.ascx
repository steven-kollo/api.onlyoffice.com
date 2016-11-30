<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateLinearGradientFill</span>
</h1>

<h4 class="header-gray" id="CreateLinearGradientFill">CreateLinearGradientFill(aGradientStop, Angle) &rarr; {<a href="<%= Url.Action("spreadsheetapi/apifill") %>">ApiFill</a>}</h4>
<p class="dscr">
Create a linear gradient fill which allows to fill the object using a selected linear gradient as the object background.
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
            <td><em>aGradientStop</em></td>
            <td>
                <em>Array</em>
            </td>
            <td>The array of gradient color stops measured in 1000th of percent.</td>
        </tr>
        <tr class="tablerow">
            <td><em>Angle</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#PositiveFixedAngle">PositiveFixedAngle</a>
            </td>
            <td>The angle measured in 60000th of a degree that will define the gradient direction.</td>
        </tr>
    </tbody>
</table>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action("spreadsheetapi/apifill") %>">ApiFill</a>
    </dd>
</dl>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oGs1, oGs2, oFill, oStroke;
oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 224, 204), 0);
oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 164, 101), 100000);
oFill = Api.CreateLinearGradientFill([oGs1, oGs2], 5400000);
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 1, 3 * 36000);
builder.SaveFile("xlsx", "CreateLinearGradientFill.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5004597&doc=WjFYaEZVYzUxN3BRaTZQbVpRTURNK2lNdTVkdW9nVTc5dElZOFQveWxFST0_IjUwMDQ1OTci0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>