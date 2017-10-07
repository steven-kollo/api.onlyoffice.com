<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetThemesColors</span>
</h1>

<h4 class="header-gray" id="GetThemesColors">GetThemesColors() &rarr; {ThemesColors}</h4>
<p class="dscr">
    Get the list of all available theme colors for the spreadsheet.
</p>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <em>ThemesColors</em>
    </dd>
</dl>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var themes = Api.GetThemesColors();
for (var i = 0; i < themes.length; ++i) {
oWorksheet.GetRange('A' + (i + 1)).SetValue(themes[i]);
}
builder.SaveFile("xlsx", "GetThemesColors.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5116480&doc=cWZ5dGY1eVBOVEljMzRVQmFjNVZDY0E5S1JHSzlVQUpkQk5QK2hkZThoRT0_IjUxMTY0ODAi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
