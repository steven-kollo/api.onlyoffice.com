<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateColorByName</span>
</h1>

<h4 class="header-gray" id="CreatePresetColor">CreateColorByName(sPresetColor) &rarr; {<a href="<%= Url.Action("spreadsheetapi/ApiColor") %>">ApiColor</a>}</h4>
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
        <a href="<%= Url.Action("spreadsheetapi/ApiColor") %>">ApiColor</a>
    </dd>
</dl>
<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oColor = Api.CreateColorByName("ltSteelBlue");
oWorksheet.GetRange("A2").SetValue("Text with color");
oWorksheet.GetRange("A2").SetFontColor(oColor);
builder.SaveFile("xlsx", "CreateColorByName.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5116095&doc=WWFzM2lFcCttRHhsMTRsZEVVbWV1V0FrWENZM213SEN3bmticTcwaVNFOD0_IjUxMTYwOTUi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>