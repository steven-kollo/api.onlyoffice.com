<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetThemeColors</span>
</h1>

<h4 class="header-gray" id="SetThemeColors">SetThemeColors(oThemesColors)</h4>
<p class="dscr">
    Set the theme colors to the current spreadsheet.
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
            <td><em>oThemesColors</em></td>
            <td>
                <em>ThemesColors | string</em>
            </td>
            <td>The list of theme colors that will be used to select the color scheme to be set to the current spreadsheet.</td>
        </tr>
    </tbody>
</table>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var themes = Api.GetThemesColors();
for (var i = 0; i < themes.length; ++i) {
oWorksheet.GetRange('A' + (i + 1)).SetValue(themes[i]);
}
Api.SetThemeColors(themes[3]);
builder.SaveFile("xlsx", "SetThemeColors.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5116585&doc=UDMwVWN1amw2YU84WWY0a3VRcUIwdTNKbFZVdEZRK1hjbTByZVlXWUlpND0_IjUxMTY1ODUi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>