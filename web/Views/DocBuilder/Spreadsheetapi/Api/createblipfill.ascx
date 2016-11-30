<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateBlipFill</span>
</h1>
<h4 class="header-gray" id="CreateBlipFill">CreateBlipFill(sImageUrl, sBlipFillType) &rarr; {<a href="<%= Url.Action("spreadsheetapi/apifill") %>">ApiFill</a>}</h4>
    <p class="dscr">
        Create a blip fill which allows to fill the object using a selected image as the object background.
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
            <td><em>sImageUrl</em></td>
            <td>
                <em>string</em>
            </td>
            <td>The path to the image used for the blip fill (currently only internet URL or Base64 encoded images are supported).</td>
        </tr>
        <tr class="tablerow">
            <td><em>sBlipFillType</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#BlipFillType">BlipFillType</a>
            </td>
            <td>The type of the fill used for the blip fill (<em>tile</em> or <em>stretch</em>).</td>
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
var oFill, oStroke;
oFill = Api.CreateBlipFill("https://api.onlyoffice.com/content/img/docbuilder/examples/icon_DocumentEditors.png", "tile");
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 1, 3 * 36000);
builder.SaveFile("xlsx", "CreateBlipFill.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5004593&doc=WlBHczhKenU4OGRXNFQ5NTdyd0x1VGtlS1d2c0JETlhwNDYwM2htQzlDaz0_IjUwMDQ1OTMi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>