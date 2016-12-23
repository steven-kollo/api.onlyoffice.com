<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateColorFromRGB</span>
</h1>

<h4 class="header-gray" id="CreatePresetColor">CreateColorFromRGB(r, g, b) &rarr; {<a href="<%= Url.Action("spreadsheetapi/ApiColor") %>">ApiColor</a>}</h4>
<p class="dscr">
    Create an RGB color setting the appropriate values for the red, green and blue color components.
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
            <td><em>r</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#byte">byte</a>
            </td>
            <td>Red color component value.</td>
        </tr>
        <tr class="tablerow">
            <td><em>g</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#byte">byte</a>
            </td>
            <td>Green color component value.</td>
        </tr>
        <tr class="tablerow">
            <td><em>b</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#byte">byte</a>
            </td>
            <td>Blue color component value.</td>
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
<div class="copy_code">
    <span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oColor = Api.CreateColorFromRGB(49, 133, 154);
oWorksheet.GetRange("A2").SetValue("Text with color");
oWorksheet.GetRange("A2").SetFontColor(oColor);
builder.SaveFile("xlsx", "CreateColorFromRGB.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5116064&doc=bkJCWlJ2b0xURE13TGdpS09oVUUzYlJWZ2hMNzFHV0QwbkVGSnF1bHdDaz0_IjUxMTYwNjQi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
