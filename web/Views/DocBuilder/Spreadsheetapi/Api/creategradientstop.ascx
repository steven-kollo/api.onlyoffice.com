<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateGradientStop</span>
</h1>

<h4 class="header-gray" id="CreateGradientStop">CreateGradientStop(oUniColor, nPos) &rarr; {<a href="<%= Url.Action("spreadsheetapi/apigradientstop") %>">ApiGradientStop</a>}</h4>
    
<p class="dscr">
Create a gradient stop used for different types of gradients.
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
            <td><em>oUniColor</em></td>
            <td>
                <a href="<%= Url.Action("spreadsheetapi/apiunicolor") %>">ApiUniColor</a>
            </td>
            <td>The color used for the gradient stop.</td>
        </tr>
        <tr class="tablerow">
            <td><em>nPos</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#PositivePercentage">PositivePercentage</a>
            </td>
            <td>The position of the gradient stop measured in 1000th of percent.</td>
        </tr>
    </tbody>
</table>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action("spreadsheetapi/apigradientstop") %>">ApiGradientStop</a>
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
builder.SaveFile("xlsx", "CreateGradientStop.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5004597&doc=WjFYaEZVYzUxN3BRaTZQbVpRTURNK2lNdTVkdW9nVTc5dElZOFQveWxFST0_IjUwMDQ1OTci0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>