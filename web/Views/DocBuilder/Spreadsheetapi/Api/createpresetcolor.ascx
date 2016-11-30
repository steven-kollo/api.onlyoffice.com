<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreatePresetColor</span>
</h1>
<h4 class="header-gray" id="CreatePresetColor">CreatePresetColor(sPresetColor) &rarr; {<a href="<%= Url.Action("spreadsheetapi/apipresetcolor") %>">ApiPresetColor</a>}</h4>
<p class="dscr">
Create a color selecting it from one of the available color presets.
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
            <td><em>sPresetColor</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#PresetColor">PresetColor</a>
            </td>
            <td>A preset selected from the list of the available color preset names.</td>
        </tr>
    </tbody>
</table>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action("spreadsheetapi/apipresetcolor") %>">ApiPresetColor</a>
    </dd>
</dl>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oGs1, oGs2, oFill, oStroke, oPresetColor;
oPresetColor = Api.CreatePresetColor("lightYellow");
oGs1 = Api.CreateGradientStop(oPresetColor, 0);
oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 164, 101), 100000);
oFill = Api.CreateLinearGradientFill([oGs1, oGs2], 5400000);
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 1, 3 * 36000);
builder.SaveFile("xlsx", "CreatePresetColor.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5004632&doc=aEZUWm13TllXZVV5bHVJalJOR0VGa1NUNFlqSGZ6QzVXNldHbjFIbWFyYz0_IjUwMDQ2MzIi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>